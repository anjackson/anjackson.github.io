---
title: Archiving Facebook, Right Now
subtitle: Cross-posted from the DPC blog
date: 2025-08-18T11:37:00.000+01:00
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
images:
  - /assets/images/uploads/img_20250818_114136~2b.jpg
description: If you need to archive a Facebook account now (like, right now),
  what should you do?
---
Originally published as [a DPC blog post](https://www.dpconline.org/blog/archiving-facebook-right-now).

----

Archiving social media is a long-standing concern for digital preservation, and a challenge that only seems to get more difficult as the years go by. Recently, we’ve had a couple of members raise questions in this area, and so I spent a little time looking at a specific example:

If you need to archive a Facebook account now, like, *right now*, what should you do? 

Because as far as I can tell, it’s a bit of a nightmare.

## One Does Not Simply…

In the past, I’ve spent a lot of time trying to use generic web archiving tools to archive social media accounts. It was difficult. They tend to get blocked from accessing the content, and tend to struggle to deal with the dynamic nature of these platforms. Some progress has been made more recently (see for example [this report from the British Library](https://blogs.bl.uk/webarchive/2024/10/archiving-social-media-with-browsertrix.html)), but still requires a significant amount of manual setup and review.

There are ‘turn key’ solutions out there, but the vast majority of the dedicated social media archiving tools appear to be aimed at commercial markets, focussing on things like legal compliance and brand management. As such, these tools are often too expensive for non-commercial organisations. Very few provide a way to export the collected material in a form suitable for long-term preservation. Crucially, perhaps because of the legal issues involved, these tools often have little or no support for retrospective capture, and so can’t get to material posted before the archiving service was set up. 

## Archivist, Export Thyself

The only alternative seems to be self-archiving, i.e. getting individuals to request a download of their information from the social media platform, and keeping that.  In general, this gathers much less context because individuals are usually not allowed to download information authored by other users. So you might only get half the conversation. But then, that’s better than nothing.

One positive here is that this approach does seem to be actively supported by Facebook, with reasonably decent documentation on the process available here: [Export a copy of your Facebook information | Facebook Help Centre](https://www.facebook.com/help/212802592074644/)

That page makes the overall process pretty clear, but there are some details that are worth unpacking a little.

Firstly, the export comes in two ‘flavours’: HTML or JSON. However, these are not simply different encodings of the exactly the same data. Both are *intended* to contain the same information, but in practice the HTML one is 'lossy' and contains less information than the JSON one because they are aimed at slightly different use cases:

* The HTML version stores the data as a set of web pages and web page fragments. This means it's immediately accessible without additional tools (just a web browser) but is not easy to analyse or move into different platforms.  
* The JSON version attempts to store the 'raw' data in a machine-readable form, so could in theory be used to move between platforms. However, if you want to understand what’s in there, you’ll need additional software.

This is in sharp contrast to the [X (nee Twitter) download archive](https://help.x.com/en/managing-your-account/how-to-download-your-x-archive) or [the Flickr Lifeboat](https://www.flickr.org/programs/content-mobility/data-lifeboat/), which cleverly provide the export as ‘raw’ JSON data but include an HTML \+ JavaScript viewer in the package that makes the JSON accessible via a standard web browser.

## Time & Space

As well as the format, the Facebook platform also needs you to specify how far back in time the export should go, and the quality of the media that are exported. Depending on the situation, these two choices may well be more important than the choice of data format\!

Putting all this together, to maximise the captured information (at the cost of having to work out how access works later on) the best option seems to be:

* Asking to export the 'Available Information' (all information except 'data logs' which appear to be Facebook’s data about your data and not very useful),  
* With a date range of 'All time',  
* In JSON format,  
* Media quality at 'high’, which will hopefully return the closest thing to the original media uploads.

However, what the documentation doesn’t say is: how long will this take?

I tried it with my own account, and it only took a few minutes, but I’m a very light user of Facebook. The total download was just 73MB of compressed data.

Has anyone out there tried this with a large, media-heavy account? I’d be fascinated to know how long it takes\!

## Export Them All

While you can only choose either HTML or JSON when requesting a data export, you are allowed to submit multiple download requests. While one individual export might be slow, given what we know about Facebook's scale and architecture, there is no reason to suspect that requesting multiple exports will somehow interfere with themselves and slow things down. Maybe we can export all the things\!

If time is short, it might make sense to queue up three export requests:

1. JSON format, with the shortest date range you are comfortable with, and with the media quality at the default of 'medium'. (Critical information version)  
2. JSON format, but 'all time' and 'high quality'. (Maximum information version)  
3. HTML format, 'all time' and 'medium quality'. (Easy access version)

Doing this means you should at least get the first export and get something useful. If the second export works, then that can supersede the first. And if the third export works, you can keep that as well, and it can act as an 'access copy' if there are problems accessing the JSON version.

## Or What?

Is this really the best we can do? Are there other options I’ve missed? What about other platforms, like Instagram? Is that all tied into Meta now? 

Is there any advice out there about how that works right now?

If you have any information that might help, please get in touch\!
