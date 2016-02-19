---
title: Saving The News
subtitle: Testing browser-based archiving to the limit
author: anj
layout: post
shown: true
sidebar-include: _wapi.md
category: Digital Preservation
tags: ["Web Archive APIs"]
---


From PhantomJS rendered form:

~~~ html
<div class="responsive-image responsive-image--16by9">
    <div class="responsive-image__inner-for-label">
        <img src="http://ichef-1.bbci.co.uk/news/96/cpsprodpb/4CF4/production/_87600791_87600370.jpg" datasrc="http://ichef-1.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" class="responsive-image__img js-image-replace" alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel" width="640" height="360">
        <!--[if lt IE 9]>
        <img src="http://ichef-1.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" class="js-image-replace" alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel" width="640" height="360" />
        <![endif]-->
        <div class="responsive-image__media-and-live-label" aria-hidden="true">
            <span class="badge-icon-only badge-icon-only--video-for-image"><span class="svg-icon svg-icon--video-dark"><span class="off-screen"> Video</span></span></span>
    <span class="badge-text-only badge-text-only--duration">2:21</span>
        </div>
    </div>
</div>
~~~

From Chrome Inspect Element of original site:

~~~ html
<img src="http://ichef.bbci.co.uk/news/130/cpsprodpb/4CF4/production/_87600791_87600370.jpg" datasrc="http://ichef.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" class="responsive-image__img js-image-replace" alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel" width="640" height="360">
~~~

and view source:

~~~ html
<div class="js-delayed-image-load" data-src="http://ichef.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" data-width="640" data-height="360" data-alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel"></div>
~~~

From Chrome view-source form of wayback rendered version:

~~~ html
<div class="js-delayed-image-load" data-src="http://ichef.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" data-width="640" data-height="360" data-alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel"></div>
~~~

From Chrome Inspect Element in wayback rendered version:

~~~ html
<img src="http://192.168.99.100:8080/wayback/20160111124345oe_/http://ichef.bbci.co.uk/news/130/cpsprodpb/4CF4/production/_87600791_87600370.jpg" datasrc="http://192.168.99.100:8080/wayback/20160111124345oe_/http://ichef.bbci.co.uk/news/200/cpsprodpb/4CF4/production/_87600791_87600370.jpg" class="responsive-image__img responsive-image__img--loading js-image-replace" alt="Lady Gaga poses with award for Best Actress TV Series or Limited Movie, for her role in American Horror Story: Hotel" width="640" height="360">
~~~

As downloaded by Heritrix3

~~~ html
<div class="js-delayed-image-load" data-src="http://ichef.bbci.co.uk/news/200/cpsprodpb/166FC/production/_87600919_87600917.jpg" data-width="640" data-height="360" data-alt="Spain's Princess Cristina sits in court where she appears on charges of tax fraud in Palma de Mallorca"></div>
~~~
