---
title: What makes a large website large?
subtitle: My WARCs XL
date: 2023-06-09T13:06:28.787Z
category: building-web-archives
tags:
  - Web Archives
layout: post
author: anj
shown: true
url: null
aliases: null
---
Recently, the [Library of Congress's excellent Web Archive Team](https://www.loc.gov/programs/web-archiving/about-this-program/) sent out a request to gather information about how web archives cope with large websites. One of the questions was about how we define what makes a website "large".  This is my attempt to answer that question, and outline how we've adapted our crawling to cope with large sites...

<!--break-->

Of course, the primary factors that make a site "large" are the number of URLs to be archived, and the sizes of those resources.  However, as we don't archive sites that use a lot of audio and video, we find the size is less important than the number of URLs.

But the crawl is critically dependent on two additional factors.  How fast can we crawl? And how quickly does the content change?

Usually, to be polite to websites, we restrict our crawlers to downloading one URL at a time, and at a rate of no more than one or two URLs a second. Therefore, a site becomes "large" when it is no longer possible to crawl it in a "reasonable" amount of time. 

The classic example for us is a new site like BBC News. That site has a LOT of URLs, and as such a full crawl can take weeks or months. Which brings us to the last factor - the rate of change of the site itself.

Traditional crawling workflows are often based around setting overall crawl frequencies. e.g. we crawl this site once a day, this other site once a month, and so on.  What frequency should we use for a news site?

Clearly, at least once per day, because the site keeps changing! But we can't possibly crawl the whole site in a day! We need to run the crawl for WEEKS!

In short, we know a site is "large" when we hit this conflict between freshness and completeness. 

The simplest way to deal with this risk of temporal incoherence is to have two crawls. A shallow and frequent crawl to get the most recent material, with a longer-running deeper crawl to gather the rest. However, this does risk overloading the websites themselves, and the total volume of crawling may be considered impolite.

This is why for the UK Web Archive we modified the behaviour of the Heritrix crawler so that it can run crawls for many weeks, but seeds and sitemaps are re-fetched daily so that those URLs are up to date and any new URLs are discovered.  This ensures a steady and controlled crawl rate, but allows the 'fresh' URLs to be prioritised.

With hindsight, whether this elegance is worth the additional complexity and customisation of the crawler is less clear. As we look to how we might adopt [Browsertrix Crawler](https://github.com/webrecorder/browsertrix-crawler)/[Cloud](https://github.com/webrecorder/browsertrix-cloud) in the future, rather than make the tools more complex, perhaps it's better to risk being impolite and just run parallel crawls?
