---
title: Lessons Learned
subtitle: on Digital Preservation
layout: default
tag: Digital Preservation
status: stub
publish: false
---


Learned
- object is performance 
- format is interpretation 
- format identification links bitstreams to the software and people that understand them
- format is communication
- format grammar is not is
- format language can be built: http://anjackson.net/keeping-codes/practice/talking-about-formats.html
    - Hence, PREMIS uses its own definition: a specific, preestablished
    - structure for the organization of a digital file or bitstream. 
    - https://www.loc.gov/standards/premis/v3/premis-3-0-final.pdf
- PRONOM can be embedded in mime tree
- ways to help tools
- non-consumptive datasets for signatures 
- registries don't overlap much
- The bottleneck is (almost) always the disk
- Sometimes MD5 is faster than SHA256
- We don't know what we are:
    - Springing from e.g. newcomer not being aware of NLA Performance model.
    - Poor coherence of reading/background/established work
    - Disagreement between iPres attendees
    - Do ug/pg courses act to bring coherence? Can textbooks?
- NLA were right (pretty much)
- The DP/IT interface is fraught but critical.
    - Some digipres requirements can seem insane, but others are insane.



It's also been interesting to compare the web archiving community with the broader digital preservation community. There's many familiar faces due to the strong overlap between the fields, but there's also a stronger sense of a unified vision, a preference for practical results, and a more constructive colllaboration between researchers and content-holding organisations. On the flip-side, there is something of a silo effect, where web archive material is often poorly integrating into the bigger picture, both in the abstract (e.g. the bigger picture of digital preservation) and the concrete (e.g. we're only just learning how to integrate web archives with our other holdings).


- Architects and Engineers
    - Environment, neutral/abstract versus specific
    - Lingia Franca - No-ones language versus language of work. Esperanto or English.
    - Structured data verses entensible+free form.
    - Waterfall versus Agile/Ingest and Iterate.
    - 


 - PDF encryption is weird

 - how fast can you hash?

```
dd if=/dev/zero bs=1M count=1000 | openssl dgst -sha512
 
# dd if=/dev/zero bs=1M count=1000 | openssl dgst -sha512
1000+0 records in
1000+0 records out
1048576000 bytes (1.0 GB) copied, 3.94019 s, 266 MB/s
(stdin)= a7d483bb9af2ca4b064420d1911d9116b6b609ca312fd7ed919fc1b8be7d1eb57c46f2a6f13380b6dc38f024d17442b4c7b8ecb8c121dc88227d588fc2e04297
# hdparm -tT /dev/sda1
/dev/sda1:
 Timing cached reads:   17696 MB in  2.00 seconds = 8861.16 MB/sec
 Timing buffered disk reads: 332 MB in  3.01 seconds = 110.42 MB/sec
[root@crawler06 python-shepherd]# dd if=/dev/zero bs=1M count=1000 > /dev/null
1000+0 records in
1000+0 records out
1048576000 bytes (1.0 GB) copied, 0.0997883 s, 10.5 GB/s
```

- Intros to using [PDFDebugger](https://pdfbox.apache.org/2.0/commandline.html#pdfdebugger) and iText RUPS
- Backwards and forwards compatibility and validation.
    - http://anjackson.net/keeping-codes/experiments/does-jhove-validate-pdfa-files.html
    - http://www.pdfa.org/wp-content/uploads/2014/12/PDF_A_JHOVE_Friese_28112014_en1.pdf http://www.pdfa.org/2014/12/ensuring-long-term-access-pdf-validation-with-jhove/
- Big metadata is a bad smell
- Identification changes over time, PUIDs are not forever
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
- Pre-Ingest Does Not Exist
    - Issue with OAIS: SIP AIP DIP are names based on context, and OAIS is a bit fuzzing about the context
    - Flexible, the Archive might be part of an organisation, or the whole organisation.
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


Impossible Standards
--------------------

c.f. [DP benchmarking paper](http://ifs.tuwien.ac.at/~duretec/publications/benchmarks_for_digital_preservation.pdf)

Is it possible? i.e.
- can it cope with lack of concensus over meaning?
- can it cope with context-dependent nature of identification?
- can it cope with non-trivial cases? HTML?
- can it cope with Turing-complete cases?

Even if is possible, it is feasible?
- We've been saying we need format corpora and registries etc for a decade.
- We still have PRONOM, but that's it (as shared infrastructure)
- Work may be done in private, but global FEs committed to working on this are very few.
- Even thinks like CRISP completely failed. What can we learn from that?
- And the amount of work is absolutely massive.
- Who created those benchmarks in other fields? Who paid them to do it? Why?
- Are they different because the creators also control the meaning whereas we are documenting the meanings of others?



