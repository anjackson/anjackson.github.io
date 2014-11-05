---
layout: default
type: book
promote: 0
status: 1
created_ts: 1249997239
changed_ts: 1281621945
node_id: 1858
title: Content Access Protocols
created: '2009-08-11'
changed: '2010-08-12'
aliases:
- "/digital_preservation_notebook/digital_object_storage/content_access_protocols/"
permalink: "/digital_preservation_notebook/digital_object_storage/content_access_protocols/"
tags: []
---
## Content Access Prototols

The pipes that make the sources work.

### [OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)###

See [this overview](http://xml.coverpages.org/oams.html).

 * [Attaching DC, RFC 1807 or MARC metadata](http://www.openarchives.org/OAI/1.0/openarchivesprotocol.htm#appendix%201)
 * [A Java Harvester](http://www.oclc.org/research/software/oai/harvester2.htm).
 * [A big list of repositories](http://gita.grainger.uiuc.edu/registry/).
 * <http://arxiv.org/help/oa/index>
 * [Summary of ResearchArchive at Victoria University of Wellington](http://gita.grainger.uiuc.edu/registry/details.asp?id=2208)
 * [XML Schemas and Support for Multiple Record Formats in OAI-PMH](http://www.oaforum.org/tutorial/english/page5.htm)

### AtomPub ###

 * [AtomServer](http://atomserver.codehaus.org/index.html), [AtomServer article](http://www.infoq.com/articles/atomserver), APL
 * [Apache Abdera](http://incubator.apache.org/abdera/) APL
 * [Atomojo server & client](http://code.google.com/p/atomojo/) NBSD
 * [atom-multipart](http://www.tbray.org/ongoing/When/200x/2008/07/07/Atom)
 * [Offical Atom link relationships](http://www.iana.org/assignments/link-relations.html).

### [Fedora](http://www.fedora.info/documentation/) ###

 * Supports a range of APIs, some Fedora-specific, and OAI-PMH too.
 * Stores and moves in [FOXML](http://www.fedora.info/download/2.2.1/userdocs/digitalobjects/introFOXML.html)

## Others ###

 * DB access, Amazon S3, DSpace, WebDav, CalDav, JCR, Atom, etc.
 * [Content Management Interoperability Services](http://en.wikipedia.org/wiki/Content_Management_Interoperability_Services)
 * [Google Data APIs (like Atom)](http://code.google.com/apis/gdata/)
 * [Windows Live Data API](https://dev.live.com/livedata/sdk/Default.aspx)

List, from
<http://discerning.com/topics/standards/resource_management.txt>

- list(resource_path, query_expr, accept_mime_type) these kinds of formats
- HXDLG http://hdlg.sourceforge.net/ xmlns=http://www.hdlg.info/XML/filesystem
- manifest.xml xmlns=http://openoffice.org/2001/manifest
- atom:feed "application/rss+xml revision=http://purl.org/rss/1.0/"
- RMP (builtin)
- Web Collections http://www.w3.org/TR/NOTE-XMLsubmit
- OAI-PMH xmlns="http://www.openarchives.org/OAI/2.0/static-repository"
- TODO: RDDL http://www.rddl.org/rddl2 (explain what namespaces mean) and http://www.w3.org/2001/tag/doc/nsDocuments/ 
- simply lists all metadata objects for all immediate children, in a XML response wrapper

<pre>
<code>
  &lt;collection xmlns="http://gupe.org/rmp" path="some/resource_path">
    &lt;collection name="fred" ...>
      &lt;atom:entry>...&lt;/atom:entry>
    &lt;/collection>
    &lt;data name="fred/xml">
    &lt;/data>
  &lt;/collection>
</code>
</pre>

Standards for Document Repositories
-----------------------------------
* [The JISC Digital Repository Programme as part of its work is exploring the interaction between repositories and other systems.](http://www.ukoln.ac.uk/repositories/digirep/index/Deposit_API)
* [DSpace API Outline](http://www.dlib.org/dlib/january03/smith/01smith.html)
* Multiple, so need a repository definition layer that defines:
  * Read method (HTTP hopefully).
  * Write method (HTTP too, on WebDAV etc, but we may need property definitions for different services).
  * Authentication system.  Write, and probably reads need authentication with the repo.
* WebDAV plus standard metadata partner file ('''name'''.metadata.xml) would be fine for uploads.
* IDEA: Local wrapper allowing WebDAV access to selected local files/directories would be a nice way of allowing Planets access to arbitrary file resources.  Even if just read-only access.
