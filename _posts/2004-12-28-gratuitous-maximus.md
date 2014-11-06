---
layout: post
type: blog
promote: 0
status: 1
created_ts: 1104228793
changed_ts: 1279903438
node_id: 1573
title: gratuitous maximus
created: '2004-12-28'
changed: '2010-07-23'
redirect_from:
- "/node/1573/"
permalink: "/2004/12/28/gratuitous_maximus/"
category: Geek
tags: []
---
Well, you might have noticed by now that I've been fiddling with the design of this site.  The main problem was the blocks in the side bars, which I've been meaning to sort out since I moved over to ((Drupal)) blinking ages ago.  Having time off over Christmas has given me a chance to come up with something suitably __excessive__ and finish off the implementation.  Read on for the gory details if you're into this kind of thing...
<!--break-->
The reason why the design should be considered gratuitous is because of the transparency effects I've used.  These are ridiculously fiddly to get working in Microsoft's Internet Explorer (largely because it's hopelessly out of date), and after all of that the transparent bits are fer subtle and you might not even notice them unless you look closely.

"So why?  Why on Earth did you bother?" I hear you cry.  This is the geek mind at it's most insufferable I'm afraid - I did it simply to see if I could get it to work.

The problem with Internet Explorer is that although [PNG images](http://www.libpng.org/pub/png/) with their lovely 8-bit alpha (a.k.a. mask or transparency) channel have been around for ages, Microsoft never bothered finishing off the rendering engine for them on the PC (it works fine on the Mac version of IE!).  To get IE 5.5 or later to render transparent PNG images correctly, I used the clever little _behavior_ from [this site (WebFX)](http://webfx.eae.net/dhtml/pngbehavior/pngbehavior.html) along with the following bit of CSS hand-waving magical invokage (all chant after me):
<code>
    background-image: url('transparent.png') !important;
    background-repeat: no-repeat;
    background-position: top left;
    _background-image: none;
    _filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="transparent.png",sizingMethod="crop");
    _height: 1px;
</code>
Note the filthy use of the underscore as a prefix to the style commands - browsers like [Mozilla Firefox](http://www.spreadfirefox.com/?q=affiliates&id=0&t=86) rightly ignore this nonsense, whereas IE assumes the underscore was some kind of mistake and ignores it.  I've no idea what Opera or Safari etc do with this, so I've wilfully broken the intended sematics the CSS and added a '!important' to the line that should take precedence in any other browser.

To make it clear how ridiculous this enterprise was, you should understand what once I'd got the transparent blocks working, I then had to add a backdrop to the pages, otherwise there would be nothing to see through the transparency.  Indeed on the [site map page](http://anjackson.net/all), the left-hand blocks are not transparent at all, and you get the same look without half the trouble. (Although getting both top corners to be rounded was a bit of a hack.  I tend to think all the blocks would look nicer if every corner was rounded, but to do this means having a flat transparency and colour over the blocks instead of the graduated effect which I rather like. I'm pretty sure there's no way around that.)

So, I wanted some transparency to show off, so I had to come up with something to place underneath the right-hand blocks.  Adding new design features simply to show off some technical effect is about as gratuitous as you can get.  So, I started coming up with a few suitable graphics, and made the background-image of the page body point to [this script](http://anjackson.net/themes/anjackson.net/backdrop/random.php) ([source here](http://anjackson.net/themes/anjackson.net/backdrop/random.phps).  That bit of PHP (thrown together from the reference notes on [php.net](http://www.php.net)) simply returns a random image drawn from that directory.

So there you have it - transparent graduated blocks with smoothed corners and with something to see under them.  

I hope you like the new look.  Let me know if it falls over horribly in your browser of choice, but to be honest I might not have time to do anything about it.

Anj
