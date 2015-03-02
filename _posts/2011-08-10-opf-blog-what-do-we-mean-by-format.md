---
layout: post
type: blog
title: 'OPF Blog: What do we mean by format?'
author: anj
category: Digital Preservation
tags:
- Format Registry
- Digital Preservation
---
<p>
A new OPF blog entry: <a href="http://openpreservation.org/knowledge/blogs/2011/08/10/what-do-we-mean-format/">What do we mean by format?</a> Reproduced below...
</p>
<!--break-->
<h1></h1>
<p>Bill’s <a class="external" href="http://www.openpreservation.org/blogs/2011-07-21-registry-guidelines-answers">earlier post</a> and <a class="external" href="http://unsustainableideas.wordpress.com/2011/08/05/so-what-was-that-twitter-rant-against-pronom-all-about/">this one from Chris Rusbridge</a> have spurred me to try to describe what I discovered about PRONOM format records during my <a class="external" href="http://www.openpreservation.org/blogs/2011-01-14-building-collaborative-format-registry-editor">editable registry experiment</a>. Building that site required a close inspection of the PRONOM Format Record data model, during which I realised that we commonly conflate two quite different ways of defining formats. I suspect we should start to tease them apart.</p>
<p><!--break--></p>
<p>The two definitions are:</p>
<ul>
<li>Format, as it is specified. e.g. files that conform to the PDF 1.4 specification.</li>
<li>Format, as it is used. e.g. PDF files created by Adobe Illustrator CS2.</li>
</ul>
<p>Flicking through the existing PRONOM records, it is clear the majority of the most complete records are defined by reference to specification. Many of the emptiest record correspond to known software, but with poor documentation. In between, the records are mostly thin wrappers around simple names, known internal signatures and file extensions. These different flavours of records have no consistently overlapping data fields that can be considered ‘primary keys’, i.e. that uniquely define a format. In other words, we don’t know what a format is.</p>
<p>If we are not sure which fields define a format, then I fear that the PRONOM team’s <a class="external" href="http://www.diigo.com/annotated/ea66cf2f076435d661fa5160a12593c1">primary focus on creating signatures</a> rather than documenting formats going to sting us in the long term. This is because the lack of clarity about what it is we are identifying will mean we may risk, for example, accidentally conflating different formats, or making artificial distinctions between differently named versions of the same format. We are minting identifiers for ambigious concepts, and so we must expect those identifiers to be retracted or replaced at some point in the future.&nbsp;What does it mean mint a permanent identifier for a record when every single aspect of that record is permitted to change?</p>
<p>One alternative to the PRONOM model is the <a class="external" href="http://www.dcc.ac.uk/events/talks-seminars/database-seminar-format-typing-preservation-data-sets-and-databases">GDFR approach</a>, which defines a format as “a serialized encoding of an abstract information model”, and provides a sophisticated four-level model of what that means:</p>
<ul>
<li>Abstract information model</li>
<ul>
<li>…mapped via Format encoding model to the…</li>
</ul>
<li>Coded information set (semantic)</li>
<ul>
<li>…mapped via the Format encoding form to the…</li>
</ul>
<li>Structural information set (syntactic)</li>
<ul>
<li>…mapped via the Format encoding scheme (parser/encoder) to the…</li>
</ul>
<li>Serialized byte stream</li>
</ul>
<p>The problem is that not all format specifications have these four levels. The levels were inspired by the <a class="external" href="http://www.unicode.org/unicode/reports/tr17/">Unicode character encoding model</a>, but (as that document itself indicates) other specifications uses different numbers of levels. RDF has three, HTML5 has three that define the markup semantics but uses more levels to link the mark-up to the behaviours and other features of the interpretation/renderer. Furthermore, formats defined only by software have only the lowest rungs of this scheme (data and parser/encoder). Such formats have no abstract information model, just an in-memory representation and an interpretation/performance. Even this mapping conflates the formal specification of the parser/encoder with it’s implementation – if we are being perfectly strict, the only thing the two perspectives have in common is the bytestream itself.</p>
<p>Conflating these different ways ways of defining format makes it difficult to describe the cases where conflict arises. We have probably all come across files that are perfectly well handled by the software, but break the specification, or indeed formats that have no formal specification. We need to be able to describe these difficult cases. Perhaps we should we be minting distinct identifiers for format specifications and format implementations instead? This could be done by deferring to the specification document instead of trying to model it’s contents, and would still allow us to distinguish between a bitstream that conforms to a given standard and a bitstream that is parseable using a particular implementation of that standard.</p>
<p>I think PRONOM are aware of the limitations of <a class="external" href="http://labs.nationalarchives.gov.uk/wordpress/wp-content/uploads/2011/06/draft-pronom-vocabulary-specification.pdf">their model</a>, but are <a class="external" href="http://www.diigo.com/annotated/45738c0e43add8eda9093cacb1e8a27a">going to go ahead and get the data out first anyway</a>. Simultanously, it looks like <a class="external" href="https://bitbucket.org/udfr/main/wiki/Home">UDFR</a>&nbsp;are proceeding with their own ontology, presumably based on the GDFR model. In general, I think just pushing the data out there first (a.k.a. <a class="external" href="http://www.bbc.co.uk/blogs/technology/2009/06/sir_tims_cry_raw_data_now.html">raw data now</a>) is a reasonable approach, because we can always review and consolidate later, and doing it this way around helps ensure that the consolidation is based on real data. But I can’t shake the feeling that we are taking the long way round.</p>