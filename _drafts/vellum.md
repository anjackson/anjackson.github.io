---
title: Vellum
category: Digital Preservation
tags: ["Keeping Codes"]
status: stub
layout: post
author: anj
shown: true
---

Following Vint Cerf's talk at AAAS, the "Digital Dark Age" is in the news again (see [DSHR's blog](http://blog.dshr.org/2015/02/vint-cerfs-talk-at-aaas.html) for a good summary, or one of the [~200 other news articles about it!](https://www.google.co.uk/search?q=%22digital+vellum%22&tbm=nws)). The coverage spun me into a Twitter rant ([documented here](http://ws-dl.blogspot.co.uk/2015/02/2015-02-17-reactions-to-vint-cerfs.html)), but ranting only gets me so far, so I want to dig a bit deeper into the issues here...

<!--break-->

> Honestly, if Cerf brings the news that our digital crap is in jeopardy, that's good enough. Different people listen to him.
> 
> <small>[@textfiles](https://twitter.com/textfiles/status/566257028071714817)</small>

I do agree that it's great that big news stories like this raise awareness about these issues, but that's just the first step. Awareness is just an engine of anxiety unless you know how to act upon that knowledge, and it's this part of Vint's message that I find problematic. By pitching  "Digital Vellum" in almost the same breath as posing the problem, Vint makes it sound like digital preservation is just another technical issue to be solved. Hey! Don't worry, it's just a bug in the system! The boffins are working on it! It'll be fine!

Well, the boffins have been working on this for a while....

* [There's the late 90's Universal Preservation Format](http://info.wgbh.org/upf/)...
* ...[the early 2000's Universal Virtual Computer](http://en.wikipedia.org/wiki/UVC-based_preservation)...
* ...[the mid-2000's XCL Project (which doesn't think of itself as a universal preservation format, but it is)](http://planetarium.hki.uni-koeln.de/planets_cms/)...
* ...[the late 2000's Self-contained Information Retention Format](http://www.snia.org/SIRF)...
* ...[the early 2010's KEEP Virtual Machine](http://www.keep-project.eu/ezpub2/index.php?/eng/About-KEEP/Technical-solution/Progress-beyond-the-state-of-the-art) (see also [here](http://www.keep-project.eu/downloads/training/09kvm.pdf), [here](http://eprints.port.ac.uk/3417/) and the [patent, here](http://worldwide.espacenet.com/publicationDetails/biblio?CC=WO&NR=03052542&KC=&FT=E&locale=en_EP))...
* ...[and of course the currently available bwFLA Emulation as a Service system](http://bw-fla.uni-freiburg.de/)...
* ...[and now a new one -- Welcome to the party Olive Archives!](https://olivearchive.org/)

My initial response to the news story was largely due to my frustration that most of this work appears to be unknown to Vint[^1]. But having thought about it, this is really a symptom of a much deeper problem. We've been researching this for twenty years, with some very clever people coming up with some very clever ideas, but these ideas remain lost in a niche. We've been using ['Digital Dark Age' to scare up funding for a long time](https://twitter.com/anjacks0n/status/566252699768090624), but those big, expensive EU projects have led to very few concrete changes in how content is managed over time. Even the Guardian can't seem to remember that it's sold this story before...

> The Digital Dark Age ... Still Looming After All These Years: [2003](http://web.archive.org/web/20030110082553/http://www.guardian.co.uk/online/story/0,3605,871091,00.html) to [2015](http://www.theguardian.com/technology/2015/feb/13/google-boss-warns-forgotten-century-email-photos-vint-cerf)
> <small>[@anjackson](https://twitter.com/anjacks0n/status/567722836555747329)</small>

Out of all the recent news coverage, I think [Seamus Ross's interview on BBC Radio 4](https://twitter.com/anjacks0n/status/566293872238940162) ([from about 00:30:30, here](http://www.bbc.co.uk/programmes/b051w4dr)) was the most helpful. Seamus emphasised that you need to take care of your digital resources, and outlined some of the actions you can take to look after the files you care about.

Digital media are more brittle, and yes, changes to software can make individual resources inaccessible. There are a range of solutions an approaches, but to take advantage of them, there must be individuals and organisations who are charged with that responsibility and are in a position to do so.  Digital presevation is fundementally both a social and technological problem, in equal measure. Or, to but that another way...

> "Digital Vellum" is made of *people*.
> <small>[@anjacks0n](https://twitter.com/anjacks0n/status/567684803861151744)</small>

It appears that this aspect of the preservation problem did come up in the Q&A after Vint's AAAS presentation[^2]:

> Google is not directly involved in the digital preservation effort, Cerf said, "although we have worked really hard at preserving the digital information of the day. We aren't planning to become the archive of the future -- although I think it would be cool."
>
> Instead, he envisions libraries and governments investing in the technology needed to carry today's information into the distant future. 
>
> <small>["Internet future blackout: No way to preserve our data", Contra Costa Times](http://www.contracostatimes.com/education/ci_27516239/internet-future-blackout-no-way-preserve-our-data)</small>

Ah, it's us. Of course.  With our miniscule budgets (compared to Google), with austerity cutting ever deeper, and with an persistent pressure to outsource everything, it's the libraries and governments of the world that are expected to solve this problem. Certainly those organisations have the remit, but do they have the capability?

The question is, then, how do we turn this big news story into concrete action?


- c.f. also that IDCC15 blockchain talk. http://www.dcc.ac.uk/events/idcc15/programme-presentations 
- ‘A system for distributed minting and management of persistent identifiers’ Lukasz Bolikowski et al.

- Help us cope with [DRM in HTML5](http://www.infoworld.com/article/2614597/cringely/drm-sinks-its-fangs-into-html5--with-help-from-netflix--google--and-microsoft.html)
- Provide access to [DRM eBooks](https://support.google.com/books/partner/answer/3309439?hl=en-GB) (hey, at least [you're using ePub](http://en.wikipedia.org/wiki/Google_Play_Books#File_formats)!)
- Provide Olive-style enviroments for Android and apps.

[^1]: Particularly the KEEP and bwFLA work which is really very similar to the Olive Archive approach -- maybe he should have [Googled it](https://www.google.co.uk/search?q=emulation+as+a+service) ;-)
[^2]: Assuming quote accurate, as this question comes across a bit differently [here](http://dailyfreepress.com/2015/02/19/digital-dark-age-threatens-to-swallow-civilizations-bytes-expert-warns/)

----

* Keep args about timescale switching etc. and technical issues etc. elsewhere.
* Your shoebox of photos won't last 1000 years either.
* Migration of signals (all these VM things) still have issues. Essentially a 'preservation platform', but has to subsume compexity of all the other platforms. Can you run Windows 8 on a 386? Will Windows 3.11 run on 64bit hardware. The edges are very complex, and the whole thing probably has the combinatorical problem.
    * i.e. unique differentiable combinations of application software. (Order of installation!)
    * i.e. unique differentiable combinations of hardware.
    * You can sell it to me as 'covering a lot of ground', but you can't sell it as 'perfect'.