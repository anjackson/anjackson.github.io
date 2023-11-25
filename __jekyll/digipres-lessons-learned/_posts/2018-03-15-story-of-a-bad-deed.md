---
title: "Story of a Bad Deed"
subtitle: A tiny digital mystery
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

I love a digital preservation mystery, and this one started with question from [@joe](https://digipres.club/@joe/) on [digipres.club](https://digipres.club/):

<iframe src="https://digipres.club/@joe/99650486509645352/embed" class="mastodon-embed" style="max-width: 100%; border: 0" width="400"></iframe><script src="https://digipres.club/embed.js" async="async"></script>

A mystery file, starting with `0x0baddeed`, eh? Fascinating. Those hex digits didn't happen be accident. Using four-digit hex patterns to signal format is an extremely common design pattern, but no authority hands them out -- each format designer mints them independently. There must be a story here...
<!--break-->

The first step is to find other examples to work with. For exactly this reason, I deliberately built a special feature into our search indexes: the ability to seach for files based on the first four bytes. Gratifyingly, [someone else](https://digipres.club/@nkrabben) beat me to it:

<iframe src="https://digipres.club/@nkrabben/99650687654066239/embed" class="mastodon-embed" style="max-width: 100%; border: 0" width="400"></iframe><script src="https://digipres.club/embed.js" async="async"></script>

Poking around in [the underlying data](https://gist.github.com/anjackson/1cb69ae72eadea65a50e348b71d93d2d) it was clear that the [179 files that matched this query](https://www.webarchive.org.uk/shine/search?query=content_ffb:%220baddeed%22) all appeared to be PowerPoint files based on the file extension, but neither [DROID](https://www.nationalarchives.gov.uk/information-management/manage-information/policy-process/digital-continuity/file-profiling-tool-droid/) nor [Apache Tika](https://tika.apache.org/) could say any more.

A [search of PRONOM](http://www.nationalarchives.gov.uk/PRONOM/Format/proFormatSearch.aspx?status=new) showed two separate records for [Microsoft PowerPoint for Macintosh 4.0](http://www.nationalarchives.gov.uk/PRONOM/Format/proFormatSearch.aspx?status=detailReport&id=885) and [Microsoft Powerpoint Presentation 4.0](http://www.nationalarchives.gov.uk/PRONOM/Format/proFormatSearch.aspx?status=detailReport&id=133), but no earlier versions. In this case, [Wikipedia faired better](https://en.wikipedia.org/wiki/Microsoft_PowerPoint), [linking to](https://en.wikipedia.org/wiki/Microsoft_PowerPoint#cite_note-early-file-compatibility-252) this [nice overview of the format compatability between PowerPoint versions](https://web.archive.org/web/20130510103008/http://www.bitbetter.com/powerfaq.htm#versions).

While the [File Format Wiki](http://justsolve.archiveteam.org/wiki/PPT) did not have much detail for the early versions of PowerPoint, it did [link](http://justsolve.archiveteam.org/wiki/PPT#Sample_files) to [a source of sample files](https://web.archive.org/web/20020313074855/http://ftp.sunet.se/pub/Internet-documents/isoc/charts/presentations/)[^2]. This proved to be very fortunate indeed...

I downloaded some of the old sample files from there, and compared them against the `0x0baddeed` files. Here's the start of one of the sample file:


```
$ hexdump -C nii.ppt | head
00000000  ed de ad 0b 03 00 00 00  45 17 00 00 3f 01 31 17  |........E...?.1.|
00000010  6f 20 0f 00 50 00 3e 01  28 17 00 00 28 00 00 00  |o ..P.>.(...(...|
00000020  79 00 00 00 5b 00 00 00  01 00 04 00 00 00 00 00  |y...[...........|
00000030  c0 16 00 00 00 00 00 00  00 00 00 00 10 00 00 00  |................|
00000040  00 00 00 00 00 00 00 00  00 00 80 00 00 80 00 00  |................|
00000050  00 80 80 00 80 00 00 00  80 00 80 00 80 80 00 00  |................|
00000060  c0 c0 c0 00 80 80 80 00  00 00 ff 00 00 ff 00 00  |................|
00000070  00 ff ff 00 ff 00 00 00  ff 00 ff 00 ff ff 00 00  |................|
00000080  ff ff ff 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
```

and here's the start of one of the `0x0baddeed` files...

```
$ hexdump -C BidStrat.ppt | head
00000000  0b ad de ed 00 00 00 03  00 00 00 1e 00 7b 00 0a  |.............{..|
00000010  00 00 be cd 00 50 00 7a  00 00 00 00 00 00 80 00  |.....P.z........|
00000020  00 18 00 00 03 f6 80 00  00 00 00 00 04 0e 80 00  |................|
00000030  03 c0 00 00 04 0e 80 00  01 a4 00 00 07 ce 80 00  |................|
00000040  0d 16 00 00 09 72 80 00  00 26 00 00 16 88 80 00  |.....r...&......|
00000050  00 00 00 00 16 ae 80 00  00 40 00 00 16 ae 80 00  |.........@......|
00000060  00 00 00 00 16 ee 80 00  00 60 00 00 16 ee 80 00  |.........`......|
00000070  00 26 00 00 17 4e 80 00  00 20 00 00 17 74 80 00  |.&...N... ...t..|
00000080  00 18 00 00 17 94 80 00  00 00 00 00 17 ac 80 00  |................|
00000090  03 40 00 00 17 ac 80 00  01 54 00 00 1a ec 80 00  |.@.......T......|
```

Do you see it? Look closer...

```
$ hexdump -C BidStrat.ppt | head -1
00000000  0b ad de ed 00 00 00 03  00 00 00 1e 00 7b 00 0a  |.............{..|
$ hexdump -C nii.ppt | head -1
00000000  ed de ad 0b 03 00 00 00  45 17 00 00 3f 01 31 17  |........E...?.1.|
```

Both the first and second four bytes match, but are reversed! Welcome to the confusing world of [endianness](https://en.wikipedia.org/wiki/Endianness) (see also [Apple's docs on byte ordering](https://developer.apple.com/library/content/documentation/CoreFoundation/Conceptual/CFMemoryMgmt/Concepts/ByteOrdering.html))[^1].

Most computers use a byte-ordering called 'little-endian', but the older Mac used an alternative ordering called 'big-endian'. This is just two different conventions for storing data, and I can't look at `0x0baddeed` and know which ordering it is. However, the discovery of `ppt` files starting with either `0x0baddeed` or `0xeddead0b` is consistent with the same type of data being stored in different endian-orders.

Indeed, [searching for the reversed pattern finds 430 files](https://www.webarchive.org.uk/shine/search?query=content_ffb:%22eddead0b%22), and better still the [online version of TRiD](http://mark0.net/onlinetrid.aspx) determines these to be early PowerPoint files.

![TRiD Result]({{site.url}}/digipres-lessons-learned/images/trid-result-for-nii-ppt.png)

In fact, [it looks like TRiD is also able to distinguish between versions 2.0 and 3.0](http://file-extension.net/seeker/file_extension_ppt), but only for the more common byte-ordering.

Sadly, there is no trivial 'fix' for this. You can't just go through the whole file and flip the bytes, because only some chunks are stored like that. If you use the `strings` command to extract the text, it's in the expected order, not half-flipped, because it's stored as a byte stream not [32-bit 'words'](https://en.wikipedia.org/wiki/Word_(computer_architecture)). The only way to open these files will be to use PowerPoint 2.0 or 3.0 in an emulator, and although either should be able to open both, they are effectively distinct formats. I'm not able to test this, but maybe someone else can?

But why `0x0baddeed`? Well, I started to speculate that this was a statement from a disgruntled developer. PowerPoint 2.0 was the first version of PowerPoint that ran on both Macs and PCs, and a joke that only reveals itself on one platform would be just the kind of thing I'd expect from a community that relishes Rick-rolls. But then after I thought I had this idea, I realised it feels more like a memory. Can any one else remember a story like this? Please let me know!

----

[^1]: I remain frustrated that I still find endianness confusing. In the past, I managed to cobble together a port of a [little-endian platform emulation](https://www.marutan.net/rpcemu/) that ran on my big-endian Mac, and despite the fact I got it working I never felt like I really understood it properly!
[^2]: Thanks to [Nick Krabbenhöft](https://twitter.com/NKrabben) for [pointing out](https://twitter.com/NKrabben/status/974386913464537099) that I'd mis-remembered where I'd got these samples from. This updated blog post should now be accurate!
