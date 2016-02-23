{% assign series = site.data.cats[include.series] %}
{% if series.description %}
<h4>Blog Series: {{ series.title }}</h4>
<div class="hline"></div>
<p>
{{ series.description }}
</p>
{% assign tagged_posts = site.categories[include.series] %}
<ul class="popular-posts">
  {% for post in tagged_posts %}
  {% if post.shown != false %}
    <li>
      {% include _tag_icon.html post=post %}
      <p><a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title | truncate: 45 }}</a></p>
      <em>Posted: {{ post.date | date:"%Y-%m-%d" }}</em>
    </li>
  {% endif %}
  {% endfor %}
</ul>
<div class="clearfix"></div>
{% endif %}