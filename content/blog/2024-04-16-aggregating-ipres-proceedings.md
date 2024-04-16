---
title: Aggregating iPRES Proceedings
subtitle: Two decades of data, together at last.
date: 2024-04-16
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
---
As part of the [Registries of Good Practice project](https://github.com/digipres/registries-of-practice-project), we wanted to start by seeing if we could make it easier to find the records of research and practice that make up the iPRES digital preservation conference proceedings.

There has been an iPRES conference almost every year since 2004, but even if you've been working in digital preservation for a while, it's quite difficult to get an overview of what's been presented there. The web presence of the conference series is fairly minimal, and the publication of the conference proceedings has been done in slightly different ways over time. There's no formal proceedings series, e.g. along the lines of an electronic journal.

This makes it hard to find what's been published before. For example, while some iPRES publications are in [Google Scholar](https://scholar.google.com/) and [the Fatcat](https://fatcat.wiki), many are missing, particular from the earlier years. So the challenge was, can we find all the iPRES proceedings and make it easier to find, understand and use those records?
## Finding iPRES
As an attempt to ensure that I have a realistic understanding of the situation, I deliberately avoided asking anyone where to look.  At this point, I want to approach the situation as if I was new to the field, and only use openly available information to understand where things are.

Starting with a Google search for "_digital preservation conference_", you can quickly get to the homepage of the conference series: https://ipres-conference.org/  That list of starting points on the home page is pretty much what I need! Great!

However... There are a few gaps and oddities.

Most of the entries on the conference list contain a link to the [PHAIDRA](https://phaidra.univie.ac.at/) service at the University of Vienna, which has copies of the proceedings both as individual items and as an 'all-in-one' MEGAPDF. To gather metadata for all the articles I want those individual records, but that iPRES homepage list sometimes only links to the 'all-in-one' MEGAPDF. There also seems to have been a URL scheme change at PHAIDRA at some point, because a handful of the URLs need to be modified to work. For example, the homepage for iPRES proceedings on PHAIDRA is given as <https://phaidra.univie.ac.at/detail_object/o:340041>, but that link is now broken.  Looking at how it works, I guessed the fix, and it's just a case of changing the `detail_object` bit to just `detail`, like this: <https://phaidra.univie.ac.at/detail/o:340041> In this way, with a bit of effort, I was able to get a good set of links for proceedings held in PHAIDRA.

However, since 2018, some proceedings have been published to [Center for Open Science](https://cos.io)'s [OSF platform](https://osf.io/). This seems to have been used to support embedding the proceedings in structured hierarchies that reflect the structure of the conference itself, and to allow multiple files to be associated with each item (e.g. bringing together both the paper and the slide deck associated with a given conference presentation).

Only the OSF collections for iPRES 2018 and 2019 were included on the conference homepage (one as 'proceedings' and the other as 'materials'). But searching around I managed to find 2021 and 2022 in OSF too. iPRES 2022 was also notable for _not_ having any presence in PHAIDRA.

Finally, we come to iPRES 2023, which was different again. In this case, there did not seem to be any records in PHAIDRA or OSF, but everything was on the [Illinois Digital Environment for Access to Learning and Scholarship (IDEALS)](https://www.ideals.illinois.edu/units/541).

I gathered as much of this together as I could find, along with some links to recordings of the presentations and to collaborative notes, and put them into a set of structured `data + text` files that are published as HTML/CSV/JSON here: http://www.digipres.org/publications/ipres/

Hopefully I can work with the iPRES Steering Group to work out how to contribute this back so it's part of the iPRES Conferences website.

But to build the index, the next step was to see if I could access the metadata records for all the individual entries.
## Gathering the Metadata
This is where things get a bit more difficult.  As I found when trying to identify publications on the web when I worked at the UK Web Archive, getting consistently structured metadata out of web pages isn't always easy.  There's usually a per-platform maintenance overhead because each system behaves slightly differently.  At least in this case there were only three platforms...

As PHAIDRA was the platform with the best coverage, I started there.
### Talking to PHAIDRA
Overall, the URLs of PHAIDRA are understandable and well-structured, and each page has links to metadata records in various formats. However, it's not clear how to do things like generate a list of items in each collection.

I couldn't find any formal API documentation, so instead I did a `[Right Click] > Inspect` and used my browser's debugging tools to see how the website works. Keeping an eye on the network activity, it was pretty easy to spot a useful call to the website's internal API. For example, [this URL that lists items from the iPRES 2004 collection](https://services.phaidra.univie.ac.at/api/search/select?q=*%3A*&wt=json&start=0&rows=32&fq=owner%3A*%20AND%20ispartof%3A%22o%3A295028%22%20AND%20-isinadminset%3A%22phaidra%3Autheses.univie.ac.at%22%20AND%20-hassuccessor%3A*%20AND%20-ismemberof%3A[%22%22%20TO%20*]&indent=on). This is clearly something wrapped around [Apache Solr](https://solr.apache.org), which I've used before and understand well enough to reduce that down to the bare essentials I need:

<https://services.phaidra.univie.ac.at/api/search/select?q=*%3A*&wt=json&start=0&rows=1000&fq=ispartof%3A%22o%3A295028%22&indent=on>

Where the `ispartof=o:295028` bit specified which iPRES conference collection I'm listing, using the same IDs we found on the iPRES homepage.

These records are quite detailed, and so downloading one of these URLs for each iPRES collection is enough to gather all the information I need. Because the URLs have a consistent structure, it's easy to construct the links to things like thumbnails and the direct file downloads. For example, once you have an object ID for an item within a collection, e.g. `o:295002`, you can generate the API URLs for the:

- Metadata: <https://services.phaidra.univie.ac.at/api/object/o:295002/uwmetadata?format=xml>
- Thumbnail: <https://services.phaidra.univie.ac.at/api/object/o:295002/thumbnail>
- Download: <https://services.phaidra.univie.ac.at/api/object/o:295002/download>

At this point, I just want to grab the raw data to store for processing. So I wrote a [Python script](https://github.com/digipres/digipres-practice-index/blob/main/src/fetcher.py) to store the Solr data as [JSONLines](https://jsonlines.org/). Here, for example, is the raw PHAIDRA data for [iPRES 2004}(https://github.com/digipres/digipres-practice-index/blob/main/sources/ipres/raw/ipres2004.phaidra.jsonl).
### Talking to OSF
The next target was OSF, which turned out to be somewhat more challenging. The support for deeper hierarchies means the structures are more complex, but that aside, the metadata model is quite basic.  The hierarchies of each iPRES collection are slightly different, but each 'node' or level in the collection appears to support the same set of metadata:

- Contributors
- Date created
- Last updated
- Identifier/DOI
- Category
- Description
- License
- Tags

However, like the hierarchies, these metadata fields are not used consistently year to year. On top of that some information, like the _type_ of the publication (long/short paper, poster, etc.), doesn't fit neatly anywhere. 

For [iPRES 2018](https://osf.io/u5w3q/), the _Description_ field holds the abstract, which is one of the things we need, and the paper type can be inferred from the tags or the hierarchy ([example paper](https://osf.io/m6qa5/)). For [iPRES 2019](https://osf.io/6ern4/) entries are not categorised, with the description field being used to say it's a long paper, while the paper abstract is not present in the metadata, and there are no tags ([e.g. from 2019](https://osf.io/udj9f/)). Those from [2021](https://osf.io/rb2dt/) seem to have no description at all, no tags, and the individual publication authors are not recorded as the _Contributors_ ([e.g.](https://osf.io/sp2ja/)). For [2022](https://osf.io/8bczf/) the _Contributors_ are the authors and _Description_ free-text field is being used to capture the location of the YouTube recording as well as the type, but not the abstract ([e.g.](https://osf.io/yf8tn/)).

But before processing this data, we need to get to it programmatically.

When looking for the API, it's easy to find the [OSF APIv2 Documentation](https://developer.osf.io/), but this is quite overwhelming and I struggled to find relevant examples of how to use it.  I went back to inspecting what the website itself was doing, and it seems a good chunk of what is on the page uses an older `v1` API ([e.g.](https://osf.io/api/v1/project/8bczf/)) which does not appear to be publicly documented.  The actual retrieval of the files themselves seems to rely on a separate service and API called OSF Storage ([e.g.](https://osf.io/ng9d7/files/osfstorage)). This means we need to make multiple API calls across multiple services to scan through the contents of each set of conference outputs, and negotiate a different arrangement of data and metadata in each case.

Resolving all of this is clearly possible, but also quite complex and difficult. So for now, I chose to rely on the information in PHAIDRA. This is fine for most years, but not for iPRES 2022, which is not available from there. So I started looking for alternative approaches...
### Talking to EventsAir
Exploring the [iPRES 2022 site](https://ipres2022.scot/) and looking at the [programme](https://inconference.eventsair.com/ipres-2022/), it's clear there's a lot of rich information on the latter, generated from the _EventsAir_ platform.  Once again, opening up the browser developers tools and poking around, I looked for any internal APIs I could use.

Fortunately, I found _EventsAir_ published all the conference information as a single JSON file! For iPRES 2022, it looks like [this](https://az659834.vo.msecnd.net/eventsairwesteuprod/production-inconference-public/c556f4abcab245e5917106f996aa835d). It's a proprietary model, but it was pretty easy to go through it and work out where the details and abstracts are stored, and even the links to the original submissions. Skipping OSF wasn't ideal, but this seemed an acceptable way to make sure we have some coverage of 2022.
### Talking to IDEALS
Finally, for iPRES 2023, I needed a different approach. This conference was not covered by PHIADRA or OSF, and does not appear to be stored anywhere else. So, to collect the metadata I again broke out the browser developer tools and started exploring...

I could see the system making calls to get lists of item results, although the responses were chunks of HTML rather than being something like JSON data.  Worse still, if I tried to re-use these URLs outside of the context of the browser page, the server blocked the requests. It's probably possible to work around this, but given the service was actively blocking these operations, it wasn't clear whether that would upset the people running the service.

Looking around, I eventually spotted [this entry in the service documentation](https://guides.library.illinois.edu/ideals/what_is_the_oai_pmh_data_provider_url_for_ideals), which says the service supports getting metadata using [OAI-PMH](http://www.openarchives.org/pmh/). Given this documentation exists, it seems fair to assume that this is the official way to gather the metadata I need.

I've not used OAI-PMH much, but I have a rough understanding of how it works, and a bit of Googling led me to a capable looking Python implementation called [Sickle](https://sickle.readthedocs.io/en/latest/). It describes itself as _OAI-PMH for Humans_, so assuming I can pass the Turing test I should be fine.

Starting at the [tutorial](https://sickle.readthedocs.io/en/latest/tutorial.html) and poking around the [OAI-PMH service](https://www.ideals.illinois.edu/oai-pmh?verb=Identify) was helpful, and I guessed that there should be an identifier for the particular set that corresponded to the iPRES 2023 collection. The [web-based version of the list of all sets](https://www.ideals.illinois.edu/oai-pmh?verb=ListSets) was not very helpful, unfortunately, as there are lots of pages and it's hard to search through.

So, I ended up writing a [script that listed all the sets](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/fetcher-ideals.py#L14-L18) to give me a complete textual list, which I could then search through to find that the set I wanted, which was called [`com_2142_120947`](https://www.ideals.illinois.edu/oai-pmh?verb=ListRecords&metadataPrefix=oai_dc&set=com_2142_120947).

With [a bit more scripting](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/fetcher-ideals.py#L22-L28) I was then able to get all the records in that collection, and get almost all the metadata I need. _Almost..._

Having the metadata is great, but I also need to know the URLs to the _actual content_. Ideally, the 'landing page' URL (which is to the repository web page that describes the item) and the actual direct download document URL. My understanding is that this is a known _feature_ of the OAI-PMH standard, and while there are common extensions to the standard to add these kind of links, IDEALS has not implemented them. I was stuck.

I kept poking around and looking for anything I could use, trying out different things. And eventually, I noticed something potentially useful...

On the website, every item's landing page has a permalink which is a [Handle](https://www.handle.net/), like `https://hdl.handle.net/2142/121087.

In the OAI-PMH feed, every item has an identifier, like: `oai:www.ideals.illinois.edu:2142/121087`

As the actual identifier bit, `2142/121087`, is the same across both services, I guessed that I can parse the OAI identifier, break off the end, and add that the Handle URL prefix to get to the landing page. And that seems to work!

The actual document URL needed a bit more work. Each landing page exposes the link to the corresponding PDF in the HTML page metadata, as the `citation_pdf_url` property (this is a common practice, see e.g. [Zotero's docs](https://www.zotero.org/support/dev/exposing_metadata#using_an_open_standard_for_exposing_metadata)) So, by downloading each landing page, and applying a bit of [XPath](https://en.wikipedia.org/wiki/XPath) magic (`/html/head/meta[@name="citation_pdf_url"]`), I was finally able to put together [a script to gather all that lovely metadata](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/fetcher-ideals.py#L21-L56).

## Taking a Breath
Am I doing something wrong?

I've worked _near_ libraries for a long time, but not really very closely with this kind of data. So it's entirely possible I'm going about it all the wrong way. But even when there is a specific service for re-using this metadata, it seems really brittle and difficult?

This isn't meant as criticism. I know very well that these things are more difficult than they seem, and especially so given the system and staffing constraints we all work under. And I know that I'm looking back over twenty years of evolving practices and evolving teams.

But that was _hard_, right?

And it's not over...
## Reconciling the Metadata
Again, starting with PHAIDRA to get the most coverage, it's fairly simple to pull the metadata out of the Solr JSON and construct the following set of fields:

- year
- title
- abstract
- authors
- keywords
- license
- landing page URL
- document URL

Each PHAIDRA record appears to correspond to a single publication which may be a paper, or a poster abstract, or a presentation slide deck. No items have multiple files, so if an entry could have had both a paper and a slide deck, we only get the paper. Which keeps things simple, but means there's no links to additional materials or recordings.

There were a few oddities in the data itself. Sometimes the title had redundant information like the name of the conference embedded in it. Sometimes the abstract was just an `x`. Sometimes the keywords just described the conference. Sometimes one of the items in each collection was a 'whole proceedings' PDF, which is not what we're after here, but it wasn't programmatically clear which one it was.

So some clean-up was needed, but some additional information could be found too!  Sometimes, it was possible to work out the type of publication, e.g. poster/paper/etc.  And sometimes, the author entries included the author's institutions, which seems like an interesting additional facet. This process was consolidated into [a script that generate a list of publication items with a simple common data model](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/merger.py#L19-L81). 

The _EventsAir_ metadata was different again, as you might expect for a conference agenda.  Most of the fields were fairly easy to integrate, but e.g. only the presenter was listed, rather than all the authors. However, the institutions and publication types were much clearer.  The lack of a link to the OSF collection mean it was not possible to supply the right landing page URLs, but the _EventsAir_ system does provide links to the original proposal documents, in DOCX format.  Not ideal, but [good enough](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/merger.py#L83-L119).

Finally, the IDEALS data model was the simplest to map, but there was one catch. In many cases, there were duplicate records: one for the PDF of the paper, and another for the corresponding slide deck.  They were identical except for the titles, which had "` [presentation]`" appended in the latter case. So, it was necessary to filter through this and join up the two sets, making single records with an additional 'slides URL' in those cases where both were available. With this [final part of the process](https://github.com/digipres/digipres-practice-index/blob/6383ba73d7e07a53055855a77ac0cbc56c3defbd/src/merger.py#L83-L119) in place, it was possible to generate a single merged list of all the metadata in a single file.

## Conclusions So Far
This exploratory process meant the final data models for both the conference series and the individual publications had evolved and emerged rather than been planned.

The model for conferences can been seen [this example for iPRES 2015](https://raw.githubusercontent.com/digipres/publications/main/ipres/ipres-2015/index.md). This format allows the flexibility of a Markdown document for things that don't fit into the more structured data model that makes up the header of the file.

For the individual publications, [this Pydantic data model](https://github.com/digipres/digipres-practice-index/blob/main/src/models.py#L6-L22) captures the unified form, where the intention is that each publication has a separate record, but may have additional URLs for slides, notes or recordings.  The latter two are not used at all yet, but have been put in place because I'm aware that some conferences do have some of those resources at the level of individual contributions.

This model may need to change, however, as for example iPRES 2022 posters have documents that capture the original proposal, but also poster videos and PDFs of the actual poster. Therefore it may make more sense to rename the `slides_url` to `presentation_url` so that it can be used for talk slides or poster PDFs depending on the type of publication.

If possible, it would be nice to agree a data model for iPRES conferences, so that future proceedings are clearer on these matters. For example, it would be nice if the institutions were clearly identifiable as well as the authors, and if the publication types were clearly and consistently marked.
## Next Steps
The first thing to do after assembling the data has been to generate some [prototypes](https://github.com/digipres/registries-of-practice-project?tab=readme-ov-file#prototypes) to explore how that data can be used. I'm planning to describe that in more detail in a future post. This post is long enough!

The other thing, as indicated above, is to reach out to the iPRES Steering Group and any other interested parties to try and lay the ground work for working out what to do next.

According to [this project's principles](https://github.com/digipres/registries-of-practice-project?tab=readme-ov-file#principles), I would rather contribute any model changes or data tweaks upstream to the source systems and repositories. But at this point, it's not clear how reasonable it is to expect the PHAIDRA/OSF/IDEALS systems or data to be changed or updated. The same goes for the iPRES homepage.

If you have strong feeling about this, please get in touch with me, or get in touch with a member of the [iPRES Steering Group](https://ipres-conference.org/) if you think that's more appropriate. 

Anyone interested in booking a brief chat with me about anything related to my work can use [my Calendly page](https://calendly.com/andrew-n-jackson/dpoh).

I'd especially like to hear if you think I'm going about this is the wrong way. For example, as well as being surprised how difficult this was, I was also surprised that I couldn't find an existing citation or publication data model that fits this kind of data. I suspect I'm missing something, and would much rather use a standard or widely-adopted model if possible!

If you've read this far, I only thank you for your perseverance. 

Share and enjoy.
