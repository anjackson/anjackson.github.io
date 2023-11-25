---
layout: blog
permalink: /blog/tags/
title: Tag Index
description: "An archive of posts sorted by tag."
---

{% capture site_tags %}{% for tag in site.tags %}{{ tag | first }}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
{% assign tags_list = site_tags | split:',' | sort %}

<ul class="tag-box inline">
  {% for item in (0..site.tags.size) %}{% unless forloop.last %}
    {% capture this_word %}{{ tags_list[item] | strip_newlines }}{% endcapture %}
    <li><a href="#{{ this_word | replace: ' ','' }}">{{ this_word }} <span class="badge badge-theme">{{ site.tags[this_word].size }}</span></a></li>
  {% endunless %}{% endfor %}
</ul>

<hr/>

{% for item in (0..site.tags.size) %}{% unless forloop.last %}
  {% capture this_word %}{{ tags_list[item] | strip_newlines }}{% endcapture %}
  <h2 id="{{ this_word | replace: ' ','' }}" style="padding-top: 70px; margin-top: -70px;">{{ this_word }}</h2>
  <ul class="post-list">
  {% assign tagged_posts = site.tags[this_word] %}
  {% assign sorted_posts = tagged_posts | sort:"date" %}
  {% for post in sorted_posts %}{% if post.title != null %}
    <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }} - <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span></a></li>
  {% endif %}{% endfor %}
  </ul>
{% endunless %}{% endfor %}