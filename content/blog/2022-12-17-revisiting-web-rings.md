---
title: Revisiting Web Rings
subtitle: Once upon a time, there was a more distributed social web...
category: mining-web-archives
tags: ["Websites"]
layout: post
author: anj
shown: true
---

Recently, for _no particular reason I'm sure_, there seems to have been a renewed interest in more distributed and community-oriented ways of finding good stuff on the web. In particular, the ancient[^1] idea of [web rings](https://en.wikipedia.org/wiki/Webring) seems to keep coming back (as illustrated by [the webring page on the IndieWeb wiki](https://indieweb.org/webring)). 

I particularly like the look of [this Webring Kit](https://mxb.dev/blog/webring-kit/), but a recent [Twitch stream](https://www.twitch.tv/whitep4nth3r) by [@whitep4nth3r](https://indieweb.social/@whitep4nth3r) about [The Claw Webring](https://github.com/whitep4nth3r/the-claw-webring) made me realise I'd forgotten exactly how web rings used to look and function back in the 90's.

Can I use web archives to find out?

<!--break-->

## Overall Trends

I started by searching in the [historical search index](https://www.webarchive.org.uk/shine) hosted by the [UK Web Archive](https://www.webarchive.org.uk/), which points you [Internet Archive](http://web.archive.org) items that match your search query[^2]. Using the search term `webring OR "web ring"`, the [overall trend](https://www.webarchive.org.uk/shine/graph?query=webring+OR+%22web+ring%22&year_start=1996&year_end=2013&action=update) looks like this:

[![Trend graph for webrings from 1996 to 2013](/blog/images/2022-12-17-remembering-web-rings/webring-shine-trend.png)](https://www.webarchive.org.uk/shine/graph?query=webring+OR+%22web+ring%22&year_start=1996&year_end=2013&action=update)

Although clearly a minority interest (peaking at only ~0.15% of the total volume of pages crawled), the time span of web rings was much wider than I was expecting.  Looking at [the detailed results list](https://www.webarchive.org.uk/shine/search?query=webring+OR+%22web+ring%22&tab=results&action=search&facet.in.content_type_norm=%22html%22) shows there are over _two million_ snapshots of web pages that matched!

Leafing through the first few results, the standout page is 1996's [www.webring.org](http://web.archive.org/web/19961019055613/http://www.webring.org:80/). I think this was the first (and the largest) web ring service, and as such the [www.webring.org web ring index and showcase](http://web.archive.org/web/19961019060929/http://www.webring.org/rings.html) provides a gateway to a potentially huge number of web rings (as long as the web crawler managed to get to them before they went away!).

[![www.webring.org list of rings from 1996](/blog/images/2022-12-17-remembering-web-rings/1996-www.webring.org-rings.png)](http://web.archive.org/web/19961019060929/http://www.webring.org/rings.html)

With so many links to follow, I'm only going to scratch the surface here. So I encourage you to explore the archives yourself, and let me know what gems you find!

<div class="row">
  <div class="alert alert-warning col-md-10 col-md-offset-1 text-center" role="alert">
    As ever, there's all sorts of stuff in web archives, so as you browse around you may accidentally come across adult or otherwise inappropriate content. <br/>Usually the title or URL of the links should make it clear, but <i>do browse carefully</i>.
  </div>
</div>

## How They Looked

In terms of looks, there seem to be three rough classes of web ring.  Some are just simple text...

[![Stone Circle web ring](/blog/images/2022-12-17-remembering-web-rings/stone-circle-webring.png)](http://web.archive.org/web/20050206151413/http://www.ancient-stones.co.uk/borders/031/034/details.htm)

[![Open Views web ring](/blog/images/2022-12-17-remembering-web-rings/openviews-webrings.png)](http://web.archive.org/web/20040101001119/http://www.openviews.org.uk:80/#webrings)


But others extend this to add images for the main web ring home page, and to take you to the next link, in a wide banner format:

[![DALnet web ring](/blog/images/2022-12-17-remembering-web-rings/dalnet-webring.png)](http://web.archive.org/web/19961112175309/http://www.nwnet.co.uk:80/British/)

[![Gillian Anderson web ring](/blog/images/2022-12-17-remembering-web-rings/gillian-anderson-webring.png)](http://web.archive.org/web/19970209111906/http://www.pstewart.demon.co.uk/ga/ga.htm)

[![Cat ring](/blog/images/2022-12-17-remembering-web-rings/cat-ring-webring.png)](http://web.archive.org/web/19961219043238/http://www.lowdon.demon.co.uk:80/)

However, these wide banners seem to have fallen out of favour, and most of the web rings I found use a more compact form:

[![Art Historians Circle](/blog/images/2022-12-17-remembering-web-rings/art-historians-circle.png)](http://web.archive.org/web/20010223221126/http://nouveaunet.com/arthistory/step1.htm)

[![Church of England web ring](/blog/images/2022-12-17-remembering-web-rings/coe-webring.png)](http://web.archive.org/web/20010103174600/http://www.christchurchclifton.org.uk/links.htm)

[![eBooks web ring](/blog/images/2022-12-17-remembering-web-rings/ebooks-webring.png)](http://web.archive.org/web/20120101010753/http://www.treasurebook1.co.uk:80/contact_us.php)

[![UK Waterways web ring](/blog/images/2022-12-17-remembering-web-rings/uk-waterways-webring.png)](http://web.archive.org/web/20120101002904/http://www.coobeastie.co.uk:80/ranking/index.php?id=47)

[![Fossil Dealers web ring](/blog/images/2022-12-17-remembering-web-rings/fossil-dealers-webring.png)](http://web.archive.org/web/20040101000004/http://www.thedugoutrockshop.co.uk:80/prod53.htm)

With some sites belonging to lots of web rings:

[![Music Corner web rings](/blog/images/2022-12-17-remembering-web-rings/musiccorner-webrings.png)](http://web.archive.org/web/20040101000738/http://www.musiccorner.co.uk:80/web_rings.html)

<h2>How They Worked</h2>

The web ring banners usually provide links back to the web ring home page, and as long as they were crawled successfully, we use those links to find more information about how they worked. I particularly liked this detailed example:

[![Navel History web ring homepage](/blog/images/2022-12-17-remembering-web-rings/navel-history-webring-homepage.png)](http://web.archive.org/web/20001121131800/http://www.navships.org/)

At a technical level, these web rings relied on a centralized service, where the actual ring was managed. Each banner on each site linked to the web ring service, embedding some kind of site identifier along with the action that should be performed.  e.g. to go to the next site in the _NavShips History Ring_, the link points to:

    http://www.webring.org/cgi-bin/webring?ring=navships;id=002;next

Where the ring itself is identified by `ring=navships`, the current site on the ring identified by `id=002`, and finally the requested action `next`. When the user visited this link, the `www.webring.org` server would look up the ring and site, and redirect the user on to the next site on the ring.

There may well be other mechanims, but the ones I've found seem to work in this way.

## Building A Modern Web Ring

In principle, anyone could host a web ring, but maintaining a web ring service is not trivial, so a handful of centralized services dominated the scene by offering a free service (and presumably making money from the ring data and/or complementary services). This is a familiar pattern: many technologies that can work in a distributed fashion _in principle_ end up centralized for socio-economic reasons[^3].

Which makes me wonder... Given where we are now and what technologies and services are available, can we recreate web rings in a way that makes them trivially easy to host and maintain?  Perhaps one of the recent re-imaginings I mentioned earlier have already addressed this? Or perhaps I'll have a go at building something...

---

[^1]: I'm reliably assured the 1990's now counts as ancient history. This is upsetting.
[^2]: Disclaimer: I helped build this historical search service, so I'm biased towards liking it!
[^3]: I read somewhere that these reasons included fairly aggressing trademark litigating from _webring.org_ claiming ownership of the term _'Web Ring'_, but I can't find the evidence of this to link to. Sorry!