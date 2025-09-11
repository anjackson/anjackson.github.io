---
title: Re-indexing iPRES 2022
subtitle: "One does not simply automate metadata reconciliation "
date: 2025-09-11T11:27:00.000+01:00
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
images:
  - /assets/images/uploads/img_20250911_113028.jpg
description: Updating iPRES 2022 in the publications index, and dealing with the
  consequences.
---
Last year, the first output from the [Registries of Good Practice Project](https://www.dpconline.org/digipres/collaborative-projects/registries-of-good-practice) was [the first version of the Digital Preservation Publications Index](https://www.dpconline.org/blog/digital-preservation-publications-index), which focussed on bringing together the proceedings of the iPRES conference series from 2004-2023. Then, [just before Christmas](https://www.dpconline.org/blog/an-unexpected-gift), the iPRES 2024 committee helped my bring the index up to date (a.k.a. v.1.1.1).

However, as documented in [Aggregating iPRES Proceedings](https://anjackson.net/2024/04/16/aggregating-ipres-proceedings/) and [Re-publishing iPRES](https://anjackson.net/2024/04/29/re-publishing-ipres/), there were some issues and some gaps. Some years' proceedings were split over multiple systems, making it difficult to bring everything together. For iPRES 2022, for example, the lightning talks were not individually listed in the EventsAir programme, so they didn't make it into the index.

## Free Hosting! (offer expires 2025)

Then, earlier this year, links started breaking. The index for iPRES 2022 was not only relying on EventsAir for metadata, but also as a way to download and view the contributions themselves (in their original DOCX submission format). Of course, a conference platform with no-one paying the bills isn't going to keep running forever. So now, those files were gone.

Looking for a quick fix, I checked the [Internet Archive's version of the iPRES 2022 index](https://web.archive.org/web/20250320113733/https://www.digipres.org/publications/ipres/ipres-2022/), but found that most of publications did not get archived there. I couldn't put it off any longer. It was time to go back to the sources and work out how to pull everything together.

## The Split

I still had the EventsAir metadata, and all the [iPres 2022 Conference materials were available on OSF](https://osf.io/8bczf/). But it wasn't clear how to bring them together. Or even just how to systematically walk through the OSF collection, especially since the different iPRES years all used slightly different collection structures.

I spent far too long trying to automate all this. But eventually, the penny dropped. 

Instead of writing scripts, I set up an [iPRES Zotero library](https://www.zotero.org/groups/5564150/ipres/library) with a folder for iPRES 2022 and then within that, a folder for each type of contribution (paper/lighting talk/etc.). I then used the Zotero browser plug-in to open each entry page for each type and add the item to the right collection.  Within a hour, I had an index of what was in OSF for iPRES 2022.

There was still one more problem. OSF hold very little metadata for each record, and we'd lose a lot of useful information without EventsAir. But how to link up the metadata from one with the records from the other?  The iPRES conferences haven't been using unique identifiers across the different platforms, so there was no key to join the two datasets together.

Again, it turned out that a manual process worked best. I'd written code to gather the data from both sources, and make sure each record had a unique ID. I then dumped both lists into a single spreadsheet ([here](https://github.com/digipres/digipres-practice-index/tree/main/sources/ipres/raw-by-hand)), opened up Excel, and sorted the rows by title. With a little manual patching to cover differences between the data sources (including getting help to unblock a number of publications the OSF thought were spam!), I had a list that contained both sets of data, with each publication represented by a pair of rows (one from EventsAir, one from OSF). A bit more manual data munging, and I had [a CSV file that links each pair of records together](https://github.com/digipres/digipres-practice-index/blob/main/sources/ipres/raw/ipres2022.eventsair-osf-mapping.csv).

## The Join

Finally, I could update the [data aggregation code](https://github.com/digipres/digipres-practice-index) to pull in both sources and use this 'join table' to merge them, adding relevant EventsAir metadata to each OSF record. This updated version was release as v1.2.0 of the [publications index](https://www.digipres.org/publications/), and you can see [the improved iPRES 2022 records here](https://www.digipres.org/publications/ipres/ipres-2022/).

Which is great! 

But also, not ideal.

The 'sources of truth' for iPRES 2022, the data needed to bring the proceedings together, are now split and replicated across EventsAir, OSF, a Zotero library and a couple of data files in a GitHub repository.

## The Path

Alone, I can only hack together patchwork solutions like this. To make this more sustainable, I'm going to need the help of the iPRES community. 

But this isn't just an unfortunate overhead. If we could find a way to more systematically manage this information, it would open up new possibilities!  We could clean up inconsistencies, like ensuring the same people get recognised for all their contributions, despite any name changes or inconsistencies in formatting. We could backfill [ORCID](https://orcid.org/)s into older records. We could link session recordings and source documents in a consistent manner. We could make sure institutions and nations are noted, so we better understood the ways in which our communities may or may not represent the wider world. We could maybe even add cleaner and more consistent keywords!?

From a technical perspective, I can think of two very different approaches. The simplest being something like an official iPRES Zotero library that people volunteer to manage, which becomes the master metadata store. At the other end of the scale we could make "iPRES Conference Proceedings" an actual thing, like a journal that gets conference outputs added to it every year rather than each year handling that part differently.

There are a lot of technical options, but before I get carried away, I return to the most important question for any you decide on the design of any kind of registry.

Who is going to fill it?
