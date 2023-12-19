---
title: Migrating from Jekyll to Hugo
subtitle: It's been ten years. It's time for a change.
date: 2023-12-19T11:20:25.662Z
tags:
  - Websites
layout: post
author: anj
draft: false
---
About [ten years ago](https://github.com/anjackson/anjackson.github.io/commits/master/?since=2013-09-23&until=2013-12-31) I realised that, for a personal website, Drupal was far too much work to maintain. So I started migrating [that website](https://web.archive.org/web/20121223102901/https://anjackson.net/) to a static site system, specifically [Jekyll](https://jekyllrb.com/). This ran on GitHub Pages at first, and moved to Netlify later on. Looking back, I'm surprised I didn't blog about that in more detail. But perhaps it was because I never exactly finished the Drupal-to-Jekyll content migration!

But now, as I'm about to move jobs, I want to simplify and re-focus this site to better match where I'm headed.  I also want to move from Jekyll to the [Hugo](https://gohugo.io/) static site engine, as it's really fast and I'm more familiar with it than Jekyll at this point. It was during this process that I realised the original Drupal-to-Jekyll migration had broken quite a few things, so I've taken the opportunity to patch up some of the gaps.

Thankfully, these gaps were mostly _not_ around the maintaining the URLs, which I think I've managed reasonably well during these transitions. Static site engines usually support generating web pages from simple Markdown files, with URLs based on file names and paths, which makes them nice and explicit, and most support redirecting users from older URL aliases.  Because of this, the Jekyll-to-Hugo mapping was much simpler than the original shift from Drupal.

However, there are some differences in conventions, especially around the metadata declared at the start of each pages (a.k.a. [frontmatter](https://jekyllrb.com/docs/front-matter/)).  In some cases, these can be dealt with by modifying the Hugo configuration or templates, but in other cases it's easier to update the metadata itself. Apart from anything else, keeping the conventions close to those usually used by the static site generator means most of the existing themes and templates should work immediately.

Updating this embedded metadata may sound daunting, but the available tools these days are so good. A little searching soon led me to examples of using a tool called [`yq`](https://github.com/mikefarah/yq) to do exactly this kind of thing. For example, this little script takes a set of Markdown files, and updates three metadata fields, e.g. using [`aliases`](https://gohugo.io/methods/page/aliases/) instead of [`redirect_from`](https://github.com/jekyll/jekyll-redirect-from?tab=readme-ov-file#jekyllredirectfrom) to define the alternative URLs for a page:

```bash
#!/bin/bash

for arg in $@; do
    echo "Updating: $arg"
    yq -i -f "process" ".url = .permalink | del(.permalink)" $arg
    yq -i -f "process" ".aliases = .redirect_from | del(.redirect_from)" $arg
    yq -i -f "process" ".date = .created" $arg
done
```

But in other cases, configuration is a better tactic. For example, under Jekyll, the RSS feed for my site is at `https://anjackson.net/feed.xml`. By default, Hugo uses `index.xml`, but some investigation showed [there was a way to handle this via Hugo's configuration options](https://rimdev.io/creating-rss-feeds-using-hugo#the-xml-way), so I can maintain that URL by tweaking these options:

```toml
[outputFormats]
    [outputFormats.RSS]
        baseName = "feed"
```

The biggest problems from the original Drupal-to-Jekyll migration were around embedded resources, like the fairly complicated way Drupal connected images embedded in pages with the 'nodes' that define any embeddable images. This was a bit more complicated, requiring a custom [template](https://gohugo.io/templates/single-page-templates/) for image pages and a [shortcode helper](https://gohugo.io/content-management/shortcodes/) for re-using images in other pages.

The custom template is the most cumbersome part of this, as tweaking templates necessarily depends on the [theme](https://themes.gohugo.io/) that you're using. I'd already chosen [Blowfish](https://blowfish.page/) by this point, which already supported most of what I wanted, and provided a strong basis for minor modifications. For example, Blowfish has [simple hooks](https://blowfish.page/docs/partials/#custom-analytics-providers) for adding things like extra JavaScript, which I'm using to switch away from Google Analytics (I'm going to try [Umami](https://umami.is/) for a while).

With all these changes in place, I've mostly been tweaking how some parts are presented, e.g. the _Projects_, and flicking through various pages to look for problems (like fixing broken images in [this surprisingly popular piece of chocolate history](/2004/07/16/a-brief-history-of-aero/)). There's more to do, in particular the tags and categories are a bit of a mess, but I think things are good enough to go live.

So here... we... go...