---
layout: default
type: book
promote: 0
status: 1
created_ts: 1249998515
changed_ts: 1249999076
node_id: 1860
title: Property Extraction Tools
created: '2009-08-11'
changed: '2009-08-11'
aliases:
- "/digital_preservation_notebook/digital_object_properties/property_extraction_tools/"
permalink: "/digital_preservation_notebook/digital_object_properties/property_extraction_tools/"
tags: []
---
### [DROID](http://droid.sourceforge.net) ###
DROID identifies files using the magic numbers approach.

 * Refers to [PRONOM](http://www.nationalarchives.gov.uk/pronom/), e.g. ''info:pronom/fmt/100'' is HTML 4.01.
 * Required manual proxy configuration via text-file-hacking. 
 * Use ProxySelector and other magic?
 * [DROID 5](http://droid5.yourwiki.net/wiki/DROID_5.0)

### [JHOVE](http://hul.harvard.edu/jhove/) ###
JHOVE is an extensible, Java-based tool developed for the JSTOR/Harvard Object Validation Environment (<http://www.jstor.org/>) aimed at validating digital objects. It builds on a magic number approach and adds much richer parsing functionality in order to extract more information and more thoroughly assess validity.

 * Apparently tends to fail awkwardly when the network latency is high.
 * Also uses it's own system of type identifiers.
 * Adds attributes/metadata?
 * Validates?

### Inferno ###
Inferno is a Java-based tool for rule inference and application of such sets of rules. It is currently heavily biased towards charcterization. It was developed at the Danish Royal Library as a proof-of-concept for using rule inference as an unifying approach to characterization, both directly to perform characterization tasks, and indirectly to integrate results from various existing characterization tools in an optimal way.

Inferno has been successfully applied to file and text string characterization by text file encoding (Latin 1, UTF-8, UTF-16LE and UTF-16BE), file type (text file encoding, JPEG and PNG) and language used in text file (Danish, Swedish, English and Norwegian).

 * Implementation not available yet.
 * Is this done using one of the available [rule engines](http://java-source.net/open-source/rule-engines)?

## Other Tools ###

 * See [PRONOM links](http://www.nationalarchives.gov.uk/aboutapps/PRONOM/tools.htm)
 * [NLNZ Metadata Extraction Tool](http://www.natlib.govt.nz/about-us/current-initiatives/past-initiatives/metadata-extraction-tool), [http://meta-extractor.sourceforge.net/](http://meta-extractor.sourceforge.net/).
 * [FITS](http://code.google.com/p/fits/) and links therein...
 * Use pdffonts and other code from pdf-utils ([xpdf](http://www.foolabs.com/xpdf/) or [Poppler](http://poppler.freedesktop.org/)) to extract information, like font dependencies.
