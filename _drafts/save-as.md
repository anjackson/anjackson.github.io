---
title: Save as...
category: Digital Preservation
tags: ["Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: false
---

What do we mean by 'digital object'? 

Well, the *official* answer is clear enough:

> Digital Object: An object composed of a set of bit sequences. 
> <small>[Reference Model for an Open Archival Information System (OAIS) ][1]</small>

Other treatments have attempted to draw more attention to the layers of interpretation around bitstreams -- to the software. For example, [Kenneth Thibodeau's tripartite model][3] teases the digital object into physical, logical and conceptual layers.  The team behind [BitCurator][7] tease the notion of a digital object into even more layers:

> ![BitCurator Levels of Representation]({{site.url}}/blog/images/ll/bitcurator-levels-of-representation.jpg)  
> "The various levels of representation in what we consider to be digital objects @BitCurator @openpreserve"
> <small>[@digitalfay][6]</small>

Thinking along similar lines to Thibodeau, Matthew Kirschenbaum argues as follows:

> "Here I want to go a step further and suggest that the preservation of digital objects is logically inseparable from the act of their creation — the lag between creation and preservation collapses completely, since a digital object may only ever be said to be preserved if it is accessible, and each individual access creates the object anew. One can, in a very literal sense, never access the "same" electronic file twice, since each and every access constitutes a distinct instance of the file that will be addressed and stored in a unique location in computer memory."
> <small>[Matthew Kirschenbaum](https://twitter.com/mkirschenbaum), [The .txtual Condition][4]</small>

All the approaches outlined here share a common assumption -- that the bitstream is fundamental. But by the end of the first sentence from Kirshenbaum, the digital object is *also* the thing created anew inside the memory of the machine. At once, both the bitstream *and* something approaching Thibodeau's 'logical object'.

Kirshenbaum's perpertual re-creation is much closer to the National Archives of Australia's [performance model][8], which avoids the term 'digital object' altogether. Rather, it describes the digital record as a something performed by a process, built from a source.

### What are we preserving?

But it is common to talk about 'preserving digital objects', such as [Preserving digital Objects with Restricted Resources][9], [Preserving Complex Digital Objects][10] or [Preserving the Authenticity of Contingent Digital Objects][11] (although oddly, the [DPC perservation handbook does not define it][12]).  In this context, the term 'digital object' is *mostly* used to refer to bitstream (or bitstreams), at least among those of us working in the shadow of OAIS. But it's also use to refer to other layers of representation, right up to 'the thing I interact with' (e.g. see [A Theory Of Digital Objects][5]). 

But surely the latter is closer to what we really mean to preserve? Who cares what the encoding is, as long as the text remains unchanged? If we place the emphasis of preservation upon the bitstream, don't we risk losing sight of the fact that it is the *experience* of access that we are trying to preserve?

This confusion peaks when it comes to defining the 'significant properties' of these objects, and in the worst cases, lead to property models built on a mish-mash of bitstream properties and properties observed during use.


### Where is the digital object?

Consider a simple thought experiment. A colleague wants to share a photograph with you, and wanders over to your lustrous cubicle armed with a USB flash drive. You plug the drive in, and open the JPEG directly from the USB in order to take a look at it. It is *hilarious*.

The shared laugher subsides, and you both decide you should probably get back to work. But before you can stop them, your colleague grabs hold of the USB drive and yanks it out of the machine.

What happens next?

Well, first, there is the stern admonishment...

![Disk Not Ejected Properly]({{site.url}}/blog/images/ll/not-ejected-properly.png)

...but we weren't writing to any important files, so it should be okay. But behind this dialog box, the image is still there.

Worst still, due to a freak accident mere seconds later, your colleague's USB drive was knocked from their hand, fell through a rift in space-time and was propelled at near light speed into the heart of a distant sun.

The bitstream is gone.

But the image is still on the screen.

You can view it. You can use it. So it can still be saved.

Is the bitstream still there? No. The thing you are interacting with is not the bitstream, it is the projection of the runtime representation of the image manipulation capabilities of the software you are using. What was once a neat, contiguous bitstream has now been spread around and interleaved with the software that loaded it. But almost none of the bytes themselves will be the same. The image has been stripped of it's original compression, and the bytes that make up the image are unrecognizable unless the software intervenes.

Right now, all it takes is a power cut to your desktop PC, and the photograph will blink out of existence. And entropy will win.

But it can still be saved -- just press 'Save', and a new bitstream will be written. It might not be *quite* the same as the original, but it might be good enough.

![Ce ne sont pas un objet numérique.]({{site.url}}/blog/images/ll/notado.png)


### Bitstream Considered Optional

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

Behind the 'performance', the bytes in flight.

Any model that seeks to describe digital resources as they are, rather than as we might wish them to be, must understand the distinction. Otherwise, we are left with a framework that cannot describe the most basic acts of digital preservation: 'Save as..' and 'Load...'. Only the NAA performance model comes close.


[1]: http://public.ccsds.org/publications/archive/650x0m2.pdf
[2]: http://www.ils.unc.edu/callee/p507-lee.pdf
[3]: http://www.clir.org/pubs/reports/pub107/thibodeau.html
[4]: http://www.digitalhumanities.org/dhq/vol/7/1/000151/000151.html
[5]: http://firstmonday.org/ojs/index.php/fm/article/view/3033/2564
[6]: https://twitter.com/digitalfay/status/604202789846302720
[7]: http://www.bitcurator.net
[8]: http://www.naa.gov.au/Images/An-approach-Green-Paper_tcm16-47161.pdf
[9]: http://digitalpowrr.niu.edu/
[10]: http://www.facetpublishing.co.uk/title.php?id=049580#.VYnU4-ds6N4
[11]: http://www.dlib.org/dlib/july00/eppard/07eppard.html
[12]: http://www.dpconline.org/advice/preservationhandbook/introduction/definitions-and-concepts
