---
title: "Access starts with 'Loading...'"
subtitle: What a performance!
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

So what was going on in [our little experiment in data destruction?](/2017/04/10/unsafe-device-removal/) Well, to understand what happens when we open up digital files, I want to take you back to my childhood, back when 'Loading...' really meant something.
<!--break-->

I'd like you to watch the following video. Please, listen to the sweet 'music' of the bits of the bitstream as they stream off the tape and into the memory of the machine. And no skipping to the end! Sit through the whole *damn* thing and experience the frequent (and I fear formative) frustration of my early life, awaiting the end of the loading screen.

<div style="text-align: center;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/V0EfycbDhiw?rel=0" frameborder="0" allowfullscreen></iframe>
</div>

I particularly like the bit from [about 0:24s in, as the loading screen loads](https://youtu.be/V0EfycbDhiw?t=24s). First, we can see a monochrome image being loaded, section-by-section with individual pixels flowing in, row after row. The ones and zeros you can see are the same one as the ones you can hear, but they are being passed from the tape, through the computers [CPU](https://en.wikipedia.org/wiki/Central_processing_unit), and being stored in a special part of the [machine's](https://en.wikipedia.org/wiki/ZX_Spectrum) memory, called the [screen memory](http://whatnotandgobbleaduke.blogspot.co.uk/2011/07/zx-spectrum-screen-memory-layout.html).

This screen memory is special because another bit of hardware called the [ULA](http://www.worldofspectrum.org/faq/reference/48kreference.htm#Contention) can see what's there, and uses it to compose the signal that is sent to the television screen. As well as forming the pixels, it also uses the last chunk of memory to define what colours should be used, and mashes these two sets of information together to make the final image appear. You can see this as the final part of the loading screen loading process happens, and the monochrome image suddenly fills with colour.

After that, the tape moves on and we have to wait even longer while the actual game loads, but constant work is required to generate the illusion of a stable image. Fifty times a second, the ULA reads the screen memory and sends the result out to the television screen, and this process is interlaced with the data loading as the whole thing hums along at 3.5MHz.

The point I want to emphasise is that this is just a slow-motion version of what still happens today. The notion of 'screen memory' has become more complex and layered, and it all happens *much* faster, but you're still interacting with computer's memory and not the actual persistent bitstream[^1].

This is why I was able to re-save my test image out of the GIMP - it's an image editing program, and developing editing software is much easier if you can load the whole file into memory to work on it. This also means I can re-save it in a wide range of formats, translating the in-memory representation of the image into whatever bitstream format I like. This is common behaviour for editing software.

However, based on my results, it seems Apple Preview works differently. It's likely that Preview always retains a reference to the original file, but then generates an intermediate in-memory image for display purposes (e.g. a thumbnail image). The intermediate, cached image can still be shown, even if future operations will fail because the software can no longer find the original file.

No-one interacts *directly* with the bitstreams we identify as 'Digital Objects'.

----

[^1]: Sometimes, this gap has been reduced using a technique called [memory mapping](https://en.wikipedia.org/wiki/Memory-mapped_file). This allows some or all of a given file to be treated as if it were part of the computers memory, which is more efficient than having to copy chunks of data into memory before being able to interact with them[^1]. LIKE SCREEN FORMAT SAMENESS This only works with [random-access media]() - again, we rarely iteract with literal 'streams' of bits.

