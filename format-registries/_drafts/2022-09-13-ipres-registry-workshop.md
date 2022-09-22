---
title: Returning to Registries
subtitle: A report on the iPres 2022 collaborative workshop on digital preservation registries.
category: format-registries
tags: ["Digital Preservation"]
layout: post
author: anj
shown: true
created: '2022-09-14'
changed: '2022-09-21'
---

I was lucky enough to be able to go to #iPres2022 in Glasgow. Unfortunately, I have to return home and and will have to attend the final day of the formal conference remotely. But it's been great, and while I didn't catch up with everyone I wanted to see, I did enjoy seeing faces old and new, some dating back to my early days in digital preservation!

I was involved in a few different sessions, but right now I want to highlight some ideas that came up during the workshop I was involved in on Monday: "Registering our preservation intentions: A collaborative workshop on digital preservation registries".  

Here are the _fragments_. Perhaps some _patterns_ will emerge.

## The One Registry

One question that came up was whether our time would be better spent building one unified registry.  In my opiion, this is one of digital preservation's [wicked problems](https://en.wikipedia.org/wiki/Wicked_problem).  It's one of those where it's not that it's a _bad_ idea -- it _could_ be _great!_

But each of these registries is a little different, built with slightly different assumptions, scratching a slightly different itch, managed in a slightly different way. PRONOM signatures are a little _stricter_, for good reason. Apache Tika's are a little more _loose_, for a different, perfectly good reason. PRONOM uses signature priority to filter signatures matches, others use a conformance heirarchy (a bit like [Apple's](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_conc/understand_utis_conc.html#//apple_ref/doc/uid/TP40001319-CH202-SW4)). Some registries just identify a format by a title string, others include references to specifications, and some (like the Library of Congress's) go _deep_ and really explore a format by including detailed explanations, rather than just metadata fields and values.

If you make _The One Registry To Rule Them All_, you have to get a lot of things right all at once: A data model that accepts everyone's use cases and constraints. An editorial and governance approach that everyone can live with. Outputs and integrations that replicate whatever already happens downstream of the current registries (thus likely having to support multiple _legacy_ APIs as well as whatever new stuff has come up). And as I learned during the workshop, the amount of _use_ each registry gets is often used to help justify the funding that ensures each registry exists _at all_ -- any centralised model has to find a way to maintain that justification. If it looks like someone else is solving the problem, it'll fall apart.

This is _possible in principle_. But then it's also _possible in principle_ to generate a Shakesphere manuscript by arming a sufficiently large number of chimps with keyboards.  The real issue is whether it's _likely to work_.  

Many of the "old hands" of digital preservation have seen a lot of project money spent trying to do this. We built them. Few came. None stayed.

This bitter experience has left many of us skeptical as to the practicality of _the One Registry_. It seems incredibly unlikely that we could make that transition in a single leap. 

But given that [successful complex systems tend to evolve from simpler ones](https://en.wikipedia.org/wiki/John_Gall_(author)#Gall's_law), perhaps we can _evolve_ in the right direction?


## Searching Across Registries

That's part of the reason I built [the format registry aggregator](http://www.digipres.org/formats/), because it helps us start to explore these issues without interrupting how the registries work now. It aggregates and normalizes the critical common parts of the data models, but leaves the rest alone (along the lines of a [Star schema](https://en.wikipedia.org/wiki/Star_schema)). This means we can search and compare centrally, but drive the actual reference usage traffic back to the source registry, so those home institutions can see the value of what they are building. (I plan to review the aggregator implementation to make sure it refers poeple to the original source registry as much as possible. See [this issue](https://github.com/digipres/digipres.github.io/issues/32).).

Crucially, in comparison to many previous efforts, there no cloning or forking of the source registries. The aggregator just records how things look right now, builds a normalized subset, and notes any conflicts or anything else that looks odd. If the data needs to be changed, that happens at source, by talking to the folks that run the corresponding registry.


## Concordance Heirarchy

As mentioned above, concordance heirarchies are a useful way of capturing things like the fact that e.g. _DOCX_ `is a` _ZIP_ `is a` _BYTESTREAM_, or _XHTML 1.1_ `is a` _XHTML_ `is a` _XML_ `is a` _TEXT_ `is a` _BYTESTREAM_.  This means you can say things like 'I think this is a _TIFF_, but I don't know which version'. And any downstream processing like parsing can 'fail up the tree', e.g. if you don't manage to parse a _DOCX_ as _DOCX_ you can still parse it as _ZIP_ and record some useful information about it.

The digipres.org format aggregator and the [webarchive-discovery tools](https://github.com/ukwa/webarchive-discovery) both work by building a [MIME-type based conformance heirarchy](http://www.digipres.org/formats/mime-types/). This means that when DROID/[Nanite](https://github.com/openpreserve/nanite) recognises a particular version of a file, we can record it using something along the lines of `application/pdf; version=1.6`. But if that fails for some reason, Apache Tika (or other tools) can probably still identify that it's a `application/pdf` and act accordingly.

One thing that became clear during the meeting is that I should probably publish more about the advantages and limitations of this approach!

## Too Many Registries?

But are there too many registries? For example, there has been a long history of short-term project money being use to built _yet another tool registry_, with each fading as the money fades. In the past, members of the iPres community have worked together to try to stop that rot, merging the existing tool registries into a single one known as [COPTR](https://coptr.digipres.org/), and trying to ensure future developments enhance that rather than starting from scratch. 

But so far, it seems like the different _format_ repositories are mostly complementary, rather than in competition, or repetition. In the break-out group I was part of, it seemed much more important to be clear about the _scopes_ of the different registries, so people don't go off and do their own thing if they don't need to. I've [made a note to add more information on this](https://github.com/digipres/digipres.github.io/issues/33) to the current digipres.org format aggregator.

## Comparing Format Registries

As each registry tends to cover slightly _different_ information about formats, it's interesting to know whether we're approaching the _same_ formats from different angles, or covering _different_ formats. This is particularly important when considering the fact that may of us rely on being able to use PRONOM IDs in our preservation metadata.

During the workshop I presented [my comparison of format registries](https://github.com/digipres/digipres.github.io/blob/master/Format_Registry_Comparison.ipynb), showing there are a significant number of unique formats in every registry, at least across the seven that have made it into my [format registry aggregator](http://www.digipres.org/formats/overlaps/) so far (I've not had chance to [add NARA's](https://github.com/digipres/sentinel/issues/12) yet!)

This suggests it's worth continuing to explore the aggregator approach, at least for now.

The comparison with GitHub Linguist shows the smallest degree of overlap. This seems to reflect the historical difficulty we have with text formats like source code. Identifying source code is what Linguist is intended for, whereas other tools struggle to identify those formats and are focussed elsewhere.


## Tracking Changes

Changes, and adding to the aggregator.

- Automated Preservation Recommendations
- Need for re-identification


## Reminders and Refreshers

- Test Corpora TDD, project? Routine addtions? Secret Library?
- Re-vitalize digipres.org

## Funding Gaps

- Vendors getting the money
- Tension between product and variation between orgs, as shown in registries.


## Beyond Formats

In the workshop, we talked mostly about format registries. 

PAR, and WikiData/EASII



# LATER

Community 6 
- how do we discover tools?
- presenter aware of tools in context
- OS GUIs are #1 need!
- Link case studies to COPTR?
- Ask The Community is a good answer but how to make it last?
- THEN Wikibase is good, move COPTR.
- Combine the above? Case studies encoded in WB COPTR and explore for patterns?

2022-09-15 Edith DPMS TO READ
- Contact James about the model?

R2 Thompson security vs preservation v good example.
R2 Dragan, an excellent performance WB (sig prop example).
R2 Natasha, remote sandboxes, similar access pattern accessibility issues not mentioned.

Ask Seamus about the lack of Theory and the Theory/Practice split (and the benefits).