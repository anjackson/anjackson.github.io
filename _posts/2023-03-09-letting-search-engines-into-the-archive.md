---
title: Letting search engines into the archive
subtitle: Beware the greedy Googlebot
date: 2023-03-09T08:23:04.999Z
category: mining-web-archives
tags:
  - Web Archives
layout: post
author: anj
shown: false
---
Usually we don't let search engines index web archives.  When sites are still live, we don't want the archived version to intefere with the search results. And the ethical implications of making dead sites available via search engines are not clear. (In fact, unless I'm missing something, that seems like an area that needs more analysis and research.)

But in the case of the [European Dialogue NGO](https://www.webarchive.org.uk/wayback/archive/20190312121945/http://www.europeandialogue.org/), they have not only given us permission to make the site openly accessible, but also explicitly requested that we make it accessible to search engines.

<!--break-->

The question was, how to we modify our [`robots.txt`](https://www.robotstxt.org/) to make this possible? i.e. how to we get  URLs like this indexed:

[https://www.webarchive.org.uk/wayback/archive/_VARIABLE-TIMESTAMP_/http://www.europeandialogue.org/_RESOURCE-PATH_](https://www.webarchive.org.uk/wayback/archive/*/http://www.europeandialogue.org/)

Without allowing access to everything under <https://www.webarchive.org.uk/wayback/archive/...>

Fortunately, most search engines implement `Allow:` as well as `Disallow:` URL prefix-matching, and permit wildcards in the declared prefixes. Taking into account the fact that apparently some search engines may stop parsing on the first matching rule, we end up with:

```
# Default settings for robots:
User-agent: *
# Allow search engines to index specific sites:
Allow: /wayback/archive/*/http://www.europeandialogue.org/
# Otherwise, avoid archives copies of websites interfering with live sites search presence:
Disallow: /wayback/
```

Which seems to work well, in that both the [Google robots.txt Tester](https://support.google.com/webmasters/answer/6062598?hl=en) and the [Google Search Console](https://search.google.com/search-console/about) seem to be happy with the syntax.

By the way, it's certainly worth testing using both of the tools, as I found they didn't necessarily agree. While working on this, I'd accidentally put the two `robots.txt` directives in separate `User-agent: *` sections, something like this:

```
User-agent: *
Disallow: /wayback/

...other rules...

User-agent: *
Allow: /wayback/archive/*/http://www.europeandialogue.org/*
```

This was considered valid by the standalone tester tool, but the search console did not accept it.

However, despite successfully requesting indexing of the URL in the Google Search Console, the site still is not getting indexed.  As far as I can tell, it seems that this is likely because there are no links that page. If that's the case, then we need to think more deeply about how we integrate these indexing exceptions into our main site.

So, to confirm whether the lack of links is the issue, I'm writing this blog post that points [directly to the archived page in question](https://www.webarchive.org.uk/wayback/archive/20190312121945/http://www.europeandialogue.org/) and also to [the calendar page for that site](https://www.webarchive.org.uk/wayback/archive/*/http://www.europeandialogue.org/). Hopefull we'll soon find out if these incoming links encourage the `Googlebot` to poke it's nose into the archive...