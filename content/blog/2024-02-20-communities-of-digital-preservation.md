---
"0": F
"1": i
"2": r
"3": s
"4": t
"5": " "
"6": p
"7": u
"8": b
"9": l
"10": i
"11": s
"12": h
"13": e
"14": d
"15": " "
"16": "["
"17": o
"18": n
"19": " "
"20": t
"21": h
"22": e
"23": " "
"24": I
"25": I
"26": P
"27": C
"28": " "
"29": b
"30": l
"31": o
"32": g
"33": " "
"34": o
"35": n
"36": " "
"37": "2"
"38": "0"
"39": "2"
"40": "4"
"41": "-"
"42": "0"
"43": "2"
"44": "-"
"45": "1"
"46": "9"
"47": "]"
"48": (
"49": h
"50": t
"51": t
"52": p
"53": s
"54": ":"
"55": /
"56": /
"57": n
"58": e
"59": t
"60": p
"61": r
"62": e
"63": s
"64": e
"65": r
"66": v
"67": e
"68": b
"69": l
"70": o
"71": g
"72": .
"73": w
"74": o
"75": r
"76": d
"77": p
"78": r
"79": e
"80": s
"81": s
"82": .
"83": c
"84": o
"85": m
"86": /
"87": "2"
"88": "0"
"89": "2"
"90": "4"
"91": /
"92": "0"
"93": "2"
"94": /
"95": "1"
"96": "9"
"97": /
"98": c
"99": o
"100": m
"101": m
"102": u
"103": n
"104": i
"105": t
"106": i
"107": e
"108": s
"109": "-"
"110": o
"111": f
"112": "-"
"113": d
"114": i
"115": g
"116": i
"117": t
"118": a
"119": l
"120": "-"
"121": p
"122": r
"123": e
"124": s
"125": e
"126": r
"127": v
"128": a
"129": t
"130": i
"131": o
"132": n
"133": /
"134": )
"135": .
"136": " "
"137": T
"138": h
"139": a
"140": n
"141": k
"142": s
"143": " "
"144": t
"145": o
"146": " "
"147": O
"148": l
"149": g
"150": a
"151": " "
"152": H
"153": o
"154": l
"155": o
"156": w
"157": n
"158": i
"159": a
"160": " "
"161": f
"162": o
"163": r
"164": " "
"165": g
"166": i
"167": v
"168": i
"169": n
"170": g
"171": " "
"172": m
"173": y
"174": " "
"175": f
"176": i
"177": r
"178": s
"179": t
"180": " "
"181": d
"182": r
"183": a
"184": f
"185": t
"186": " "
"187": o
"188": f
"189": " "
"190": t
"191": h
"192": i
"193": s
"194": " "
"195": p
"196": o
"197": s
"198": t
"199": " "
"200": t
"201": h
"202": e
"203": " "
"204": c
"205": r
"206": i
"207": t
"208": i
"209": c
"210": a
"211": l
"212": " "
"213": f
"214": e
"215": e
"216": d
"217": b
"218": a
"219": c
"220": k
"221": " "
"222": i
"223": t
"224": " "
"225": n
"226": e
"227": e
"228": d
"229": e
"230": d
"231": .
title: Communities of Digital Preservation
subtitle: IIPC Blog Post on Preserving the Web with Open Source
date: 2024-02-20T22:44:19.202Z
category: communities-of-practice
tags:
  - Digital Preservation
  - Web Archives
layout: post
author: anj
draft: false
---
*By Andy Jackson, Web Archiving Technical Lead at the British Library (until January 2024)*

I joined the UK Web Archive early in 2012, during the build-up to [our very first UK domain crawl](https://britishlibrary.typepad.co.uk/webarchive/2013/04/non-print-legal-deposit-its-here-.html). As I started to understand what the team did, it became very clear that the collaboration with the wider IIPC web archiving community had been crucial to the team’s success, and would be a vital part of our future work.

The knowledge sharing and socialising at the [IIPC conferences](https://netpreserve.org/general-assembly/) provide the fundamental rhythm, but the web archiving community has arranged all sorts of beats over that bass drum. Not just special [events](https://netpreserve.org/events-archive/tools-development/), both online and in person (e.g. [technical training](https://netpreserveblog.wordpress.com/2015/02/25/iipc-technical-training-workshop) and a [hackathon](https://netpreserve.org/event/iipc-crawler-hackathon/?occurrence=2016-09-22) held at the British Library), but also through the way we build our shared tools. My research career had often involved using open source software, but in web archiving I began to understand how those same approaches had been used to share the load of developing standard practices, embodied by specialist tools. I also began to see how this could empower people and organisations to run their own web archiving operations.

## Buy or Build?

While the public awareness of web archiving has certainly risen over the years, it remains something of a niche concern. It has been over twenty years since a small group of cultural heritage organisations kicked things off, writing and sharing their own tools to archive the web. In the intervening years the heritage community has grown a great deal, but most of today’s archival web crawlers are still built on those first foundations. There seems to be a reasonable market for ‘medium-scale’ web archiving, with a few different vendors offering various services at that scale. But at the extremes, with personal web archiving at one end and Legal Deposit domain crawls at the other, there are all sorts of constraints that make it difficult to take advantage of those commercial offerings.

Sometimes, you have to build your own tools. But, if you must build your own, you can try to find others with similar needs and look for common ground to share. Open source licences and development practices have clearly been pivotal to helping this happen in web archiving, leading to the widespread use of Heritrix for web crawling and of the original Java Wayback playback engine. This was a success story I wanted to join in with, and a community I wanted to help grow.

## Barriers to Collaboration

Seeing this historical success, I took it for granted that *of course* our institutions would understand and support this. That anyone using these tools would be able and keen to collaborate. Why keep fixing the same bugs alone when we could fix each one once by working together?

That was very naive of me. There are lots of reasons why the open source model of collaboration can be difficult to adopt. The relationships between organisational needs and Information Technology service delivery are incredibly varied and complex. It can be very difficult to get the space and permission to experiment. It can be extremely difficult to build up or pull in the skills we need.

Even where people would like to collaborate more, there are often perfectly understandable personal or professional constraints that mean they can’t just pitch in. I am very fortunate that my direct managers and colleagues at the British Library supported my strategy of working in the open. I am also fortunate that I risk very little by doing so. It took me a while to realise what a privilege that is.

The desire to overcome these barriers was part of the reason why I helped [start up](https://netpreserveblog.wordpress.com/2018/10/12/oh-sos/) the [regular Online Hours calls](https://netpreserve.org/event/oh-sos/) to support the teams and individuals who rely on our shared tools, and provide a safe and friendly forum for anyone who is interested in talking about them.

## Investing in Open Source

I’ve also tried to support and encourage direct investment in shared tooling, both through IIPC and the British Library. I’ve been particularly pleased by [the project](https://netpreserve.org/projects/jupyter-notebooks-for-historians/) to extend the [GLAM Workbench to explore web archives](https://glam-workbench.net/web-archives/), [the project](https://netpreserve.org/projects/browser-based-crawling/) to help IIPC members make use of the [Browsertrix Cloud](https://netpreserve.org/projects/browser-based-crawling/) crawl system, and [the project](https://netpreserve.org/projects/pywb) to help everyone move from [OpenWayback to pywb](https://pywb.readthedocs.io/en/latest/manual/owb-transition.html). It’s also been great to see the increased adoption of the [webarchive-discovery](https://github.com/ukwa/webarchive-discovery#readme) WARC indexing toolkit, largely driven by the excellent [SolrWayback](https://github.com/netarchivesuite/solrwayback#readme) search interface project.

In January, I left the British Library [to work at the Digital Preservation Coalition](https://www.dpconline.org/news/andy-jackson-to-join-dpc-staff). I suspect I’ll reconnect with web archiving at some point in the future, in one form or another, but for now, I’m looking forward to taking what I’ve learned and applying it anew. Because at some point I realised that open source isn’t just about making do with not-much money. It’s about digital preservation too.

## Critical Dependencies

One of the core concepts in digital preservation is the idea of [Representation Information](https://wiki.dpconline.org/index.php?title=4.2.1.3_Representation_Information), which provides a way to formally recognise the *additional* information we need to make our collections accessible. Crucially, this includes software. After all, the thing that makes digital objects *digital* is the fact that we need software to use them.

This is where proprietary systems can become a significant risk to digital preservation. Perhaps the most important part of digital preservation is identifying single points of failure within the chain of dependencies that access requires. If playback depends on a single service provider, it’s at risk. Long-term preservation demands interoperability, which is why the [WARC standard](https://iipc.github.io/warc-specifications/specifications/warc-format/warc-1.1-annotated/) exists in the first place.

The WARC standard is our foundation stone, but that alone is not enough to make those frozen fragments sing. We can’t grasp what landed in our ‘response’ records without being able to understand the mechanisms that put them there. And we can’t analyse and explore our petrified webs without the software tools that bring them to life. There is no ‘ISO standard for playback’ (and I doubt such a thing is even possible), so we must instead preserve the *software* that makes playback work. This is why having at least one open source playback system is a crucial concern for the members of the IIPC.

But this is not just true for web archiving. This same story plays out across the whole of digital preservation. The wider shift to open source, and the work that the global community has put into open source implementations of widespread formats, has become the backbone of every digital preservation programme. We’re not out here re-implementing libtiff, or writing PDF readers based on the ISO spec. We’re all re-using open source implementations that are being maintained by the wider community. We’re all in the business of preserving *software*, at least to some degree.

## Communities of Practice

The success of the community-maintained [Web Archiving Awesome List](https://github.com/iipc/awesome-web-archiving), the way organisations have transitioned to pywb ([like this](https://netpreserveblog.wordpress.com/2024/01/22/migrating-to-pywb-at-the-national-library-of-luxembourg/)) and the growing support for Browsertrix Cloud show that the web archiving community understands this. That one way to sustainable, shared practices is through shared tools as well as common purpose. These tactics don’t only help established archives do their work, but also make it easier for ‘younger’ archives to join in and so grow the community around those tools.

My new role is all about helping digital preservation practitioners discover and build on the good practice of others. I will take what I’ve learned from web archiving with me, and come back to this community as an exemplar of what we can achieve when we work together.
