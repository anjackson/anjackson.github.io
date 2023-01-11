---
title: UK Web Archive Technical Update - Summer 2022
subtitle: 2022 Q2 Summary Report
date: 2022-07-11T18:13:30.585Z
category: building-web-archives
tags:
  - Reports
  - Web Archives
layout: post
author: anj
shown: true
showtoc: false
---
Following on from [the last quarterly update](https://blogs.bl.uk/webarchive/2022/05/uk-web-archive-technical-update-spring-2022.html), we've been able to make some good progress despite being understaffed during this period.

<!--break-->

## Hadoop storage and replication

We are still in the process of replicating content onto a second Hadoop cluster, to be moved to the National Library of Scotland.  The cluster capacity is 1PB, and it's now about 70% full. Next steps will involve double-checking the files have been replicated correctly, and planning the relocation of the servers.

## LD Access Solution

There has been significant progress on developing the new reading room access system for the UK Web Archive and other Legal Deposit content. The Webrecorder team has delivered and initial version of the [NPLD Player app](https://github.com/ukwa/npld-player), which will be needed to access Legal Deposit material on some reading room access terminals.  Once some final issues have been addressed, and some documentation added, we can start to plan the roll out in detail.

Before that, we need the centralized services deployed, which use [our PyWB system](https://github.com/ukwa/ukwa-pywb) to render PDFs and ePubs as well as archived web pages. The Webrecorder team have implemented most of the necessary changes to PyWB, and we have been working towards deploying the new access services, in partnership with the British Library's Application Support team.

The whole project team has been busy planning, capturing use cases and test cases, considering security issues, publishing internal communications about the work, and responding to feedback from those communications. There's still a few areas of uncertainty, which means we don't yet have a solid time-scale for the full transition to the new services, but this should become clear over the next few months.

## Crawlers

While the core crawl system has not been changed in the last quarter, we have made improvements to how the crawls are launched and how the current Document Harvester is implemented.

Specifically, all services have now been moved from our older workflow system to our new Airflow platform (as mentioned in [the 2022-01 technical update](https://blogs.bl.uk/webarchive/2022/01/ukwa-2021-technical-update.html)).  This means these automated tasks are now easier to monitor and manage.  In particular, the older workflow system has been struggling for some months due to the large number of tasks involved in the Document Harvester workflow. The underlying tools have been heavily refactored to make sure the document identification and extraction processes are much more efficient and reliable.

## W3ACT

While W3ACT itself has not been updated during the last quarter, the version of PyWB it uses has been updated to the latest 2.6.7 release.

## Website

The new searchable [Topics & Themes page](https://www.webarchive.org.uk/en/ukwa/category) is now live, making it much easier to explore our curated collections. We've found a few minor issues, such as some collections not appearing on the page, but we'll work on ironing these out over the next weeks.

To help us update our website with confidence, we've made a number of improvements to our [automated testing system](https://github.com/ukwa/docker-robot-framework#readme).  This has been refactored to make it easier to run, and extended to cover almost all critical web services and APIs. As well as making changes easier to implement, this also means we can automatically run the test suite every morning, and will be alerted if anything isn't working as expected (UKWA staff and partners can access [the most recent test report at this URL](https://www.webarchive.org.uk/act/static/test-reports/prod/report.html)).

This new test suite includes experimental support for running the [Pa11y accessibility evaluation tool](https://pa11y.org/), and including the results in the test report.  In time, this will help us ensure any changes we make to the website do not negatively affect the accessibility of the site (at least to the extend that automated testing can determine).

## Archives of Tomorrow

Finally, we've enjoyed starting to get into some detailed conversations with our [Archives of Tomorrow project](https://www.nls.uk/about-us/working-with-others/archive-of-tomorrow/) colleagues.  Among other things, these conversations will help drive our nascent UKWA API work, by helping us explore how best to make our curated collections and other data and metadata available for re-use. These discussions also reminded us to polish off some updates to our screen-shotting services, which means the [Twitter](https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/abouts-cards) and [Open Graph](https://ogp.me/) social card support we've added to our playback pages should now be significantly more responsive and reliable.

To find out more about the Archives of Tomorrow project, you can check out this IIPC blog post: [Archive of Tomorrow – Capturing online health (mis)information](https://netpreserveblog.wordpress.com/2022/04/21/archive-of-tomorrow-capturing-online-health-misinformation/).