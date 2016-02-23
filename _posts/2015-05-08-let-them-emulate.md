---
title: Let Them Emulate!
category: digital-dark-age
tags: ["Digital Preservation"]
layout: post
author: anj
---

On the first day of the [IIPC GA 2015](http://netpreserve.org/general-assembly/ga2015-schedule), the morning keynote was [Digital Vellum: Interacting with Digital Objects Over Centuries](http://netpreserve.org/sites/default/files/attachments/2015-IIPC-GA_Abstract_01_Cerf-Satya.pdf), presented by [Vint Cerf](http://research.google.com/pubs/author32412.html) and [Mahadev Satyanarayanan](http://www.cs.cmu.edu/~satya/). This included some more details and demonstrations of the proposed preservation solution [I blogged about before]({{ site.baseurl }}/2015/03/09/vellum), so I thought it was worth returning to the subject now that I know a little more about it.

<!--break-->

Certainly, the [Olive Executable Archive](https://olivearchive.org/) is an impressive system, and the demonstration was great fun. However, it's worth noting that most of the 'preservation work' was done elsewhere. For example, the emulation was actually done using [QEMU](http://wiki.qemu.org/Main_Page). This is nothing to be ashamed of, but it's important to understand the technical architecture of these kinds of systems in order to be able to compare them.

Specifically, in terms of overall architecture, Olive is very similar to the [KEEP Emulation Framework](http://emuframework.sourceforge.net/) (in that it is an attempt to re-package existing tools in a way that makes deployment much easier), while also also providing a 'cloud' mode very similar to [bwFLA's Emulation as a Service](http://bw-fla.uni-freiburg.de/). Olive does have [some additional advantages](https://olivearchive.org/about/): it's a very smooth experience, and it has a number of pleasant optimizations in terms of reducing the storage size when maintaining a library of software systems, and in terms of the clever [local virtualization client](https://olivearchive.org/docs/vmnetx/install/) that can run from streamed/partially downloaded disk images. But these are only optimizations, and I'd argue that the KEEP and bwFLA systems are actually more technically advanced, in terms of things like having the ability to identify formats in order to create the association with the right software.

Will this tactic preserve access for centuries? Possibly - but in the context of the IIPC, the bigger problem is that this technique is not terribly well-suited to *internet* archiving. As Satya explained, it would be possible (in principle) to preserve specific web service systems by preserving machine images of the servers involved and reconstructing them at 'playback' time, from IPv4 and DNS all the way up to the web application itself. This is a pretty neat idea, and one I can imagine applying to a small number of particularly important web services, but is simply not scalable to millions of websites. Consequentially, a number of attendees commented that it was more of an [iPres](http://ipres-conference.org) presentation than an IIPC one.

However, even accepting that, I found the presentation rather frustrating. In part, this was because they seem to have ignored almost all the existing work in this area. We know we should be archiving software. We've been studying it for a while. We know about most of these tactics and we've got a few tricks of our own. But if that's the case, why aren't we doing more? Why aren't we preserving software routinely?

Well, on one slide, Vint presented a number of challenges to software preservation[^1]:

![Challenges]({{ site.baseurl }}/blog/images/digital-vellum-challenges.png)

which manages to reproduce the challenges that the digital preservation community has been chewing over for the last decade (at least), while omitting the central challenge: the economics of preservation.

Those organizations with the remit to think truly long term are also those that are under the yoke of austerity, and many are already struggling to negotiate the massive expansion of their remit due to the growth of digital media. To have big players like Google come along and tell us what we *ought* to be doing, when we cannot compete with their budgets (and their ability to attract people with the technical skills we need), sounds altogether too much like ["Let them emulate!"](http://en.wikipedia.org/wiki/Let_them_eat_cake)

Yes, we should be archiving software. Yes, we should be supporting frameworks to make emulation more accessible. Yes, we should be collecting the information and relationships that will support this kind of access. A number of organisations already working hard on these issues (e.g. the [National Software Reference Library](http://www.nsrl.nist.gov/), [Rhizome](http://rhizome.org/editorial/2015/apr/17/theresa-duncan-cd-roms-are-now-playable-online/) or [the Internet Archive](https://archive.org/details/softwarelibrary)) but I'm pretty sure that every archive and library I know of would agree that as a community we should be doing more. But we are too poor, and too few. Perhaps Vint could find a way Google could help us out, rather than telling us what we already know.

This doesn't have to be monetary assistance -- perhaps they could help address some of those other challenges. Perhaps they could donate disk images of some of their most influential systems (e.g. Google Docs, offical Android releases) to a body like the [NSRL](http://www.nsrl.nist.gov/)? Perhaps they could help us get the DRM off their eBooks? Or cope with the [Encrypted Media Extensions](http://en.wikipedia.org/wiki/Encrypted_Media_Extensions) that they've helped push onto the web?

Having said that, *we* should also try to learn from this situation. For example, it appears that the IIPC and iPres communities (and those big EU projects that have been working on digital preservation) have not done enough to spread the word about what we've been doing. Not just in terms of publicizing EU research in the US, but also in terms of reaching out to the broader IT world and to computer science departments and similar organizations working in this area[^2]. We may not be entirely isolated, but it seems like we're not managing to work together, and that's something we can afford to change. Something we can't afford *not* to change.

Anj

[^1]: This might not be exactly the right slide, as Vint's IIPC GA 2015 slides are not up yet. I got this slide from [here](http://wirth-symposium.ethz.ch/slides/cerf.pdf).
[^2]: For example, where is [Satya](http://www.cs.cmu.edu/~satya/) publishing stuff about Olive? Are the iPres bunch there?