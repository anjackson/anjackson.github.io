---
title: Sustaining the Software that Preserves Access to Web Archives
subtitle: A post for International Digital Preservation Day 2017
author: anj
layout: post
shown: true
tags: ["Web Archives", "Digital Preservation"]
---

Today is the inaugural [International Digital Preservation Day](http://www.dpconline.org/events/international-digital-preservation-day), and as a small contribution to that excellent global effort I thought I'd write about the current state of the open source tools that enable access to web archives.

Most web archive access happens thanks to the [Internet Archive's Wayback Machine](http://web.archive.org/). The underlying software that delivers that service has gone through at least three iterations (as far as I know). The first was written in Perl and was never made public, but is referred to in papers and bits of documentation. The second was written in Java, and was made [open source](https://github.com/internetarchive/wayback). The third implementation [appears to be written in Python](https://web.archive.org/web/20160617073306/https://archive.org/about/jobs.php#wayback) and offers some [exciting new features](https://blog.archive.org/2017/10/05/wayback-machine-playback-now-with-timestamps/), but is *not* open source[^1]. As far as I can tell, the Internet Archive is currently using both the Java and Python versions of Wayback (for the Archive-It service and the global Wayback Machine respectively), but the direction of travel is away from the Java version.

This matters because like most of the [web archives in the world](http://mementoweb.org/depot/), we [built our own access system](https://www.webarchive.org.uk/wayback/archive/*/http://www.webarchive.org.uk) upon the open source version of the Wayback software. Now that the lead developers are moving away, what should we do?

Long before I heard about the newest version of Wayback, I was frustrated by what I perceived to be a lot of wasted effort by the other users of the Java Wayback software. Each of us seemed to be working alone, patching bugs and struggling to upgrade and update the Wayback software, when we really needed to pool our resources. This was why, working with others in the [International Internet Preservation Consortium](http://netpreserve.org/), I helped set up the [OpenWayback](https://github.com/iipc/openwayback) fork of the Internet Archive's open source repository.

My original idea was to stay as close to the Internet Archive version as possible. We could pool bug-fixes and testing efforts, and try to coordinate with the Internet Archive to get these small fixes back into the core while staying in sync. We could make our own releases, and use those to help manage our own deployment processes. The hope was to build a larger community of practice around this shared code-base.

This didn't really go to plan.

We did manage to set up a [developer community](https://groups.google.com/forum/#!forum/openwayback-dev) and [bug-fixes are being rolled into managed releases](https://groups.google.com/d/msg/openwayback-dev/wWa4BJTH6hk/Ny95ATyEBAAJ). We did grow the community (at least a little), and currently Lauren Ko is doing an excellent job leading the work. But given how important this tool is, there are still too few of us actively engaged in the work. To my shame and frustration, this includes the UK Web Archive -- we have not had a lot of time or resources to put back into OpenWayback recently.

Furthermore, rather than staying close to the Internet Archive version, we've ended up with a separate fork. Bug-fixes and improvements made in the Internet Archive version can no longer be easily merged into the OpenWayback repository because the two code-bases have diverged and are now too far apart. 

Looking back, I underestimated how hard it would be to build this community of practice. I didn't realise how fortunate I am to be able to work in the open, and to be in a position where it is safe and comfortable for me to do so. I didn't understand how much effort it would take to agree and maintain our shared goals. Perhaps I should have pushed back harder when the OpenWayback code started to diverge from the original version. I don't know. But then, given that the Internet Archive is leaving the Java version behind, perhaps that no longer matters.

No matter. We are where we are, and those of us responsible for preserving access to web archives need to decide how to respond to this situation. For now, the UK Web Archive continues to use the Java OpenWayback software, but we are also evaluating [pywb](https://github.com/ikreymer/pywb). This Python tool-kit for accessing web archives is part of the [Webrecorder](https://webrecorder.io/) project, and appears to provide a modern and powerful alternative implementation that is being run as a true open source project[^2]. It's already being used by the [Portuguese Web Archive](https://www.fccn.pt/en/new-release-of-arquivo-pt-with-improved-replay-quality/), [perma.cc](https://perma.cc/), the [UK National Archives](http://blog.nationalarchives.gov.uk/blog/uk-government-web-archive-now-even-better/), the [UK Parliamentary Archive](http://webarchive.parliament.uk/), and [a number of others](https://github.com/ikreymer/pywb/wiki/Public-Projects-using-pywb), so it's certainly a highly credible alternative.

I still believe that the web archives of the world need to pool our scant resources, and avoid vendor lock-in, by sharing the development and maintenance of open source access tools. The organisations and individuals that *do* consider shared open tools to be a *strategic objective* need to find each other and find ways to collaborate. I'm hopeful the new focus on training within IIPC will generate learning resources to help get new people up to speed, and perhaps we can also find ways to support those who recognised the value of working in the open but are not able or permitted to do so. 

Finally, we must try to find new ways of funding the development and maintenance of these tools. All digital resources need software to make them accessible, and therefore maintaining software is a now critical need for every memory institution that wants to preserve access to the digital or born-digital items in their collections.

It's not easy, so let's share the load.

----

[^1]: Perhaps it will be one day, but for now it appears to be proprietary.
[^2]: Note that although the main author used to work there, pywb is entirely separate from the Internet Archive work.

