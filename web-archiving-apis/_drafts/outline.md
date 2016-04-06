---
title: Web Archive APIs
subtitle: Outline
author: anj
layout: post
shown: true
category: web-archiving-apis
tags: ["Web Archive APIs"]
---


Building W3ACT
==============

Despite the success of the prototype ACT system, it was not sustainable in it's original form. As we added some of the more specific features we required, the system became more difficult to manage and upgrade. Crucially, neither Drupal nor PHP are supported development platforms for the British Library. Most of our other web archiving tools are written in Java, which is supported officially, and so we set ourselves the task of re-implementing the system in Java.

For various unfortunate reasons, this turned out to be a long and difficult journey. In part, this was because the scope needed to grow in order to encompass the other aspects of the Web Curator Tool (WCT) and Selection and Permission Tool (SPT) that the ACT prototype did not cover, such as the licensing workflow. Although Legal Deposit permits broad crawling, we still need to seek additional permissions to make crawled content available openly, and so we need a single system that could hold all of that information in one place.

This new tool, called [W3ACT](https://github.com/ukwa/w3act/), has become the core of our curatorial workflow. Like the earlier prototype, but unlike WCT, the crawler is not embedded inside W3ACT, but simply provides the basic parameters of the crawl as a data feed that is used to run crawls.

[img]

Crawl results from QA Wayback, requirement to extend to post-crawl stats.

As well as directing the frequency of our regular crawling activities, W3ACT has also grown to encompass document harvesting functionality. This allows our users to catalogue individual documents from a website, and includes some experimental support for crawling behind paywalls.

basic intro to how this works

[img]

http://webcurator.cvs.sourceforge.net/viewvc/webcurator/WCTHarvestAgent/src/org/webcurator/core/harvester/agent/HarvestAgentSOAPService.java?view=markup


Driving the Crawls
==================

https://github.com/ukwa/python-w3act

Profiles as the hack/gap.

Improving Crawl Quality
=======================

Monitrix, PhantomJS.


Experimenting With Paywalls
===========================

Then also, multiple sources, manual and various crawlers. Next step, proxification.

Current Architecture & Issues
=============================

Diagram showing all the above bits, and outlining basic problems.

Brittleness, state management, space management.


I think this reflects the deeper issue. H3 is a more a ‘crawl kit’ than a crawler solution, and you need to understand Java and H3’s innards very well to:

-   Know which stats you should turn off.
-   Know what and how to query what’s in BDB via the console.
-   Customise H3, e.g. modify the Frontier implementation.
-   Use a different crawled-url DB (e.g. HQ).
-   Scale out over multiple crawlers.
-   Use JMX or similar tools for monitoring.

And so the issue is that this doesn’t really fit the operating model we’re supposed to work under – i.e. a stable ‘service’ that requires developer knowledge to monitor/manage.


Towards a Web Archiving Platform
================================

Platforms (from https://plus.google.com/+RipRowan/posts/eVeouesvaVX)

- Separate components communicating over APIs, only.
- Scale
- Demand for monitoring, which ends up being automated QA.
- [Choose Boring Technology](http://mcfunley.com/choose-boring-technology)

c.f. <http://blog.cleancoder.com/uncle-bob/2016/01/04/ALittleArchitecture.html>


Crawler Description
Seeds
Scope
CANDIDATE CHAIN - scoping and quotas
FETCH CHAIN - includes extractors
DISPOSITION CHAIN - includes deduplication, updates frontier with found links etc
Sheets - e.g. allowing configuration to be tweaked for certain hosts.
Various lifecycle, checkpointing, logging, reporting, stats, monitors, etc.



Web Archiving APIs
------------------

- http://blog.dshr.org/2015/06/brief-talk-at-columbia.html
- http://kris-sigur.blogspot.co.uk/2015/06/even-though-it-didnt-feature-heavily-on.html
- CDX Service
    - OpenSearch API a.k.a. [RemoteResourceIndex](http://iipc.github.io/openwayback/2.2.0/apidocs/org/archive/wayback/resourceindex/RemoteResourceIndex.html)
    - CDX Server API, for [pywb](https://github.com/ikreymer/pywb/wiki/CDX-Server-API) and [OpenWayback](https://github.com/iipc/openwayback/blob/master/wayback-cdx-server-webapp/README.md)
    - [tinycdxserver](https://github.com/nla/tinycdxserver)

Evolving our architecture
=========================

- CDX server
- More robust queuing/execution
- Better storage management.
- Importance of monitoring and monitoring-QA continuum.

- Replace UniqUriFilter with something forgetful - allow different crawl frequencies.
- Move WARC writing out to the proxies (requires moving the virus scanning).
- Move webrender upstream - done *before* H3 and only passing on discovered URLs.

For frequent crawls
- Cron queues in AMQP, tagged with source, watched-ness, possibly a crawlId like 'daily'.
- OPTIONAL - Queue is consumed for webrending, and result 'new' URLs passed on to another queue
- H3 listens to the incoming queue, and processes them as usual.
- Recently Seen URI filter is used to 'forget' what's been seen after a while.

UNK

- How to watch a file for new surts? Does H3 watch any files for changes?
    - It doesn't but OWB does: org.archive.wayback.accesscontrol.staticmap.StaticMapExclusionFilterFactory
- EmbeddedCDXServerIndex is the glue from Wayback to CDXServer.
- Python watchdog module to watch for new checkpoints? 
    - Or just lift from org.archive.wayback.resourceindex.WatchedCDXSource to make a Spout?
- Plan to domain crawl with candidates.seedsRedirectNewSeeds?
- Why does my crawl keep snoozing for 5 mins? Snooze on error overly sensitive to not-really-errors?

- Persisting Ehcache?
   - Man, I have to run the GC to get it to shut down. (i.e. close was not called)
   - So, need to add the Lifecycle hooks to get it to work robustly.
   - Probably better to not bother. Keep it simple in this implementation, and use a CDX or DB driven version. instead. Maybe tinycdxserver put in underneath.
- Check checkpointIntervalMinutes plus forgetAllButLatest does what we need.
   - Nope, as forgetAllButLatest also merges e.g. previous crawl.log into a complete checkpoint
   - So solution is to remove old checkpoints ourselves.
   - Without 'forgetAllButLatest', we get a new crawl.log.cp00000-000000000 file for every checkpoint, and the WARCs are also synchronized with this.
   - Currently, we need to look at the entries and work out which WARCs were involved.
   - May be possible to get the logger to output the WARC filename instead.


QUEUE SEQUENCE

- FC-010-uris-to-render (optional)
- FC-020-uris-to-crawl
- FC-030-uris-to-index
- FC-040-document-to-catalogue
- FC-050-uris-to-check (optional)
- FC-060-uris-to-auto-qa (optional)

- FC-050-sips-to-generate
- FC-060-sips-to-submit


TODO

- Misc crawler changes:
    - Ensure Docker crawls split state by crawl job name.
    - Auto checkpoint, keeping only the last X checkpoints.
    - Pass the crawl feed over to AMQP for CDX updating.
    - If making new URLs 'forceFetched' is not good enough, switch to the RecenlySeen forgetful filter.
- RecentlySeenUniqUriFilter needs:
    - To persist to disk, and be resumable.
    - To pick up SURT-prefixes-to-TTL mapping file (and notice when it changes).
    - Optional 'opposite of a bloom filter' update mechanism to keep size down.
- WatchTargetDocumentExtractor (NEW)
    - Inspect newly crawled content.
    - Spot documents and their source.
    - Send any new documents to a discovered-documents queue.
- HAR/webrender
    - Needs to be properly scalable
    - Needs to run behind warcprox so we can keep the results
    - Needs to pass on the 'inheritable' CrawlURI metadata (if deployed mid-stream).
- tinycdxserver
    - Deploy tinycdxserver
    - But probably only for frequently-crawled stuff?
- python-w3act daemons
    - Needs to emit messages as needed rather than wait for the hour.
    - Needs up update the SURT-to-cache-forget-time lookup file.
    - Needs to update the licensed-SURT white-list file.
    - Can do less in each script, as some post-processing is not needed.
    - For documents, a separate daemon needs to watch for new documents and post them to W3ACT.
    - For SIPs, a separate daemon needs to watch for new checkpoints and bundle them for DLS.
    - For the CrawlFeed, a separate daemon that watches for new content and posts to tinycdxserver.
    - (Need to subclass AMQPCrawlLogFeed to add MessageProperties.PERSISTENT_TEXT_PLAIN)
- OpenWayback
    - Pointing to minimal # CDX indexes
    - With a cope of the filename-to-DLS_ARK_URL mapping close to hand.
    - With a list of licensed SURT prefixes.
    - Aware of all three potential storage locations (crawler disk, HDFS, DLS).
    - Annoyingly, to pick up resources from warc.gz.open files this needs to use the shortened name rather than the full filename with the '.open' on the end: https://github.com/internetarchive/wayback/blob/master/wayback-core/src/main/java/org/archive/wayback/resourcestore/resourcefile/ResourceFactory.java#L173-L178 because this needs .gz to spot compression https://github.com/iipc/webarchive-commons/blob/master/src/main/java/org/archive/io/warc/WARCReaderFactory.java#L112
    - GAH also RemoteResourceIndex does not handle de-duplication because that needs an AnnotatingCaptureFilterGroupFactory(). See https://github.com/iipc/openwayback/blob/a277b1cb11ea6e18c478d491023d97de16bd340c/wayback-core/src/main/java/org/archive/wayback/resourceindex/LocalResourceIndex.java versus https://github.com/iipc/openwayback/blob/18a5c1c10900e41be51b313bd8b7f4e3a59e0e19/wayback-core/src/main/java/org/archive/wayback/resourceindex/RemoteResourceIndex.java - I think it assumes the far-end will sort that out. So, could fix tinycdxserver rather than modify Wayback, but modifying Wayback would be a more complete solution.
    - org.archive.wayback.webapp.AccessPoint logNotInArchive INFO: NotInArchive





Heritrix Problems
=================

H3 requirements document - https://webarchive.jira.com/wiki/display/Heritrix/Internet+Archive+Crawler+Requirements+Analysis

- Cookie Monster bug.
- Massive opaque state folder, possible memory leak turn into 60TB of disk space on a 36TB WARC.GZ crawl.
- Inconsistent behaviour on shutdown - sometimes stops cleanly, usually hangs mysteriously.
- BDB strange corruption (out of file handles cause but problem is impossibility of recovery.

Trade some flexibility for simplicity.
Trade some cleverness with brute force. 
Threads/CPUs/RAM/SSD all fairly cheap now.

Major components

- Seed injection
- Scoping of URLs
- Filtering of URLs (already-seen, quotas etc.)
- URL Queues (usually per host)
- Crawl delay/politeness
- Fetching
- Parsing
- Link extraction
- WARC writing
- Reporting
- Statistics

- Thread management
- Parallelism/Scaling out (HashCrawlMapper)
- Application lifecycle definition and management.
- Checkpointing (we only need stable restarting, not restarting from three weeks ago)

- Stateful bits
    - The frontier (includes 'already seen' URI filter, queues, and implements crawl delay)
    - The server cache (includes DNS lookups, whois, robots.txt(?))
    - Cookie store.
    - The persist log (history of URLs seen, used for deduplication)
    - Statistics tracking

The Parable of Monitrix
=======================

[Watching the UK domain crawl with Monitrix](http://britishlibrary.typepad.co.uk/webarchive/2013/09/monitrix.html)

We created it, it was expensive, and in the end it didn't really scale.

We rebuilt it on ELK. It's not perfect, but it's easy to install and maintain.


Experimenting With New Architectures
====================================

Storm as framework for exploration.

NOT:
- ServiceMix
- Nirmata Microservices
- Apache Mesos
- Kubernetes
- Docker Compose

[Running a Multi-Node Storm Cluster](http://www.michael-noll.com/tutorials/running-multi-node-storm-cluster/)

[Installing a Storm cluster on CentOS hosts](http://jansipke.nl/installing-a-storm-cluster-on-centos-hosts/)

Renderer as candidate for understanding how this works due to scaling issue plus modularity.

i.e. not just modularising the infrastructure around the crawler, but also the crawler itself.

- http://www.mapdb.org/doc/caches.html Or EHCache time-to-live time-to-idle or indeed BDB
- BUT that reproduces some of H3 weaknesses.

- Memcached API and TTL
- e.g. Couchbase, others.

- Riak with LevelDB
- Redis short keys (250 byte) but could use hash.
- HBase
- Cassandra will do

Compression needed.
'Spine' model versus cache and store?

Scaling the warc proxies:
- can use Squid (or other) to load balance while routing URLs.
- But squid may not support media-range fully.
- How does warcprox handle that?
- DNS/round-robin is also fine, if deduplication DB is shared (CDX Server).

Sketching A Scalable & Modular Crawler
======================================

The gnarly chunks of H3.

Frontier (uniq, queues, delay)
State and deduplication
Writing

Complexity/power of Springy Everything.

DecideRules

Choices of queues - is this really that big a deal?

Storm, RabbitMQ, proxies, etc.

Monitoring, see

- <https://www.endgame.com/blog/storm-metrics-how>
- <https://github.com/DigitalPebble/storm-crawler/tree/master/external/elasticsearch>
- <https://github.com/DigitalPebble/storm-crawler/blob/973e6ed0745bc35555a16651ac88876ee0c93aaf/external/elasticsearch/src/main/java/com/digitalpebble/storm/crawler/elasticsearch/metrics/MetricsConsumer.java>
- <https://github.com/DigitalPebble/storm-crawler/blob/8c4a1885ad134c46e81c454f016ea024c47cb18b/external/ES_IndexInit.sh>

The Bigger Picture
==================

Integration with access etc.

Streaming Sources
=================

Idea of revisiting Twittervane, but extending to Wikipedia, and siphoning links into the crawler ASAP.

Link ingest scoping issues? All 'I' so all will sneak in? Need 'L' etc. so links can go in and be skipped if they don't match the scope.

### Twitter ###

- https://dev.twitter.com/streaming/overview/request-parameters
- Not actually possible to build a location box > 1 degree, so 'all UK tweets' probably won't work.
- Need some terms, then, probably? Or language=en and ignore US links? filter_level?
- http://stackoverflow.com/questions/3300085/twitter-stream-bounding-box-how-to-cover-london-uk

### Wikipedia ###

- https://wikitech.wikimedia.org/wiki/RCStream
- https://en.wikipedia.org/w/api.php?format=xml&action=query&prop=revisions&rvprop=content&revids=693815208
- http://mwparserfromhell.readthedocs.org/en/latest/api/mwparserfromhell.html#mwparserfromhell.wikicode.Wikicode.filter_external_links


Distributed Web Archives
========================

- P2P Memento/Wayback§
- [Wouldn’t it be fun to build your own Google?](http://radar.oreilly.com/2014/12/wouldnt-it-be-fun-to-build-your-own-google.html)
- http://tomp2p.net/
- Cassandra
- Integrating International Archives
    - DHT+Range Queries, [e.g. ExampleDST.java](https://github.com/tomp2p/TomP2P/blob/master/examples/src/main/java/net/tomp2p/examples/ExampleDST.java)?
