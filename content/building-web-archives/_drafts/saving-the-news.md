---
title: Saving The News
subtitle: Testing browser-based archiving to the limit
author: anj
layout: post
shown: true
tags: ["Web Archive APIs"]
draft: true
---

Break
<!--break-->

Context, NPLD, news as a major resource, H3 crawl system. Requirement to harvest documents too.

One problem, we were running daily stop-start crawls, carried over from 'focussed crawl' approach.  Big sites with frequently changing content need different tactics - we need a way to balance depth and frequency. Also applies to document heavy sites.

Second problem was manageability of tools and process given staffing changes and available resources. Need much higher quality, but also the monitoring and manageability in place to know that it's working.

Third, bigger problem was the final, utter failure of tools. We've been warning about this for long time, but it finally happened.

The change at the BBC:

This was fine :https://www.webarchive.org.uk/act/wayback/20150320152832/http://www.bbc.co.uk/news

This was not fine: https://www.webarchive.org.uk/act/wayback/20150324131847/http://www.bbc.co.uk/news

Responsive design, optimised for mobile first, but using JavaScript to enhance e.g. load in desktop stylesheets, higher resolution images, etc.

Similar problems with The Guardian, 28/230 requests were served from Wayback. JavaScript for responsive behaviour or delayed loads is extremely common.

responsive loads, JS, manual load balancing

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
