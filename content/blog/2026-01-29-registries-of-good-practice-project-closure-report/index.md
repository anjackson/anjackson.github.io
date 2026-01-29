---
title: "Registries of Good Practice: Project Closure & Legacy Plan"
subtitle: "A report on the work done from 2024-01 to 2026-01."
date: 2026-01-29
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
description: "A report covering the work of the Registries of Good Practice project, documenting the outputs of the project and outlining how we plan to manage them in the future."
---
**Date:** 2026-01-29\
**Revised for public release:** 2026-01-29
**Author:** Dr Andrew N. Jackson\
**Project Start Date:** 2024-01-24\
**Project End Date:** 2026-01-23

## Introduction

The two years of funding for the [[Registries of Good Practice project]](https://www.dpconline.org/digipres/collaborative-projects/registries-of-good-practice) officially ends on the 26th of January 2026. As the project draws to a close, it has been agreed that the DPC will commit to sustain the most valuable outputs of the project on an ongoing basis, where they align with the role of the DPC and the needs of our members.

Following on from the [[Midpoint Review]](https://anjackson.net/2025/04/28/registries-of-good-practice-midpoint-review/), this document summarises the results of the project, and documents which of the project deliverables are going to be maintained beyond the end of the project funding period. This document also proposes some possible future project ideas, if suitable project partners and funding can be found.

## DigiPres Publications Index & Awesome Indexer

*A dedicated search engine for digital preservation*

The [[publications index]](https://digipres.org/publications/) was the first output of the project, and has been very well received. During this process, it became clear that this prototype was really two distinct things:

- A web version of iPRES Publications, bringing the proceedings of different years together and e.g. making sure they show up in Google Scholar.

- An index and database of publications and resources for digital preservation.

We have decided to split these into two separate components. The system for building an index has been refactored into a more generic tool we have created called the [[Awesome Indexer]](https://github.com/digipres/awesome-indexer). This can be used to generate indexes and databases from standard bibliographic sources (Zenodo collections, Zotero libraries, among others). As such, the hope is that other communities can adopt the same approach, either by adding to the Digital Preservation Index directly, or by setting up their own indexes using the same tool. Hopefully this flexibility will make it easier to grow the community around the tool, thus aiding its long-term sustainability.

During the remainder of the project, we will officially launch the Awesome Indexer and the corresponding updated Digital Preservation Publications Index (DPPI 2.0, currently [[here]](https://www.digipres.org/publications/awesome-index/)). We will also investigate adding CrossRef and RSS/Atom feeds as publication sources. Among other things, this would make it possible to ensure that DPC publications can be automatically integrated into the index.

After the project, we commit to maintain and develop the Awesome Indexer, to a level sufficient to keep the DPPI running and up to date. Significant updates to the tool or major feature development will require contributions or additional funding.

As such, it is envisaged that the majority of the work will be around integrating the metadata from each year's iPRES conference into the index. Based on the experience of integrating iPRES 2024, this will need 3-4 days of work per year.

## iPRES Proceedings

*All iPRES outputs in one place search-engine-friendly place*

The current status of the iPRES Proceedings has been summarised in this post: [[Re-indexing iPRES 2022]](https://anjackson.net/2025/09/11/re-indexing-ipres-2022/). That report illustrates how the 'master' metadata for iPRES Proceedings is now split across multiple systems, and outlines some possible ways forward. The metadata-only iPRES Publications website showed one way of addressing this, but the long-term plan is not clear.

To determine the next steps, we will start by working with the iPRES 2025 team to integrate the proceedings from the most recent conference. The iPRES 2025 team has proposed that we use this experience to create a guidance document to be approved by the iPRES Steering Group, so that future iPRES conferences can handle proceedings in a more consistent manner. We (the DPC) will work with them to help make this happen, using the results of this project to inform the process and to help ensure that future iPRES Proceedings are easy to integrate into the DPPI.

It is important to note that the iPRES 2024 proceedings are held on the version of the PubPub platform that has [[since been declared the 'legacy' version]](https://www.knowledgefutures.org/updates/2025-06-update/) and is going to [[be shut down at the end of 2026]](https://help.knowledgefutures.org/migrating-off-of-pubpub/pubpub-legacy). The iPRES 2024 team is working with PubPub to manage the shutdown, but the iPRES community will need to deal with the fact that the current links will break, and that we will need to find a new place to host the iPRES 2024 resources.

If time permits, the current version of the aggregated iPRES Proceedings will be modified to use a more standard formal publications framework (like Quarto or MyST), to explore what iPRES Proceedings could look like in the future.

## DigiPres Workbench & The Format Index

*A place to explore your formats and compare collections*

The [[DigiPres Workbench]](https://www.digipres.org/workbench/) is the main collection of reports, analyses and prototypes generated by the project. The most useful parts of it include a new index across multiple format registries, and tooling to compare institutional collections against those registries and each other.

The largest pieces of work still to be completed lie in this area. They are:

- Updating the Format Index based on feedback from Yale and others.

- Updating the comparison tools based on Yale's feedback and needs.

For the future, we commit to supporting the basic maintenance of this system, but any significant new features would require contributions or additional funding. Based on the decade of experience running the precursor to the Format Index, this should not require a lot of effort. Perhaps one or two days per year, on average.

## Format Registry Research

*Sharing what we've learned about formats and registries*

The results from analysing format tools and registries have been summarised in two papers accepted at iPRES.

The first, on using ecological models to understand how many formats are out there beyond what is already in our registries, was initially presented at BDCAM 2025. This work has been extended and was presented at No Time To Wait 9 and iPRES 2025. The second, on patterns in format identification workflows, was co-created with members of the Preservation Registries Special Interest Group, and was also presented at iPRES 2025.

The first paper received a commendation from the judges of the Best Paper award:

> \"The judges say that this paper was recognized for advancing theoretical and technical understanding of file format diversity, a foundational challenge in digital preservation. It also shows how much diversity lies in our digital collections using innovative ecological modelling to estimate this species richness of digital formats. It offers both conceptual clarity and practical strategies for the field. The judges commended its originality, analytical depth, and potential for long-term impact.\"

A longer paper with a more thorough and detailed analysis of the format ecosystem model will be written, aiming for publication as an open access journal article.

## WikiData Lessons Learned

*Helping others engage with WikiData*

During the first year of the project, we worked with Yale to explore using WikiData and WikiBase for format identification and linking formats to software and executable environments. This meant the new Format Index could find software information about formats. A blog summarising our experiences during this process will be published before the end of the project.

## Toolboxes, Sandboxes & Tool Recipes

*Learn how to use specialist tools without leaving your browser*

The project also explored ways of making it safer and easier to run tools. This included:

- [[The DigiPres Toolbox]](https://github.com/digipres/toolbox) - which is similar to [[OPF's ViPER]](https://openpreservation.org/tools/viper/) but easier to use and adapt.

- [[The DigiPres Sandbox]](https://github.com/digipres/sandbox) - which is a way of running the *Toolbox* on the free cloud services like [[Binder]](https://mybinder.org/) (developed for the purposes of supporting sustainable research by organisations like the Turing Institute) and [[GitHub Codespaces]](https://github.com/features/codespaces).

- [[Tool Recipes]](https://github.com/digipres/tool-recipes) - which illustrate how, even when we can't share and distribute the tools themselves (e.g. due to copyright concerns), we can still share explicit, executable, reproducible recipes that makes running these tools easier.

The remaining work on these items is in publicising them as outputs of the project, and illustrating how they could be used to support practitioners. They are particularly useful in allowing individuals to use tools without installing them locally, for experimentation or training purposes. As long as it's clear that *private data should not be uploaded to these services*, these tools provide a safe way for practitioners to explore what specific digital preservation tools are of use in their context. This should help them define and articulate their needs when discussing the use of specialist tools with IT departments and other stakeholders.

The Sandbox approach is particularly well suited to spinning up temporary specialist environments for hand-on training purposes. Development of this kind of resource would be well-suited to a follow-on project (see below).

However, due to their complexity, no onward commitment to sustaining these outputs can be made without additional funding.

## Sustainable Websites

*Building web publications that will last*

A strong thread in this work has been on building or updating sustainable websites. Ones that need minimal resources to run, and model a "tripartite" design that keeps editing, storage and access separate so they can all evolve independently over time.

By building long-term preservation into the design from the start, we make it easier to keep sites running for longer, avoiding the need to rely on web archiving to maintain access to these resources. Moreover, these same techniques also mean if and when web archiving does become necessary, these resources are more likely to be amenable to that process and therefore be archived successfully in a complete and usable form.

This work includes the DPPI, Awesome Indexer and DigiPres Workbench, but also:

- The [[Start 2 Preserve Skills Resource Site]](https://digital-preservation-coalition.github.io/learning/).

- The [[Future Nostalgia Floppy Disk Guide]](https://www.digipres.org/the-floppy-guide/).

- The [[digipres.org]](http://digipres.org) homepage/portal, including:

  - A refreshed homepage.

  - Clearer "about" page. Saying what it is and that DPC & OPF help support it.

  - [[Support for a 'local groups' page.]](https://www.digipres.org/communities/)

  - [[Experimental support for hosting workflow webinars as structured data.]](https://www.digipres.org/workflows/)

- The new version of the Bit List ([[here]](https://bit-list.dpconline.org/)).

Only the Bit List will be actively maintained by the DPC on an ongoing basis. The others will be maintained on a best effort basis, and major changes will require additional funding.

In terms of remaining work, some of the lessons learned from these sites (especially the work on the Bit List) will be written up and published (forum/nature TBC).

## COPTR

*Finding a future for our shared tool registry*

We have been working with the Open Preservation Foundation (OPF) to understand the user needs around COPTR and stabilise the service. We worked together to create and circulate a COPTR User Survey, and this made it clear that a lot of people care about COPTR. However, it was also clear that there was little agreement about what to do with COPTR long term. The Registries project had originally expected to make significant changes to COPTR, but in light of the community feedback we have agreed to keep it running as is, and instead focus on bringing together the community around COPTR so they can decide what is needed in the future.

In terms of commitments, the proposal is:

- OPF continues to host COPTR, accepting that it runs obsolete software and mitigating the risks of doing so by keeping it isolated and ensuring there are independent backups of the data.

- DPC helps refine the homepage and documentation.

- OPF & DPC respond to user queries and work together to support user outreach.

- OPF & DPC run at least one 'hackathon' event:

  - [[An online 'relaunch' event in later January 2026 as a DPC #DPClinic]](https://www.dpconline.org/events/eventdetail/579/-/dpclinic-january-relaunching-coptr).

  - If possible, an in-person event at iPRES 2026.

  - If there is community interest, future annual online events and/or a regular iPRES session (perhaps coordinated with the Bake Off).

If possible, before the end of the project, the Format Index will also be extended to pull in tool data from COPTR so that people can more easily find tools based on the formats they support.

## PR-SIG

*An open forum for collaboration on our shared information resources*

The [[Preservation Registries Special Interest Group]](https://www.dpconline.org/digipres/pr-sig) has been a useful and supportive forum. However, it has also been quite focussed on the project work, and so it is not been clear whether to keep it running beyond the project. It would be a shame to lose it altogether, as it represents a community of over one hundred people who have indicated their interest in these kinds of resources and the issues around them.

Raising this issue in recent calls, the idea has been proposed to keep it going as a collaboration and co-working session. This could include things like working together to update COPTR records or refine the Publications Index. The work during the remainder of the project will be to experiment with this idea, to see if we might want to keep it running beyond the end of January 2026.

One approach would be to frame this group as a 'working group' with a rolling work plan. In effect, we have been defining and leading that work plan these two years. In the next year, this could be opened up: "Where do we all want to go next folks?"

Another issue is timing. The initial 9am+9pm UTC every month didn't really work for EU folks, and the current once-per-month-across-three-time-zones is rather brittle. If you miss one, there's a massive gap! To address this, a looser "Collaboration Cafe" will be run every fortnight, alternating between 4pm and 11pm UK time for 1 hour on Thursdays ([[see timezones]](https://www.worldtimebuddy.com/?pl=1&lid=5368361,5128581,2643743,2950159,2147714,2179537&h=2643743&hf=1)). Care will be taken to avoid clashing with the regular PRONOM calls. For full details, see [[the PR-SIG web page]](https://www.dpconline.org/digipres/pr-sig).

## Summary of Ongoing Work

The following table summarises the proposed post-project commitment. In each case, the public-facing homepage(s) of each resource will be updated to make their status clear to the users of that resource as part of the Project Closure Comms Plan (see below)

+----------------------------------------------------------------------+----------------------------------------------------------------------------------+
| **Actively Supported & Developed**                                   | The Bit List                                                                     |
|                                                                      |                                                                                  |
|                                                                      | Digital Preservation Publications Index (adding new iPRES proceedings each year) |
|                                                                      |                                                                                  |
|                                                                      | PR-SIG (to be reviewed every six months)                                         |
+----------------------------------------------------------------------+----------------------------------------------------------------------------------+
| **Basic Maintenance**                                                | Awesome Indexer                                                                  |
|                                                                      |                                                                                  |
| **(large changes require additional contributions or funding)**      | The Format Index                                                                 |
|                                                                      |                                                                                  |
|                                                                      | [[digipres.org]](http://digipres.org) portal                         |
|                                                                      |                                                                                  |
|                                                                      | Start 2 Preserve                                                                 |
|                                                                      |                                                                                  |
|                                                                      | The Floppy Guide (with LT/CUL)                                                   |
|                                                                      |                                                                                  |
|                                                                      | COPTR (with OPF)                                                                 |
+----------------------------------------------------------------------+----------------------------------------------------------------------------------+
| **Leave Up**                                                         | The DigiPres Workbench                                                           |
|                                                                      |                                                                                  |
| **(mark as not actively maintained, but open to follow-on funding)** | Toolbox, Sandbox & Recipes                                                       |
+----------------------------------------------------------------------+----------------------------------------------------------------------------------+
| **TBC**                                                              | iPRES Proceedings                                                                |
+======================================================================+==================================================================================+

## Project Closure Comms Plan

Once the plan for ongoing work is finalised, we will produce an appropriate comms plan to publicise the outputs of the project, clearly communicate our post-project commitments and encourage follow-on projects where appropriate.

Format and nature of these outputs and/or events are yet to be defined in detail, but include:

- Publishing this Project Closure & Legacy Plan.

- Re-launching COPTR at the January #DPClinic.

- Ensuring the legacy plan for each project output is clearly communicated to its users.

## Future Project Ideas

There are a number of possible strands for future research projects we'd like to highlight here.

Note that, if there is interest from a DPC Full Member and if there is someone able to work on them, these projects might be a good fit for the [[DPC Research & Development Fund]. The Call for Proposals for this year's Fund will open shortly, with a deadline of 30](https://www.dpconline.org/digipres/discover-good-practice/research-and-development-fund) January 2026.

### Format Identification & PRONOM

*Working with PRONOM to help it grow*

The project has endeavoured to publicise and promote the wonderful work the UK National Archives do to support the wider community through PRONOM and DROID. There has been some particularly interesting work by the UK National Archives lately on a new version of PRONOM that takes a similar "tripartite" approach to those explored in this project, and does so in ways that make maintaining and contributing to PRONOM much easier.

Building up more of a relationship with PRONOM has been a part of this project, and maintaining this relationship will continue beyond the end of the project.

A future project could look at supporting the UK National Archive's work on the new PRONOM, e.g. combining it with support and training resources to contribute to PRONOM, possibly leveraging some of the other outputs from this project such as the Toolbox and Workbench along with related analysis tools such as [[Freud]](https://github.com/digital-preservation/freud) and [[Demystify-Lite]](https://ross-spencer.github.io/demystify-lite/).

### Software Preservation & Emulation For Practitioners

*Putting emulation in practitioners hands*

Building on the partnership with Yale, it would be interesting to look at follow-on projects to explore making emulation accessible for practitioners. There has been interest in software preservation and emulation from DPC members, and DPC will be planning an event on this in April 2026. This would be a good opportunity to bring together the Software Preservation Network, the ARC Center of Excellence in Born Digital Heritage (if funded), and other interested parties to see if there is appetite for a project bid that would help put emulation tools into practitioners hands.

### Migrating Old Media

*Saving early born-digital history while we still can*

Building on the work of both this and the Future Nostalgia project, one possibility for follow-on funding would be to look at supporting practitioners and building up some good practice, training and shared services around migrating old media like floppy disks. CUL is looking at developing a project bid along these lines, with DPC as a partner.

Verifying that media migration has been successful is often challenging. Getting this right often involves the use of emulation tools, so this is a place where cross-project collaboration might be appropriate. Specifically, this may provide an excellent opportunity to build on the relationship with Yale and leverage the EAASI service.

### GLAM Workbench & Beyond

*Empowering practitioners with web-accessible tools*

One possible avenue for future work, given suitable funding, would be to work with Tim Sherratt to build an extension to the GLAM Workbench, or a separate Workbench explicitly targeting practitioners. This would help make the DigiPres Workbench more sustainable by shifting it to technologies that more people are able to support on an ongoing basis.

Some DPC Members have previously expressed an interest in funding something along these lines. It also relates to the OPF's ViPER work, and could perhaps be combined with the idea of enabling more practitioners to work with format identification tools and develop PRONOM signatures (mentioned above).
