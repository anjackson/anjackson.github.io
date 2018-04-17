---
title: Lessons Learned
subtitle: on Digital Preservation
layout: default
tag: Digital Preservation
status: stub
publish: false
---

Story of a bad deed


The CMX 600 of Digital Content Management

In 1971 the [CMX 600](https://en.wikipedia.org/wiki/CMX_600) began a revolution by being the very first [non-linear video editing system](https://en.wikipedia.org/wiki/Non-linear_editing_system). 

(see snapshots on desktop)



Lessons Learned

- Unsafe Device Removal: an experiment in digital destruction
- Access starts with 'Loading...': What a performance!
    - jetpac is loading - the closest I can get to a digital object
    - Loading is always there, so what's the relationship?

- This is not a Digital Object: More than just a copy
- Don't say Digital Object: We preserve processes
- It starts with Save As...

- Google Doc does not fit in OAIS

- DigiPres and the big niches - 3D, maths, ?

- Serialisation, marshalling, pickling, parsing, 

- Data formats and schema and composition, separate files FTW.

What a good file format looks like (from a preservation perspective):
- Signature/magic - predicable location, unique, human-readable ideally
- No soft edges - PDF vaguaries over header location and tail.
- Versioning and profiles - clarity of methodology, part of header when necessary, etc.
- Principle of least power - sub-Turing complete please
- Standard base format - writing parsers is hard, yeah

Web Packging Exists!

Language as critical as it/dp boundsary is tense
Format obsolescence is not as urgent and terrible as advertised
Bit preservation is not solved
We don't need registries for truth
We don't need registries for what to do, we need each other. It takes a village...

Prescriptive v Descriptive Linguistics
If we only accept valid PDFs, we are saying. We know best. We understand PDF and we know what's worth preserving. In this analogy: We know what's best. We understand the Queen's English and any documents will need to be translated before we archive them HERE.
Speculation on easy/'preservable' formats and correlated use with different social/economic subgroups.

Every format has two faces/parsing is hard

When you press save, what happens? Lots of decision. It's not just the document. What about the undo buffer? What about the window position? What about the language? These can be installation/user/file level, it depends.

Format standardisation is precisely a designated community coming together to determine which properties of a Digital (Performance) Object they want to preserve over time.

Compression is Fraught: I wonder if some of those opposed to compression also avoid using databases as master stores for critical metadata?

Sheridan Code, versus the Models. Man made, use the language of what it is. No (further) abstraction necessary and in fact it gets in the way. NLA model only good because it gets closer.

Herbert CNI talk. Scholarly communication fragments. Atmosphere at iDCC? How physics worked at different places. How biology worked. Thoughts on adoption. Thoughts on costs.

OAIS is for talking about digital preservation, not for doing it.‬ 
I think OAIS is better suited to talking about doing digital preservation than helping get preservation done. It deliberately floats above ‬

Flexibility versus the principle of least power

SIPs as DIPs etc 
https://twitter.com/euanc/status/922520776384962560
But it's not a DIP if it's not leaving your org

‪
MPLP and layers?

- Beyond Cyberpunk Hypercard zine
- Media Maker? https://twitter.com/beet_keeper/status/928127010559242240
- See screenshots of it working...
- Appears to be 512 0x200 byte application-specific header.


[^1]: Sometimes, this gap has been reduced using a technique called [memory mapping](https://en.wikipedia.org/wiki/Memory-mapped_file). This allows some or all of a given file to be treated as if it were part of the computers memory, which is more efficient than having to copy chunks of data into memory before being able to interact with them. LIKE SCREEN FORMAT SAMENESS This only works with [random-access media]() - again, we rarely iteract with literal 'streams' of bits.

But constant work is required to generate the illusion of a stable image. Fifty times a second, the ULA reads the screen memory and sends the result out to the television screen, and this process is interlaced with the data loading as the whole thing hums along at 3.5MHz (about a thousand times slower than a modern machine).

OODT is closest thing to ref impl of OAIS
- https://pdfs.semanticscholar.org/3948/3ebe4da227c0e380046d7a0e0274e6e99a28.pdf
- http://lipade.math-info.univ-paris5.fr/lops/wp-content/uploads/2014/04/PDS-A-Model-Driven-Planetary-Science-Data-Architecture-for-Long-Term-Preservation-.pdf
- http://www.iso16363.org/ptab/
- https://cwe.ccsds.org/sea/docs/Work%20Completed%20(Closed%20WGs)/Information%20Architecture%20Working%20Group/Draft%20Documents/IA%20Reference%20Model/ccsds_rasim_20060308.pdf 
- https://www.bl.uk/aboutus/stratpolprog/collectioncare/publications/reports/wigan_digital_preservation.pdf

A light-weight pre-premis/mets would be very useful.
Extend bagit with orthogonal data in linewise files

Open source and digital preservation

Poor cohesion of reading lists 

More automation possibilities e.g. UI script Acrobat Reader to test, I.e. Simulate user interactions in 

Validation, nope
Validation, fast and thorough

How to help practitioners help?!
http://anjackson.net/2016/06/08/frontiers-in-format-identification/#comment-2723081343

Re-deriving significant properties
Note that OAIS
Ingest as odd notion
Normalisation as prejudice



- Spectrum load music and in-band signalling. Out of band signalling and tape covers.
    - http://faqwiki.zxnet.co.uk/wiki/Spectrum_tape_interface
- ZX Spectrum walkthrough:
    - http://www.old-computers.com/museum/photos.asp?t=1&c=223&st=1
    - https://upload.wikimedia.org/wikipedia/commons/8/85/ZXspectrum_mb.jpg

- Format is interpretation - multi-format files - format grammar 'is' is not enough
- No digital object necessary: The Australians had the right idea all along
- format identification links bitstreams to the software and people that understand them
- format is communication Communicating with the Future
- format language can be built: http://anjackson.net/keeping-codes/practice/talking-about-formats.html
    - Hence, PREMIS uses its own definition: a specific, preestablished
    - structure for the organization of a digital file or bitstream. 
    - https://www.loc.gov/standards/premis/v3/premis-3-0-final.pdf
- PRONOM can be embedded in mime tree

- Preservation without access is like a backup you've never tested
    - Preservation Copies are like backups you never test
    - Access is what we are preserving
    - Mocking up/thinking through how access might work is necessary. Say staff-access for spot-checking.
- Closed tools are dead provenance
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

MP3 

- https://www.theregister.co.uk/2001/06/26/mp3_owners_get_stroppy/
- https://madfileformatscience.garymcgath.com/2017/04/15/mp3-freedom-matters/
- https://twitter.com/GaryM03062/status/853218170072698881
- https://en.wikipedia.org/wiki/MP3#Licensing.2C_ownership_and_legislation
- http://lame.cvs.sourceforge.net/viewvc/lame/lame/doc/html/history.html
- https://madfileformatscience.garymcgath.com/2017/04/20/mp3-april-23/

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



