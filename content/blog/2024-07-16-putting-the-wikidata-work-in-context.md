---
title: Putting the WikiData work in context
subtitle: 'Boromir: One does not simply "solve" the format registry problem!'
date: 2024-07-16
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
---
Following my brief post on [Finding Formats in WikiData](https://anjackson.net/2024/07/12/finding-formats-in-wikidata/), [Ross Spencer posted a response that was full of useful information](https://exponentialdecay.co.uk/blog/we-love-our-fiefdoms-the-dpc-and-wikidata/). But Ross's post also leads me to conclude I hadn't been sufficiently clear about the scope and context of the work. So here goes...

## Goals

The goal of this project is absolutely not to "solve" or "own" the format registry "problem". I don't even believe that is possible. Perhaps we can update the [project goals](https://github.com/digipres/registries-of-practice-project?tab=readme-ov-file#goals) to make it clearer that the goal is to understand the work being done, explore how to make the most of it, and if there are things that can be done to help.

Also, I struggle to understand how my attempt to openly document my exploration of how WikiData works can be interpreted as telling the WikiData community they are 'doing it wrong', or be considered 'colonization'.  If it reads that way, I apologise. 

I am trying to understand how the WikiData community works. For example, some of the file format records do not appear to comply with [a formal-looking specification](https://www.wikidata.org/wiki/Wikidata:WikiProject_Informatics/Structures/File_formats#Properties_&_structure_of_items)  from a [formal-looking endeavour](https://www.wikidata.org/wiki/Wikidata:WikiProject_Informatics), but neither appear (to me) to provide much context or assistance.  Perhaps my institutional background is making me leap too quickly to the idea of framing this as a _policy_, and that has led me astray? But surely there are some kinds of specific expectations and social structures around this? 

I had picked up on some general information about this, but Ross has now provided some concrete recommendations, so perhaps I can get a bit further!

## Scope

It is perhaps worth clarifying that file 'magic' a.k.a. internal binary format signatures are wholly out of scope at present. I think that's a much harder problem, and not one I'm going to do much about in the context of this project. My focus us on user discovery paths, cross-referencing resources, that kind of thing. As such, quite a lot of what is referenced in Ross's post, while very interesting, is not in scope for me at present.

## Context

This is not a "DPC project". I am co-funded by Yale University Library (YUL), who have a long history of work in this area, and have great deal of expertise of WikiData and the community around it.  My blog post was an attempt to work in the open as I build up a list of questions to resolve both within and outwith the project team. I should probably have been clearer about that.

I ended up rushing the post slightly, in response to being [tagged into this GitHub issue](https://github.com/richardlehane/siegfried/issues/183#issuecomment-2222500229), and I neglected to make it clear what resources I'd been using as I built up my understanding of what was going on. I'll try to remedy that now.

It's pretty difficult to build up a complete list, as I looked at a large number of different references and resources as I tried to understand SPARQL and WikiData in general, as well as the specific work on digital preservation and WikiData. But it's worth highlighting that last body of work here (while noting that Katherine Thornton is at YUL and is one of the collaborators on this project):

- Thornton, Katherine, Euan Cochrane, Thomas Ledoux, Bertrand Caron, and Carl Wilson. ‘Modeling the Domain of Digital Preservation in Wikidata’. In _iPRES 2017 Conference Proceedings_, 2017. [https://phaidra.univie.ac.at/o:931058](https://phaidra.univie.ac.at/o:931058).
- Seals-Nutt, Kenneth, and Katherine Thornton. ‘Getting Digital Preservation Data out Wikidata’. In _iPRES 2019 Conference Proceedings_, 2019. [https://phaidra.univie.ac.at/o:1081747](https://phaidra.univie.ac.at/o:1081747).
- Spencer, Ross, Katherine Thornton, Richard Lehane, and Euan Cochrane. ‘Wikidata: A Magic Portal for Siegfried and Roy’. In _iPRES 2021 Conference Proceedings_, 2021. [https://phaidra.univie.ac.at/o:1424926](https://phaidra.univie.ac.at/o:1424926).
- Katherine Thornton, ‘Wikidata for Digital Preservationists: New DPC Technology Watch Guidance Note Now Available on General Release - Digital Preservation Coalition’. Accessed 10 July 2024. [https://www.dpconline.org/news/twgn-wikidata-gen](https://www.dpconline.org/news/twgn-wikidata-gen).

I had read all of this work ahead of writing that blog post, and asking those questions. However, I am not a perfect reading machine, so of course I may have failed to grasp some of it. Or perhaps not understood things deeply enough to have the confidence to make assertions that are not explicitly stated within those pages. I think in a future blog post I'll revisit those documents with my own questions in mind. That might also save Dr Thornton some time!

Ross also pointed out the existing [WikiDP-Issues](https://github.com/ffdev-info/wikidp-issues/issues) space (created in 2020) and the [wikidp.org](https://wikidp.org/) gateway. I was aware of them but to be honest, at this point, I struggled to understand how to meaningfully engage with either of those things, and I thought I was asking much more basic questions.  I will be spending more time with them in the future.

## Credit

Ross raises a very good point by noting my failure to link back to the [Siegfried wiki source](https://github.com/richardlehane/siegfried/wiki/Wikidata-identifier#harvesting) when I [added WikiData support to the Format Aggregator in 2020](https://github.com/digipres/digipres.github.io/commit/aea5310129bdbd83a2d736eb4023a894ecff5908). I have updated the [comments around the code to credit the source more clearly](https://github.com/digipres/digipres.github.io/blob/master/_sources/registries/wikidata/download-wikidata-formats.py#L8-L10).

## Kindness

I appreciate that Ross recognised my anxiety around working with WikiData. 

I recognise I am privileged to be in this role, and fortunate that I risk relatively little by working in the open.  But this does mean sharing the works-in-progress, the incomplete, the under-linked, the baffled and the baffling. 

Frankly, I find social structures far harder to comprehend than technological systems. And this project is all about the social structures we depend on. Handling that part of this role is my biggest challenge in this project, and where I feel most vulnerable. 

So I will do my best to respond in kind to whatever kindness and patience I am gifted.


