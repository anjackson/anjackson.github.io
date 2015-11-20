---
title: The provenance of web archives
subtitle: Why did they archive that?!
category: Digital Preservation
tags: ["Keeping Codes", "Web Archiving", "BUDDAH"]
layout: post
author: anj
shown: false
---

http://www.forbes.com/sites/kalevleetaru/2015/11/16/how-much-of-the-internet-does-the-wayback-machine-really-archive/

http://blog.dshr.org/2015/11/you-get-what-you-get-and-you-dont-get.html

> If the Archive simply opens its doors and releases tools to allow data mining of its web archive without conducting this kind of research into the collection’s biases, it is clear that the findings that result will be highly skewed and in many cases fail to accurately reflect the phenomena being studied.

> You can't deduce anything from the absence of a page in the archive.

> ...one of the biggest undocumented biases in Web archives is the result of Web archiving technology lagging behind the evolution of the Web.


Even before working with the Buddha project, we'd spent a long time thinking about this, and we've tried to our best to capture as much crawl context as we can. For every crawl, we don't just store the WARC request and response records, we also store:

- The list of links that the crawler found when it analysed each resource 
- The full crawl log, which records DNS results and other situations that may not be reflected in the WARCs
- The crawler configuration, including seed lists, scope rules, exclusions etc.
- The versions of the software we used (in PREMIS/METS)
- Rendered versions of original seeds and home pages, as PNG and as HTML, and associated metadata.

In principle, we believe that the vast majority of questions about why a particular resource has been archived can be answered by studying this additional information. However, it's not clear how this would really work in practice. Even assuming we have caught the most important crawl information, reconstructing the history behind any particular URL is going to be highly technical and challenging work because you can't really understand the crawl without understanding the software (to some degree at least).

But there are definitely gaps that remain - in particular, we don’t document absences. We don’t explicitly document precisely why certain URLs were rejected from the crawl, and if we make a mistake an miss a daily crawl, or mis-classify a site, it’s hard to tell the difference between accidents and intentional changes. Similarly, we don’t document every aspect of our curatorial decisions, e.g. precisely why we choose to pursue permissions to crawl specific sites that are not in the UK domain. Capturing every mistake, decision or rationale simply isn’t possible, and realistically we’re only going to record information when the process of doing so can be largely or completely automated (as above).

And this is all just a the level of individual URLs - when performing corpus analysis, things get even more complex. When analysing multiple URLs at once and over time, crawl configurations vary and change. Right now, it’s really not clear how to combine or summarise the fine-grained provenance information in order to support data-mining and things like trend analysis, although in the context of working on the Buddha project, we did start to explore how this might work. For example, the TIMES article brings up the fact that crawl frequencies vary, and so not every site has been crawled consistently, e.g. every day. Of course, we found exactly the same kind of thing when building the Shine search interface, and this is precisely why our trend graphs currently summarise the trends by year. In other words, if you average the crawled pages by year, you can wash out many of the short-term variations.  Of course, large crawls can last months, so really you want to be able to switch between different sampling parameters (quarterly, six-monthly, or annual, starting at any point in the year, etc.), so that you can check whether any perceptible trend may be a consequence of your sampling strategy (not that we got as far as implementing that, sadly).

<https://www.webarchive.org.uk/shine/graph>

NOT NECESSARY size limit

Similarly, notice that Shine show you the percentage of matching resources by year, rather than the absolute number of matching documents.  Again, it would be even better to be able to switch between the two so you can understand what any given trend means.  More useful still would be the ability to pick any other arbitrary query to be the normalisation baseline, so you could plot matching words against total number of words per year, or matching links per total number of links, and so on. The crucial point is that if your trend is genuine, you can use sampling and normalisation techniques to test that, and to look for and find or rule out particular kinds of biases within the data set.

I think there will be practical ways of summarising our provenance information in order to describe the systematic biases within web archive collections, but it’s going to take a while to work out how to do this, particularly if we want this to be something we can compare across different web archives. My suspicion is that this will start from the top and work down - i.e. we will start by trying different sampling and normalisation techniques, and discover what seems to work, then later on we’ll be able to work out how this arises from the fine details of the crawling and curation involved.

