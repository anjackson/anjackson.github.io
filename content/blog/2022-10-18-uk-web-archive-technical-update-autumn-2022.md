---
title: UK Web Archive Technical Update - Autumn 2022
subtitle: 2022 Q3 Summary Report
date: 2022-10-18T18:06:29.546Z
category: building-web-archives
tags:
  - Reports
  - Web Archives
layout: post
author: anj
shown: true
url: null
aliases: null
---
This is a summary of what's been going on since [the update at the start of the summer](https://blogs.bl.uk/webarchive/2022/07/uk-web-archive-technical-update-summer-2022.html).

<!--break-->

* TOC
{:toc}

## Website Refresh

On 2022-08-16 we relaunched the [UK Web Archive website](https://www.webarchive.org.uk/), but you probably didn't notice!

The previous version of the website treated page content like it was software, so updating what the pages said was far too difficult. This quarter, we finally got to release some changes we'd made so that most of the website pages are statically generated from [Markdown source held on GitHub](https://github.com/ukwa/ukwa-site/blob/master/content/info/about/index.en.md), using [Hugo](https://gohugo.io/). This means we could add in a content managment system called [NetlifyCMS](https://www.netlifycms.org/), which should make editing and translating the pages of our site much easier.

We've taken care to match the old website presentation and carefully overlay the new system while falling back on the old system for more complex dynamic pages. You might notice some minor differences to the styling between the two, if you look closely...

An important part of this was our [automated accessiblity testing](https://github.com/ukwa/docker-robot-framework/blob/main/tests/website/a11y.robot). While accessibility evaluation cannot be fully automated, these tools help us manage the process of making changes to our website and minimise the risks of making things worse in time periods between full accessibility evaluations.

## 2022 Domain Crawl Launch

As the British Library networks are in the final stages of being upgraded, 2022 is the last year we expect to run the domain crawl on Amazon Web Services.

We launched the 2022 crawl on 2022-08-17, and since the British Library is now a member of Nominet we were able to use an up-to-date list of UK domains as our starting point.

So far, we've processed nearly 400 million URLs, totalling about 19TiB of data (uncompressed). 

However, we've noticed what seems to be an uptick in systems like [fail2ban](https://www.fail2ban.org/) automatically mis-reporting our crawler activity as abusive behaviour. This means we have to put more work into managing our relationship with AWS, and has slowed things down a bit. Nevertheless, we expect the crawl to run successfully until the end of the year, as in previous years.

## Hadoop Replication

After many weeks of steady progress, our replica Hadoop storage service is now pretty much at capacity. Filling the thing up with about one petabyte of content took a while, but it's been taking us a bit longer to be sure we've double-checked the transfer worked.

We are now awaiting a decision on whether we can purchase another server for this cluster, so we can make sure there's room for the most recent crawls, and for content we expect to get in the near future.  Either way, we'll then start to plan shifting the hardware up the the National Library of Scotland.

## Exporting Collection Metadata

Working with the [Archives of Tomorrow](https://www.nls.uk/about-us/working-with-others/archive-of-tomorrow/) project, we've been developing way to export our collection metadata so it's more suitable for re-use.

Having real use cases drive the work has been useful, and over the next weeks we're hoping to integrate the outputs into the [UKWA API](https://www.webarchive.org.uk/api/docs) so anyone can use that data.


## Legal Deposit Access & NPLD Player

Working with [Webrecorder](https://webrecorder.net/) we've seen some good progress on a new version of PyWB that supports direct rendering of PDFs and ePubs, and on the secure player application that will be used to provide access in some reading rooms.

Much of the work has focussed on the challenges around testing and preparation for a new version of a service that works across multiple independent institutions. But it's been good to start to get some user feedback on how the system works in practice, which has already flushed out some additional requirements for the first release.

## iPres 2022

As covered in [this dedicate blog post](https://blogs.bl.uk/webarchive/2022/10/ipres-2022-conference-report-from-the-uk-web-archive.html), iPres 2022 included a presentation partly based on lessons learned from managing the technical aspects of the UK Web Archive. The plan is to publish a longer version of that work later in the year.

## Major Outage

After the successes of the iPres conference, we were quickly brought back down to earth by a severe hardware failure on the 25th of September. One of the network switches failed, and the whole UKWA dedicated network locked-up in a way that made it difficult to understand and route around the failure. 

This took a while to diagnose and resolve, so we moved some critical components onto other machines so our curators and users could use our services. While this was relatively successful, it also showed that some of our automated tasks need breaking down so that different functions can be managed independently. For example, we need crawl launches to be able to proceed even if nothing else is running. These problems meant that our daily crawling activity was delayed and patchy for most of last week.

These complications mean it's taken a bit longer than expected to undo all the interim changes that were made during the hardware outage.  However, we expect to be fully back to normal next week.

