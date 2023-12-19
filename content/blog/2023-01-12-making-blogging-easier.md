---
title: " Making Blogging Easier"
subtitle: This blog post was brought to you by NetlifyCMS
date: 2023-01-12T23:05:54.798Z
layout: post
author: anj
shown: true
url: null
aliases: null
---
I'm not really into new year resolutions, but I would like to get back into blogging. I'd like to be a better writer, and more regular practice must surely help? So, to lower the barriers to blogging I've modified my [Jekyll](https://jekyllrb.com/)-powered blog to add a simple content management system.

<!--break-->

I'm using [NetlifyCMS](https://www.netlifycms.org/), because it's quite easy to set up and does not interfere with how the site is generated.  Unlike a traditional CMS (such as Drupal, which I used to use to run this site), it doesn't require you to move you content into it.  Instead, it is a single-page JavaScript web application that understand how to talk to GitHub, and works with Markdown source files directly. It manages the editing process, makes adding images much easier, and integrates well with Netlify (which I was already using to host this site).

This kind of CMS is part of a growing trend in web development, separating the editorial workflow from the publishing stack (often a static site generator), to make each easier to manage and secure. You can find out more about this approach on the [Headless CMS JAMStack page](https://jamstack.org/headless-cms/).

There is one fly in the ointment: it looks like [NetlifyCMS is no longer being maintained](https://github.com/netlify/netlify-cms/discussions/6503). However, it's not the only Git-backed headless CMS around. The [StaticCMS](https://github.com/StaticJsCMS/static-cms) fork of NetlifyCMS looks particularly promising, so I'll be keeping an eye out for their [forthcoming migration instructions](https://staticjscms.netlify.app/docs/netlify-cms-migration-guide).

And if that plan fails, I can always go back to editing the files myself. If I get enough writing practice, perhaps the barrier to blogging won't seem so high.

__﻿UPDATE 2023-03-06:__ As well as the StaticCMS fork, it turned out that Netlify had been taking steps to ensure the longevity of the NetlifyCMS open source project.  The project [will be renamed DecapCMS](https://www.netlify.com/blog/netlify-cms-to-become-decap-cms/) and has been handed over [to a new company dedicated to it's development](https://decapcms.org/blog/2023/02/introducing-decap/). While it's not yet clear what the longer term commercial model will be, it's good to see an open source project being carefully transitioned to new ownership, rather than just abandoned.

