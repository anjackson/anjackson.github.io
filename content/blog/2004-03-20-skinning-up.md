---
layout: post
type: blog
promote: 0
status: 1
created_ts: 1079759798
changed_ts: 1279903369
node_id: 7
title: Skinning up.
author: anj
created: '2004-03-20'
changed: '2010-07-23'
category:
tags: [Websites]
url: "/2004/03/20/skinning/"
aliases:
  - "/node/7/"
date: '2004-03-20'
---
Well, I've more or less finished munging the old website style into a skin for [Drupal], and it's looking pretty good.  Still need to check its valid XHTML, but it should not be far off.

As well as recreating the old style, I've made a number of new editions - perhaps the funkiest of which is the integration of the [ASCIIMathML](http://www1.chapman.edu/~jipsen/mathml/asciimath.xml) JavaScript library, which allows me to type in LaTeX-style maths such as this:

'sum_(i=1)^n i=(n(n+1))/2'

and get your browser to translate it into MathML like this:

\`sum_(i=1)^n i=(n(n+1))/2\`

If it didn't work, read on to find out how to fix it.
<!--break-->

Note that to render the MathML correctly you need a browser that can cope with it, such as <a href="http://www.mozilla.org/products/firefox/">Firefox</a>, <a href="http://www.mozilla.org/">Mozilla</a>/Netscape 7, or if you are stuck with aging technology, Internet Explorer 6 plus <a href="http://www.dessci.com/en/products/mathplayer/welcome.asp">MathPlayer</a>.  The transformation occurs just after the document has loaded, so if you look closely you'll see the LaTeX-to-MathML transformation occuring.
