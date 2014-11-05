---
layout: default
type: book
promote: 0
status: 1
created_ts: 1249998476
changed_ts: 1249998489
node_id: 1859
title: Property Extraction Methods
created: '2009-08-11'
changed: '2009-08-11'
redirect_from:
- "/node/1859/"
permalink: "/digital_preservation_notebook/digital_object_properties/property_extraction_methods/"
tags: []
---
### Magic numbers ###
Magic numbers is the name for the standard UNIX mechanism used to identify file types. This approach is not limited to UNIX, but is usually considered a UNIX related practice that has since spread to many other platforms. The mechanism is based on a database that maps byte strings and positions to file types. Common examples are GIF, JPEG and TIFF, that all contain reliable markers, at least for identifying the general file format. Minor version identification (i.e., format characterization rather than format identification) often requires a more sophisticated approach, e.g. parsing of header structures. On a UNIX system, the magic number mechanism can be accessed using the file command, e.g.:

<code>
kb005264:~/Code/Graphics andersjohansen$ file logo.png</code>

<code>logo.png: PNG image data, 64 x 64, 8-bit/color RGBA, non-interlaced
</code>

Advantages are fast performance and reliable identification for many file formats. Limitations include that often minor version variations can’t be determined (i.e., less than reliable characterization), that the method does not allow for formats that lack reliable identification strings (such as text files), and that it uncritically accepts the evidence (e.g., if a text file contains the magic number for a GIF file, the file command will identify it as a GIF file, regardless of other evidence).
