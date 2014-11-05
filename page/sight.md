---
layout: default
type: page
promote: 0
status: 1
created_ts: 1092389813
changed_ts: 1101790193
node_id: 1297
title: Sight
created: '2004-08-13'
changed: '2004-11-30'
aliases:
- "/poot/java/sight/"
permalink: "/poot/java/sight/"
tags: []
---
# Sight
A BibTeX references file management application written in Java.
<!--break-->

# JabRef
Sight is not that great.  Try [JabRef](http://jabref.sourceforge.net/) for all your BibTeX citation management needs (as it looks a lot better!)

----

<table width="100%" border="0" cellpadding="5" cellspacing="5">

<tr>
<td valign="top" width="15%" class="section-cell">
<h2>
demo
</h2>
</td>
<td valign="top" width="85%">
<p align="center">
Follow this link to run the (DEMO OFFLINE AT PRESENT!).
<br>
When run as a stand alone application, the load/save and quit facilities work.

</p>
<table width="100%" border="0" cellpadding="5" cellspacing="5"></table>
</td>
</tr>

<tr>
<td valign="top" width="15%" class="section-cell">
<h2>
screenshots
</h2>
</td>
<td valign="top" width="85%">

<p align="center">
Here are some screenshots of it running on the Acorn Java VM.
</p>
<p align="center">
[image:1294]
[image:1295]
[image:1296]
</p>
<table width="100%" border="0" cellpadding="5" cellspacing="5"></table>
</td>
</tr>

<tr>
<td valign="top" width="15%" class="section-cell">

<h2>
release notes
</h2>
</td>
<td valign="top" width="85%">
<p>
This is now proper release version 1.0.A proper version is avaliable using the link at the bottom of the page. I fear the supplied documentation may not be enought to get it working.If you want help, <a href="/contact">contact me</a>.
</p>
<table width="100%" border="0" cellpadding="5" cellspacing="5"></table>
</td>

</tr>

<tr>
<td valign="top" width="15%" class="section-cell">
<h2>
raw notes
</h2>
</td>
<td valign="top" width="85%">
The following will probably only make much sense to me...

<H3>Modification Notes:</H3>

<ul>
<li> v.1.0 - 29/10/2000:</li>
<li> Now copes with escaped quotes and nested braces.</li>
<li> Source code is now managed using CVS.</li>
<li> Barely room to compile it at home!</li>
<li> </li>
</ul>

<H3>Needs a brief manual/README and some unix screen-shots!</H3>

<H3>SHOULD:</H3>
<ul>
<li> Allow merging with other .bib files (+filter?). (data from bids!)</li>
<li> Make cursor keys behave sensibly when the search filter is on.</li>
<li> try to avoid it showing the browser in init</li>
</ul>

<H3>BUGS:</H3>
<ul>
<li> The whole filename/dir thing gets rather confused when 'saving as' under RISCOS.</li>
<li> On Acorn: Save As.. saves in the wrong place! Tends to use / instead of . when saving under 'Save As...'.Praps a VM problem?</li>
<li> Stop the selected entry from being offscreen (This appears to be a general non-characteristic of any Java VM).</li>
</ul>

<H3>COULD:</H3>
<ul>

<li>Handle abbreviations ('@string') properly, ie at all.
</li>
<li>Add a 'Revert'.
</li>
<li>Ask when you quit it, and delete all editors and generally exit gracefully.
</li>
<li>Should always use a pointer to the current entry, instead of copying it off etc.
</li>
<li>Should remember at least the last selected type and use that for new entries.
</li>
<li>Make search-string filtering work live, (no filter button) requires speed!
</li>

<li>Really should sort out ways to minimize redraws etc.
</li>
<li>Store the nav-string in the DatabaseEntry, and only calulate it when edited.
</li>
<li>Add sorting facilities.
</li>
<li>Implement the 'Info...' dialog.
</li>
<li>Rank 'close-up' list entries by required/optional/spurious.
</li>
<li>Allow full cursor-key nagivation.

</li>
<li>Implement multiple selection.
</li>
<li>Allow proper insertion, cutting, pasting, copying etc.
</li>
<li>Implement the mini-editor.
</li>
<li>Check for double entries, mismatched parenthesis, conflictions etc.
</li>
<li>Know when something has been changed.  Obviously, it should know when unsaved and go ALERT! when required.
</li>
<li>Warn before deleting an entry(?).
</li>
<li>Tie together/indicate and/or fields.(Radio icons?, extra two columns may solve the spacing problems.)
</li>
<li>Use a messages file for language portability.
</li>
<li>Allow references to be grouped into 'Folders', storing the information in BibTeX comment lines.
</li>
<li>Allow import of BIDS data (any others?).
</li>
<li>Allow formatted export?
</li>
<li>Implement the 'Help...' and 'Preferences...' dialogs.

</li>
<li>Guess the \cite string according to some rules.
</li>
<li>Ability to look-up cite definitions and fields meanings etc (i.e. Help system.)
</li>
<li>Specify the order of the fields for each type in the def file, or somewhere.
</li>
<li>Also, a decent bib-style file generator would be good.
</li>
</ul>

<H3>ALSO:</H3>

<ul>
<li>Supply various notes about how well it implements the allowable field combinations (in a brief manual).
</li>
<li>All errors should be reported in a standard SightError Dialog box.
</li>
<li>Is there any way to get remove to work for lists?
</li>
<li>The group may be interested.
</li>
<li>Compiler notes: Sight.java:31: class DatabaseEntry is defined in Database.java. Because it is used outside of its source file, it should be defined in a file called "DatabaseEntry.java".
</li>
<li>The version compiled at work doesn't produce FileDialogs at home (vica versa?)

</li>
<li>When home version is run under Solaris, it produces a NullPointerException in/just after initSightFrame, but not in the Compaq JVM.
</li>
<li>How do I do the SHIFT_MASK stuff (look for KEYDOWN.CONTROL instead?
</li>
</ul>

<H3>OUTPUTS:</H3>
<p>
----------------------------------------<br>
Sight: A BibTeX citation file manager<br>
Written in Java 1.0 by Andrew N Jackson<br>

Being run on an OS other than RISC OS...<br>
user.name= anj<br>
user.home= /Home/anj<br>
user.dir = /tmp_mnt/phys/alpha/anj/anj/Docs/Thesis<br>
os.name= Compaq's Digital UNIX<br>
os.version = V4.0<br>
java.version = 1.1.7B-2<br>
----------------------------------------<br>
Being run on an OS other than RISC OS...<br>

user.name= anj<br>
user.home= /Home/anj<br>
user.dir = /phys/alpha/anj/Ideas/Sight<br>
os.name= Solaris<br>
os.version = 2.x<br>
java.version = 1.1.6<br>
----------------------------------------<br>
Being run on RISC OS...<br>
user.name= root<br>

user.home= <br>
user.dir = raFS::Sight.$.!Sight<br>
os.name= RISC OS<br>
os.version = 3.x<br>
java.version = pwombwel:11/08/98-13:16<br>
[[Lots of #237 characters]<br>
----------------------------------------<br>
</p>

Just a thought - could rewrite LivePlot so that is uses stdio, or rather this could be a feature of Danse.


<table width="100%" border="0" cellpadding="5" cellspacing="5"></table>
</td>
</tr>
</table>

