---
title: UK Web Archive Technical Update - Winter 2022
subtitle: 2022 Q4 Summary Report
date: 2023-01-11T11:55:39.032Z
category: building-web-archives
tags:
  - Reports
layout: post
author: anj
shown: true
---
This is a summary of what’s been going on since [the update at the start of the autumn](https://blogs.bl.uk/webarchive/2022/10/uk-web-archive-technical-update-autumn-2022.html).

## 2022 Domain Crawl Completion

As in previous years, the 2022 Domain Crawl continued to run right up until the end of the year. Overall, things ran smoothly, with only brief outages for upgrading the virtual server over time as the size of the frontier grew.

![DC2022 URLs and size over time](/assets/images/uploads/2023-01-04-dc2022-summary-2.png "DC2022 URLs and size over time")

Because we were running on the cloud, we are paying for how much compute capacity, RAM and disk space we're using. So, when the crawl is small and the Heritrix3 frontier database is small, it makes sense to use a small computer. But as the crawl frontier grows, so does the amount of RAM the crawler needs to manage the frontier, so we scale up as we go.

This is one of the reasons we spent time making it possible to [configure](https://github.com/ukwa/ukwa-services/blame/012d9b194560ca4143238f575eaa3622e05870ec/ingest/dc/dc-crawl/docker-compose.yml#L40-L42) the frontier database so more house-keeping and clean-up processes are run while the crawl is running. This helps Heritrix clear disk space after it has dealt with URLs, and led to significant savings. The 2020 crawl ended up using 45TB of disk space to store the crawl state, and deleting old 'checkpoint' files (which can be used to revert the crawl state to a previous point in time) did not help free up more space. But after changing those configuration options, the 2021 and 2022 crawls only needed 15TB of space, and deleting checkpoints was much more effective.

## 2023 Domain Crawl Planning

The 2020 Domain Crawl was the last we expect to run on Amazon Web Services. We originally moved to the cloud to relieve pressure on the BL networks during the pandemic as more staff switched to working remotely. But even when COVID restrictions were eased, the library has continued to support staff working remotely where possible.  However, over the last year the library has upgraded many of the network systems across both the London and Boston Spa sites, which means we now have permission to run the 2023 crawl from Boston Spa.

As there is still a little uncertainty as to how this will affect other network users, we are planning to begin the crawl much earlier in the year. This gives us more time to revisit our options if something goes awry.

## Internal Collections API

Working with the Archives of Tomorrow project to understand he requirements, we now have an internal API where W3ACT metadata can be downloaded for entire collections, including all sub-collections and target site metadata. Authenticated W3ACT users can retrieve these full collection extracts (including unpublished collections), which are updated daily. The JSON files are available at <https://www.webarchive.org.uk/act/static/api-json-including-unpublished/collection/> for logged-in users.

The public version of the API is in the final stages of development, and should be released early in 2023. Unlike the internal API, this will not include collections that are not yet ready for publication.

## W3ACT 2.3.4

Just a few days ago, W3ACT 2.3.4 was released. This included a number of minor tweaks and fixes, including fixing the CSV export feature and adding more export formats (TSV and JSON). For more details, please take a look at [the associated release milestone](https://github.com/ukwa/w3act/milestone/41?closed=1).

Accidental subdomain accesx Fix subdomain access

## Document Harvester Outage

DDHAPT Outage

## Legal Deposit Access Solution

Ericom Replacement

## CDX Backfill

One of the critical components of the web archive is the content index (CDX), which is an index of all the URLs we have archived, and is required for playback to work. Ours runs on [OutbackCDX](https://github.com/nla/outbackcdx) (from the National Library of Australia), and a subset of it's functionality is available via [our API](https://www.webarchive.org.uk/api/docs#/Archived%20URLs/lookup_url_mementos_cdx_get).

In the past, we've had problems running large CDX indexing jobs, and this had left us in an unfortunate situating where the 2016, 2018 and 2019 domain crawls were not indexed. Over the last few months, we set the the indexing process to 'backfill' the index and (re)process our WARCs, and filled in those gaps.  This also showed that we could process our entire collection (over 1PB) in a reasonable time (about three months), which is reassuring. It will likely be necessary to re-build various indexes from time to time, and it's good to know it should be possible to do so in a reasonable amount of time. Also, the act of reading every byte of every WARC is an explicit additional proof that the files have been kept safe over all these years!

The 2020, 2021 and 2022 domain crawls will have to wait a little longer, as they are stored on Amazon Web Services and need transferring to the British Library before they can be indexed.

## Browsertrix-Cloud

We're part of the IIPC project *[Browser-based Crawling For All](https://netpreserve.org/projects/browser-based-crawling/)*, contributing the the development of [Browsertrix Cloud](https://browsertrix.cloud/) by supporting it's development and attempting to ensure IIPC members can take advantage of it. As part of this, we proposed two sessions for [next years' IIPC conference](https://netpreserve.org/ga2023/), both of which have been accepted:

* A workshop called *Browser-Based Crawling For All: Getting Started with Browsertrix Cloud*, aimed at helping attendees take advantage of Browsertrix Cloud.
* A panel called *Browser-Based Crawling For All: The Story So Far*, giving an insight into the current state of the project and of Browsertrix Cloud (including any feedback from the workshop).

Hoping to see you there!