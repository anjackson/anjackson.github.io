---
title: My Format Identification Misunderstandings
subtitle: Those were not the DROID descriptions I was looking for.
date: 2023-03-22T20:53:45.363Z
category: format-identification
tags:
  - Digital Preservation
layout: post
author: anj
shown: true
url: null
aliases: null
---
As the [ZIP scanning issue](https://github.com/digital-preservation/droid/issues/906) keeps getting updated, I realised I made some errors in my analysis of how DROID works.

<!--break-->

I've updated the last two blog posts, adding detailed comments in _italics_.  But in short, the good news is that I'd forgotten that DROID does attempt to drop binary signatures when there are container signatures instead. The bad news is that as well as beginning-of-file with unbounded wildcards, PRONOM also supports _variable_ signatures that can occur anywhere in a file. ID ain't easy.

The thread also referred me to [this blog post by Martin Hoppenheit called 'Minimizing the DROID signature file'](https://martin.hoppenheit.info/blog/2017/minimizing-the-droid-signature-file/), which discusses many of these issues, and recommends reducing the number of signatures in use based on your context.

Personally, I'm not sure that's worth the effort.  Just using a reasonable maximum-bytes scan limit (e.g. 1MB) would have essentially the same effect in most cases, without having to fiddle about with the signature files (and risk making the binary and container signature files inconsistent).

I think a better answer is to work with the PRONOM/DROID team to replace the signatures that cause a full scan with ones that have some limits. Or propose to write a modification to DROID to port over some of Siegfried's optimizations. 

Those kind of changes would benefit us all.