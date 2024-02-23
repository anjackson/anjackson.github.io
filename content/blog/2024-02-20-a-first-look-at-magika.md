---
title: A first look at Magika
subtitle: A new format identification tool, from Google.
date: 2024-02-20T22:49:47.886Z
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
---
There was a little flurry of excitement on #DigiPres Mastodon a few days ago when we heard about [Google's new format identification tool](https://mastodon.social/@Ange/111939777883334772). In particular, the application of machine learning techniques is of interest to a lot of us, as many formats cannot be identified using traditional heuristics like ['magic numbers'](https://en.wikipedia.org/wiki/Magic_number_(programming)#In_files). This applies to a lot of text formats, like programming language source files, and people working in digital preservation have been talking about creating tools like this for [a long time](https://anjackson.net/2016/06/08/frontiers-in-format-identification/#developing-identification-techniques-for-text-formats).

So, has Google come to save us?!  Well, the [official announcement](https://opensource.googleblog.com/2024/02/magika-ai-powered-fast-and-efficient-file-type-identification.html) starts off by saying:

> "Today we are [open-sourcing Magika](https://google.github.io/magika/), Google’s AI-powered file-type identification system, to help others accurately detect binary and textual file types."

But it rapidly becomes clear that the authors understand that optimal coverage, performance and accuracy of format identification depend on the context you're working in. For them, this means tuning for the following use case:

> "Internally, Magika is used at scale to help improve Google users’ safety by routing Gmail, Drive, and Safe Browsing files to the proper security and content policy scanners."

So, while this is an interesting example of working towards high precision at large scale, it is not necessarily going to be useful to other communities interested in format identification.  As one of the authors was quick to make clear:

<iframe src="https://mastodon.social/@Ange/111943077577813361/embed" width="450" height="255" allowfullscreen="allowfullscreen" sandbox="allow-scripts allow-same-origin allow-popups allow-popups-to-escape-sandbox allow-forms"></iframe>

Nevertheless, it's interesting to study this work, to help us understand what it might take to build the All-Singing All-Format _Ident-o-matic_ machine of our dreams.

## Context and Coverage

This first release of Magika covers [about 100 formats](https://github.com/google/magika/blob/main/docs/supported-content-types-list.md), which is enough to identify 97% of the items they are scanning. With only 3% remaining, and [plans to support more formats](https://github.com/google/magika?tab=readme-ov-file#q-why-does-magika-support-only-100-content-types-and-not-many-more), surely they'll be done soon!

Sadly not.  As I'm sure the authors know, and as I expect most of you will already have learned from experience, the distribution of formats across realistic collections is rarely so simple. In a way, the most interesting result here is that they managed to get to 97% with so few formats!

There's CSV but no TSV. Adobe Illustrator but no Photoshop or InDesign. Or course, Powerpoint, Word, Excel, Outlook, but no MS Project. No Numbers/Pages/Keynote. Just two video formats, MP4 and WEBM. No HEIC or JP2. 

I'm not trying to criticise the Magika team -- they are approaching this problem in a very sensible way. I'm trying to make the point that there will likely be _thousands_ of formats in the long tail hiding under that innocent-looking 3%.

I suspect that how important this is, and what the 'skew' of that long-tail looks like, is very dependent on your collection. And while there are formats I think of as characteristic of different niches (like AutoCAD, DNG, Matlab, R, GeoTIFF, RSS), the truth is there may be hundreds or even thousands of formats that only crop up in a handful of collections. This kind of variation could also happen below the level of 'format'. For example, I'd expect the kind of HTML that gets stored on Google Drive to be consistently different to that used in emails, or found in the wilds of a web archive.

## Granularity

As well as coverage, it's also interesting to look at tools like Magika to see what they consider the appropriate level of granularity of identification.  Traditionally, those of us working in digital preservation have sought to identify files at the level of different versions of formats, with PRONOM being the quintessential example. This approach has been applied widely, but does have some limitations.

Firstly, it assumes that file formats have clearly defined versions, and tends to imply they are drawn from formal specifications. Not all formats are like that.

Secondly, and relatedly, this model doesn't map very well onto how format identification tends to be used in practice in the wider technology sector. Google isn't asking 'what format is this' to record it as a fact for future use.  They are doing it to work out which bits of software will understand which files. Therefore, the granularity of the identification is driven by the expectations of what processes are going to be applied downstream.

 I'm guessing that's why they don't care which version of a format they have. Similarly, they have a single category for source code in the C family, a single category for Outlook formats, a single category for Windows Executables.

Again, this is not a criticism. It just illustrated that the appropriate granularity can also depend on your context.

## Methodology

While this particular (open source) tool and (closed source) model may not be all that useful outside the context of cloud storage information security, perhaps we can use the same approach to make our own model or tool?

The details of their approach won't be clear until the [forthcoming paper](https://google.github.io/magika/) has come forth, but for now I'd like to make some observations based on the following assertions from the [GitHub project homepage](https://github.com/google/magika?tab=readme-ov-file#magika):

> Under the hood, Magika employs a custom, highly optimized Keras model that only weighs about 1MB, and enables precise file identification within milliseconds, even when running on a single CPU.

> Trained on a dataset of over 25M files across more than 100 content types.

> In an evaluation with over 1M files and over 100 content types (covering both binary and textual file formats), Magika achieves 99%+ precision and recall.

To the best of my knowledge, previous work using machine learning for format identification has struggled due to a lack of a suitably large and well-labelled set of training data. It seems highly unlikely that either the 25 million (training) or 1 million (benchmark) datasets have been manually verified, so presumably some kind of unsupervised or semi-supervised approach was used.  Given Google are likely not able to share the training or benchmark dataset, I'm looking forward to seeing how they were constructed, so see whether the same approach could be used elsewhere.

That said, if the approach actually _requires_ 25M files for every 100 formats, it's probably not going to be worth pursuing. There are many thousands of formats of interest, which implies billions of training files. It seems unlikely that any organisation in the cultural heritage sector has both a suitably varied collection of that size, and the ability to experiment on it in this way. 

Having said that, given the final model is only 1MB in size, 25M files in total means there were over 3 files for _every single bit_ of the model.  I'm not very experienced in machine learning, but that seems like a lot. Perhaps it is possible to get comparable results from significantly smaller datasets? 

My final observation at this point would be to take the promise of 99%+ precision and recall with a pinch of salt, because I think this will depend on lot on the distribution of formats in a given corpus.

Based on what I've read, it seems the 1 million file benchmark set was restricted to the ~100 formats targeted for training -- i.e. none of the unidentified 3% was used for benchmarking. So, while Magika performed far better on this test set than any of the other tools they tested[^1], this does not tell us anything about the false positive rate on a more realistic corpus.

I've only had time to fire a few examples through the [web demo version](https://google.github.io/magika/), but when I passed it files it _shouldn't_ understand, it seemed very sure about the mostly wrong answers it gave me. Like MOVs identified as MP4, and an MPEG identified as ICO.

However, this is hardly a systematic analysis, so you should also take my anecdata with a pinch of salt! Magika clearly works for them, so these false positives are presumably either avoidable or inconsequential. It's just something to bear in mind if you are trying to reapply the tool or approach in a different context.

## Evaluation

Despite the fact that we've been discussing this kind of tool for a long time, it wasn't that easy to find relevant publications on the topic.  I did find this paper from iPRES 2021: [Text File Format Identification: An Application of AI for the Curation of Digital Records](https://phaidra.univie.ac.at/detail/o:1424885) but not much else, and as far as I know no such tools has actually made it into production.

With that in mind, I'm looking forward to seeing the final paper and seeing how the tool develops.  It seems likely that the methodology could help someone build a useful new tool, perhaps targeted at common textual formats.  In particular, I'd imagine it could work quite well in combination with existing tools, e.g. using [Siegfried](https://www.itforarchivists.com/siegfried) to filter out all those formats that are easier to identify, and then pass the remainder through something like Magika.

But judging new identification tools remains a big challenge, and one that dates at least as far back as the [PLANETS Testbed](https://planets-project.eu/about/#objectives).  Perhaps now is the time to revisit the idea of building a very varied openly-licensed benchmarking corpus? Perhaps re-using whatever approaches the Magika team used to generate sets of test files? Perhaps.

I think before that, we a more realistic idea of the size of the problem we're trying to solve. How many formats are there in our collections? How does this vary between collections? And how does this relate to the contents of our various format registries?  These are some of the threads I want to pull on as part of the Registries of Practice project. 

_EDIT 2024-02-23:_ You should also read [Ed Summers great post about Magika](https://inkdroid.org/2024/02/21/magic/)!

[^1]: Notably, the list of tools used in the comparison did not include [GitHub Linguist](https://github.com/github-linguist/linguist?tab=readme-ov-file#linguist), which is better suited to identifying text-based formats than the other competitors.

