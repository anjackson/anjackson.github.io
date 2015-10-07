---
title: Web Archiving APIs
author: anj
layout: post
shown: true
sidebar-include: _wapi.md
tags: ["Web Archive APIs"]
---

This is a series of posts describing our evolving web archiving framework and tools. In particular, the aim is to document how our crawl architecture has evolved to become more modular, and to explore the idea of using APIs to make these systems more manageable over the long term.

Tools for Legal Deposit
=======================

When I joined the [UK Web Archive](http://www.webarchive.org.uk/) team, the preparations for [Non-Print Legal Deposit](http://www.bl.uk/aboutus/legaldeposit/introduction/) were already under way. At that time, we were only archiving selected websites by explicit permission, using the [Web Curator Tool](http://webcurator.sourceforge.net/) (WCT) to manage almost the whole life-cycle of the material. The final playback was via an instance of Wayback, but WCT drove the rest of the process.

The problem was that WCT isn't a good match for a domain crawl. In particular, the [old version of Heritrix](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix#Heritrix-Heritrix1.14.4%28May2010%29) embedded inside WCT was not considered very scalable, was not expected to be supported for much longer, and was difficult to re-use because of the way it was baked inside WCT. Even ignoring those issues, the workflow and data model that supports selective archiving just doesn't make much sense when applied to a domain crawl.

The chosen solution was to use [Heritrix 3](https://github.com/internetarchive/heritrix3) to perform the domain crawl separately from the selective harvesting process. While this was rather different to Heritrix 1, requiring incompatible methods of set-up and configuration, it scales very efficiently, allowing us to perform a full domain crawl on a single server.

But as I came into the project, a number of other issues came up. What about going behind paywalls? What about capturing dynamic dependencies due to things like JavaScript? What about integrating pre-HTML5 videos, or adding in additional (large) content submitted via hard-disk to avoid network costs? What it we have to use some kind of archiving web proxy so that we can drive the capture manually? Surely we will need to capture our web archives through a shifting and growing range of tools and mechanisms, and our management processes need to cope with that?

As things stood, following the onset of the Non-Print Legal Deposit regulations, the domain crawls and the WCT crawls would continue side by side, but as separate collections. It would be possible to move between them by following links in Wayback, but no more.

This is not necessarily a bad idea, and it certainly would have been simple to implement, but it seemed to be a terrible shame.  Crucially, it made effective re-use of material that had been collected as part of the domain crawl very difficult.  For example, what if we found we'd missed an important website that should have been in one of our high-profile collections, but because we didn't know about it, it's only been captured under the domain crawl? Well, we'd want to go and add those old instances to that collection, of course.

But WCT makes that kind of thing really hard.

If you look at the overall workflow, the Web Curator Tool enforces what is essentially, despite the odd loop or dead-end, a linear workflow (figure taken from [here](http://webcurator.sourceforge.net/docs/1.6.1/Web%20Curator%20Tool%20Quick%20Start%20Guide%20%28WCT%201.6%29.pdf).

See BIG DIAGRAM:

1. Define Target
2. Get permission to harvest and make available
3. Create descriptive metadata
4. Create/modify crawl configuration
5. Crawl Target
6. QA Crawled Target Instance
7. If quality is poor, delete, GOTO 4
8. Submit to preservation store
9. Make available

First you define your Target and it's metadata, then you crawl it (and maybe re-crawl it for QA), then you store it, then you make it available. In that order.

But what if we've already crawled it? Or collected it some other way? What if we want to add metadata to existing Targets? What if we want to store something but not make it available. What if we want to make domain crawl material available via Wayback even if we haven't QA'd it?

Looking at WCT, the components we needed were there, but intricately intertwined in one monolithic application that embodied the expected linear workflow. I simply could not see how to take it apart in a way that would make sense and enable us to do what we needed.

So, I made the decision to make a fresh start. Instead of the Web Curator Tool, we would develop a new, more modular archiving architecture built around the concept of annotations.


Driving Crawls Via Annotations
==============================

The heart of the idea was simple. Instead of starting with the metadata, we start with the live web. Each 'Target' in WCT is really very similar to a 'bookmark' in an social bookmarking service like [Pinboard](https://pinboard.in/), [Diigo](https://www.diigo.com/) or [Delicious](https://delicious.com/), except that as well as describing the web site, it should also drive the archiving of that site[^1].

Once we have instances of those URLs and sites of interest, we can then apply the same annotation model to the material we have crawled. In particular, we can combine one or more targets with a selection of annotated instances to form a collection. 

Thinking in terms of annotations also makes is easier to peel processes apart from their results. For example, metadata that indicates whether we have passed those instances through a QA process can be record as annotations on our archived web, but the actual QA process itself can be done entirely outside of the tool.

To test out this approach, I built a prototype Annotation & Curation Tool (ACT) based on [Drupal](https://www.drupal.org/). Drupal makes it easy to create web UIs for [custom content types](https://www.drupal.org/node/21947), and as I know Drupal quite well I was able to create an appropriate interface very quickly.  This allowed users to register URLs and specify the additional metadata we needed -- most crucially, the crawl permission, schedules and frequencies. But how to we use the to drive the crawl?

Our solution was to configure Drupal so that it provided a 'crawl feed' in a machine readable format. But rather than attempting to modify Heritrix itself, we use a separate scripted process that requests the latest crawl feeds and restarts the daily/weekly/monthly crawls via the [Heritrix 3 API](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix+3.x+API+Guide).

This was tactic was very successful, and this more modular architecture looked like being much more manageable. The 'prototype' rapidly morphed into the production, and the emphasis shifted to working out how to make this approach more maintainable, and extending it to make it capable to taking over fully from WCT.

[^1]: Note that this is also [a feature of some bookmarking sites](https://pinboard.in/upgrade/).

Building W3ACT
==============

https://github.com/ukwa/python-w3act


Improving Crawl Quality
=======================

Monitrix, PhantomJS.


Experimenting With Paywalls
===========================

Then also, multiple sources, manual and various crawlers. Next step, proxification.


Towards a Web Archiving Platform
================================

Platforms (from https://plus.google.com/+RipRowan/posts/eVeouesvaVX)

- Separate components communicating over APIs, only.
- Scale
- Demand for monitoring, which ends up being automated QA.



Web Archiving APIs
==================


- http://blog.dshr.org/2015/06/brief-talk-at-columbia.html
- http://kris-sigur.blogspot.co.uk/2015/06/even-though-it-didnt-feature-heavily-on.html

Importance of monitoring-QA continuum.

Experimenting With New Architectures
====================================

Storm as framework for exploration.

Renderer as candidate for understanding how this works due to scaling issue plus modularity.

Sketching A Scalable & Modular Crawler
======================================

The gnarly chunks of H3.

Storm, RabbitMQ, proxies, etc.

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
