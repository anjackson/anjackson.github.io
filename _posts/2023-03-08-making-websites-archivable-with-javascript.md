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
A [recent comment](https://mstdn.social/@quinnanya/109982604342822356) from the [\#DHNB2023](https://mstdn.social/tags/DHNB2023) conference caught my eye...

> ﻿ If you just follow web archiving friendly standards, you'll have a really boring website.

W﻿hich made me laugh. But it also made me think about how we archive websites now, and I realized this isn't necessarily true anymore.

<﻿!-- break -->

## Dynamic Dependencies

T﻿he established view is pretty much that *JavaScript is bad*. More precisely, as the [UK National Archives compliance guidelines](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link6) puts it:

> Dynamically-generated page content using client-side scripting cannot be captured.
> <small>[How to make your website archive compliant: Dynamically-generated content and scripts](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link6)</small>

T﻿his is certainly true in general, but it is also a reflection of the common ways websites are created. [Many websites use a content management system](https://almanac.httparchive.org/en/2021/cms) like Wordpress or Drupal, where the same system is used for editing and for access, where pages are stored in a database, and where the web pages are usually generated on demand.  These systems are often used to provide rich interfaces for searching and browsing, and those are heavily dependent on the back-end database to generate the vast number of possible views. 

> If your site uses databases to support its functions, these can only be captured in a limited fashion.
> <small>[How to make your website archive compliant: Database and lookup functions](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link9)</small>

The addition of client-side JavaScript usually makes this kind of thing worse. Design patterns like the [JAM Stack](https://almanac.httparchive.org/en/2021/cms) move a lot of the page generation complexity into the client browser as JavaScript, which talks to a back-end API to generate the page content. This gives us two problems, the complex JavaScript and the infinite possibilities of API calls.

But modern patterns in how JavaScript is bundled and deployed often mean we can capture the front-end code. And even when that's not the case, we have got better at archiving JavaScript, thanks largely to the work of [Webrecorder](https://webrecorder.net/) and tools like [ArchiveWeb.Page](https://archiveweb.page/) and [Browsertrix](https://github.com/webrecorder/browsertrix-crawler#readme). In general, it's not the client JavaScript that is the problem, the problem is that it's hard to work out what further resources the page is going to need when you use it.

But if JavaScript-heavy pages are explicit about their dependencies, and only read data from a server rather than updating it, they can be archived perfectly well.

Even emulators like [JSSpeccy](https://jsspeccy.zxdemo.org/) or [The Emularity](https://wiki.archiveteam.org/index.php/Emularity). Even text search systems like [ElasticLunr](http://elasticlunr.com/). Or rich faceted and interactive databases like [Datasette-Lite](https://github.com/simonw/datasette-lite#readme). Or even, up to a point, fully interactive computational environments like [JupyterLite](https://jupyterlite.readthedocs.io/en/latest/). As long as the dependencies can be determined, web archiving can work.

## Use Case: Tool Registries

https://quinndombrowski.com/projects/project-bamboo/

https://rd-alliance.org/system/files/filedepot/136/Lit%20Linguist%20Computing-2014-Dombrowski-llc-fqu026.pdf

https://web.archive.org/web/20131101102611/http://dirt.projectbamboo.org/

http://web.archive.org/web/20140127150038/https://wikihub.berkeley.edu/display/pbamboo/How+to+build+a+site+like+Bamboo+DiRT+using+the+Drupal+content+management+system Drpual and a lot of modules, 



## HTML & Javascript as a Preservation Platform


HTML + JavaScript is likely to remain a backward compatible platform for many years, 

https://minicomp.github.io/wax/

https://sql.js.org/#/

https://developer.mozilla.org/en-US/docs/Web/HTTP/Link_prefetching_FAQ