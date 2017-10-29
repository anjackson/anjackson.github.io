---
title: Evolving Our Crawl Engine 
subtitle: How we use Heritrix3 
author: anj
layout: post
shown: false
tags: ["Web Archives", "Digital Preservation"]
---

[](/2017/10/30/driving-crawls-via-annotations)
Rather than attempting to modify Heritrix itself, we use a separate scripted process that requests the latest crawl feeds and restarts the crawls for each crawl frequency via the [Heritrix 3 API](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix+3.x+API+Guide). The question was, how many separate crawl jobs should we run?

The intent of the curators is clearly that each Target should have it's own crawl job, with it's own launch time and scope. We'd managed this before, but the change to Legal Deposit meant we were now attempting to archive far more Targets, and the majority of those would be ongoing crawls. For example, in the past, we would tend to harvest only those news stories associated with a particular event or collection. Now we needed to archive all the news sites all the time, at least daily.

This means we need to run hundreds of different crawls, and managing many small crawl jobs in Heritrix proved to be too difficult. We were forced to merge the different Targets into shared crawl jobs, and for simplicity we chose to do this by frequency. Thus, we ended up with six different crawl jobs, one for each re-crawl frequency. The `daily` targets being visited in one *daily* crawl, the `weekly` targets being visited in one *weekly* crawl, and so on.

Despite the limitations this implies, this was tactic was very successful. The 'prototype' rapidly morphed into the production system, and the emphasis shifted to working out how to make this approach more maintainable, and extending it to make it capable to taking over fully from WCT. 

Moreover, the modular, API-based architecture looked like being much more manageable over time. As long as any crawl engine could read the Crawl Feed API, and emit the resulting WARCs and log files, we were free to experiment with different crawl tactics without affecting other parts of the process.

----

[^1]: 
