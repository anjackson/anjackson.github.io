---
title: Making websites archivable with JavaScript
subtitle: It's not always evil
date: 2023-03-08T20:00:06.910Z
category: building-web-archives
tags:
  - Websites
  - Web Archives
layout: post
author: anj
shown: false
---
A [recent comment](https://mstdn.social/@quinnanya/109982604342822356) from the [#DHNB2023](https://mstdn.social/tags/DHNB2023) conference caught my eye...

>﻿ If you just follow web archiving friendly standards, you'll have a really boring website.

W﻿hich made me laugh. But it also made me think about how we archive websites now, and I realized this isn't necessarily true anymore.

<﻿!-- break -->

T﻿he established view is pretty much that _JavaScript is bad_. The [UK National Archives compliance guidelines](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link6) put things more precisely. e.g.

>﻿  Dynamically-generated page content using client-side scripting cannot be captured.

T﻿his is certainly true in general, but it is also a reflection of the common ways websites are created. Maynwebsites use a content management system like Wordpress or Drupal, https://almanac.httparchive.org/en/2021/cms, where the same system is used for editing and for access, where pages are stored in a database, and where those pages are usually generated on demand.  These systems are often used to provide rich interfaces for searching and browsing, and those are heavily dependent on the back-end database to generate the vast number of possible views. 

Wo, a more modern pattern like the [JAM Stack]() moves a lot of the page generation complexity into the client browser as JavaScript, and talks to a back-end API. This gives us two problems, the complex JavaScript and the infinite possibilities of API calls.

M﻿odern patterns in how JavaScript is bundled and deployed often mean we can capture the front-end code. AndCB﻿ut we have got better at archiving JavaScript, thanks largely to the work of Webrecorder and tools like ArchivePage.web and Browsertrix. The dAPIs are the problem.

