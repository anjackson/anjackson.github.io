---
title: More Magic From Siegfried
subtitle: ...and Roy!
date: 2023-03-21T22:49:49.990Z
tags:
  - Digital Preservation
layout: post
author: anj
shown: true
---
Following on from [the previous post](/2023/03/21/speeding-up-format-identification/), I was experimenting with [Siegfried](https://www.itforarchivists.com/siegfried) and found it to be even faster than I was expecting!

<!--break-->

I'd constructed a large ZIP file for testing:

```bash
dd if=/dev/urandom of=sample.rnd bs=1G count=1
zip sample.zip sample.rnd
```
With DROID/Nanite, identification was taking a couple of seconds, partially due to the issue with wildcard signatures noted in the previous post. 

But with Siegfried, it only took a tiny fraction of a second, even just after clearing the RAM file cache.

```bash
$ time sf random.zip 
---
siegfried   : 1.9.6
scandate    : 2023-03-21T11:39:06Z
signature   : default.sig
created     : 2022-11-06T17:44:52+01:00
identifiers : 
  - name    : 'pronom'
    details : 'DROID_SignatureFile_V109.xml; container-signature-20221102.xml'
---
filename : 'nanite-core/src/test/resources/random.zip'
filesize : 1073915886
modified : 2023-03-20T11:49:51Z
errors   : 
matches  :
  - ns      : 'pronom'
    id      : 'x-fmt/263'
    format  : 'ZIP Format'
    version : 
    mime    : 'application/zip'
    basis   : 'extension match zip; container match with trigger and default extension'
    warning : 

real	0m0.081s
user	0m0.030s
sys	0m0.025s
```

For comparison, this is what it looks like with a JAR:

```
11:42 $ sf nanite-core/target/nanite-core-1.5.0-111.jar
---
siegfried   : 1.9.6
scandate    : 2023-03-21T11:42:46Z
signature   : default.sig
created     : 2022-11-06T17:44:52+01:00
identifiers : 
  - name    : 'pronom'
    details : 'DROID_SignatureFile_V109.xml; container-signature-20221102.xml'
---
filename : 'nanite-core/target/nanite-core-1.5.0-111.jar'
filesize : 240488
modified : 2023-03-19T22:40:41Z
errors   : 
matches  :
  - ns      : 'pronom'
    id      : 'x-fmt/412'
    format  : 'Java Archive Format'
    version : 
    mime    : 'application/java-archive'
    basis   : 'extension match jar; container name META-INF/MANIFEST.MF with byte match at 0, 17'
    warning : 
```

Note that both `basis` values refer to the container signatures, and neither directly refer to any binary signature match.

I asked Richard Lehane about it and [he confirmed](https://twitter.com/richardlehane/status/1638179119870484480) what I suspected based on this: that Siegfried also drops any further binary signature scanning once a container match is found.

In DROID/Nanite, the scan works something (roughly) like:

- Scan all binary signatures, and record all matches.
- Drop any lower-priority matches.
- If one of the matches is a container format, run container signature matching.
    - If there's one or more container matches, return them.
- Otherwise, if there's one or more binary signature matches, return them.
- Otherwise, if there's one or more extension matches, return them.
- Otherwise, no match.

Whereas the magic of Siegfried goes something (roughly) like:

- Scan all binary signatures:
    - If the current signature that is part of a 'tree' of prioritized binary signature, limit the scan to that tree.
        - If there is a match consistent with the file extension, return it.
        - If there is a match but it isn't consistent with the file extension, run those signatures too and if they match up, return that instead.
    - If the current signature is a container format, immediately begin container signature scanning.
        - If there's a one or more container matches, return them and stop scanning.
- Otherwise, if there's one or more extension matches, use those.
- Otherwise, no match.

The fact that container matching begins immediately during the binary signature scan, together with the decision to stop scanning if a container match is found, means that Siegfried will usually run _much_ faster than DROID for container formats.

Fortunately, the TNA team had a great idea: they are looking at whether it's possible to [drop the wildcard binary signatures for formats that can be identified using container signatures](https://github.com/digital-preservation/droid/issues/906#issuecomment-1478342546).  This won't match all of Siegfried's magic, but will bring a big boost to DROID's performance on container formats.

I await my visit from the Magic Circle's Secret Enforcement Agency.
