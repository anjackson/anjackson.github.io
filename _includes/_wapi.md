<div class="panel panel-default" style="margin-bottom: 1.5em;">
  <div class="panel-body">
<p>
This is part of my <i>Web Archiving APIs series</i>, describing our evolving web archiving framework and tools. In particular, the aim is to document how our crawl architecture has evolved to become more modular, and to explore the idea of using APIs to make these systems more manageable over time.
</p>
<ul class="series-list">
  {% assign tagged_posts = site.tags["Web Archive APIs"] %}
  {% assign sorted_posts = tagged_posts | sort:"path" %}
  {% for post in sorted_posts %}{% if post.title != null and post.shown != false %}
    <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a></li>
  {% endif %}{% endfor %}
</ul>

  </div>
</div>
