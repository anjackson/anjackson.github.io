---
title: "Formats Define Significant Properties"
category: Digital Preservation
tags: ["Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
series-position: 6
sidebar-include: _ll.md
---

Another way to describe digital objects is to avoid the more subjective or abstract tactics, and just attempt to point to where, physically, the 'object' resides.

I would argue that there three main locations where a coherent 'digital object' might be found:

1. The bitstream, encoded as signs on a medium.
2. The representation, expressed in the RAM, entangled with the software.
3. The presentation, usually expressed in the RAM, mapped to the input/output channels (i.e. entangled with the operating system).

The transient channels mapped out in levels 1-5 of the BitCurator model are responsible for mapping between locations 1 and 2, although that model does not explicitly recognized location 2, prefering to bundle 2 and 3 together as the 'In-application rendering'.

But the crucial point is that only location 2 is *required*.

For location 3, this is because it is possible for the software to simply talk to the input/output channels directly. Early computer systems had very little RAM, and so the software would pipe signals directly to and from the outside world.

For location 1, as we saw in the thought experiment above, this is because you can create and use a 'digital object' without ever creating anything like a bitstream. But if you don't press 'Save As...', you might lose your work.

But without location 2, you have nothing at all. The software is the process that brings these all together, knitting the traces in the RAM together, responding to the user and projecting the state back out to them again.

The image has been stripped of it's original compression, and the bytes that made up the image file are unrecognizable unless the software intervenes.
