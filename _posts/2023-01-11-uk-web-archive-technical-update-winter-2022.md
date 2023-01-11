---
title: UK Web Archive Technical Update - Winter 2022
subtitle: 2022 Q4 Summary Report
category: building-web-archives
tags:
  - Reports
layout: post
author: anj
shown: true
---
This is a summary of what’s been going on since [the update at the start of the autumn](https://blogs.bl.uk/webarchive/2022/10/uk-web-archive-technical-update-autumn-2022.html).

## 2022 Domain Crawl Completion

The 2022 Domain Crawl continued to run right up until the end of the year.


H3 space saving
2020 45TB for Heritrix State, and deleting old checkpoints did very little.
Then:
https://github.com/ukwa/ukwa-services/blame/012d9b194560ca4143238f575eaa3622e05870ec/ingest/dc/dc-crawl/docker-compose.yml#L40-L42
https://github.com/ukwa/ukwa-services/blob/012d9b194560ca4143238f575eaa3622e05870ec/ingest/dc/dc-crawl/docker-compose.yml#L40-L42

2021 15TB, and deleting old checkpoints has a more significant effect. Significantly cheaper.

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