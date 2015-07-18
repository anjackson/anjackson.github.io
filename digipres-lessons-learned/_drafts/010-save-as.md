---
title: "It starts with 'Save as...'"
category: Digital Preservation
tags: ["Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
series-position: 10
sidebar-include: _ll.md
---

Let's start with an experiment...

<!--break-->

## Materials ##

For this experiment, you will need:

* An USB flash drive of little importance. One of those old 64MB ones you got from that conference.
* A copy of a  digital file of great importance. Any format will do, as long as it's in a format you can read. I'm going to use this JPEG:


## Method ##

1. Copy the test file to the USB flash drive.
2. Open up the test file from the USB drive, as you usually would.
3. Pull out the USB flash drive. *Do Not Eject It Properly!* **Just yank it right out!**
    * **Optional:** Throw the USB drive into a blender and [destroy it utterly](https://www.youtube.com/watch?v=y2eNhPC8wCQ).
4. Observe what happens next.


## Results ##

In my experiment, the first thing that happened was...

![Disk Not Ejected Properly]({{site.url}}/blog/images/ll/not-ejected-properly-2015.png)

...but beside this admonishment, the image was still there.

The bitstream was gone (optionally blended into oblivion). But the image was still on the screen. I bet yours is still there too.

But right now, it's at risk. All it takes is loss of power to this machine, and the photograph will blink out of existence. And entropy will win.

Can you press 'Save as...', and get a new bitstream back?  

It depends on the sofware. 

When I tried this with Apple Preview, I couldn't save the image, even though I could see it. The rendered image was still stored in some presentation buffer, but the only way to get it seemed to be as a desktop screenshot.

But with image editing software, specifically the [GIMP](http://www.gimp.org/), I pressed 'Save as...' and a new bitstream was written. Not *quite* the same as the original, but good enough.


## Conclusion ###

Once your bitstream is loaded, the thing you are interacting with is not the bitstream. It is a projection of the runtime representation of the capabilities of the application you are using. What was once a neat, contiguous bitstream has now been spread around and interleaved with the software that loaded it.

This is the story of every digital resource. Every single one is born entangled with and defined by software. Bytes in flight.

Code *always* comes first, and the first act of digital preservation is *always* 'Save as...'

![Save as...]({{site.url}}/blog/images/ll/save-icon.png)



