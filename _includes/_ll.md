<div class="panel panel-default" style="margin-bottom: 1.5em;">
  <div class="panel-body">
<p>
This is part of my <i>Lessons Learned series</i>, covering aspects of digital preservation that I've been forced to reconsider over the years. So far, the posts published in this series are:
</p>
<ul class="series-list">
  {% assign tagged_posts = site.tags["Lessons Learned"] %}
  {% assign sorted_posts = tagged_posts | sort:"series-position" %}
  {% for post in sorted_posts %}{% if post.title != null and post.shown != false %}
    <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a></li>
  {% endif %}{% endfor %}
</ul>

  </div>
</div>
