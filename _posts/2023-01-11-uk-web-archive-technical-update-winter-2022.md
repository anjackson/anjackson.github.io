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

W3ACT api-json-including-unpublished

Authenticated w3act users can now retrieve full collection extracts (including unpublished collections) from our static directory which is updated regularly:

Example:

https://www.webarchive.org.uk/act/static/api-json-including-unpublished/collection/4028.json

You need to be logged in as normal through w3act for authentication.

https://www.webarchive.org.uk/act/login

The public API access for unauthenticated extraction (i.e. excluding published collections) is undergoing integration and testing for deployment; we will notify you when it is available.

Browsertrix-Crawler and Cloud maaan

CDX Backfill

Fix subdomain access

DDHAPT

Ericom Replacement

W3ACT 2.3.4 - not yet released