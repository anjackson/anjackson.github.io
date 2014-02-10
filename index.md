---
title: index
---

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-44259730-1', 'anjackson.github.io');
  ga('send', 'pageview');

</script>

<ul class="posts">
{% for post in site.posts limit: 5 %}
  <div class="post_info">
    <li>
	    <a href="{{ post.url }}">{{ post.title }}</a>
	    <span>({{ post.date | date:"%Y-%m-%d" }})</span>
    </li>
    </br> <em>{{ post.excerpt }} </em>
    </div>
  {% endfor %}
</ul>

