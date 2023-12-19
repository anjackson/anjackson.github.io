---
title: "Unsafe Device Removal"
subtitle: "An experiment in digital destruction"
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

Let's start with an experiment...

<!--break-->

## Materials ##

For this experiment, you will need:

1. An USB flash drive of little importance. One of those old sub-GB ones you got from that conference will do.
2. A copy of a digital file of great importance. Any format will do, as long as it's in a format you can open.


I'm going to use this drive:

![Test Drive](/digipres-lessons-learned/images/save-as/save-as-test-drive.jpg)

...and this JPEG:

![My father and my son, alike.](/digipres-lessons-learned/images/save-as/best-test-image.jpg)

## Method ##

1. Copy the test file to the USB flash drive. *Do not use your only copy of the precious file!*
2. Open up the test file from the USB drive, as you usually would (i.e. using the usual app for that format).
3. Pull out the USB flash drive. *Do Not Eject It Properly!* **Just yank it right out!**[^1]
    * **Optional:** [Throw the USB drive into a blender and destroy it utterly](https://www.youtube.com/watch?v=y2eNhPC8wCQ).
4. Observe what happens.


## Results ##

In my experiment, the first thing that happened was...

![Disk Not Ejected Properly](/digipres-lessons-learned/images/save-as/save-as-oops.jpg)

...but beside this admonishment, the image was still there...

![But Still There](/digipres-lessons-learned/images/save-as/save-as-still-there.jpg)

The bitstream was gone (optionally blended into oblivion -- the Digital Object destroyed). But the image was still on the screen. I bet yours is still there too.

But right now, it's at risk. All it takes is loss of power to this machine, and the file will blink out of existence.[^2]

Can you press 'Save as...', and get a new bitstream back? It depends on the software. 

When I [tried this with Apple Preview](https://www.flickr.com/photos/anjacks0n/sets/72157655724233440), I couldn't save the image, even though I could see it. 

![Apple Preview Says No](/digipres-lessons-learned/images/save-as/save-as-preview-says-no.png)

The only way to save it seemed to be as a desktop screenshot, which I would then need to crop to get back an acceptable image.

But re-running the same experiment with image editing software (specifically the [GIMP](http://www.gimp.org/)), I could press 'Save as...' and a new bitstream was written. Not *exactly* the same as the original, but good enough.[^3]


## Over to you ##

I'd be fascinated to know what happens on other platforms and with other software, so please get in touch if you've tried this. I'd also be curious to know how the choice of format affects the outcome. If anyone has any results to share, I'll collect them together in a follow-up post.

----

[^1]: Go on, admit it, you've always wanted to try this and see what happens. Well, now you get to do it. For Science.
[^2]: And entropy will win. And we don't want *that*.
[^3]: The two images were highly similar, with a [PSNR](https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio) of just over 56dB and with a distribution of differences that looks like [this](/digipres-lessons-learned/images/save-as/difference.png). It is not clear if the variation is due to small differences in JPEG compression parameters, or if all the parameters are the same but the implementations have small difference in execution (e.g. rounding errors).


