---
title: Making websites archivable with JavaScript
subtitle: It's not always evil
date: 2023-03-10T20:00:06.910Z
category: building-web-archives
tags:
  - Websites
  - Web Archives
layout: post
author: anj
shown: true
url: null
aliases: null
---
A [recent comment](https://mstdn.social/@quinnanya/109982604342822356) from the [\#DHNB2023](https://mstdn.social/tags/DHNB2023) conference caught my eye...

> If you just follow web archiving friendly standards, you'll have a really boring website.

Which made me laugh. But it also made me think about how we archive websites now, and I realized this isn't necessarily true anymore.

<!--break-->

## Dynamic Dependencies

The established view is pretty much that *JavaScript is bad*. More precisely, as the [UK National Archives compliance guidelines](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link6) puts it:

> Dynamically-generated page content using client-side scripting cannot be captured.\
> <small>[How to make your website archive compliant: Dynamically-generated content and scripts](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link6)</small>

This is certainly true in general, but it is also a reflection of the common ways websites are created. [Many websites use a content management system](https://almanac.httparchive.org/en/2021/cms) like Wordpress or Drupal, where the same system is used for editing and for access, where pages are stored in a database, and where the web pages are usually generated on demand.  These systems are often used to provide rich interfaces for searching and browsing, and those are heavily dependent on the back-end database to generate the vast number of possible views. 

> If your site uses databases to support its functions, these can only be captured in a limited fashion.\
> <small>[How to make your website archive compliant: Database and lookup functions](https://www.nationalarchives.gov.uk/webarchive/archive-a-website/how-to-make-your-website-compliant/#Link9)</small>

The addition of client-side JavaScript usually makes this kind of thing worse. Design patterns like the [JAM Stack](https://almanac.httparchive.org/en/2021/cms) move a lot of the page generation complexity into the client browser as JavaScript, which talks to a back-end API to generate the page content. This gives us two problems, the complex JavaScript and the infinite possibilities of API calls.

But modern patterns in how JavaScript is bundled and deployed often mean we can capture the front-end code. And even when that's not the case, we have got better at archiving JavaScript, thanks largely to the work of [Webrecorder](https://webrecorder.net/) and tools like [ArchiveWeb.Page](https://archiveweb.page/) and [Browsertrix](https://github.com/webrecorder/browsertrix-crawler#readme). In general, it's not the client JavaScript that is the problem, the problem is that it's hard to work out what further resources the page is going to need when you use it.

But if JavaScript-heavy pages are explicit about their dependencies, and only read data from a server rather than updating it, they can be archived perfectly well.

Even emulators like [JSSpeccy](https://jsspeccy.zxdemo.org/) or [The Emularity](https://wiki.archiveteam.org/index.php/Emularity). Even text search systems like [ElasticLunr](http://elasticlunr.com/). Or rich faceted and interactive databases like [Datasette-Lite](https://github.com/simonw/datasette-lite#readme). Or online format identification tools like [Siegfried JS](https://siegfried-js.glitch.me/). Or even, up to a point, fully interactive computational environments like [JupyterLite](https://jupyterlite.readthedocs.io/en/latest/), or [Linux](https://bellard.org/jslinux/)!. As long as the dependencies can be determined, web archiving can work.

## Use Case: Registry/Directory Sites

There's a lot of dead projects and long-lost data-driven sites. Wikis, tool directories, format registries, generated by short-term project funding, which then struggle to stay alive after the project ends. Web archiving can help, but usually rich search and browse interfaces are lost, because the back-end database is needed to make that happen.

## Minimal Computing & Static Sites

The idea of [Minimal Computing](https://go-dh.github.io/mincomp/about/) can help here, particularly static website tools like the [WAX digital exhibitions system](https://minicomp.github.io/wax/). WAX takes simple inputs (CSV files and images) and generates static HTML pages, along with a ElasticLunr client-side search system. The search feature require a JSON file, <https://minicomp.github.io/wax/search/index.json>, which contains the index data. As things are, a web crawler would probably not manage to spot that automatically, but that's the only problem from a web archiving point of view.

This model, using HTML + JavaScript as a sustainable platform, is a very appealing one.  Both HTML and JavaScript are likely to remain a backward-compatible platform for many years, and even if the JavaScript breaks, we only lose the search functionality. 

(This point was also explored as a small part of [Ed Summer's](https://inkdroid.org/about/) excellent post on [The Web as a Preservation Medium](https://inkdroid.org/2013/11/26/the-web-as-a-preservation-medium/).)

## Richer Sites on Static Assets

Which all leaves me wondering if it would be useful to build on the WAX approach and develop a toolkit for registry or directory-style web sites? What features could we add?

### Database Included

By bringing in tools like the aforementioned _Datasette-lite_, or similar systems like [sql.js](https://sql.js.org/), it would be possible to embed a full copy of the underlying database as a static asset (e.g. an sqlite file).  This could be used to power more complex interfaces, like faceted browsing, but could also be downloaded and used directly.

### Data Published

Each item from the underlying database could also be published in machine-readable format as well as HTML pages. e.g. a JSON URL for every page, acting as an API making the raw data easier to access and re-use. (WAX may already do this, but I haven't managed to confirm this yet.)

### Dependencies Declared

With the WAX example, the only thing preventing easy web archiving was that the `index.json` dependency wasn't explicitly declared in the HTML.  It would be great to design and promote a standard practice for declaring such dependencies, e.g. as 
[pre-fetch link directives](https://developer.mozilla.org/en-US/docs/Web/HTTP/Link_prefetching_FAQ). With those in place, even simple web crawlers would be able to find everything we need to archive the site.

But then, perhaps that's beside the point. If more people made more sites using techniques that last longer and cost less to sustain, we might hope for a web that needs less archiving.
