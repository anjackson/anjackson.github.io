{% assign series = site.data.cats[include.series] %}
{% if series.description %}
<div class="btn-group" style="width:100%; margin-bottom: 12px;" role="group" aria-label="Series navigation">
{% assign first_tag = page.categories | first %}
{% if first_tag %}
{% assign tagged_posts = site.categories[first_tag] %}
{% assign sorted_posts = tagged_posts | sort:"date" %}

{% assign go_next = false %}
{% for post in sorted_posts reversed %}

{% if go_next %}
<a class="btn btn-theme" href="{{ post.url }}" style="width:45%" title="Previous post in this series: {{ post.title }}">&laquo; Previous in series&nbsp;</a>
{% assign go_next = false %}
{% endif %}

{% if post.url == page.url %}
{% assign go_next = true %}
{% endif %}

{% endfor %}

{% assign go_next = false %}
{% for post in sorted_posts %}

{% if go_next %}
<a class="btn btn-theme" href="{{ post.url }}" style="width:45%" title="Next post in this series: {{ post.title }}">&nbsp;Next in series&nbsp;&raquo;</a>
{% assign go_next = false %}
{% endif %}

{% if post.url == page.url %}
{% assign go_next = true %}
{% endif %}

{% endfor %}

</div>

{% endif %}

<h4>{{ series.title }}</h4>
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