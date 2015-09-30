---
title: Lessons Learned
subtitle: on Digital Preservation
layout: default
tag: Digital Preservation
status: stub
publish: false
---


- Big metadata is a bad smell
- Identification changes over time
- Formats identification is a guessing game
    - text encoding heuristics [file's encoding.c](https://github.com/file/file/blob/master/src/encoding.c)

- [It starts with Save as...](../010-save-as)
- ['Load' is not the opposite of 'save'](../020-load-versus-save)
- [Don't say Digital Object](../030-dont-say-digital-object)
- [We Preserve Processes](../040-we-preserve-processes)
- 'Significant Properties' Won't Save Us
    - Gap between 'Significant Properties' and significant properties.
    - Things that work don't actually describe the performance or the process.
    - What are the significant characteristics of the Mona Lisa?
- [Formats Define Significant Properties](../060-formats-define-significant-properties)
    - http://www.dpconline.org/events/previous-events/288-significant-properties
    - http://digitalcontinuity.org/post/125850578993/software-dependent-content
    - Pretending that software is not central is only possible because of all the work that went into making interoperable formats.
- Identification Links Bitstreams to Software
    - Formats are behaviours, not properties.
- Validation is unnecessary
    - Not always possible, Halting Problem etc.
    - Note fast-fail versus linting modes.
- We need mecha suits
    - http://tabula.technology/
    - Film scratch removal and other digital re-mastering tools.
- Emulation is a type of migration
    - The Migration Line
- [Format obsolescence is not the biggest risk we face]()
    - The biggest preservation risk is economics.
    - Storage isn't solved.
- [We don't know what we've got]()
    - SCAPE meeting need for better characterisation
    - https://twitter.com/andrewjbtw/status/625824129585971200
- The biggest preservation risk: unsustainable investment
- Obsolescence is obsolete
    - Vendors drive it.
    - Open source avoids it, largely.
    - Compare with hardware obsolescence.
    - http://blog.dshr.org/2010/11/half-life-of-digital-formats.html
    - http://www.ariadne.ac.uk/issue46/rusbridge/
- We can learn from Adobe Lightroom
- The first AIP should be the SIP (plus just enough provenance to know how/why you have it)
- The AIP Is Never Finished
- OAIS Is Not Enough (models a preserving organisation not preservation itself)
    - OAIS Is Still Not Enough (pre-ingest/inner ring - models a repository or an organisation?)
- Provenance does not guarantee trust
- Digital Preservation Is Not A Science
    - Like the use of the work Tool, the use of the work Theory is confusing.
    - 'Theory', but this is more like literature.
    - Also crucial importance of value judgements
    - Scientific approach is appropriate in many cases
    - Emergent behaviour is complex
    - But it might look more like medical science
    - https://en.wikipedia.org/wiki/Film_preservation#Digital_restoration_steps
* Format identification needs parent-child, grammar
    - .lck (zero bytes) https://twitter.com/britpunk80/status/588278017580990465
* We don't need corpora to be annotated to learn something useful
    - https://archive.org/details/ftpsites
    - http://lcamtuf.blogspot.co.uk/2015/01/afl-fuzz-making-up-grammar-with.html
- We need a format grammar
    - Text encoding example, codecs etc
    - MIME is great, missing versions but can be extended.
- We need to understand the barriers to collaboration 
    - format registries 
    - corpora
- Corpora first
- No shame in bit-preservation only
- But keep some renderings, plus software gap and dependencies
- HTML/A
    - HTML/A-1 All transclusions embedded, no JavaScript at all, metadata.
    - HTML/A-2 No JavaScript?, metadata.
    - Which is more damaging? JavaScript or remote transclusions?
    - Platform dependencies == none (standard elements only)
- JPEG is okay
    - Would you rather have 600dpi JPEG or a 300dpi TIFF?

-DP Alternative Bibliography
http://digital-scholarship.org/dcbw/dcbw.htm
http://blogs.loc.gov/digitalpreservation/2014/01/a-national-agenda-bibliography-for-digital-asset-sustainability-and-preservation-cost-modeling/
Mechanisms
MP3
What happens when you press a key
What every programmer needs to know about unicode
DSHR Kryder
http://www.ariadne.ac.uk/issue46/rusbridge
Formats over time
http://www.naa.gov.au/Images/An-approach-Green-Paper_tcm16-47161.pdf
The Problems of Software Conservation
http://www.cs.man.ac.uk/CCS/res/res07.htm#f


