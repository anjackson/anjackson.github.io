{% assign series = site.data.cats[include.series] %}
{% if series.description %}
<div class="panel panel-default" style="margin-bottom: 1.5em;">
  <div class="panel-body">
<p>
{{ series.description }}
</p>
<ul class="series-list">
  {% assign tagged_posts = site.categories[include.series] %}
  {% if tagged_posts %}
  {% assign sorted_posts = tagged_posts | sort:"path" %}
  {% for post in sorted_posts %}{% if post.title != null and post.shown != false %}
    <li><a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a></li>
  {% endif %}{% endfor %}
  {% endif %}
</ul>

  </div>
</div>
{% endif %}