---
title: UK Web Archive Technical Update - Spring 2022
subtitle: 2022 Q1 Summary Report
date: 2022-05-17T18:21:52.371Z
category: building-web-archives
tags:
  - Reports
  - Web Archives
layout: post
author: anj
shown: true
showtoc: false
---
This is a summary of what’s been going on since [the last update, at the start of the year](https://blogs.bl.uk/webarchive/2022/01/ukwa-2021-technical-update.html).

## Hadoop storage and replication

With the live services happily running off both the old and new Hadoop clusters, we have been focusing on setting up and populating our third Hadoop cluster, destined for the National Library of Scotland.

The Legal Deposit libraries have worked together to fund this additional, independent copy of the UK Web Archive holdings. This is primarily for the purposes of preservation, as having a further copy managed by a separate team and organisation will help ensure our records are not lost or damaged.  Longer-term, this system can also function as an independent access and research platform, and this is something we hope to explore as part of the [Archives of Tomorrow](https://www.nls.uk/about-us/working-with-others/archive-of-tomorrow/) project.

As there is a petabyte of content to replicate, we were initially concerned that the process of migrating the data would take an extremely long time, and possibly put an unsustainable load on our internal network infrastructure. Happily, these worries were unfounded: over the last six weeks, we've replicated about 300TB of WARCs, and this has not caused any noticeable network capacity problems. We've also been able to start running cluster jobs that calculate checksums for the files on both ends of the replication, so we can verify everything is working.

![Server rack and cables](/assets/images/uploads/server-rack-back.jpg "Server rack and cables")

## LD Access Solution

The current system for accessing Non-Print Legal Deposit material in our reading rooms has accessibility problems, and is being replaced with two components:

* An [enhanced version of PyWB](https://github.com/ukwa/ukwa-pywb/issues/74) that can render PDFs and ePubs.
* An ['NPLD Player' app](https://github.com/ukwa/npld-player) that will allow the content to be accessed from reading room PCs that have not been set up to prevent copies of items being accidentally taken away.

With both components being developed through a contract with Webrecorder.

This quarter has mostly been about laying the groundwork for this (like writing [deployment documentation](https://github.com/ukwa/ukwa-services/tree/master/access/rrwb#readme), so we might make more progress next quarter.

## Crawlers

We use web browsers to render a lot of seed pages, and this now represents a significant amount of data and included a lot of duplication of common files and media. To mitigate this, we have [enabled deduplication](https://github.com/ukwa/ukwa-services/issues/55) for the browser-based crawling.

We've also improved monitoring of the process of moving WARCs and logs to Hadoop, so we can spot if backlogs are building up.

## W3ACT

For the core W3ACT service, the only changes have been to fix the [links to QA Wayback that were being misdirected to the wrong URL](https://github.com/ukwa/w3act/issues/664), and [upgrade PyWBs to 2.6.4.1](https://github.com/ukwa/ukwa-services/issues/75).

However, we have been working on embedding [additional services behind the W3ACT login](https://github.com/ukwa/ukwa-services/issues/39). These include:

* A way to [view the logs from the W3ACT crawls](https://www.webarchive.org.uk/act/grafana/d/67xk-317z/recent-crawler-activity?orgId=1&refresh=1m).
* An instance of [SolrWayback](https://github.com/netarchivesuite/solrwayback/), configured to [search full text indexes from the W3ACT crawls](https://www.webarchive.org.uk/act/solrwayback/).

Our Danish colleagues have been very helpful, collaborating with us to augment SolrWayback so it could be run with our systems.  There are still some gaps (e.g. the internal playback part does not work reliably as our old Solr indexes do not provide all the fields SolrWayback needs) but it's still very valuable as a way of exploring and evaluating how we might work in the future.

One gap, however, is that we haven't yet updated the Storage Report with one that is up-to-date and runs across both clusters ([ukwa-notebook-apps#12](https://github.com/ukwa/ukwa-notebook-apps/issues/12)). That should be done early in April.

## Website

The majority of the work has focused on polishing off the high-level category view of the web archive collections, finalizing the design and pulling together the translations. This should be released in April.

In addition, like QA Wayback, the public PyWB service has been updated to 2.6.4.1, and we've [shifted the services to new hardware](https://github.com/ukwa/ukwa-services/issues/58).

Finally, we have been laying the groundwork for regular automated regression testing, including testing for accessibility issues.  Once established, this will be a huge help, allowing us to modify our services with more confidence, knowing that if we accidentally break any critical functionality, the test suite will catch the problem early. This is particularly important as preparation for larger changes, like integrating static documentation and translations into the main website ([ukwa-services#48](https://github.com/ukwa/ukwa-services/pull/48)).

## Google Sheets Add-On No Longer Available

A while ago, we experimented with an [add-on for Google Sheets](https://github.com/ukwa/ukwa-gsheets-utils)  that provided a way to query web archive holdings from an online spreadsheet ([this COPTR link provides some additional information](https://coptr.digipres.org/index.php/UKWA_GSuite_Add-On)).

Unfortunately, this has become unavailable due to a particular kind of digital obsolescence: changes to Google's policies.  To make it work again, we have to modify our formal policies and documentation in a way that meets Google's specific requirements. Realistically, due to other work taking priority, it's likely to be some time before we are able to look at restoring it.