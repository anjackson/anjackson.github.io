---
layout: default
type: page
promote: 0
status: 1
created_ts: 1086041757
changed_ts: 1170908533
node_id: 704
title: XML Utilities For RISC OS
created: '2004-05-31'
changed: '2007-02-08'
aliases:
- "/poot/riscos/xmlutils/"
permalink: "/poot/riscos/xmlutils/"
tags: []
attachments:
- - src: page/files/xmlutils-1.1.zip
    name: xmlutils-1.1.zip
---
<div class="node">
<img src="/themes/anjackson.net/sw/xmlutils.png" border="0" align="left" style="margin: 5px;" />
<p>
A small suite of XML and XSLT utilities ported to RISC OS.
</p>
</div>
<br/>
<p>
Justin Fletcher's port of xslproc from the Linux libxml project is a faster XSLT processor than this one.
</p>

Includes my ports of:
* The _sabcmd_ Sablotron XSLT processor. 
* The examples from the expat library:
    * _outline_ - Produces text outlines of XML documents.
    * _elements_ - Returns textual information on the elements in an XML document.
    * _xmlwf_ - Checks that an XML document is well-formed.

The download link is at the bottom of the page.

You can also download a RISC OS binary version of the Expat XML-parser library from [here](http://anjackson.net/poot/riscos/xmlutils/expat).

----

### Change Log
# 4th March 2002: Minor change to the examples
Having a chunk of my website inside XMLUtils was messy and causing me problems, so I've turned that part of the docs to link to my real website instead.

# 11th November 2001: Expat v. 1.95.2
After being innundated (sp?) with a email from someone interested in using the Expat library on RISC OS, I have added this to the list ov downloads. Its 26-bit only, compiled under Acorn C, and comes complete with full source, binaries, documents and so on and so forth.

# 5th October 2001: New version of Sablotron
A few days ago, Ginger Alliance released a new version of Sablotron, 0.70. There were a few additional compilation problems, mainly because UnixLib does not appear to support the snprintf function. A portable implementation of this subroutine has been added to my copy of the source, and thus version 1.1 of the RISC OS release is now available (and has been tested against my own website). Also, the previous version of the RISC OS port mistakenly included the wrong XML and DTD filetype icons - this has been fixed in this new release.

# 21st September 2001: Whoopsiedaisy...
I finally get around to releasing this software and I mess it up! The current release (v1.0) does not include the correct XML and DTD filetype icons. Also, I posted my c.s.a.announce using the email address XXXXXX - this is rubbish as my actual news address is XXXXXX. This will probably bet even more confusing given that I suggest using XXXXXX in the package itself. Oh well, I wonder what else I've forgotten.
