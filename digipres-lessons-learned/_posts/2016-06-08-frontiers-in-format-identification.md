---
title: Frontiers in Format Identification
category: digipres-lessons-learned
layout: post
author: anj
---

I came to work in digital preservation through [the PLANETS project](http://www.planets-project.eu/), and later [the SCAPE project](http://scape-project.eu/) (for the first year) before moving over to web archiving. These were inspiring projects which achieved a great deal, but we were also left with lessons to be learned.

<!--break-->

In particular, I remember a meeting between the representatives of the various content-holding institutions -- the libraries and archives that were intended to benefit the most from the results of those projects. All of us agreed that, while we appreciated the importance of planning and implementating preservation actions, we were concerned that the fundemental evidence base wasn't really strong enough to make this planning reliable. Quite simply, we were worried that we just don't understand our collections well enough to make sensible decisions about their future care. In retrospect, I think we should have directed more resources at the problem of characterising and analysing the content we have -- at understanding the question rather than rushing to the answer.

I was reminded of this when Jenny Mitcham tweeted about the issues in identifying more obscure formats:


> Any ideas how we solve DAT file format problem? <https://digital-archiving.blogspot.co.uk/2016/05/research-data-what-does-it-really-look.html>
> <small>[@Jenny_Mitcham](https://twitter.com/jenny_mitcham/status/740513668807462912)</small>

and so I thought it might be worth sharing some of the ideas that were borne out of those big projects, but we had little or no time to pursue.

## Sharing format profiles ##

I think there is much we could do to improve how we use data about formats to drive the improvement of format identification and analysis tools.

For example I was very happy to see that shortly after Jenny's tweet, the Bentley Historical Library followed up with a similar format profile:

> New post looking at our born-digital file formats (in response to @Jenny_Mitcham's on research data file formats): <http://archival-integration.blogspot.co.uk/2016/06/born-digital-data-what-does-it-really.html>
> <small>[@UMBHLCuration](https://twitter.com/umbhlcuration/status/740643410479026176)</small>

I belive sharing this kind of information would be extremely useful, encouraging a more data-driven approach to tool development, and helping us to explore the relative strengths and weaknesses of various tools. As [Nick Krabbenhöft indicated](https://twitter.com/nkrabben/status/740649460804521988), there are some tools being developed in this area, and it would be good to see this kind of summary information being shared[^1].


## Aggregating format registries ##

There's also gains to be made by making the most of what we already have. To this end, some time ago I build a website that aggregates the contents of five different format registries: <http://www.digipres.org/formats/>

This merges the various sources into a single, coherent format heirarchy [(e.g. XML)](http://www.digipres.org/formats/mime-types/#application/xml), and allows you see what five different registries say about a given file extension [(e.g. flac)](http://www.digipres.org/formats/extensions/#*.flac). It also allows you to [compare the contents of the registries](http://www.digipres.org/formats/overlaps/), leading to the surprising realisation that the degree of overlap between them is really rather small. Currently, only 77 file extensions are know to all five tools, but I hope that publicising the gaps between the registries will help encourage those gaps to be closed.

Obviously, it would be really interesting to combine this kind of approach with the idea of sharing format profiles from real collections, and to hook it up to sources of information about tools (like [COPTR/POWRR](http://www.digipres.org/tools/)).


## Exploring semi-automated format identification ##

In the web archive, we've done some work on exploring formats by combining search facets based on the first few bytes of a file with facets built from the file extension. This has been a very useful way to start exploring files by the common internal features, because it's so very common for software to use a fixed file header format at it's own format identfication technique. This make is possible to semi-automatically generate an initial format signature. This was also the basis of the [Percipio tool](https://github.com/blekinge/percipio), which in turn is similar to how [TrID](http://mark0.net/soft-trid-e.html) works.

We've tried to build on some of these ideas in our web archive analysis systems, but we've not had enough time to explore the results. I suspect we could learn a lot about the more obscure file formats very quickly if we were able to cluster them based on common internal structures and patterns.


## Developing identification techniques for text formats ##

One of the long-standing problems in format identification is how to cope with text-based formats. This causes problems for web archives when there are wrong or missing file extensions or MIME types, because formats like CSS and JavaScript are hard to spot. Similarly, CSV, TSV and other text data formats are unfortunately reliant on file extension for identification, as are computer source code formats (C, Java, etc.).

My starting point here would be to extend the n-gram frequency methods used in natural language detection (see [here](http://cloudmark.github.io/Language-Detection/) for a detailed introduction). However, instead of relying the frequencies of individual character combinations, the idea would be to build language profiles based on classes of text entities, like punctuation, quoted strings, keywords, and so on. I'm reasonably confident this would vastly improve our current format identification capabilities, but sadly I don't have the capacity to work on it myself.


## Documenting obsolescence ##

Finally, another area which would really benefit from a stronger base of actual evidence, based on real experience, would be format obsolescence itself. I'm hoping to share more stories of difficult formats on this blog in the near future, but I'd also like to see us all collect more examples of how formats are born and how formats die, so we can better understand the challenges ahead of us.


## Building the community ##

There's a lot to be done, and I don't have nearly as much time as I'd like to work on these issues. We need to collaborate effectively, between content-holding organisations and with researchers and tool developers. I'd love to hear from anyone who wants to work on these problems, or about the other challenges that I've missed out here.


[^1]: We have [C3PO](https://github.com/peshkira/c3po) as a standalone tool, and [Brunnhilde](https://github.com/timothyryanwalsh/brunnhilde) and [droid-sqlite-analysis](http://openpreservation.org/blog/2016/05/24/while-were-on-the-subject-a-few-more-points-of-interest-about-the-siegfrieddroid-analysis-tool/) designed to analyse the output from Siegfried and/or DROID. For web archives, similar functionality has been built into the UKWA [webarchive-discovery](https://github.com/ukwa/webarchive-discovery) stack, and we [publish format profiles as open data](http://data.webarchive.org.uk/opendata/ukwa.ds.2/fmt/).