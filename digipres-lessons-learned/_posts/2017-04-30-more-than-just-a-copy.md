---
title: "More than just a copy"
subtitle: Bytes in flight
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

Following my [previous post](/2017/04/19/access-starts-with-loading/), a [tweet from Raffaele Messuti](https://twitter.com/atomotic/status/854982711076950017) lead me to this quote:

> "Computers, by their nature, copy. Typing this line, the computer has copied the text multiple times in a variety of memory registers. I touch a button to type a letter, this releases a voltage that is then translated into digital value, which is then copied into a memory buffer and sent to another part of the computer, copied again into RAM and sent to the graphics card where it is copied again, and so on. The entire operation of a computer is built around copying data: copying is one of the most essential characteristics of computer science. One of the ontological facts of digital storage is that there is no difference between a computer program, a video, mp3-song, or an e-book. They are all composed of voltage represented by ones and zeros. Therefore they are all subject to the same electronic fact: they exist to be copied and can only ever exist as copies."
> <small>From [Radical Tactics of the Offline Library](http://networkcultures.org/wp-content/uploads/2014/06/NN07_complete.pdf) via [an annotation](https://via.hypothes.is/http://networkcultures.org/wp-content/uploads/2014/06/NN07_complete.pdf#annotations:N5kgkCWnEeeWyJNvazzkJg) by [@atomotic](https://twitter.com/atomotic/status/854982711076950017).</small>

Copying is indeed fundamental to how computers function, and we need to understand that to understand some of the the limits and affordances of digital resources.

However, this isn't quite what I was trying to say. The thing you interact with is *more* that just a copy.

Admittedly, sometimes the distance between the two is small. In the case of the ZX Spectrum loading screen they are almost identical: the data loaded from the tape just has to be unpacked[^1] and streamed into the right place in memory in order to produce the image. 

![Schematic of how a ZX Spectrum loading scheme works.]({{site.url}}/digipres-lessons-learned/images/access-layers-spectrum.png)

But in general, the bitstream format (and it's data model) are quite different to the run-time representation. Broadly speaking it's more common to have some internal data model that is manipulated when you interact with the software, which is then used to compose a 'view' of that model that can be delivered to the user (via the host operating system).

![Schematic of how a modern software application usually works.]({{site.url}}/digipres-lessons-learned/images/access-layers-modern.png)

This kind of software is often much richer than most of the formats it supports. For example, when I restored the image by saving it from the GIMP image editor, I didn't *have* to save it as a JPEG. I could re-save it in a wide range of formats, translating the in-memory representation of the image into any of the bitstream formats GIMP supports. Like most editor software, it has a 'native' format that closely matches the capabilities of the software, and then a wider range of 'export' formats that are useful but may lose some functionality.

All of this only makes sense if the thing we're interacting with is much more than just a copy of the original file. 

Which makes it all the more surprising that we don't have a good name for the actual thing we actually interact with.

----

[^1]: The ZX Spectrum [tape data structure](http://www.shadowmagic.org.uk/cssfaq/reference/48kreference.htm#TapeDataStructure) describes some interesting details of the packaging format, including the checksum used to ensure the data has loaded correctly.
