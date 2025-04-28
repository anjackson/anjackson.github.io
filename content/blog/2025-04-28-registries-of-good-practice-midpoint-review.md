---
title: "Registries of Good Practice: Midpoint Review"
subtitle: Public release of the internal project status report dated 2025-10-08
date: 2025-04-28T15:40:00.000Z
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
images:
  - /assets/images/uploads/screenshot-1745851700960.png
description: Public version of the midpoint review report for the Registries of
  Good Practice project.
---
**Date:** 2025-01-08\
**Revised for public release:** 2025-04-28\
**Author:** Dr Andrew N. Jackson\
**Project Start Date:** 2024-01-24\
**Project End Date:** 2026-01-23

## Introduction

This midpoint review covers the progress through year 1 of the "Registries of Good Practice" Project (2024-01-24 to 2025-01-23), and lays out the plan for the second and final year of the project (2025-01-24 to 2026-01-23). This is intended to allow us to determine if the project steering group members are happy with the progress of the project so far, and if there are any additional lessons to be learned. It is also intended to gather feedback on the current proposals for year two.

Year two will also require time for planning possible follow-on work and future projects. Some initial ideas are outlined at the end of this document to encourage further input, and ensure any prerequisites or dependencies can be raised as soon as possible.

This focuses on the work carried out by Andy Jackson at the DPC. It does not include the full details of the “yaLe wikidAta exploRation diGital prEservation” (LARGE) project or the engagement with Yale’s digital repository team. However, coordination points and links are included as needed below. Note that there has been ongoing open and friendly coordination and collaboration throughout, with clear communication and strong management from Yale. This has been much appreciated!

## Goals

The project aims to explore the following issues:

* **"Practical Registries (PR)"** What is the current ‘landscape’ of active and openly-accessible registries of things like format, software, tools and workflows, and how are they being used in practice? How do vendors integrate and use them? How does that compare with what practitioners do with them, and how registry maintainers build them? What works well? What’s not so good? How could things be improved?  
* **"Registries of Practice (RoP)"** How do practitioners work towards ‘good practice’, and could ‘registries of practice’ help? What methods do people use to improve their practices? How do we build on the work of others, and avoid reinventing the wheel? What are the good sources of information about practical digital preservation? How useful are the iPRES proceedings in this regard? How can we improve the discoverability of these kinds of resources?  
* **"The Practice of Registries (TPoR)"** What are the common practices used to build and maintain technical registries themselves? What are the constraints we’re operating under? How does that affect the kind of approaches we can take? What kinds of contributions are welcome, and through which channels?

The intended outcomes are:

* An established *[Preservation Registries Special Interest Group (PR-SIG)](https://www.dpconline.org/digipres/pr-sig)* where people can come together to talk about digital preservation registries.  
* A range of formal and informal publications documenting the current state of our registries.  
* New tools and services to help us improve our practices and maintain our registries, built with long-term maintenance and sustainability in mind.

## Quality Assurance

The success of the project can be judged along two dimensions: delivery and impact.

By delivery, we mean the project delivers what it has promised to, on an acceptable schedule. Project funders should be satisfied that their investment has been respected and progress has been made.

By impact, we mean the success of what the project has delivered. This means collecting community feedback, peer review, attendance figures and usage statistics (e.g. web analytics) about the project outputs.

## Year 1 Outputs

### PR-SIG

The Preservation Registries Special Interest Group (PR-SIG) has been successfully set up, and runs regularly on the first Thursday of every month. To accommodate the global audience, it runs in two time slots, early (9am) and late (9pm) UK times. It has been a modest success, with six to ten attendees each time.

However, the associated mailing list has many more members than this (105), so it is not clear the current form is meeting the right needs. We will return to this in the Year 2 Outputs section.

### Digital Preservation Publications Index 1.0[](https://digipres.org/publications/)

![Homepage of DigiPres Publications Index showing the basic UI.](/assets/images/uploads/digipres-publications-index-v1.png "DigiPres Publications Index Homepage")

The first project output was the Digital Preservation Publications Index, available at [https://digipres.org/publications/](<>)

Through usage and feedback, it became clear that this is really two prototypes: an iPRES Proceedings website and an index of publications.

* The iPRES Proceedings gather all the metadata and abstracts together into a single web site that has a basic search and can be indexed by search engines. It is a set of metadata files that is combined with a lightly modified version of a widely used static website template system.  
* The index is a database of the same information, that can be used for queries in a range of off-the-shelf clients. The prototype uses one called Datasette Lite, which provides a complex but powerful way to explore the database.

Future plans for this component take this split into consideration.

#### Impact

* Anecdotal feedback is good. A number of individuals have commented that it helped find papers they did not already know about, including Kieran O’Leary (for his archiving Masters project) and Ethan Gates (for his Emulation Bibliography).  
* The web analytics results indicate that the publications part of the digipres.org site has received \~5000 page views from \~2400 distinct visits over the last year.   
* The available web link referrer data indicates that people are getting to those pages from major search engines including Google and Bing, showing that the material is being indexed successfully.  
* The efforts to mark up the academic works correctly appears to have paid off, as a significant fraction of the visits are coming in via Google Scholar.  
* The iPRES 2024 site integrates with the Publications Index by linking the 2024 publications keywords directly into the website search system.  
* The index data was reused by the iPRES 2024 poster: [Was it all worth it?](<>)  
* The index data was mentioned in [this blog on making data available in SQLite and similar formats](<>).  
* Engagement with the iPRES Steering Group has also been positive, with initial steps being taken to consider adopting project outputs and proposals via the forthcoming iPRES continuity sub-group.

See <https://digipres.org/publications/> 

### Digital Preservation Workbench

![DigiPres Workbench Homepage featuring overview diagram.](/assets/images/uploads/screenshot-1745851700960.png "DigiPres Workbench Homepage")

The second major project output is really a set of related prototypes:

* Information about format registries, including a comparison and a database-based search across them.  
* A set of collection profiles (based on file extension) and a way to view and compare them. Also includes a way to quickly generate a format profile running in the browser. So far, fourteen collection profiles have been contributed by 11 organisations.  
* An ecosystem analysis to estimate the total number of digital formats out there.  
* Publication analysis and statistics.  
* An experimental ‘Sandbox’ that spins up a temporary virtual machine, demonstrating the possibility to use this to experiment with tools via the command line or Python without having to install anything locally.

The collaboration and feedback with Yale on this part of the project has been very helpful.

#### Impact

* The workbench was released in September 2024. Since then, the web analytics indicate that there have been \~1700 page views from \~700 visits.  
* The collection profile idea has been well received. Multiple institutions have added their own. One institution reported that it had been useful to understand their local challenges and that it was being used to advocate for more resources.  
* The ecosystem analysis was the basis of the good peer review results mentioned earlier, and anecdotally it appears to represent a compelling and innovative approach.  
* One member of a Python Study Group noted that the Sandbox may help them with their studies. Another member institution (Cambridge University Library) also wants to follow up on the Sandbox, but this has not happened yet so their precise interest is not yet known.

See <https://digipres.org/workbench/> 

### Start 2 Preserve Skills Resource Site (S2P-SRS)

![Welcome to the DigiPres Learning Resources Portal!](/assets/images/uploads/screenshot-1745863604886.png "The DigiPres Learning Resources Portal homepage")

As an experiment in different approaches to managing a ‘registry’, a site was set up to see how well we might support a community group as they build up a set of training resource links using simple and sustainable technology (Jekyll, GitHub, DecapCMS).[^1] This was used in the “Start 2 Preserve: Creating a Skills Development Resource” workshop, and appeared to be successful as the attendees were able to use it without major problems.

See <https://digital-preservation-coalition.github.io/learning/> 

### Experimental ‘DPC Publications’ Subsite

![](/assets/images/uploads/screenshot-1745863923440.png)

A similar experiment looked at using a modern formal publication toolchain called MystMD as an alternative way of managing large documentation-oriented parts of the DPC Website. This illustrated what might be possible, including making it much easier to maintain HTML, PDF and ePub variants of each publication. This was demonstrated at a DPC Staff Meeting in December 2024, and appeared to be well received despite the fact that it will represent a significant change to our existing publication processes.

See <https://digital-preservation-coalition.github.io/toolkits/> 

### Format Index 2.0

![Search The Format Index with results for VRML](/assets/images/uploads/screenshot-1745864198029.png "Example results searching for VRML using the Format Index 2.0")

An updated version of the Format Aggregator, called the Format Index 2.0, was slated for full release in the last quarter of 2024. This was included in the Yale project roadmap, as the plan includes integrating data from WikiData. Progress was made, as software information is now being collected daily, and a new prototype for the service is available as part of the Digital Preservation Workbench.

However, as of January 2025, this work is not complete, as all the data sources (old and new, including WikiData), have not yet been integrated into the index database and user search interface.[^2]

See <https://www.digipres.org/workbench/formats/format-index> to access the work-in-progress version of the new Format Index.

### Conference Papers & Presentations

The project work was presented at iPRES 2024:

* Workshop: [Digital Preservation Registries: What We Have & What We Need](https://www.digipres.org/publications/ipres/ipres-2024/papers/digital-preservation-registries-what-we-have-what-we-need/)  
* Bake-off Demo: [Understanding your collections with the DigiPres Workbench](https://www.digipres.org/publications/ipres/ipres-2024/papers/understanding-your-collections-with-the-digipres-workbench/)

Both appear to have been well-received. The workshop sold out, and engagement and feedback was good on the day.

Part of the workshop material was also presented in [\#DPClinic September – Registries of Good Practice](https://www.dpconline.org/events/eventdetail/373/144/dpclinic-september-registries-of-good-practice) which had 12 attendees. The recording has been viewed nine times so far. The feedback on the clinic was:

* "5/5: Everything, it was excellent. File formats, identification, the comparison to bird species and bird watching."
* "5/5: I thought the analogy with species taxonomy was really good in highlighting the complexity of information available and how it can be layered.\
  \
  I thought given the remote presentation format, this was a very good event. The only thing I can think of that would improve a presentation of the Workbench would be an in-person clinic where people brought along real examples to study."
* "5/5: The DigiPres workbench blew me away, and the publications index is so slick! Really exciting project guys! Enjoyed the birding analogy too (although more of a plant classifier myself)\
  \
  There was a lot of information covered in this talk (which was great) - I would love to see a practical follow-up to get using the workbench. Maybe even a roadshow type event where we can bring some gnarly files! "
* "4/5: The project "Registries" itself, the comparison with ecology, the presentation of the tool that was clear and practical, the fact it is recorded (for later re-watch, or to show the video to colleagues)"

The recording of the presentation part of the clinic has been made publicly available via the DPC’s YouTube channel: [\#DPClinic September – Registries of Good Practice](https://youtu.be/wOv6usTbPhc).

<iframe width="560" height="315" src="https://www.youtube.com/embed/wOv6usTbPhc?si=UWnXxAs92N5b0qUu" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Looking ahead, papers have been submitted to both IDCC 2025 and the inaugural Born Digital 2025 conferences. Both were successful, with excellent reviews. Unfortunately, due to other priorities, the IDCC paper has been withdrawn. However, the work in that paper will be re-used and reshaped into a proposal for iPRES 2025.

## Midpoint: Transition to Year 2

At the current time, having reviewed the progress above, we now need to sketch out the second year of work and start to plan beyond that too.

The project closure plan and future plans should take into account whether Andy Jackson will be retained as a member of DPC staff on an ongoing basis. The earlier this can be confirmed, the more thorough the planning can be.

For project planning purposes, it would also be good to establish whether Andy Jackson will be able to attend iPRES 2025 in Wellington, possibly extending this trip to cover the DPC Australasian Members Unconference in both NZ and Australia (to maximise the benefits of travel).

## Year 2 Outputs

Due to the iterative nature of the project, deliverable plans are usually finalised on a quarter-by-quarter basis. Therefore, the outputs listed below may be adjusted over time. 

### PR-SIG

The PR-SIG will continue to run, shifting towards thematic agendas rather than focussed on the project. The next meeting (February) will be on Preservation Risk with NARA. The March meeting will focus on tool registries and plans for COPTR.

It is not clear whether PR-SIG will continue in its current form beyond the project. The broad ‘any information source’ scope is good for research, experimentation and innovation, but an active SIG needs to reflect a real community of practice. It may make more sense to spend future efforts supporting and engaging with the successful and well-established regular calls held by the PRONOM team.

### Format Index 2.0

As indicated above, the Format Index 2.0 work needs to be completed. (w/ Yale)

### DigiPres Workbench 2.0

We will continue to gather feedback on the DigiPres Workbench and make improvements as appropriate. This will include:

* One or more pages exploring the Format Index 2.0.  
* Gathering more collection profiles.  
* Exploring new ways to document workflow, informing the search for a new home for the Community-Owned Workflows and outputs from the DPC Workflow Webinar series.

### Guide To Imaging Obscure Floppy Disk Formats 2.0

This prototype for a community-owned ‘registry of practice’ will start with the current version of the “Guide To Imaging Obscure Floppy Disk Formats” (from iPRES 2024), as this is the document that we are supporting the next iteration of through the Future Nostalgia project. This allows us to experiment with the MystMD publication system and with supporting community-owned documentation rather than bearing sole responsibility for maintenance and updates.

### DPC Bit List Subsite

As part of the DPC Website project, we will experiment with reusing the S2P-SRS approach to tame the complex resource which is the [DPC’s Bit List](https://www.dpconline.org/digipres/champion-digital-preservation/bit-list). This is a large and multi-faceted data resource that is currently managed as a set of documents and associated web pages. Shifting to a static website generation system should be easier to maintain, and that is what this work will evaluate.

### Awesome Indexes & the digipres.org Homepage

This idea takes the indexing part of the Publications Index, and seeks to turn into a more generic system for building tools to search curated data sources. Bringing together aspects of many of the different year one outputs, this will be a tool that:

* Generates a static website and database from one or more curated data sources:  

  * iPRES publications data,  
  * Zotero collections,  
  * and ‘Awesome Lists’.  
* Provide a homepage with faceted search, like a simplified version of S2P-SRS.  
* Includes documentation on:  

  * How to add sources (suggesting Zenodo, SQLite, blogs, etc.)  
  * How to use it  
  * How to deploy GitHub Pages sites with it via a GitHub Action (lowering the barrier to reuse)

This will be used to refresh the digipres.org community portal homepage, and allow those three sources to be searched in one place. However, it will be designed to be a generic tool, suitable for use by any community that has an Awesome List and/or Zotero collection. The IIPC’s Awesome Web Archiving list and/or Zotero collection will be used as an example.

### Sustainability Planning

Crucially, as the project draws to a close, we will plan for the sustainability of the project outputs. This will include:

* Investing time regularly meeting with and deepening relationships with the PRONOM team, the Open Preservation Foundation, and the iPRES conference and futures committees and the Steering Group.  
* Reviewing the evidence we’ve gathered of what has worked well in the past, to see what lessons we can learn.  
* Documenting our understanding of current and near future constraints and available resources.  
* Investigate promising avenues for follow-on projects or collaborations.  
* Evaluating the prototypes and making clear decisions about what will be maintained, and at what level.  
* Mirror outputs to multiple platforms, and diversify to multiple forms, as deemed appropriate.  
* Clearly communicate this process and its outcomes, adding appropriate links or statements to every published prototype or output.

### Publications & Events

An important part of the project closure plan is to summarise and document what we’ve learned. As such, a number of publications and events are planned.

* Born Digital 2025 Paper and Plenary Panel  
* iPRES 2025 papers (all currently in very early draft form):  

  * Formats Hazards paper (on real-life format identification workflows)  
  * Registry Landscape paper (on format registry comparisons and the format ecosystem)  
  * Future Nostalgia paper (on the DigiPres Practices approach)  
  * Tools & Workflows (Registries Workshop TBC)  
* Demonstrations & Workshops:  

  * DPC Europe and/or Australiasian Members Forums/Unconferences (Paul Wheatley presented the Workbench at the Australiasian Unconference this year).  
  * Online demo for Yale Library Staff, the EaaSI Research Alliance, and DPC stakeholders (w/ Yale, details to be confirmed)  
* A learning resource for practitioners about the outputs and learnings of this project (with Yale)  
* A final project report, summarising outputs, sustainability plans and future vision..

## Year 2 & Beyond

There are also a range of planning activities around future work that may or may not make progress during the duration of the project.

### COPTR

We have committed to working with the OPF to help ascertain the future of the COPTR tools registry, which they are not able to support due to its complexity. Work on this will focus on raising the problem with all stakeholders and attempting to determine if there is a viable community of practice that can take on maintaining this resource. It is likely that some basic, minimal prototype will be generated during the project in order to help inform this process.

See <https://github.com/orgs/digipres/discussions/53> 

### PRONOM

The UK National Archives is already taking steps to refresh how PRONOM works, and has independently started prototyping an alternative implementation that is very close to the experiments of year one of this project. In year two, we should seek to support that work. This may include seeking funds to collaborate on that in the future.

### iPRES Proceedings

The iPRES Proceedings part of the Publications Index has been a success, and the next logical step is to work with the newly established Continuity Sub-Group to determine what to do. Given the timing, this will fall outside of this project period. 

However, iPRES 2024 has almost immediately succumbed to a classic digital preservation risk, because the platform used to publish it is shutting down ([announcement](https://www.knowledgefutures.org/updates/pubpub-platform/)). So some time should be spent learning what others are doing about this (e.g [this one](https://copim.pubpub.org/pub/copim-thoughts-pubpub-platform/release/2)), making backups of the content held there, and possibly building a second prototype version of the iPRES Proceedings site that includes that information (based on MystMD, unlike the current iPRES Proceedings site).  This would provide an interim mitigation and help stimulate the work of the Continuity Sub-Group. 

### Yale Partnership

During this final year, we will also take time to understand Yale’s priorities, capacity and ambitions, and look for ways to build on our collaboration in the future.

### Born Digital Memory Co-operative

A more ambitious follow-on project would be to seek large-scale funding to help establish a co-operative network dedicated to preserving at-risk born digital materials.

This would start with the emerging need (across multiple DPC members and beyond) to migrate data from aging hand-held media. The first goal would be to provide a federated service that is able to manage, triage and migrate large volumes of floppy disks and optical media. Across the community, we have many of the pieces needed to deliver this. In particular, the British Library team has experience running exactly this kind of service, but are held back by their current constraints and hungry to do more. Beyond the British Library, through e.g. the DPC’s DF-SIG, there is a network of growing expertise, interest and adoption of these approaches that we could help bring together. What is needed is some vision, some funding, some coordination, and some cloud infrastructure.

To help validate and utilise the results of these migrations, a second strand of this multi-workstream project would build on the relationship with Yale, looking to establish services to access the content via emulation. An EaaSI-UK, taking inspiration from AusEaaSI (<https://auseaasi.org/>), but set up to operate in the UK legal context.

## Conclusions

In terms of delivery, the project has achieved some success. It is often challenging to manage the balance between wide experimentation and focussed effort, but clear and regular communications with stakeholders and wise line management have kept things largely on course. The completed Format Index 2.0 did slip, but Yale’s proactive management meant this has not had significant negative consequences.

In terms of impact, the project has been very successful. The prototypes have been well received, the work is recognised and many of the outputs are already being used by others in the digital preservation community. It has generated a lot of good feedback and many possible opportunities for future work as part of a vibrant DPC research agenda. It has also strengthened the relationship between DPC and Yale in a way that should extend beyond this project and support future collaboration.

Finally, a comment from one of the PR-SIG members and a leader of the AusEaaSI network:

> "In my trainings of Australian archivists, when they ask the question, "how do I figure out what environment to use to render this file, anyway?" I always point them to Registries of Good Practice, and spruik your great project. We're all blundering around in the dark, and your work is a light in the tunnel."\
> \
> Cynde Moya (Swinburne University)

[^1]:  For more details, see: <https://anjackson.net/2024/12/06/building-low-maintenance-community-websites/> 

[^2]:  Since writing this report but prior to the public release, the remaining sources have been added and the index now includes software information from NARA and WikiData.
