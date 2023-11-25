---
layout: default
type: page
promote: 0
status: 1
created_ts: 1103759892
changed_ts: 1279903438
node_id: 1572
title: automagic buttoner
author: anj
created: '2004-12-22'
changed: '2010-07-23'
category: Geek
tags: []
url: "/node/1572/"
aliases: []
date: '2004-12-22'
---
<p>
Once one site encouraged people to <a href="http://www.gtmcknight.com/buttons/" title="steal these buttons"><i>"steal these buttons"</i></a>, lots of other jumped on the <a href="http://www.b3ta.com/" title="glass coke - kinda like a transparent bandwagon">GC</a>.  So here I am, nicking code from <a href="http://minimalverbosity.com/2003/May/19/buttons.htm" title="minimal verbosity's buttoner script">here</a>, a form from <a href="http://kalsey.com/tools/buttonmaker/" title="Adam Kalsey's buttoner form">here</a>, and then munging and tweaking it all to work as I would prefer.  All this really means is that you can use the form below to generate buttons dynamically...
</p>
<!--break-->
  <form method="POST" action="/extras/buttoner/button.php" name="form1"> 
    <h2>Button Maker</h2>
    e.g. <img src="/extras/buttoner/button.php?random=true" alt="" id="generated" height="15" title="rss valid">
    <img src="http://anjackson.net/extras/buttoner/button.php?leftText=drupal&leftFill=0000aa&rightText=powered&rightFill=ffffff&rightTextColor=0000aa" alt="drupal powered" id="generated" height="15" title="drupal powered">

	<h3>Borders</h3>
    <p><label for="outerBorder">Outer border</label>
<input name="outerBorder" id="col0" value="666666" size="20" onfocus="setCursor(0);" onblur="colorStore('0');" type="text">as hex rrggbb.</p>

    <p><label for="innerBorder">Inner border</label>
<input name="innerBorder" id="col1" value="ffffff" size="20" onfocus="setCursor(1);" onblur="colorStore('1');" type="text">as hex rrggbb.</p>
	<div class="twocol rel">

       <h3>Left box:</h3>
       <p><label for="leftText">Text</label>
<input name="leftText" id="leftText2" value="RSS" size="20" type="text"></p>
       <p><label for="leftFill">Background</label>
<input name="leftFill" id="col2" value="ff6600" size="20" onfocus="setCursor(2);" onblur="colorStore('2');" type="text">as hex rrggbb.</p>

       <p><label for="leftTextColor">Text color</label>
<input name="leftTextColor" id="col3" value="ffffff" size="20" onfocus="setCursor(3);" onblur="colorStore('3');" type="text">as hex rrggbb.</p>
	</div>
	<div class="twocol rel">

       <h3>Right box:</h3>
       <p><label for="rightText">Text</label>
<input name="rightText" id="rightText" value="Valid" size="20" type="text"></p>

       <p><label for="rightFill">Background</label>
<input name="rightFill" id="col4" value="898E79" size="20" onfocus="setCursor(4);" onblur="colorStore('4');" type="text">as hex rrggbb.</p>
       <p><label for="rightTextColor">Text color</label>
<input name="rightTextColor" id="col5" value="ffffff" size="20" onfocus="setCursor(5);" onblur="colorStore('5');" type="text">as hex rrggbb.</p>

	<h3>Button Size:</h3>
    <p><label for="buttonWidth">Button Width</label>
<input name="buttonWidth" id="col0" value="" size="20" onfocus="setCursor(0);" onblur="colorStore('0');" type="text">px (leave blank to calculate the width automatically).</p>
	</div>

    <input name="Submit" value="Go ahead, make my button." type="submit">
  </form>

<p>
The mildly modified source code is available <a href="/extras/buttoner/button.phps" title="buttoner source code">here</a>.
</p>
