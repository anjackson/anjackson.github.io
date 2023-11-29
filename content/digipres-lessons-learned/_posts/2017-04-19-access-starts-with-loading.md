---
title: "Access starts with 'Loading...'"
subtitle: What a performance!
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

So what was going on in [our little experiment in data destruction?](/2017/04/14/unsafe-removal-results/) Well, to understand what happens when we open up digital files, I want to take you back to my childhood, back when 'Loading...' really *meant* something...
<!--break-->

I'd like you to watch the following video. Please enjoy the sweet 'music' of the bytes of the bitstream as they stream off the tape and into the memory of the machine. 

And no skipping to the end! Sit through the whole *damn* thing, just like I had to, all those years ago!

<div style="text-align: center;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/V0EfycbDhiw?rel=0" frameborder="0" allowfullscreen></iframe>
</div>

I particularly like the bit from [about 0:24s in](https://youtu.be/V0EfycbDhiw?t=24s), as the loading screen loads...

![JETPAC: loading the loading screen](/digipres-lessons-learned/images/jetpac-screen-loading-montage.png)

First, we can see a monochrome image being loaded, section-by-section, with individual pixels flowing in row-after-row. The ones and zeros you can see are the same one as the ones you can hear, but they are being copied from the tape, unpacked by the [CPU](https://en.wikipedia.org/wiki/Central_processing_unit), and being stored in a special part of the [machine's](https://en.wikipedia.org/wiki/ZX_Spectrum) memory, called the [screen memory](http://whatnotandgobbleaduke.blogspot.co.uk/2011/07/zx-spectrum-screen-memory-layout.html).

This screen memory is special because another bit of hardware (called the [ULA](http://www.worldofspectrum.org/faq/reference/48kreference.htm#Contention)) can see what's there, and uses it to compose the signal that gets sent to the television screen. As well as forming the binary pixels, it also uses the last chunk of memory to define what colours should be used, and combines these two sets of information to make the final image. You can see this as the final part of the screen-loading process happens, and the monochrome image suddenly fills with colour. You can even *hear* the difference between the pixel data and the colour information.

After that, the tape moves on and we have to wait even longer while the actual game loads.[^1]

The point I want to emphasize is that this is just a slow-motion version of what still happens today. The notion of 'screen memory' has become more complex and layered, and it all happens *much* faster, but you're still interacting with the computer's memory, not the persistent bitstream.

Because working with memory is faster and simpler than working directly with storage devices, the kind of software that creates and edits files is much easier to write if you can load the whole file into memory to work on it there. The GIMP works like this, and that's why I was able to re-save my test image out of it.

However, Apple Preview works differently. Based on my results, it seems likely that Preview retains a reference to the original file, which it uses to generate an intermediate in-memory image for display purposes (e.g. a scale-down version). The cached intermediate image can still be shown, even if future operations may fail because the software can no longer find the original file.

These results only make sense because the thing you are interacting with via the computer screen is *not* the original bitstream, but a version of that data that has been loaded into the computer's memory. The relationship between these two representations depends on the software involved, can be quite complicated, and the two forms can be quite different.[^2] My suspicion is that we need a better understanding of this relationship in order to better understand what it is we are actually trying to preserve.

----

[^1]: What's that? You skipped to the end!? Shame on you.
[^2]: As we've seen, this is true even for a very common and well standardised bitstream format like JPEG.
