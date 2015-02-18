---
title: Evaluating Our 'Historical Search Engine'
category: Data Mining
tags: ["Web Archives","BUDDAH"]
status: stub
layout: post
---

Over the last year, we have been working on [Big UK Domain Data for the Arts and Humanities](http://buddah.projects.history.ac.uk/) project -- a very ambitious project to build an 'historical search engine' that spans the entire history of the web in the UK. This continues the work of the [Analytical Access to the Domain Dark Archive](http://domaindarkarchive.blogspot.co.uk/) project but at a greater scale, and moreover, with a range of much more challenging use cases.

We presented the current prototype at the International Digital Curation Conference last week (as written up by the DCC as ["A macroscope for UK web history"](http://www.dcc.ac.uk/blog/macroscope-uk-web-history)), and received largely positive feedback, at least in terms of how we have so far handled the scale of the collection (although the impromptu load-test that followed our presentation showed that supporting many users at once is still a challenge!).

However, we are eagerly awaiting the results of the *real* test of this system, from the [project's bursary holders](http://buddah.projects.history.ac.uk/news/bursaries/). Ten researchers have been funded as 'expert users' of the system, each with a genuine historical research question in mind. Their feedback will be critical in helping us understand the successes and failures of the system, and how it might be improved.

One of those bursary holders, Gareth Millward, has already talked about their experiences, including this (somewhat misleadingly titled but otherwise excellent) Washington Post article ["I tried to use the Internet to do historical research. It was nearly impossible."](http://www.washingtonpost.com/posteverything/wp/2015/02/17/i-tried-to-use-the-internet-to-do-historical-research-it-was-nearly-impossible/). It seems like the results are something of a mixed bag, and from our informal conversations with the other bursary holders, we suspect that Gareth's experiences are representative of the overall outcome.

For example, although calling this an 'historical search engine' is an effective way of getting the idea across, the actual experience and 'information needs' of the user are very different. As Gareth states, if you [search for RNIB using Google](https://www.google.co.uk/search?q=rnib), the RNIB site and information about it is delivered right at the top of the results.

But does this reflect what a 'historical search engine' should do?

When Google ranks it's results, it is making many assumptions. Assumptions about the most important meanings of terms. Assumptions about the current needs of it's users. Assumptions about the information needs of specific users (also know as the [filter bubble](http://en.wikipedia.org/wiki/Filter_bubble)). What assumptions should we make? Are we even playing the same game as Google?

One of the most important things we have learned so far is that the information needs of our researchers might be very different to those of a normal search, and indeed different betweem different users. When a user searches for '[iphone](http://www.webarchive.org.uk/shine/graph?query=iphone&year_start=1996&year_end=2010&action=update)', Google might guess that you care about the popular one, but perhaps you mean the late 1990's [Internet Phone by VocalTec](http://www.webarchive.org.uk/shine/graph?query=iphone+AND+vocaltec&year_start=1996&year_end=2010&action=update).  Terms change their meaning over time, and we must enable our researchers to discover and distinguish the different usages. As Gareth says "what is 'relevant' is completely in the eye of the beholder."

Moreover, in a very fundemental way, the historians we have worked with are not searching for the one top document, or a small set of documents about a specific topic. They look to the web archive as a refracting lens onto the society that built it, and are using these documents as intermediaries, carrying messages from the past. In this sense, caring about the first few hits makes no sense. Every result is equally important, at first.

To help understand these whole sets of results, we have endeavoured to add appropriate filtering and sorting options that can be used to 'slice and dice' the data down into more manageable chunks.  At the most basic level (and contrary to the Washington Post article), the results are sorted, and the default is to sort by ascending harvest date. The contrast with a normal search engine is perhaps no more stark than here -- where BING or Google will generally seek to bring you the most recent hits, we focus on the past and look forward (something that is very difficult to achieve using a normal search engine).

We believe we have a very capable search technology (in the form of Apache Solr), but perhaps the biggest challenge is to present its capabilities to the user in a comprehensible way. Take, for example, the problem where the RNIB advertisements for a talking watch were polluting the search results. Fortunately, as the text of the advert is highly consistent, it is possible to precisely identify those advertisements by searching for the text ["in associate with the RNIB"](http://www.webarchive.org.uk/shine/graph?query=%22in+association+with+the+RNIB%22&year_start=1996&year_end=2010&action=update). This means it is possible to [refine a search for RNIB to make sure we exclude those results](http://www.webarchive.org.uk/shine/graph?query=RNIB%2CRNIB+NOT+%22in+association+with+the+RNIB%22&year_start=1996&year_end=2010&action=update) (although, as you can see, the effect is very minor).

The problems are even more marked when it comes to trying to allow network analysis to be exploited. We do already extract links from the documents, and so it is [already possible to show how the number of sites linking to the RNIB has changed over time](http://www.webarchive.org.uk/shine/graph?query=links_domains%3Arnib.org.uk&year_start=1996&year_end=2010&action=update), but it is not yet clear how best to expose and utilise that information. At the moment, the best solution we have found is to present this network information as additional search facets. For example, [here is the results for the sites that linked to rnib.org.uk in 2000](http://www.webarchive.org.uk/shine/search?query=*:*&tab=results&action=search&facet.in.links_domains=%22rnib.org.uk%22&facet.in.crawl_years=%222000%22), which you can contrast with [those for 2010](http://www.webarchive.org.uk/shine/search?query=*:*&tab=results&action=search&facet.in.links_domains=%22rnib.org.uk%22&facet.in.crawl_years=%222010%22).

Currently, we expect that refining a search on the web archive will involve a lot this kind of operation, combinine new search terms and clauses to help focus in on the documents of interest. Therefore, looking further ahead, we envisage that future iterations of this kind of service might be able to take the research queries and curatorial annotations we collect and start to try to use this information to semi-automatically classify resources and better predict user needs.

Both sides of this system are learning as we go. We can build our prototypes, and require our users' feedback to guide us, but at the same time, those researchers have had to learn how to approach such a complex, messy dataset. Both sides have had their expectations challenged, and we look forward to continuing to make progress in partnership with the research community.

<!--
links to self. Problems with text.
-->

