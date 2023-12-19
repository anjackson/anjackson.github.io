---
title: Blog Ideas
author: anj
layout: post
draft: true
---

WARC extract one file:
- If you are on a Mac, The Unarchiver supports WARCs: https://unarchiver.c3.cx/formats
- Alternatively, the jwattools extract command lets you extract the payload for a particular URI: https://sbforge.org/display/JWAT/JWAT-Tools Run 'jwattools help extract' to see how it works.
- Or, use Python Wayback (https://github.com/ikreymer/pywb) to set up a local service that plays the WARC content back.
- [r/Archiveteam - How to extract warc files?](https://www.reddit.com/r/Archiveteam/comments/5mdv4u/how_to_extract_warc_files/)

Fake News
- http://www.dailymail.co.uk/news/article-4120970/Opera-star-Andrea-Bocelli-backs-singing-Trump-s-inauguration-receiving-death-threats.html (unidentified source)
- https://www.nytimes.com/2016/12/20/arts/andrea-bocelli-wont-be-singing-at-the-trump-inauguration.html?_r=1 (much older)
- https://www.google.co.uk/search?hl=en&q=bocelli+death+threat (generated from the Mail's report)

ATI System Research Agenda 2.0

Agenda: http://www.cl.cam.ac.uk/~jac22/ati-systems-2.0.txt

- Tension between custom HW/FPGA arrays and Intel Phi Throw More CPU At IT.
- iPython notebooks or growing their own.
- Some minority interest in sharing results, reproducibility and a hint of long-term preservation concerns.

Boris Grut, Edinburgh Informatics
- Much data, e.g. sensor data volumes (amenable to specialised compression?)
- Moore's Law is dead (either physics or economics will kill it)
- End of Dennard scaling (i.e. power consumption no longer going down)
- Argues for specialised vertical stacks.
- Every system different, poor portability across stacks.
- But each stack can be heavily optimised to a domain.
- DSL -> Transistors
- e.g. Oracle Project RAPID. DB appliance, DB ops in hardware, querying 10TB/s.
- Project 'Catapult'? FPGA board, hard to program.
- Google Tensor Processing Unit - slightly mysterious dedicated HW accellerator.
- (GPU as an old example)

Andrew Mallinson, Intel
- Xeon Phi.
- (see EPCC blog)
- Performance future is in parallelism.
- Serial portion of code needs to be minimised.
- Audience - Big Data is usually as parallel as the data is big. (not quite convinced - tail wagging dog?)
- Pitching a propriatary 'child of Infiniband' which they bought.
- Big fat chips, no more density (or rather, slowing rate of adoption of lower nm process)
- But lots more on a 'package', more specialised RAM on/near the chip, dedicated fast near I/O to network stuff.

Maxeler Dataflow Computing
- Memory Wall? Power Wall.
- Idea remixed from Shannon, fix the power envelope, how much performance can we get out?
- A vertical, from maths down to transistors.
- Not focused on the acceleration/optimisation, but on the question, e.g. is there a cow in this picture.
- See OpenSPL
- Some properitary (possibly sub-Turing complete) language that compiles to hardware, presumably FPGA.
- General smell of snake oil/BS. Especially the 8 hours to 2 mins financial risk analysis example. (likely Excel to code).

Christophe Dubeata, Edinburgh Informatics
- Programming appproaches for heterogenous architectures
- Accellerators come and go
- Want a small language that compiles down to parallel/accellerator HW.
- Their approach auto-optimises by random-walking the possible implementation space.
- Heirarchy of tactics to make exploring the space more efficient.
- Symbolic manipulation used to refactor code without changing semantics
- DSL for dataflow/functional data processing.
- Cache geometries for particular problems
- (Q Can FPGAs model cache?)
- Q on 'what happens when place-and-route fails' i.e. you run out of FPGA space. 
- (Akin to the old days where you run out of RAM. I content this will not go mainstream until there is ample FPGA so that 'running out' is rare, OR we get the hang of semi-auto-selecting the subset of a code that should be shifted onto the FPGA.)
- Q raising general problem of data affinity/topology optimisation.
- 'Abstraction is the opposite of performace'
- Discussion on removing laters of abstraction.
- e.g. compiler picking the right abstration layer
- e.g. multi-node synthesis of code, i.e. large FGPA array programming as an problem to be attacked.
- (HTTP-over-UDP and that binary-transfer-over-UCP protocol are examples of removing a layer of abstraction in order to increase performance)

Anton Lokhmotov of dividiti.com
- e.g. Convolutional Neural Nets in cars.
- Need to deploy model and weights on a range of HW.
- Jupyter notebook sighted.
- Comparing AlexNet, GoogleNet, SqueezeNet implementations.
- reuse of intermediates needed
- ctuning/ck on GitHub.
- experimental results and analyssis, reearch more efficient.
- cknowledge.org
- (Sharing via Jupyter is a good DigiPres plan).
- Q notes workshop on Debugging and Debunking at a CS conference. Open working noted as a less confrontational tactic, which may work better in a small community that debunking.
- see also 'The Incredibles' - a debunking paper on network benchmarking.
- ATI students starting on reproduction.
- See also, artefact evaluation committee.

Intel (second presenter)
- Si/Ge transition, c. 2019-2022.
- 3D scaling as new direction.
- Looking at Top 500 customers.

Pure Storage
- 4U 16TB
- Backup does not scale - need replication.
- Isilon/traditional systems hard to scale, lots of cable mess. Cables/TB as complexity metric.
- They offer extremely dense storage.
- Essentially a very large SSD with an Object Store API.
- 15 blades in a chassis, 4 power and 8 QSFP network cables.
- Flash sounds awful, need to re-write to keep data.
- e.g. 1KB of EEC per 1/2KB of data!
- 16TB * 3 per blade, this only gets you to 840TB so I'm missing something.
- Moves SSD controler complexity up to the server layer, with a big dumb flash array underneath.
- Apparently 100 USD/GB.
- Erasure coding, can lose two blades.
- Custom code that does the replication etc. (of course)
- Optimistic two-phase-commit-but-only-checked-if-something-goes-awry.

James Cheney
- PL for DS
- fairly close to maths
- SQL API to modern DSLs. querycert compiling to Scala/Spark
- Concern about long-term preservation
- Reproducibility problem, 36% AC/m 2012 artefact evaluation committee result.
- http://osf.io/bcef5/
- (note sharing/network effects are key to preservation)
- 'Big' provenance - Analysing stream of system audit events, looking for signals of e.g. hacks.
- Puppet, heavily inherited configurations, difficult to analyse.
- Notes difficulty in hiring PL+Systems+DB skills needed (looks like a Unicorn problem to me).
- Others not 'detectic brokenness' as high-priority skill.
- Note of history of error correction in the ALU/processing layer.
- Suggest expert evaluation of DSL.

Philip Walker
- On "Quoted Domain Specific Languages"
- SQL example ported into F#

Day 2
=====

NOTE Heath data has restricted terminals, ask John? Maybe not as this implies I'm listening.
ATI student model means research agenda is a bit confused at present.
Docker, but with specialised code unikernels i.e. discarding the OS.
Very high performance, but very small scale.
Parallel to specialised HW versus general.
Worse is better?
Director: Trying to pin down a tighter research program.

Desire for advances in CS that make this more secure.

Peter Pietzuch on SCONE
- More secure cloud applications, esp microservices in containers.
- Can SGX be used to secure these containers.
- Just accepted as OSDI'16.
- Enclaves, regions of memory dedicated to a particular process.
- Userspace process, not priviledged, so kernel etc is not affected.
- Even with physical access to the machine, Enclave RAM is encrypted and hard to access.
- Cryptographically signed images are used to bootstrap into the enclave.
- No system calls?! (Kernel is untrusted)
- Performance overhead.
- Entering/leaving the enclave is costly.
- Haven approach, applied to Linux via Linux Kernel Library which runs the kernel in userspace. Very heavy (make a big 'TCB')
- Alternative approach with a specialised libc, much more lightweight, but every system call crosses the enclave boundary.
- Large (>92MB) memory, encryption overhead explodes.
- 32MB read performance drop something to do with the non-Enclave baseline?
- SCONE inserts a layer underneath a vanilla libc, managing the raw POSIX API calls.
- Trusted Computing Base
- Proof-carrying code 
- SCONE:
    - User-level M:N threading done inside the enclave, reduce enclave boundary crossings.
    - Batches system calls for asynchronous execution (some user-code waits of course, Thread WAIT)
    - Also adds TLS wrapping when the process opens a socket, so can link enclaves to clients securely.
    - Also compatible with Docker containers, sign the docker image, then can use untrusted Docker tools and hosting.
- Can get decent performance, but very dependent on system call frequency and memory movements.
- Yesterdays point about 'synthetic benchmarks' versus 'application benchmarks'.
- ARM has TrustZone which is very similar, I imagine iOS uses this.

Manuel Costa - MS Research Cambridge
- VC3 protects MapReduce computations from untristed cloud
- Integrity and confidentiallty.
- Intel SGX again.
- Not sure how to to minimise the TCB.
- How to guarentee integrity of whole computation. Integrity.
- Map and Reduce functions are what goes in the enclave, encrypted and bound to small amount of public code.
- Public code binds secure code to the untrusted Hadoop framework.
- Compilers that instrument memory access so we can tell if secrets leak, backed up by static verifier that analyses the binary.
- Fine-grained memory access control inside the enclave.


----

ATI Meeting For Adam
--------------------

- DLS about 600TB but 3PB waiting...
- Lots of JP2, ALTO, all sorts of stuff. 40+40+70+70
- Comparison of holdings via catalogue against what's digitised. Some old analogue catalogue records too, that need work.
- Cataloguing standards have shifted and changed over time.
- These days also catalogue remote accessible material.
- Purchase of additional copies of NPLD material also common.
- Getting to stuff:
    - Copyright, can't copy some stuff. 10% as a policy/rule of thumb.
    - Data protection, esp. personal archives.
    - Embargoed content, not much.
    - Legal deposit material. Print constraints have been mapped to digital.
    - Orphan works, creates uncertainty about our liabilities. 
    - Unpublished manuscripts are in (c) even if very old, until 2039.
    - Substitability, N-Grams, etc.
- ATI counts as on-site!
- Does an authors code running on-site count? Does VPNing in count? Adam proposes we build-up case studies rather than wait for the lawyers.
- Use cases
    - CNNs on images
    - Similar techniques to analyse music, needs GPUs for accelleration. So dropped a server on site for it! Probably still on site! Needed to shift content over on disks. 
        - Can we shift over pre-processed down-sampled images?
    - 


- WARCs only c. 310TB...
- James Ravenscroft, Maria Liakata's PhD student, on Impact traces in web data c. 2013.


----

----

> "Each network node stores only content it is interested in, ..."
> https://ipfs.io/

Why not emulation?
It's been proven for decades? So what's the objection?
Bearman? Nope.

https://en.wikipedia.org/wiki/Magic_Eye

ArchiMate, response to training course.


About legacy of Shannon and Turing and the active living theory of digital preservation that underpins everything we do.

The bits 
in the chips
beneath your fingertips
don't want to persist
they want to flip
to melt
to dissapate
succome to the heat
the entropy
and be lost as noise and head

But the chips hold the line

Each fine strand of silicon 
etch by light
each cell and grain and pit
designed by a human mind
to hold back the heat and the darkness
and keep the signal clear and bright

every microsecond of the bit streams life


----

The Obsolete
- WAP and other early moble era shims

Original manuscript:
http://www.bl.uk/collection-items/alices-adventures-under-ground-the-original-manuscript-version-of-alices-adventures-in-wonderland

* eChums
    * Before MySpace and Facebook, about the same time as Friendster...

> **Keep your contacts up to date automatically**
>
> As the people you know change jobs, cities, and names, it can be tough to stay up to date with their latest information. The new Contacts ensures that the info you see is still accurate and ready to use by blending your contact’s Google profile information with the stuff you already have.
>
> <small>[The new Google Contacts: Bringing everyone together](http://gmailblog.blogspot.nl/2015/03/the-new-google-contacts-bringing.html)</small>

Archivematica
- http://www.archiveswales.org.uk/projects/digital-preservation/
- http://digital-archiving.blogspot.co.uk/2015/01/the-first-meeting-of-archivematica-uk.html
- https://ww.archivematica.org/en/docs/archivematica-1.3/admin-manual/installation/installation/
- http://www.moma.org/explore/inside_out/2015/04/14/momas-digital-art-vault 

Quelle Surprise, Quelled Surprise
- You may not be surprised simply because you've already considered it. Would you have also said the same if the exact opposite had been found. There must be a name for this kind of bias. 
http://en.wikipedia.org/wiki/Hindsight_bias
- You may not be surprised because this does simply confirm a widely-held belief. Congratuations, you have elevated a hunch to something approximating objective truth!
- Picking out individual stories are representative required evidence that they are representative. (this buts both ways, distant-to-close too)
http://en.wikipedia.org/wiki/Confirmation_bias
- Discovery of otherwise undiscovered sources is hard to measure.
- [Reading creationism in the web archive](http://peterwebster.me/2014/11/18/reading-creationism-in-the-web-archive/)

"Plain Text"
- http://blog.codinghorror.com/there-aint-no-such-thing-as-plain-text/
- http://www.joelonsoftware.com/articles/Unicode.html
- http://www.slate.com/articles/arts/books/2012/08/history_of_the_mp3_by_jonathan_sterne_reviewed_.single.html
- n.b. also case sensitivity, line endings, floating point, etc etc.

Death of Disk
- Major architectural change and it's consequences.
- http://www.zdnet.com/article/why-ssds-are-obsolete/

Digital Preservation & Sustainable Software
[The State of JavaScript in 2015](http://www.breck-mckye.com/blog/2014/12/the-state-of-javascript-in-2015/)

Formats Over Time
- Hypothesis, that for given usage, formats start as wild and settle down as network effects kick in.
- e.g. image/* format popularity versus duration?


http://mortoray.com/2015/02/25/invented-here-syndrome/

Digital Dark Age
- ["Information technologies are essentially obsolete every 18 months."](http://sunsettower.net/docs/63kuny1.pdf)
- http://www.foiman.com/archives/1438
- Still Looming http://web.archive.org/web/20030110082553/http://www.guardian.co.uk/online/story/0,3605,871091,00.html versus http://www.theguardian.com/technology/2015/feb/13/google-boss-warns-forgotten-century-email-photos-vint-cerf
- [Managing digital National Archive "a challenge"](http://www.bbc.co.uk/programmes/p02k057y)


> "In some instances, it feels like I’m a digital archaeologist, delving into the depths of software applications decades old and long-forgotten on operating systems that have shared the same fate and resurrecting them so that they can become tools for the Digital Preservation team to wield against format, software and hardware obsolescence that threatens every digital object."
> <small>https://www.nla.gov.au/blogs/behind-the-scenes/2015/04/30/imagine-life-as-a-librarian-0</small>

- CLEAR and archiveready http://link.springer.com/article/10.1007/s00799-015-0144-4/fulltext.html

DESTROY
https://bitbucket.org/andrealanci/topicmapping
http://journals.aps.org/prx/pdf/10.1103/PhysRevX.5.011007
Sampling skew is nuts. 

Long-winded documents and requirements, decision papers, etc.
- Just Do It.

The Pitch:
- Uberconverter
    - Know-your-files
- Flatsearch

Single Point Of Failure
- 

Single Point Of Repair
- DOI controversy, see also http://blog.martinfenner.org/2015/06/03/persistent-idenfiers-urls/
- The web as a million points of failure.
- Interdependence.
- Bittorrent as a distributed but coordinated system
- http://blog.archive.org/2015/02/11/locking-the-web-open-a-call-for-a-distributed-web/
- https://github.com/jbenet/ipfs
- http://joearms.github.io/2015/03/12/The_web_of_names.html
- As if no-one bearing responsiblilty for individual bitstreams is better than one.
- Need monitoring component. How many valid copies of each are there?
- But its just a protocol (see biotorrents etc. Academic Torrents).
- Needs the social pact.
- Multiple Points Of Repair

BitTorrent Is Not An Archive
- http://academictorrents.com/browse.php?cat=6&page=4
- http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0010071
- https://www.kaggle.com/wiki/ANoteOnTorrents

Digital Dark Age
- History, forgotten mistakes.
- Vendor dependency.

On Modelling:
- [The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)](http://www.joelonsoftware.com/articles/Unicode.html)
- [Floating-point](http://floating-point-gui.de/basic/)
- [An Interview with the Old Man of Floating-Point](http://www.cs.berkeley.edu/~wkahan/ieee754status/754story.html)

Funders:
- http://www.arcadiafund.org.uk/
- Knight, Mellon, Shuttleworth, Sloan and Helmsley Foundations

Forgiveness & Permission
- A number of creators of MS-DOS programs have contacted me about having running versions of their works at @internetarchive. Contact me.
-- https://twitter.com/textfiles/status/564819608386150400
- Just to be clear - the creators of MS-DOS programs have contacted me to add their programs to the ranks. Contact me if you want to add yours
-- https://twitter.com/textfiles/status/564820681226199040

https://twitter.com/textfiles/status/558736094066642944
That's kind of the point. Outsourcing the tech further disempowers the 'web archiving gang'. If organisations…
only invest in hand-wringers, that's all they'll be able to do. The situation is bad enough already, as you say.
No-one is blaming IA for this & of course channeling funds to support IA is far better than doing nothing at all.

UKWA we do capture contemporary renderings during the crawl, and other contextual data. The hope is that…
…this will help those who *do* take on sw/access preservation to be confident they are doing it right…
… But I'm not sure it'll be us that's 
My point being it depends on the shape ones collection. A web archive is mostly full of content intended to…be shared across platforms.

http://blogs.loc.gov/digitalpreservation/2014/10/gossiping-about-digital-preservation/
All types of Forward error correction
http://en.wikipedia.org/wiki/Inherent_vice_%28library_and_archival_science%29
Exherent Vice too.

Although there would be some minor duplication between the two, the volume of data involved would be tiny. Anyway, having two independent but overlapping collections helps build trust in both, because you can compare them to see if they are consistent (and therefore more likely to be complete, accurate, etc.).

On open metadata as (c) hack
- https://sandbox.htrc.illinois.edu/HTRC-UI-Portal2/Features
- http://tedunderwood.com/2014/06/03/a-window-on-the-twentieth-century-may-be-about-to-open/

How much have we saved?
- [DSHR: Talk at Fall CNI](http://blog.dshr.org/2014/12/talk-at-fall-cni.html)
- [DSHR: Talk "Costs: Why Do We Care?"](http://blog.dshr.org/2014/11/talk-costs-why-do-we-care.html)
- ["NARA estimates that only about 2 percent of all Federal records are permanent."](http://www.afm.ars.usda.gov/ppweb/pdf/251-08M.pdf)
- ["Only a small proportion of the records---often no mare than two to five percent---has sufficient value for administrative, legal, or research purposes to warrant permanent retention as archives."](http://www.unesco.org/webworld/ramp/html/r8906e/r8906e04.htm)
- ["Since the files were very voluminous, a sampling was made of them that saved only 3 percent of the total."](http://www.archives.gov/research/alic/reference/archives-resources/appraisal-informational-values.html)

Using ARKs
- http://www.bnf.fr/en/faq_ark_en/a.faq_ark_en.html
- https://wiki.ucop.edu/display/Curation/ARK
- http://ecommons.library.cornell.edu/handle/1813/3688
- http://www.qdl.qa/en/archive/81055/vdc_100023510136.0x000048

## Ideas, briefly:
- JP2 et al http://xooyoozoo.github.io/yolo-octo-bugfixes/#mascot&jp2=m&bpg=m
    - https://github.com/ross-spencer/rs-misc-scripts/blob/master/jp2-10-1-compression-artifacts.pdf
    - http://kakadusoftware.com/wp-content/uploads/2014/06/Usage_Examples.txt
    - http://wellcomelibrary.org/content/documents/22082/JPEG2000-preservation-format
    - http://www.digitizationguidelines.gov/still-image/documents/Martin.pdf
    - http://www.digitizationguidelines.gov/still-image/documents/JP2LossyCompression.pdf
- Functional Programming Brain Hurt
    - Feels like when I'm solving hand puzzles, or some cryptic crossword clues. I can feel my way to the right answer, but I frankly don't quite understand it until afterwards.
- Maps as metaphors for languages and models.
- flindex: Flat Index
- I have mixed feelings about "The perfect is the enemy of the good." It's true, but I've seen it used to justify very sloppy work.…when the real problem has been that the 'perfected' proposal is simply disconnected from reality, or an excuse not to talk to users, or 
- CDX Dataset
- [Domain crawl graphs](https://intranet.bl.uk:8443/confluence/pages/viewpage.action?pageId=139630062)
- CC License adoption
- Don't &lt;blink> -- obsolete elements from the web archives
    - Plus &lt;marquee>  ... ?
- Fashions in Styling, CSS versus &lt;font>
- clear.gif -- tracking images through the web.
- CAPTCHA, see {% include crossref.md page="ukwa-mining-meaning" %}.
- Nanite (what to say?)
- Web archiving RI use case e.g. <http://britishlibrary.typepad.co.uk/webarchive/2011/12/advent-calendar-december-3rd.html>
* Using UKWA to preserve your project.
- Islands in the UK Domain
- <http://www.openplanetsfoundation.org/blogs/2014-03-24-arc-warc-migration-how-deal-de-duplicated-records>
- [This Is For Everyone - (c) All Rights Reserved](http://gty.im/149366163)
 - On The Naming Of Things
 - On Preserving Conversations
   - Blog on HTTP v. HTML
   - Connect to DSHR blog. <http://blog.dshr.org/2010/06/jcdl-2010-keynote.html>
- Software Engineering versus Computer Sciece. CS4SC? Comp-to-Data arc. <http://www.delicious.com/beardedstoat/cs4sc>
- Format Herd Immunity
    - Format obsolescence as disease 
    - We are the immune system 
- Data And Metadata, interpretation difference.
- eBook wars, like early years of DRM music etc.
- Files versus filesystems. Latter obsolete first, former at risk due to persistent ram plus walled gardens.
-  Is ISO Enough? Open standards etc.
- [Endangered Languages -- Scottish Gaelic](http://www.endangeredlanguages.com/lang/3049)
* Characterising Codes
- Beyond OAIS
    - why OAIS is a straight-jacket and limits the care digital media needs.
- Compression Is Not A Significant Property
- Preservation Planning - Baysian versus frequentist... First principles/ab initio or Empirical modelling.
- Simplification pressure? e.g. Markdown or even Wikipedia? REST over SOAP. HTML over PDF? Others?
* BLOG: Building Trust (Format Registries)
* BLOG: Format data model - what is permanent? Why opaque IDs.
* BLOG: The long-tail of formats
* BLOG: Identifying Microsoft formats. Why DROID and File fail. JHOVE2 it. Use those os and office installers or images to make test corpus?
* TODO BLOG: Preserving processes, software and test suites.
- Wikipedia's echo chamber - Deletionists - Self reinforcing etc.
- QA costs and variation - "QA for emulation can be at an environment rather than object level so potentially cheaper" <https://twitter.com/euanc/status/375272042511491072>
- My fathers story - Learning to geek
- Career planning computer - And jobs that didn't exist.


## Fragments

### 2012, the year DP jumped the shark

- Rothenberg arguing dp should outline its society by design - long now
- Rosenthal's straw man
- HTML as rothenbergs types
- Still apparently arguing Migration v Emulation, more straw men
- Unproven strategies taught?
- Hopelessly overambitious levels of preservation, most folks need reasons to get off the bottom rung.

### The Fourth Age Of Cataloguing ###

0. Books on shelves. locations in head.
1. Card catalogue of physical items
2. Online card catalogue OPAC of physical items
3. Online catalogue of digitised physical items
4. Online catalogue of born digital material.

We have been here before... [Google Directory No Longer](http://www.seroundtable.com/google-directory-gone-13731.html)

### On Format Languages ###
http://www.nationalarchives.gov.uk/PRONOM/Format/proFormatSearch.aspx?status=detailReport&id=1160&strPageToDisplay=summary
I understand the desire to focus PRONOM development on creating signatures, and I realise that keeping the references up to date would be a lot of work. However, I worry that signatures alone are not enough, because without the references, I don't think it's clear what is actually being identified. Without reference to any version of the ISO spec., or indeed MS Office, what does it mean to identify a file as 'Open Office XML' fmt/412? That kind of fine-grained identification is critically important if you wish to really understand the preservation issues around OOXML, because on the strict form has transparent semantics and can be considered preservation friendly. The transitional form is full of opaque semantics like 'render this paragraph like Word95 does'.

Except, actually, right now, it doesn't matter, because as far as I know there is no generally available software that implements OOXML Strict (I think only the latest Office betas do so). So right now, the ambiguity in the PRONOM definition is harmless, and getting into the details is pretty much a waste of time. If you just need to ID files right now, it works just fine.

http://www.zdnet.com/office-to-finally-fully-support-odf-open-xml-and-pdf-formats-7000002696/

Except, except, when the new versions arrive, and the various formats start to get supported to varying degrees, and the standard keep moving and 

Also, it's worth noting that the Open Digital Formats Registry idea is quite close to the Registry Ecosystem idea outline here (http://www.openplanetsfoundation.org/blogs/2011-02-15-file-format-registry-report-released). I used to be quite skeptical about this idea, but I've come around to it (http://www.openplanetsfoundation.org/blogs/2012-07-06-biodiversity-and-registry-ecosystem).


### Standards For Fragments

Issue about CITE paper, W3C Fragment effort, and issue about whether the fragment can reference the entity rather than the resource.

<http://www.ariadne.ac.uk/issue67/blackwell-hackneyBlackwell/> <http://www.w3.org/2008/WebVideo/Fragments/>

In particular, if we wish the fragment identifiers to be insulated from some details., i.e. fractions used be CITE rather than pixels, we need to get that in the standard? It does % for spatial dimensions, so is that okay? is that precise enough? What if we want to point at something really small? How many SigFig.


### Cargo Cult Standards

p.s. and if I anyone starts writing yet another standalone identifier, provenance or metadata standard from scratch, I will come around to your house, take away your computer, and replace it with a Chrome tablet so you always have to GOOGLE IT FIRST. :-)

Every time you start writing a new standalone metadata standard from scratch, God kills a kitten. Please make it stop.


### Letters to my son

- Plans for digital preservation
- Scaleability from the low side, to contrast with BL scale later.
- A business opportunity?
- Costs manageable via scale?


### Coding at Scale

Scaling Issues: File numbers

* DROID file handles
* Results, all in memory, JHOVE v Tika.
* Also, Tika at scale issue, where keeping the same class was building up RAM? Need to reinstanciate to make things stop going OOM and/or running OOFileHandles. (???)

Scaling issues: File size, 
Aggressive random-access-file opening:
https://github.com/openplanets/droid/commit/2c9f9b1a86e3fd219ecc8b8ed4cde0b81cfe2057

If you want to really optimise this thing, it should be possible to do all this (including checksum calculation) while only streaming over the whole input stream once. I've been trying to do that in our web archive indexer (which also incorporates the Nanite tool) with some success, but gracefully handling large files is not proving easy when some tools (e.g. DROID, PDFBox Preflight) tend to assume that you have a random access file and can flip to the end of the bitstream and back easily.

### Iteration

* http://rkroundtable.org/2014/06/30/contexts-connections-access-the-glorious-possibilities-of-getting-it-all-wrong/
* http://blog.codinghorror.com/quantity-always-trumps-quality/


Knowing first is impossible
"Need to be very *very* clear about what is to be preserved before developing tools"
<https://twitter.com/mopennock/status/375271606085378048>


 -    - [http://gamearchitect.net/Articles/SoftwareIsHard.html][3] 
   - [http://www.codinghorror.com/blog/2006/04/best-practices-and-puffer-fish.html][4] 
   - [http://www.webarchive.org.uk/wayback/archive/20121225045735/http://www.jisc.ac.uk/events/2010/07/jif10/virtualgoodybag/understandingsustainability.aspx][5] 


### Programmer versus car mechanic

http://www.codinghorror.com/blog/2012/05/please-dont-learn-to-code.html
http://www.codinghorror.com/blog/2012/05/so-you-want-to-be-a-programmer.html
programming versus writing, not all of us need to be novelists.



  [1]: https://sourceforge.net/apps/trac/planets-suite/
  [2]: http://e-records.chrisprom.com/?p=1183
  [3]: http://gamearchitect.net/Articles/SoftwareIsHard.html
  [4]: http://www.codinghorror.com/blog/2006/04/best-practices-and-puffer-fish.html
  [5]: http://www.jisc.ac.uk/events/2010/07/jif10/virtualgoodybag/understandingsustainability.aspx
  [6]: http://www.codinghorror.com/blog/2006/04/best-practices-and-puffer-fish.html
  [7]: http://www.naa.gov.au/records-management/secure-and-store/e-preservation/at-naa/software.aspx
  [8]: http://inkdroid.org/journal/2010/08/24/notes-on-retooling-libraries/
  [9]: http://www.naa.gov.au/records-management/secure-and-store/e-preservation/at-naa/software.aspx
  [10]: http://www.youtube.com/my_videos
  [11]: http://www.youtube.com/watch?v=3L44R9FJ-9U
  [12]: http://blog.dshr.org/2010/06/jcdl-2010-keynote.html
  [13]: http://blogs.ecs.soton.ac.uk/keepit/2010/08/23/keepit-course-3-describing-significant-characteristics-and-recording-provenance/
  [14]: http://digital-scholarship.org/dcpb/dcpb.htm
  [15]: http://lists.ala.org/wws/arc/digipres/2010-08/msg00007.html
  [16]: http://www.digitalpreservation.gov/ndsa/
  [17]: http://www.digitalpreservation.gov/ndsa/
  [18]: http://www.software.ac.uk/SustainingSoftware.html
  [19]: http://www.culturegrid.org.uk/
  [20]: https://sourceforge.net/mail/admin/list_subscribers.php?group_id=265364&amp;group_list_id=68391&amp;func=display



