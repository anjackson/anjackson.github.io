---
title: archive
layout: default
permalink: /archive/
---

{% comment %} This first capture lists all the tags from all the pages and assembles them into a sorted list. {% endcomment %}

{% capture tags %}{% for post in site.pages %}{% for tag in post.tags %}{{ tag }},{% endfor %}{% endfor %}{% endcapture %}
{% assign sortedtags = tags | split:',' | sort %}

{% comment %} This second capture removes all of the duplicates from that sorted list. {% endcomment %}

{% capture unique_tags %}{% for tag in sortedtags %}{%if tag != prev_tag %}{{ tag }}{% unless forloop.last %},{% endunless %}{%assign prev_tag = tag %}{% endif %}{% endfor %}{% endcapture %}
{% assign tags_list = unique_tags | split:',' | sort %}

<ul class="tag-box inline">
  {% for tag in tags_list %}
    <li><a href="#{{ tag }}">{{ tag }}</a></li>
  {% endfor %}
</ul>

<hr/>

{% for tag in tags_list %}
  <h3 id="{{ tag }}">{{ tag }}</h3>
  <ul>
  {% for post in site.pages %}
    {% if post.tags contains tag %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endif %}
  {% endfor %}
  </ul>
{% endfor %}


