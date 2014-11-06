---
layout: post
type: blog
promote: 0
status: 1
created_ts: 1184845139
changed_ts: 1184861351
node_id: 1806
title: visualising prime numbers in binary
author: anj
created: '2007-07-19'
changed: '2007-07-19'
redirect_from:
- "/node/1806/"
permalink: "/2007/07/19/visualising_prime_numbers_in_binary/"
category: Geek
tags: []
---
<p>
For a while now, I've wondered what the prime numbers look like in binary, that is, if you paint the ones as white dots, and the zeros as black dots, what does the whole set look like?  I finally got around to writing a program to generate the prime numbers and output them as a PNG, and you can see the results below...
</p>
<!--break-->
<div style="float: right; background-color: #888; width: 50px; height: 600px; overflow: scroll; margin: 1em;">
<img  style="float: left; background-color: transparent; margin: 0; padding: 0; border: none;" 
src="http://anjackson.net/sites/anjackson.net/files/images/primes.png"/>
<img  style="float: left; background-color: transparent; margin: 0; padding: 0; border: none;" 
src="http://anjackson.net/sites/anjackson.net/files/images/not-primes.png"/>
</div>

<img  style="display: block; margin: 0.5em auto; padding: 0; border: none;" src="http://anjackson.net/sites/anjackson.net/files/images/PrimePlotIllustration.png"/>

<p>
The above image illustrates how the plot works.  Horizontally we have the 'units of twos' - i.e. the columns from right to left corresponds to increasing powers of 2.  You've seen this before in decimal, where the columns are units, tens, hundreds, thousands and so on, but instead of the number 13 being made up by adding one ten and three units, we indicate the number thirteen as a sum of powers of two, i.e. 13 = 8 + 4 + 1.  So, in this case, the 8,4 and 1 columns are white, and the others are black/blank.
</p>
<p>
Now we understand the columns, it's clear that each row is a different prime number.  I chose to start with 1 (although this is not always considered prime), giving the sequence 1, 2, 3, 5, 7, 11, 13...  Each row shows the prime number in the black/white binary form.
</p>
<p>
Over on the far right, we have two more images showning the first 9,593 primes and the first 9,593 numbers (i.e. including non-primes).  I've put them in a scrollable box to make it easier to view.  When I first plotted the primes, I was surprised by the complex and interesting pattern and the strong bifurcation motifs that repeat throughout.  However, plotting the natural numbers in binary shows that this bifurcation is just an artefact of the choice of representation - the patterning of binary numbers is very clear here.
</p>
<p>
So, I'm not sure how much insight is to be gained from this plot, but it was interesting to make.  It also illustrated the advantages of using Java, as this type of thing is very easy to create in a language with such strong support for graphics built into the standard libraries.
</p>

