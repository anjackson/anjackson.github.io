---
title: Lessons Learned
subtitle: on Digital Preservation
layout: default
tag: Digital Preservation
status: stub
publish: false
---


# Experimenting with Frontera

The processes starts when we load seeds in using the Strategy Worker:

    python -m frontera.worker.strategy  --config huntsman.config.sw --add-seeds --seeds-url file:///Users/andy/absolute-path/seeds.txt

This scores the seed URLs and places them on the `frontier-score` queue. A DB worker processes these incoming, scored URLs:

    python -m frontera.worker.db  --config huntsman.config.dbw --partitions 0 1 --no-batches

This reads the `frontier-score` queue and pushes the content into the `queue` table of the database. A separate DB worker:

    python -m frontera.worker.db  --config huntsman.config.dbw --partitions 0 1 --no-incoming

...reads the `queue` table and breaks the prioritised queue down into batches to be sent to the crawlers, posting them onto the `frontier-todo` queue. For each partition we have a crawler instance:

     scrapy crawl crawl-test-site -L INFO -s SPIDER_PARTITION_ID=0

The spiders download the URLs and extract the links. The results are posted onto the `frontier-done` queue, as a stream of different events. There are `page-crawled` events, `links-extracted` events (where one message lists all the URLs from one response), and `offset` events that indicate where the spiders have got to in the queue partition they are processing.

(AFIACT) the DB workers and the Strategy Worker:

    python -m frontera.worker.strategy  --config huntsman.config.sw --partitions 0 1

...all read the `frontier-done` queue, and update the state they are responsible for accordingly. Tasks that get done are:

- The crawled items update(?) the `metadata` table to refect that they've been downloads. (Incoming DB worker?)
- The `offset` events are used to keep track of where the spiders have got to (Batching DB worker)
- The extracted links are scored and enqueued in the `frontier-score` queue, and the cycle continues.

Overall, Frontera has lots of good ideas to learn from, but is also somewhat confusing and the documentation appears to be out of date (probably just by one release).  Using different message types in a single single stream is rather clumsy -- Kafka's design (e.g keys and compaction) and my preference leans towards having separate queues for different message types.


# Office Hours: Supporting Open Source

Here at the UK Web Archive, we're very fortunate to be able to work in the open, with almost all code on [GitHub](https://github.com/ukwa/). Some of our work has been taken up and re-used by others, which is great. We’d like to encourage more collaboration, but we've had trouble dedicating time to open project management, and our overall management process and our future plans are unclear. For example, we've experimented with so many different technologies over the years that our [list of repositories](https://github.com/ukwa) give little insight into where we're going next. There are also problems with how issues and pull-requests have been managed, often languished waiting for us to get around to looking at them. This also applies to the [IIPC repositories](https://github.com/iipc) and other projects we are involved in, as well as the projects we lead.

I wanted to block out some time to deal with these things promptly, but also to find a way of making it a bit more, well, a bit more fun. A bit more social. Some forum where we can chat about our process and plans without the formality of having to write things up.

Taking inspiration from [Jason Scott live-streamed CD-ripping sessions](https://twitter.com/textfiles/status/964642009142235138), we came up with the idea of [Open Source Office Hours](https://twitter.com/anjacks0n/status/991769159246675971) -- some kind open open video conference or live stream, where we'll share our process, discuss issues relating to open source projects and have a forum where anyone can ask questions about what we’re up to. This should raise the profile of our open source work both inside and outside our organisation, and encourage greater adoption of, and collaboration around, open source tools.

All welcome, from lurkers to those brimming with burning questions. Just remember that being *kind* beats being right.

Anyone else who manages open source projects like ours is also welcome to join and take the lead for a while! I can only cover the projects we’re leading, but there’s many more.

The plan is to launch the first Office Hours session on the 22nd of May, and then hold regular weekly slots every Tuesday from then on. We may not manage to run it every single week, but if it’s regular and frequent that should mean we can cope more easily with missing the odd one or two.

On the 22nd, we will run two sessions - one in the morning (for the west-of-GMT time-zones) and one in the evening (for the eastern half). Following that, we intend to switch between the two slots, making each a.m. and p.m. slot a fortnightly occurance.

For more details, see [the IIPC Trello Board card](https://trello.com/c/imFyJ6wr/28-office-hours-supporting-open-source)


# Online Hours: An ongoing experiment in building tools together

At the UK Web Archive, we believe in [working in the open](https://gds.blog.gov.uk/2017/09/04/the-benefits-of-coding-in-the-open/), and that organisations like ours can achieve more by working together and pooling our knowledge though shared practices and open source tools. However, we've come to realise that simply working in the open is not enough -- it's relatively easy to share the technical details, but less clear how to build real collaborations (particularly when not everyone is able to release their work as open source).

To help us work together (and maintain some momentum in the long gaps between conferences or workshops) we were keen to try something new, and hit upon the idea of [Online Hours](http://blogs.bl.uk/webarchive/2018/05/online-hours.html). It's simply a regular web conference slot (organised and hosted by the IIPC, but open to all) which can act as a forum for anyone interested in collaborating on open source tools for web archiving.  We've been running for a while now, and have settled on a rough agenda:

- Full-text indexing:
    - Mostly focussing on our [Web Archive Discovery](https://github.com/ukwa/webarchive-discovery) toolkit so far.
- Heritrix3:
    - Like [Heritrix 3 release management](https://trello.com/c/Inb8MW5w/29-establish-offical-heritrix-releases), and the migration of Heritrix3 documentation to the GitHub wiki.
- Playback:
   - Covering e.g. [SolrWayback](https://github.com/netarchivesuite/solrwayback) as well as [OpenWayback](https://github.com/iipc/openwayback/) and [pywb](https://github.com/webrecorder/pywb).
- AOB/SOS:
    - For Any Other Business, and for anyone to ask for help if they need it.

This gives the meetings some structure, but is really just a starting point. If you look at the [notes from the meetings](https://docs.google.com/document/d/1WVw4rxPp1gBbYmWq2mZClasz-cEV70wf9BWp2r6QnYY/edit), you'll see we've talked about a wide range of technical topics, e.g.

* [OutbackCDX](https://github.com/nla/outbackcdx) features and documentation, including it's [API](https://nla.github.io/outbackcdx/api.html)
* Web archive analysis, e.g. via the [Archives Unleashed Toolkit](https://archivesunleashed.org/aut/).
* [Summary of technologies](https://docs.google.com/document/d/1YqYbHNyOlDcSPm29ENM6dd9ErsODNfSERsSq4RzLJyk/edit) so we can compare how we do things in our organisations, to find out which tools and approaches are shared and so might benefit from more collaboration.
* Coming up with ideas for possible new tools that meet a shared need in a modular, reusable way.

The meeting is weekly, but we've attempted to make the meetings inclusive by alternating the specific time between 10am and 4pm (GMT). This doesn't catch everyone who might like to attend, but at the moment I'm personally not able to run the call at a time that might tempt those of you on Pacific Standard Time. Of course, I'm more than happy to pass the baton if anyone else wants to run one or more calls at a more suitable time.

If you can't make the calls, please conider:

- Reviewing [the notes from the calls](https://docs.google.com/document/d/1WVw4rxPp1gBbYmWq2mZClasz-cEV70wf9BWp2r6QnYY/edit) and adding any questions or comments.
- Joining the [#oh-sos channel](https://iipc.slack.com/messages/CAHNKM0UU) on the [IIPC Slack](https://iipc.slack.com/) to join the discussion around the meetings.
- Reviewing [our Trello board](https://trello.com/b/BojRfzFt/supporting-tool-development), and commenting on/voting for items of interest.
- Contributing to the [Awesome Web Archiving List](https://github.com/iipc/awesome-web-archiving).

My thanks go to everyone who as come along to the calls so far, and to IIPC for supporting us while still keeping it open to non-members.

Maybe see you online?



---

Technology Strategy




https://www.iota.org/research/meet-the-tangle Blockchains etc

The CMX 600 of Digital Content Management

In 1971 the [CMX 600](https://en.wikipedia.org/wiki/CMX_600) began a revolution by being the very first [non-linear video editing system](https://en.wikipedia.org/wiki/Non-linear_editing_system). 

(see snapshots on desktop)

> There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.
> (@codinghorror)[https://twitter.com/codinghorror/status/506010907021828096?lang=en]

PDF encryption as a 'lessons learned' blog post

I wonder if some of those opposed to compression also avoid using databases as master stores for critical metadata?

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



