---
layout: default
type: book
promote: 0
status: 1
created_ts: 1100576835
changed_ts: 1279903439
node_id: 1511
title: a lack of vision
author: anj
created: '2004-11-16'
changed: '2010-07-23'
redirect_from:
- "/node/1511/"
permalink: "/geek_nuggets/programming_languages/java/lack_vision/"
category: Geek
tags: []
---
I have one long running source of frustration when trying to do simulation work: the lack of good visualization tools that can be easily integrated into a simulation code.  Almost all of the physics stuff I do uses fairly simple classical models that would be easy to show graphically.  The big advantage of this is that one can very rapidly see if things are working properly, just be checking if it _looks right_.
<!--break-->
However, all the graphics libraries I've seen require a great deal of setup, and a large amount of 'pollution' of the code.  I don't want to risk messing up my simulation code by having to strap in lots of visualization stuff - I just want one function call that says 'show me this'.

As an unhappy medium, I've decided to write small Java test cases where I can do graphical plots easily in order to test the algorithm, then copy and paste the algorithm into the simulation code itself.  The current problem is one I seem to come across every few years - how to bounce a sphere off the inside of a cylinder.  The first time was when I was very young, and wanted to write a 'speeding around a big maze of tubes' game (not a million miles from [Wipeout](http://www.wipeoutfusion.com/), but with arcade-adventure style gameplay).  At the moment, it's trying to get tracer particles to bounce off the inside of the tube that the fluid is moving through.

Anyways, here's the example applet. You'll need to have the Java plug-in installed for you to be able to see it[1].  Note that the particle starts at a random location, so it will look different every time.  The source code itself is attached to the bottom of this page.[2]

<applet code="net/anjackson/physlets/!CircleBouncePhyslet.class" codebase="/extras/" height="200" width="200">
No Java Plugin Installed!
</applet>

Notice that by examining the corners, and the pattern that emerges over time, one can _see_ that the implementation is essentially correct.  In fact, it looks just like those things I used to make using cotton reels when I was a kid.

And, on a related note, the [future is not looking good where a lack of vision is concerned](http://news.bbc.co.uk/2/hi/health/4008185.stm).

## Update
I realised there were some silly bugs in the finer detail of the code, which are now fixed.  I plotted the bounce points to check the reflection was okay, and it was completely wrong.  I guess one way of visualizing a code is never enough!

----

[1] Annoyingly, I just discovered that the ['official' syntax for including a Java applet on a web page](http://java.sun.com/j2se/1.4.2/docs/guide/plugin/developer_guide/using_tags.html#anywhere) is ridiculously hideous and over complicated and depends on your browser, JavaScript, and on which flavour of HTML you want to use.  Utterly idiotic.  If you don't have the plugin, and you really want to see this thing, you can probably download the JRE [from here](http://java.sun.com/j2se/1.4.2/download.html).

[2] And you'll notice that the code is about 95% stuff for doing the graphics, and 5% actual particle-bouncing mathematics. :(
