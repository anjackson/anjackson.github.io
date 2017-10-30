---
title: Driving Crawls Via Annotations
subtitle: Bringing domain and focussed crawling together
author: anj
layout: post
shown: false
tags: ["Web Archives", "Digital Preservation"]
---

The heart of the idea was simple. Rather than [starting with seeds and scopes and adding collection metadata](/2017/10/19/tools-for-legal-deposit), we would think in terms of annotating the live web, and imagine how we might use those annotations to drive the web-archiving process. From this perspective, each Target in WCT is really very similar to a bookmark on an social bookmarking service (like [Pinboard](https://pinboard.in/), [Diigo](https://www.diigo.com/) or [Delicious](https://delicious.com/))[^1], except that as well as describing the web site, the annotations also drive the archiving of that site[^2].

In this unified model, some annotations may just highlight a specific site or URL at some point in time, using descriptive metadata, tags and collections to help ensure important resources are captured and made discoverable for our users. Others might more explicitly drive the crawling process, by describing how often the site should be re-crawled, whether robots.txt should be obeyed, and so on. Crucially, where a particular website cannot be ruled as in-scope for UK legal deposit automatically, the annotations can be used to record any additional evidence that permits us to crawl the site. Any permissions we have sought in order to make a archived web site available under open access can also be recorded in much the same way.

Once we have crawled and captured instances of those URLs and sites of interest, we can then apply the same annotation model to the archival material itself. In particular, we can combine one or more targets with a selection of annotated instances to form a collection. These instance annotations could be quite similar to those supported by 'live web annotation' services like [Hypothes.is](https://hypothes.is/), and indeed this may provide a way for web archives to support and interoperate with services like that.[^3]

Thinking in terms of annotations also makes it easier to peel processes apart from their results. For example, metadata that indicates whether we have passed those instances through a QA process can be recorded as annotations on our archived web, but the actual QA process itself can be done entirely outside of the tool that records the annotations.

To test out this approach, we built a prototype Annotation & Curation Tool (ACT) based on [Drupal](https://www.drupal.org/). Drupal makes it easy to create web UIs for [custom content types](https://www.drupal.org/node/21947), and as I know Drupal quite well I was able to create a simplistic but acceptable interface very quickly.  This allowed curators to register URLs and specify the additional metadata we needed -- most crucially, the crawl permissions, schedules and frequencies. But how do we use this to drive the crawl?

Our solution was to configure Drupal so that it provided a 'crawl feed' in a machine readable format. This was initially a simple list of JSON objects (one per Target, containing all the information we held about that Target) where the list could be filtered by crawl frequency (daily, weekly, monthly, and so on). However, as the number of entries in the system grew, having the entire set of data associated with each Target eventually became unmanageable. This led to a simplified description that just contains the information we need to run a crawl, which looks something like this:

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

This simple interface became the first of our [web archiving APIs](https://kris-sigur.blogspot.co.uk/2015/06/even-though-it-didnt-feature-heavily-on.html) -- a set of [application programming interfaces](https://en.wikipedia.org/wiki/Application_programming_interface) that each embody protocols we use to try to [split our monolithic services into modular components](https://programmingisterrible.com/post/162346490883/how-do-you-cut-a-monolith-in-half).

Of course, the output of the crawl engines also needs to meet some kind of standard so the downstream indexing, ingesting and access tools know what to do. This works much like the API concept described above, but it even simpler, as we just rely on standard file formats in a fixed directory layout. Any crawler can be used as long as it outputs standard WARCs and logs, and puts them into the following directory layout:

    /output/logs/{job-identifer}/{launch-timestamp}/*.log
    /output/warcs/{job-identifer}/{launch-timestamp}/*.warc.gz

Where the `{job-identifer}` is used to specify which crawl job (and hence which crawl configuration) is being used, and the `{launch-timestamp}` is used to separate distinct jobs launched using the same overall configuration, reflecting repeated re-crawling of the same sites over time.

In other words, if we have two different crawler engines that can be driven by the same crawl feed data and output the same format results, we can switch between them easily. Similarly, we can make any kind of changes to our Annotation & Curation Tool, or even replace it entirely, and as long as it generates the same crawl feed data, the crawler engine doesn't have to care. Finally, as we've also standardised the crawler output, the tools we use to post-process our crawl data can also be independent of the specific crawl engine in use.

This separation of components has been crucial to our recent progress. By de-coupling the different processes within the crawl lifecycle, each of the individual parts is able to be move at it's own pace. Each can be modified, testing and rolled-out without affecting the others, if we so choose. True, making large changes that affect multiple components does require more careful management of the development process, but this is a small price to pay for the ease by which we can roll out improvements and bugfixes to individual components.

A prime example of this is how our Heritrix crawl engine itself has evolved over time, and that will be the subject of the next blog post.

----

[^1]: Although, noting that [Delicious is now owned by Pinboard](https://blog.pinboard.in/2017/06/pinboard_acquires_delicious/), I would like to make it clear that we are not attempting to compete with Pinboard.
[^2]: Note that this is also [a feature of some bookmarking sites](https://pinboard.in/upgrade/). But we are *not* attempting to compete with Pinboard.
[^3]: I'm not yet sure how this might work, but some combination of the [Open Annotation Specification](http://www.openannotation.org/) and [Memento](http://ti3etravel.mementoweb.org/about/) might be a good starting point.
