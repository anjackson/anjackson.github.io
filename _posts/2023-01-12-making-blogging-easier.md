---
title: " Making Blogging Easier"
subtitle: This blog post was brought to you by NetlifyCMS
date: 2023-01-12T23:05:54.798Z
layout: post
author: anj
shown: true
---
I'm not really into new year resolutions, but I would like to get back into blogging. I'd like to be a better writer, and more regular practice must surely help? So, to lower the barriers to blogging I've modified my [Jekyll](https://jekyllrb.com/)-powered blog to add a simple content management system.

<!--break-->

I'm using [NetlifyCMS](https://www.netlifycms.org/), because it's quite easy to set up and does not interfere with how the site is generated.  Unlike a traditional CMS (such as Drupal, which I used to use to run this site), it doesn't require you to move you content into it.  Instead, it is a single-page JavaScript web application that understand how to talk to GitHub, and works with Markdown source files directly. It manages the editing process, makes adding images much easier, and integrates well with Netlify (which I was already using to host this site).

This kind of CMS is part of a growing trend in web development, separating the editorial workflow from the publishing stack (often a static site generator), to make each easier to manage and secure. You can find out more about this approach on the [Headless CMS JAMStack page](https://jamstack.org/headless-cms/).

There is one fly in the ointment: it looks like [NetlifyCMS is no longer being maintained](https://github.com/netlify/netlify-cms/discussions/6503). However, it's not the only Git-backed headless CMS around. The [StaticCMS](https://github.com/StaticJsCMS/static-cms) fork of NetlifyCMS looks particularly promising, so I'll be keeping an eye out for their [forthcoming migration instructions](https://staticjscms.netlify.app/docs/netlify-cms-migration-guide).

And if that plan fails, I can always go back to editing the files myself. If I get enough writing practice, perhaps the barrier to blogging won't seem so high.