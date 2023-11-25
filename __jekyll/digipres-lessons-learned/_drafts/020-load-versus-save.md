---
title: "Every format is defined at least twice"
category:
tags: ["Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
series-position: 20
sidebar-include: _ll.md
---

It's common to assume that the format of digital resources to be a well-defined, singular thing. As in *"this file is in PDF format"*, but taken generally to be a fundemental truth. Formats are something a bitstream has, and one of the most common tasks is to infer the format from a bitstream.

But this model is wrong. When we assume that formats only have a single definition, we ignore the fact that this is impossible. There is a fundemental asymmetry here, and it boils down to the relationship between 'Load' and 'Save'.

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


'Load' and 'Save' are always different code. At the lowest of levels, when simply storing of loading bytes from memory, the relationship is a fairly simple inversion (where we swap all LOAD operations for STORE operations). But as soon as a format gains any kind of complexity, this relatioship becomes much more complex. For example, it is not possible to take the machine code for any given loader and use it to generate software capable of performing the opposite 'save as' operation. 

Therefore, any physical-logical 'mapping' style model is unable to conceive or describe failure of encoder/decoder pairs. Which leaves us unable to describe them.

PDF is an illustrative case.

Formats always have two sides. But standard, interoperable formats are those that have established strong social 'norms' between 'Load' and 'Save as...'.



