---
title: Web Archive APIs
subtitle: Outline
author: anj
layout: post
shown: true
sidebar-include: _wapi.md
tags: ["Web Archive APIs"]
---

This is a series of posts describing our evolving web archiving framework and tools. In particular, the aim is to document how our crawl architecture has evolved to become more modular, and to explore the idea of using APIs to make these systems more manageable over time.

Tools for Legal Deposit
=======================

When I joined the [UK Web Archive](http://www.webarchive.org.uk/) team, the preparations for [Non-Print Legal Deposit](http://www.bl.uk/aboutus/legaldeposit/introduction/) were already under way. Before that time, only selected websites were being archived by explicit permission, using the [Web Curator Tool](http://webcurator.sourceforge.net/) (WCT) to manage almost the whole life-cycle of the material. The final playback was via a separate instance of Wayback, but WCT drove the rest of the process.

The problem was that WCT isn't a good match for a domain crawl. In particular, the [old version of Heritrix](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix#Heritrix-Heritrix1.14.4%28May2010%29) embedded inside WCT was not considered very scalable, was not expected to be supported for much longer, and was difficult to re-use because of the way it was baked inside WCT. Even ignoring those issues, the workflow and data model that supports selective archiving just doesn't make much sense when applied to a domain crawl.

The chosen solution was to use [Heritrix 3](https://github.com/internetarchive/heritrix3) to perform the domain crawl separately from the selective harvesting process. While this was rather different to Heritrix 1, requiring incompatible methods of set-up and configuration, it scales very efficiently, allowing us to perform a full domain crawl on a single server.

But as I began to work on the domain crawl project, a number of other issues came up. What about going behind paywalls? What about capturing dynamic dependencies arising from JavaScript or complex CSS? What about integrating pre-HTML5 videos? What about adding in additional (large) content submitted via hard-disk to avoid network costs? What if we have to use some kind of archiving web proxy so that we can drive the capture manually for some of these tricky cases? Surely we will need to capture our web archives through a shifting and growing range of tools and mechanisms, and our management processes need to cope with that?

As things stood, following the onset of the Non-Print Legal Deposit regulations, the domain crawls and the WCT crawls would continue side by side, but would in effect be separate collections. It would be possible to move between them by following links in Wayback, but no more.

This is not necessarily a bad idea, and it may have been simpler to implement, but it seemed to be a terrible shame largely because it made it very difficult to effectively re-use material that had been collected as part of the domain crawl.  For example, what if we found we'd missed an important website that should have been in one of our high-profile collections, but because we didn't know about it, it's only been captured under the domain crawl? Well, we'd want to go and add those old instances to that collection, of course.

But WCT makes that kind of thing really hard.

If you look at the overall architecture, the Web Curator Tool enforces what is essentially (despite the odd loop or dead-end) a linear workflow (figure taken from [here](http://webcurator.sourceforge.net/docs/1.6.1/Web%20Curator%20Tool%20Quick%20Start%20Guide%20%28WCT%201.6%29.pdf)). First you define your Target and it's metadata, then you crawl it (and maybe re-crawl it for QA), then you store it, then you make it available. In that order.

[![WCT Overall Workflow]({{ site.baseurl }}/wa-apis/images/WCT-workflow.png)]({{ site.baseurl }}/wa-apis/images/WCT-workflow.svg)

But what if we've already crawled it? Or collected it some other way? What if we want to add metadata to existing Targets? What if we want to store something but not make it available. What if we want to make domain crawl material available via Wayback even if we haven't QA'd it?

Looking at WCT, the components we needed were there, but tightly integrated in one monolithic application that embodied the expected workflow. I simply could not see how to take it apart and rebuild it in a way that would make sense and enable us to do what we needed. Furthermore, we had already built up a rather complex arrangement of additional components around WCT, such as the additional 'Selection and Permission Tool' (SPT) used to manage the licensing process. It therefore made some sense to revisit our architecture as a whole.

So, I made the decision to make a fresh start. Instead of the WCT and SPT, we would develop a new, more modular archiving architecture built around the concept of annotations.


Driving Crawls Via Annotations
==============================

The heart of the idea was simple. Rather than starting with a Target and adding collection metadata, we think in terms of annotating the (live) web. From this perspective, each Target in WCT is really very similar to a bookmark on an social bookmarking service (like [Pinboard](https://pinboard.in/), [Diigo](https://www.diigo.com/) or [Delicious](https://delicious.com/)), except that as well as describing the web site, the annotations also drive the archiving of that site[^1].

Some annotations may just highlight a specific site or URL at some point in time, using descriptive metadata, tags and collections to help ensure important resources are captured and made discoverable for our users. Others might more explicitly drive the crawling process, by describing how often the site should be re-crawled, whether robots.txt should be obeyed, and so on. Crucially, where a particular website cannot be ruled as in-scope for UK legal deposit automatically, the annotations can be used to record any additional evidence that permits us to crawl the site. Any permissions we have sought in order to make a archived web site available under open access can also be recorded in much the same way.

Once we have crawled and captured instances of those URLs and sites of interest, we can then apply the same annotation model to the archival material itself. In particular, we can combine one or more targets with a selection of annotated instances to form a collection. These instance annotations could be quite similar to those supported by 'live web annotation' services like [Hypothes.is](https://hypothes.is/), and indeed this may provide a way for web archives to support and interoperate with services like that.[^2]

Thinking in terms of annotations also makes is easier to peel processes apart from their results. For example, metadata that indicates whether we have passed those instances through a QA process can be recorded as annotations on our archived web, but the actual QA process itself can be done entirely outside of the tool that records the annotations.

To test out this approach, I built a prototype Annotation & Curation Tool (ACT) based on [Drupal](https://www.drupal.org/). Drupal makes it easy to create web UIs for [custom content types](https://www.drupal.org/node/21947), and as I know Drupal quite well I was able to create an simplistic but acceptable interface very quickly.  This allowed users to register URLs and specify the additional metadata we needed -- most crucially, the crawl permissions, schedules and frequencies. But how do we use the to drive the crawl?

Our solution was to configure Drupal so that it provided a 'crawl feed' in a machine readable format. But rather than attempting to modify Heritrix itself, we use a separate scripted process that requests the latest crawl feeds and restarts the daily/weekly/monthly crawls via the [Heritrix 3 API](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix+3.x+API+Guide).

This was tactic was very successful, and this more modular architecture looked like being much more manageable. The 'prototype' rapidly morphed into the production system, and the emphasis shifted to working out how to make this approach more maintainable, and extending it to make it capable to taking over fully from WCT.

[^1]: Note that this is also [a feature of some bookmarking sites](https://pinboard.in/upgrade/).
[^2]: I'm not yet sure how this might work, but some combination of the [Open Annotation Specification](http://www.openannotation.org/) and [Memento](http://timetravel.mementoweb.org/about/) might be a good starting point.


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



Towards a Web Archiving Platform
================================

Platforms (from https://plus.google.com/+RipRowan/posts/eVeouesvaVX)

- Separate components communicating over APIs, only.
- Scale
- Demand for monitoring, which ends up being automated QA.


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

But butts up against crawler problems.

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

Distributed Web Archives
========================

- P2P Memento/Wayback§
- [Wouldn’t it be fun to build your own Google?](http://radar.oreilly.com/2014/12/wouldnt-it-be-fun-to-build-your-own-google.html)
- http://tomp2p.net/
- Cassandra
- Integrating International Archives
    - DHT+Range Queries, [e.g. ExampleDST.java](https://github.com/tomp2p/TomP2P/blob/master/examples/src/main/java/net/tomp2p/examples/ExampleDST.java)?
