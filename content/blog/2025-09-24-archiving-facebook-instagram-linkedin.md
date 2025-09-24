---
title: Archiving Facebook, Instagram & LinkedIn
subtitle: Cross-posted from the DPC blog.
date: 2025-09-24T16:16:00.000+01:00
category: null
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
description: A follow up to 'Archiving Facebook, Right Now', extending the work
  to look at Instagram and LinkedIn.
---
Originally published as [a DPC blog post](https://www.dpconline.org/blog/archiving-facebook-instagram-linkedin).

----

After publishing [Archiving Facebook, Right Now](https://www.dpconline.org/blog/archiving-facebook-right-now) we got quite a lot of comments, feedback and ideas ([LinkedIn](https://www.linkedin.com/posts/andrewnjackson_archiving-facebook-right-now-activity-7363160479235469313-zCti/), [Mastodon](https://digipres.club/@anj/115049307178570137)).  I was rather hoping someone would appear and say "You've got it all wrong, it's easy!" and outline the workings of some suitable solution.  But so far everything I've seen boils down to either labour-intensive web archiving, API-based downloads or accepting individual data exports. It remains difficult to find clear, publicly available documentation of techniques that work and of outputs that can be preserved.
## Revisiting Facebook
For the web archiving approach, the only report I've found on the "start of the art" came from [Ed Summers](https://inkdroid.org/about/), who got in touch to say that he'd [recently spent a bit of time seeing how well Browsertrix and ArchiveWebPage work at archiving Facebook posts](https://social.coop/@edsu/114892046975684287). I believe Webrecorder are working on the issues he documented so thoroughly, but at the time of writing no fix or update has been release.

Relatedly, [Anders Klindt Myrvoll](https://www.linkedin.com/in/andersklindt) of the national Danish web archive ([Netarkivet](https://www.kb.dk/en/find-materials/collections/netarkivet)) pointed out these two reports based on data gathered from Facebook:

- [The Digital Community Centres of Denmark - Analysis & Numbers](https://www.andnumbers.com/cases/digital-community-centres-of-denmark)
- [Verbal Attacks in the Public Debate - Analysis & Numbers](https://www.andnumbers.com/cases/verbal-attacks-in-the-public-debate)

The team that created the Facebook 'web scraper' for this research provided some technical details here: [Past, Present & Future of Cross-Institutional Collaboration in Web Archiving: Insights from the Norwegian and Danish Web Archive, the NetArchiveSuite Community, & Beyond - Slide 22 - UNT Digital Library](https://digital.library.unt.edu/ark:/67531/metadc2472430/m1/22/). It makes for a sobering read, underlining the very high degree of technical sophistication required in order to gather the data without being blocked by Facebook. While these projects were not technically _archiving_ Facebook content, they do provide an indication of what it might take to do so, and are compelling examples of what kind of research such an archive could support.

## The APIcalypse 
The state of API-based archiving was the subject of this [IIPC WAC 2024 Panel: Archiving Social Media In An Age of APIcalypse](https://www.youtube.com/watch?v=CqsVFnUheqQ). Watching this, I realised that it's not so much that this is impossible work, it's just simply that the cultural heritage sector has been priced out of it. These companies own the land our public record stands on, and there will be tithes.

The research reflected in the panel showed possible ways forward. A tool to try ([medialab/minet](https://github.com/medialab/minet)). A call for collaboration. For advocating for a different future, while pooling the record of the past. Anonymisation and opt outs. But by necessity operating beyond corporate terms of service and perhaps even the limits of the law. Researchers leading where institutions may fear to tread, further straining the thrumming tension between short-term funding and ever-shrinking business-as-usual budgets.

The brightest glimmer came at the end, with question based on the legislation around on data portability (e.g. GDPR, and [the right to data portability in the UK](https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/individual-rights/individual-rights/right-to-data-portability/)) and the possibility of data donations. In other words, relying on data exports rather than API access, as I have been doing here.

After watching the panel, I realised a good application of this approach was the [Analysis & Figures](https://www.ogtal.dk/crowdsourcingdata) project that Anders had mentioned to me. For example, their [Ogtal data dumper](https://data.svc.ogtal.dk/) gives instructions (in Danish) for exporting your data from YouTube, Instagram and TikTok  social media so you can donate it to help understand how the platforms work. Making the most of data exports still seems like the best way forward right now.

## Instagram Options
The [official documentation](https://help.instagram.com/181231772500920/) seem indicate that the Instagram data exports work in much the same way as the Facebook exports (and have done since [late 2023 at least](https://web.archive.org/web/20231122194028/https://help.instagram.com/181231772500920)). The options are very similar: HTML or JSON and a choice of timeframes and media quality levels.  As such, the advice in the previous post seems to apply here too.

If those exports are not sufficient, some other options were also mentioned to me. One was this [low-tech Instagram archive](https://github.com/forummuenchen/archive-instagram) inspired by Alex Chan's [using static websites for tiny archives](https://alexwlchan.net/2024/static-websites/) (I should point out that Alex built the Data Lifeboat mentioned in the previous post) as well as [Ed Summer's 'pincushion' for Historypin](https://inkdroid.org/2024/10/20/pincushion/).

Another was [Instaloader](https://instaloader.github.io/), which looks powerful but is nevertheless some way off from being the kind of simple tool and archivist can used to quickly preserve an Instagram account.

## LinkedIn Exports
I also wanted to look at LinkedIn exports, as I'd been told the downloads were simpler but that this also meant they were lacking the images and video you had uploaded to the site.

This is indeed the case, but the full story is quite curious. After requesting an export of my data, the system quite quickly offered me a result, but this was an initial 'basic' download.  A few hours later, a 'complete' download was ready and could be used instead of the 'basic' one.  I've not quite worked out what the difference is exactly. All I know is that they are both in CSV format, and neither contain anything other than textual and numeric CSV data. Images and videos were indeed missing.

However, one of the CSV files was called `Rich_Media.csv`, and taking a closer look, it turned out that this was a fairly simple list of images and videos. One of the columns was a URL, and following that URL gets you to the media file in question. So, the export is technically complete, but not self-contained. To complete it, we need to download these items while maintaining the link between the rows in the CSV file and the media we get.

Remarkably, there do not seem to be many user-friendly tools that will do this.

The problem is that the URLs are quite big and messy, and so most normal downloaders will modify or discard them when creating the file. With the URL gone, it's not clear how to cleanly link items to rows without resorting to creating custom code. 

The simplest thing I could think of was to store the downloaded items in [WARC](https://en.wikipedia.org/wiki/WARC_(file_format)) files, as this records the full URLs. This does reduce the number of tools that could be used, but at least the process doesn't require custom code or scripting, and the results can be inspected using standard web archiving tools.

### ArchiveBox
I started by trying [ArchiveBox](https://archivebox.io/) which is a powerful tool that includes a graphical user interface you can access via a web browser. I did find I needed to use the command line to set up a local instance, but you could use a hosted version instead (e.g. [PikaPods](https://www.pikapods.com/apps#bookmarks), more options [here](https://github.com/ArchiveBox/ArchiveBox?tab=readme-ov-file#quickstart)). Once set up, it was relatively straightforward to give it a list of URLs to download. It even managed to cope with just being given the CSV file directly and parsed out the URLs without a fuss. 

One surprising feature to be aware of is that the default configuration automatically submits all URLs to the Internet Archive, so they can independently download and copy and make it available via the [Wayback Machine](https://web.archive.org/). Which is a very cool feature, but in the context of exporting a personal archive, was a bit of a surprise! It also slowed things down quite a lot, but it was fairly easy to avoid/switch off once I was aware of it.

Similarly, a few of the standard additional downloaders or extractors are on by default, even if the underlying tool they depend on isn't installed. This leads to the download process throwing some errors, but these are harmless. These can also be switched off if they errors are causing problems.

The only real difficulty I had with ArchiveBox was getting the archives _out_. Each item was recorded separately in it's own WARC, and it wasn't easy to pull these out into a single file that could be kept alongside the source CSV long term. 

### Wget
If we resign ourselves to working at the command line, that opens up some more options. For example, the venerable [Wget](https://www.gnu.org/software/wget/) has been around since 1996 and has supported the WARC format since 2012. It's so widespread you may find it's already installed on your computer!

I have Windows laptop, but with Ubuntu installed on top [in the offically supported Microsoft manner](https://learn.microsoft.com/en-us/windows/wsl/install). Wget was already present, but a little more help was needed as it won't use the CSV file directly. You have to make a file which is a plain list of URLs.

I chose to use [csvkit](https://csvkit.readthedocs.io/) to do this. It's a Python tool, so with Python installed I just needed to run 

```sh
pip install csvkit
```

After which, I could run:

```sh
csvcut -c "Media Link" Rich_Media.csv | csvformat -E > urls.txt
```

This grabs the whole CSV file, 'cuts' out just the column called `Media Link`, and passes that column to a command that reformats it without the `Media Link` column header. What's left is just the list of URLs which is placed in the `urls.txt` file.

This can then be used to download the files:

```sh
wget -O /dev/null --warc-file="Rich_Media" --no-verbose --wait=3 -i urls.txt
```

This looks a bit intimidating, but just means it will quietly download the resources to a file called `Rich_Media.warc.gz`. The command will also wait for three second between downloads, which is just my guess at the kind of delay that might help ensure you don't get blocked for downloading things too fast.

Not as user-friendly as a web interface, but something that could be wrapped in a simple script by a user who is okay with working at the command line.

## Back to you
This seems like a good point to stop, take a breath, and ask for feedback.  Are these kinds of solutions any use? Are there other tools or tactics I could try? Please do let us know what you think!
