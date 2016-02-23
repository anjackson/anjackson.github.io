---
title: Tools for Legal Deposit
subtitle: Shifting toward domain scale
author: anj
layout: post
shown: true
sidebar-include: _wapi.md
category: web-archiving-apis
tags: ["Digital Preservation"]
---

Between 2003 and 2013, the [UK Web Archive](http://www.webarchive.org.uk/) only archived selected websites by explicit permission. During this time, the [Web Curator Tool](http://webcurator.sourceforge.net/) (WCT) was used to manage almost the entire life-cycle of the material in the archive. The final playback was via a separate instance of Wayback, but WCT drove the rest of the process.

While valuable in it's own right, this was also seen as a way of building up the experience and expertise required to implement full domain crawling under [Non-Print Legal Deposit](http://www.bl.uk/aboutus/legaldeposit/introduction/) regulations. However, WCT was not found to be a good match for a domain crawl. The [old version of Heritrix](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix#Heritrix-Heritrix1.14.4%28May2010%29) embedded inside WCT was not considered very scalable, was not expected to be supported for much longer, and was difficult to re-use or replace because of the way it was baked inside WCT. Even ignoring those issues, the workflow and data model that supports selective archiving just doesn't make much sense when applied to a domain crawl.

The chosen solution was to use [Heritrix 3](https://github.com/internetarchive/heritrix3) to perform the domain crawl separately from the selective harvesting process. While this was rather different to Heritrix 1, requiring incompatible methods of set-up and configuration, it scales very effectively, allowing us to perform a full domain crawl on a single server.

When I joined the team in 2012 and began to work on the domain crawl project, a number of other issues came up. What about going behind paywalls? What about capturing dynamic dependencies arising from JavaScript or complex CSS? What about integrating pre-HTML5 videos? What about adding in additional (large) content submitted via hard-disk to avoid network costs? What if we have to use some kind of archiving web proxy so that we can drive the capture manually for some of these tricky cases? Surely we will need to capture our web archives through a shifting and growing range of tools and mechanisms, and our management processes need to cope with that?

As things stood, following the onset of the Non-Print Legal Deposit regulations, the domain crawls and the WCT crawls would continue side by side, but would in effect be separate collections. It would be possible to move between them by following links in Wayback, but no more.

This is not necessarily a bad idea, but it seemed to be a terrible shame largely because it made it very difficult to effectively re-use material that had been collected as part of the domain crawl.  For example, what if we found we'd missed an important website that should have been in one of our high-profile collections, but because we didn't know about it, it's only been captured under the domain crawl? Well, we'd want to go and add those old instances to that collection, of course.

Similarly, what if we wanted to merge material collected from a range of web archiving tools or services into our main collections? For example, if we do need to drive the archiving process manually, we need to be able to properly integrate that content into our systems and present them as part of a coherent whole.

But WCT makes these kind of things really hard.

If you look at the overall architecture, the Web Curator Tool enforces what is essentially (despite the odd loop or dead-end) a linear workflow (figure taken from [here](http://webcurator.sourceforge.net/docs/1.6.1/Web%20Curator%20Tool%20Quick%20Start%20Guide%20%28WCT%201.6%29.pdf)). First you define your Target and it's metadata, then you crawl it (and maybe re-crawl it for QA), then you store it, then you make it available. In that order.

[![WCT Overall Workflow]({{ site.baseurl }}/web-archiving-apis/images/WCT-workflow.png)]({{ site.baseurl }}/web-archiving-apis/images/WCT-workflow.svg)

But what if we've already crawled it? Or collected it some other way? What if we want to add metadata to existing Targets? What if we want to store something but not make it available. What if we want to make domain crawl material available via Wayback even if we haven't QA'd it?

Looking at WCT, the components we needed were there, but tightly integrated in one monolithic application, baked into the expected workflow. I simply could not see how to take it apart and rebuild it in a way that would make sense and enable us to do what we needed. Furthermore, we had already built up a rather complex arrangement of additional components around WCT, such as the additional 'Selection and Permission Tool' (SPT) used to manage the licensing process. It therefore made some sense to revisit our architecture as a whole.

So, I made the decision to make a fresh start. Instead of the WCT and SPT, we would develop a new, more modular archiving architecture built around the concept of annotations.

