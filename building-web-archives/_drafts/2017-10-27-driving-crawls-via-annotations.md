---
title: Driving Crawls Via Annotations
subtitle: Bringing domain and focussed crawling together
author: anj
layout: post
shown: true
tags: ["Web Archives", "Digital Preservation"]
---

The heart of the idea was simple. Rather than starting with seeds and scopes and adding collection metadata, we think in terms of annotating the live web, and how we would use those annotations to drive the web archiving process. From this perspective, each Target in WCT is really very similar to a bookmark on an social bookmarking service (like [Pinboard](https://pinboard.in/), [Diigo](https://www.diigo.com/) or [Delicious](https://delicious.com/))[^1], except that as well as describing the web site, the annotations also drive the archiving of that site[^2].

In our unified model, some annotations may just highlight a specific site or URL at some point in time, using descriptive metadata, tags and collections to help ensure important resources are captured and made discoverable for our users. Others might more explicitly drive the crawling process, by describing how often the site should be re-crawled, whether robots.txt should be obeyed, and so on. Crucially, where a particular website cannot be ruled as in-scope for UK legal deposit automatically, the annotations can be used to record any additional evidence that permits us to crawl the site. Any permissions we have sought in order to make a archived web site available under open access can also be recorded in much the same way.

Once we have crawled and captured instances of those URLs and sites of interest, we can then apply the same annotation model to the archival material itself. In particular, we can combine one or more targets with a selection of annotated instances to form a collection. These instance annotations could be quite similar to those supported by 'live web annotation' services like [Hypothes.is](https://hypothes.is/), and indeed this may provide a way for web archives to support and interoperate with services like that.[^3]

Thinking in terms of annotations also makes is easier to peel processes apart from their results. For example, metadata that indicates whether we have passed those instances through a QA process can be recorded as annotations on our archived web, but the actual QA process itself can be done entirely outside of the tool that records the annotations.

To test out this approach, I built a prototype Annotation & Curation Tool (ACT) based on [Drupal](https://www.drupal.org/). Drupal makes it easy to create web UIs for [custom content types](https://www.drupal.org/node/21947), and as I know Drupal quite well I was able to create an simplistic but acceptable interface very quickly.  This allowed users to register URLs and specify the additional metadata we needed -- most crucially, the crawl permissions, schedules and frequencies. But how do we use the to drive the crawl?

Our solution was to configure Drupal so that it provided a 'crawl feed' in a machine readable format. It looks something like this:

~~~
[
    {
        "id": 1,
        "title": "gov.uk Publications",
        "seeds": [
            "https://www.gov.uk/government/publications"
        ],
        "schedules": [
            {
                "frequency": "MONTHLY",
                "startDate": 1438246800000,
                "endDate": null
            }
        ],
        "scope": "root",
        "depth": "DEEP",
        "ignoreRobotsTxt": false,
        "documentUrlScheme": null,
        "loginPageUrl": null,
        "secretId": null,
        "logoutUrl": null,
        "watched": false
    },
    ...
~~~


Rather than attempting to modify Heritrix itself, we use a separate scripted process that requests the latest crawl feeds and restarts the crawls for each crawl frequency via the [Heritrix 3 API](https://webarchive.jira.com/wiki/display/Heritrix/Heritrix+3.x+API+Guide). The question was, how many crawls should we run?

The intent of the curators is clearly that each Target should have it's own crawl job, with it's own launch time and scope. We'd managed this before, but the change to Legal Deposit meant we were now attempting to archive far more Targets, and the majority of those would be ongoing crawls. For example, in the past, we would tend to harvest only those news stories associated with a particular event or collection. Now we needed to archive all the news sites all the time, at least daily.

This means we need to run hundreds of different crawls, and managing many small crawl jobs in Heritrix proved to be too difficult. We were forced to merge the different Targets into shared crawl jobs, and for simplicity we chose to do this by frequency. Thus, we ended up with six different crawl jobs, one for each re-crawl frequency. The `daily` targets being visited in one *daily* crawl, the `weekly` targets being visited in one *weekly* crawl, and so on.

Despite the limitations this implies, this was tactic was very successful. The 'prototype' rapidly morphed into the production system, and the emphasis shifted to working out how to make this approach more maintainable, and extending it to make it capable to taking over fully from WCT. 

Moreover, the modular, API-based architecture looked like being much more manageable over time. As long as any crawl engine could read the Crawl Feed API, and emit the resulting WARCs and log files, we were free to experiment with different crawl tactics without affecting other parts of the process.

----

[^1]: Although, noting that [Delicious is now owned by Pinboard](https://blog.pinboard.in/2017/06/pinboard_acquires_delicious/), I would like to make it clear that we are not attempting to compete with Pinboard.
[^2]: Note that this is also [a feature of some bookmarking sites](https://pinboard.in/upgrade/). But we are *not* attempting to compete with Pinboard.
[^3]: I'm not yet sure how this might work, but some combination of the [Open Annotation Specification](http://www.openannotation.org/) and [Memento](http://ti3etravel.mementoweb.org/about/) might be a good starting point.
