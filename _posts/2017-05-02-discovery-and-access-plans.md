---
title: Revitalising the UK Web Archive
subtitle: Updating our discovery and access services
category: mining-web-archives
tags: ["Data Mining", "Web Archives", "BUDDAH"]
layout: post
author: anj
shown: false
---

It's been over a year since we made [our historical search system available][1], and it's proven itself to be stable and useful. Since then, we've been largely focussed on changes to our crawl system, but we've also been planning how to take what we learned in the [Big UK Domain Data for the Arts and Humanities][2] project and use it to re-develop [the UK Web Archive](https://www.webarchive.org.uk/ukwa/).

Our current website has not changed much since 2013, and doesn't describe who we are and [what we do](http://britishlibrary.typepad.co.uk/webarchive/2015/06/ten-years-of-archiving-the-web.html) now that the [UK Legal Deposit regulations](http://www.bl.uk/aboutus/legaldeposit/websites/) are in place. It only describes the sites we have crawled by permission, and does not reflect the tens of thousands of sites and URLs that we have curated and categorised under Legal Deposit, nor the billions of web pages in the full collection. To try to address these issues, we're currently developing a new website that will open-up and refresh our archives.

One of the biggest challenges is the search index. The 3.5 billion resources we've indexed for [SHINE][4] represents less than a third of our holdings, so now we need to scale our system up to cope with over ten billion documents, and a growth rate of 2-3 billion resource per year. We will continue working with the [open source indexer we have developed](https://github.com/ukwa/webarchive-discovery), while updating our data processing platform ([Apache Hadoop](http://hadoop.apache.org/)) and dedicating more hardware to the [SolrCloud that holds our search indexes](http://blogs.bl.uk/webarchive/2014/11/powering-the-uk-web-archive-search-with-solr.html). If this all works as planned, we will be able to offer a complete search service that covers our entire archive, from 1995 to yesterday.

The first release of the new website is not expected to include all of the functionality offered by the [SHINE prototype](https://github.com/ukwa/shine), just the core functionality we need to make our content and collections more available to a general audience. Quite how we bring together these two distinct views of the same underlying search index is an open question at this point it time. Later in the year, we will make the new website available as a public beta, and we'll be looking for feedback from all our users, to help us decide how things should evolve from here.

As well as scaling up search, we've also been working to scale up our access service. While it doesn't look all that different, our [website playback service](https://www.webarchive.org.uk/wayback/archive/) has been overhauled to cope with the scale of our full collection. This allows us to make our full holdings knowable, even if they aren't openly accessible, so you get a more informative error message (and [HTTP status code](https://en.wikipedia.org/wiki/HTTP_451)) if you attempt to access content that we can only make available on site at the present time. For example, if you look at [our archive of google.co.uk](https://www.webarchive.org.uk/wayback/archive/*/http://www.google.co.uk), you can see that we have captured the Google U.K. homepage during our crawls but can't make it openly available due to the legal framework we operate within.

The upgrades to our infrastructure will also allow us update the tools we use to analyse our holdings. In particular, we will be looking at the [Warcbase](https://lintool.github.io/warcbase-docs/) project as it provides a powerful set of open source tools and a platform that would enable us to collaborate directly with our research community. A stable data-analysis framework like Warcbase will also provide a platform for report generation and make it much easier to update our [datasets](https://data.bl.uk/UKWA/).

Taken together, we believe these developments will revolutionise the way readers and researchers can use the UK Web Archive. It's going to be an interesting year.

[1]: http://britishlibrary.typepad.co.uk/webarchive/2016/02/updating-our-historical-search-service.html
[2]: http://buddah.projects.history.ac.uk/
[4]: https://www.webarchive.org.uk/shine
