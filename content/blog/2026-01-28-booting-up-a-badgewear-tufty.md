---
title: Booting up a Badgewear Tufty
subtitle: My new band name is Lanyard Overkill
date: 2026-01-28T20:40:00.000+00:00
layout: post
author: anj
draft: false
images:
  - /assets/images/uploads/img_20260128_201308.jpg
description: Getting started with programming the Badgewear Tufty smart interactive badge.
---
I pre-ordered a [Badgeware Tufty](https://shop.pimoroni.com/products/tufty-2350?variant=55811986194811), a "smart interactive badge with colour 2.8" TFT display, powered by Raspberry Pi RP2350." It arrived today! This post covers what I've learned so far about programming it.

<!--break-->

This is what it looks like. Nice packaging, fun sticker and lanyard!

![](/assets/images/uploads/img_20260128_200810.jpg)

It comes with a few apps, and it's easy to look at them and edit them because you can make it pretend to be a USB drive. It seems some version of this model was used as a conference freebie for GitHub Universe 2025, and [the documentation for that seems to apply to this](https://github.com/badger/home?tab=readme-ov-file#universe-2025-tufty-badge).

The problem I had was having to edit the files on my laptop and then transfer them over USB and then restart the badge... That's a slow iteration cycle.  That GitHub repo said there was an emulator, but that's a bit clunky.

But I've used [Thonny](https://thonny.org/) with this kind of thing before, and that's much easier, so I gave that a try (my son also uses it for schoolwork, so he'd be able to play with it too).

I installed Thonny on Windows 11, started it up, and went to configure it

![](/assets/images/uploads/screenshot-2026-01-28-201755.png)

I then switched the Python Interpreter configuration to look for a device running "MicroPython (RP2040)" 

![](/assets/images/uploads/screenshot-2026-01-28-201815.png)

and 💥 it connected!

What *didn't* work was writing the Python files directly to the device. I've had that work on other bits of kit, but that just crashed here.  However, if you store the Python file on the host computer, you can still make it run on the Tufty over the USB connection! Here's an example, where I'm modifying a copy of the supplied 'mini apps' where it acts like a conference badge:

![](/assets/images/uploads/screenshot-2026-01-28-201447.png)

This is slightly cumbersome, in that if you want to load additional files (e.g. image files) from your script, you have to transfer them over yourself using USB mode beforehand. But it's very easy to reset the device and run your code! 

![](/assets/images/uploads/img_20260128_201308.jpg)

I also managed to hack around enough to find out that the [Image class](https://github.com/badger/home/blob/main/badgerware/Image.md) used for the screen has secret `put(x,y)` and`get(x,y)` methods that let you directly poke pixels, which is the kind of thing I like to be able to do. 

You can find out more at <https://badgewa.re/>

Share & Enjoy.
