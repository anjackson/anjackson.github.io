---
title: Web Archive APIs
subtitle: Outline
author: anj
layout: post
shown: true
category: web-archiving-apis
tags: ["Web Archive APIs"]
---

When I joined the team in 2012 and began to work on the domain crawl project, a number of other issues came up. What about going behind paywalls? What about capturing dynamic dependencies arising from JavaScript or complex CSS? What about integrating pre-HTML5 videos? What about adding in additional (large) content submitted via hard-disk to avoid network costs? What if we have to use some kind of archiving web proxy so that we can drive the capture manually for some of these tricky cases? Surely we will need to capture our web archives through a shifting and growing range of tools and mechanisms, and our management processes need to cope with that?

- WCT
- WCT + H3
- (ingest differences and scaling)
- ACT + H3 (+ WCT) - frequency problems and too-many crawls (likely our setting didn't help)
- ACT + H3 + PhantomJS - Umbra/our version and the problems
- Streaming RAbbitMQ and revert
- Docker + Inline Web Render
- Streaming with Kafka
- PhantomJS to Brozzler


The Hammer and the Grain
========================


> “She taught me what her uncle once taught her:
> How easily the biggest coal block split
> If you got the grain and hammer angled right.”
> <small>from [Clearances, Seamus Heaney](http://www.poetryfoundation.org/poem/247818)</small>

This about SH mother, but reminds me of my father.
Never great at it, but he taught me to understand the grain and the twist, and to look out for knotholes.
Coding like scultpure
Potential but unrealised, infinite space.
Each character, cadence, line and block cuts through that space, chopping of possibilities, but making what remains more real.
This is sculpting a processs, a practice, 
And it becomes intangled with the processes around it, the users of it and of what it produces, for us, our catalogures, curators readersa nd researchers.

But as the process becomes more real and more entangled, it's grain grows heavier and more twisted. It get's harder to find the lines where we can slice apart the complicit machines and repair, reform, transform. This dynamic underlies many of the problems many of our long-standing organisations face every day. Legacy systems, tangles of monoliths, all run through with human patterns and expectations.

How does the carpenter cope with the grain of the wood? The joint. The clever interface that neatly knits divergent grain. And the sculpter, the textile-person(?!), the programmer all find their ways of working with the grain.

WARC itself is a clever cleaving along a natural line.

For technologists, one of these ways of working is the API. 

What I've tried to do is to explore and understand the way many of the IIPC members use the web crawling tools. I've been trying to understand the grain, twist, and the knotholes of our tools and the processes they are embedded in within our institutions. Where should we place the chisel? At what angle should the hammer blow fall?

Existing:
- Wayback
- H3 REST API
- ...

Bad APIs:
- Conflict in crawling methodologies. Jobs, styles of jobs, continuous crawling, etc. Knots and twists, a lack of common practice in the details. It's not the place to strike, for now.

Good API candidates:
- PROXY
- CDX SERVER
- ...



But software is a but different, again, we're making processes, not state, so we can make machines that make machines.

and there is no better way to share practive than as code.

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


The Dynamics
============

Last year, I showed you this graph. Is shows how much has been lost from the web over the years, and how much we've saved. 

But that was last year, when I was the good cop.

This year, I'm here to play the bad cop.

In the old days, before Legal Deposit, and powered by the Web Curator Tool, we archived a few thousand websites, and the archiving activity was generally focussed around themes or events. Very long running crawls were rare. But under Legal Deposit, we don't just need to collect more sites, but we need to collect them more frequently as well as completely.

News publications are an important part of the library's collections, and maintaining good coverage of the news is an important goal for us. As news has gone from print to broadcast, and then online, we have had to adapt in order to fulfil the reasonable expectation that we will preserve this important stream of information.

Similarly, we need to capture official publications in new ways. Documents we used to get as regular and well-defined submissions in paper formats are now moving online, and so we need to find those documents to allow them to be catalogued and merged into the libraries collections. These documents need to be picked up shortly after publications, and these sites are often large and need to be captured completely.

It's not just a way of coping with the scale of the work - it goes deeper than that - it's about ensuring the knowledge we need to run the system is made explicit.


However, the Heritrix crawler itself remains difficult to manage and scale. We can add more parallel threads to a single Heritrix job, but we're finding this gets more brittle as we scale up. Of course, Heritrix does come with some distributed crawling support (the HashCrawlMapper, which we've used for domain crawls), but this does not allow the number of crawlers to be tuned up and down over time during a single crawl. We can live with this situation for now, but it prevents us from bringing significant improvements to the crawl process.

More seriously, although running the renderer to capture the URLs has definitely improved the crawl quality, we're still not getting the results we want, due to differences between rendered form and archived capture. 

...bbc...

It is unfortunately rather common to embed session identifiers or other transient information in HTML pages and URLs, and this means the version of a page downloaded by Heritrix requires different URLs to the one the renderer saw. It's possible to counteract this by adding lots of brittle, site-specific crawl canonicalisation rules, but this is messy, complicates playback, and will break over time. The only solution that is manageable over the long term is to run the renderer behind an archiving proxy, and capture the resources precisely as the browser saw them.

...with a proxy...

If we're going to the trouble of having a scalable archiving proxy that can write our WARCs, then rather than maintain two separate stacks that do the same job, it makes more sense to move all the WARC writing out to the proxy and run Heritrix behind it too. This would allow us to snip a significant chunk of complexity out of Heritrix and reduce the amount of crawl status information being managed by the one process.[^1]

...all with a proxy...

To try to break the monolith down further, we are considering ways to move the frontier queues themselves out of Heritrix and into a standard database engine. If we can do this, it would them make sense to break Heritrix down into it's major components and look at ways of transplanting them into a standard distributed processing framework.  Multi-process and multi-threaded code is difficult to write and maintain, so it makes sense to use a proven system rather that write our own.


Sketch ways H3 could be decoupled.

H3
- AlreadySeen cache -> redis, 
- AlreadySeen and persistLog -> HBase/warcbase and/or Wayback?
- Queues out to ElasticSearch or some sorted key-value engine.
- Extract H3 'brain' for separate stages and embed in a off-the-shelf framework

To cope, we need crawl system that:

- Scalable continuous crawling and re-crawling:
    - *Delegate WARC writing to archiving proxies*
    - *Push more pages through browser rendering engines*
    - *Move complex state our of Heritrix and into separate scalable systems where possible*
    - *Decompose Heritrix components and embed them in a standard distributed computing framework*
    - *Make development and testing of new features easier*


This presentation will revisit those challenges and explore the degree to which we have met or failed to meet them in the three years since then.  We will look at some of the problems the UK Web Archive found when crawling the dynamic, responsive web, and discuss our current tactics where we blend browser-based crawling with more traditional Heritrix crawls. Our approach will also be compared against the approaches used by other organisations.  We will then look at potential options for future development of our shared crawl capability, and call for coordinated effort among the web archiving community to prevent our tools falling even further behind.

To give you an idea of the scale of the problem, out of 230 requests made when playing back this page, only 28 went through OpenWayback. The other 202 request leaked out into the live web.

It's important to emphasis that this kind of thing does not only cause problems when playing-back the material in OpenWayback. Most of the time we never get these additional resource at all, and you can't play back what you don't have. Although H3 includes a module to perform smarter JavaScript extraction, we've not found them reliable, and using it has caused web site owners to block us.

[^1]: Having said that, the warc-writing proxy itself becomes fairly complex, as it would also need to handle de-duplication and (for us at least) virus scanning too (because we prefer to scan mid-crawl and redirect the suspected viruses into a separate stream of WARC files). 



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

Large chunks

- Frontier
- Persist Log
- recentlySeen (if caching)
- serverCache (caching DNS, robots.txt, and ???)

80M     /heritrix/state/frequent/cookies
263G    /heritrix/state/frequent/frontier
455G    /heritrix/state/frequent/persist
4.6G    /heritrix/state/frequent/recentlySeen
2.9G    /heritrix/state/frequent/serverCache
4.1M    /heritrix/state/frequent/statistics


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
