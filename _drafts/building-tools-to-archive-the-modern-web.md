---
title: Building Tools to Archive the Modern Web
subtitle:
author: anj
layout: post
category:
tags: ["Web Archives"]
abstract: "This presentation will revisit those challenges and explore the degree to which we have met or failed to meet them in the three years since then.  We will look at some of the problems the UK Web Archive found when crawling the dynamic, responsive web, and discuss our current tactics where we blend browser-based crawling with more traditional Heritrix crawls. Our approach will also be compared against the approaches used by other organisations.  We will then look at potential options for future development of our shared crawl capability, and call for coordinated effort among the web archiving community to prevent our tools falling even further behind."
---

Four years ago, during the 2012 IIPC General Assembly, we came together to discuss the recent and upcoming challenges to web archiving in the [IIPC Future of the Web Workshop][1] (see also [this related coverage on David Rosenthal's blog][2]). That workshop made it clear that our tools are failing to satisfy many of these challenges:

- Database driven features
- Complex/variable URI formats
- Dynamically generated URIs
- Rich, streamed media
- Incremental display mechanisms
- Form-filling
- Multi-sourced, embedded content
- Dynamic login, user-sensitive embeds
- User agent adaptation
- Exclusions (robots.txt, user-agent, ...)
- Exclusion by design  (i.e. site architecture intended to inhibit crawling and indexing)
- Server-side scripts, RPCs
- HTML5 web sockets
- Mobile sites
- DRM protected content, now part of the HTML standard
- Paywalls

I wish I could stand here and tell you how much great progress we've made in the last four years, ticking entries off this list, but I can't. Although we've made some progress, our crawl development resources have been consumed by more fundamental needs. We new moving to domain crawling under Legal Deposit would bring big changes in scale, but I'd underestimated how much the *dynamics* of the crawl workflow would need to change. 

News websites are a great example. Under selective archiving, we would generally only archive specific articles, relating to themes or events. For example, since 2008, we had captured just 271 snapshots of BBC News pages.

[![BBC News under selective archiving]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-news-visits-open-ukwa.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-news-visits-open-ukwa.png)

Under Legal Deposit, we expect to archive *every single news article*. This means we need to visit at least once a day, and ideally more frequently than that, while also going back and re-crawling everything at least once every few months in case the contents or presentation is changed.

[![BBC News under Legal Deposit]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-news-visits-ld-ukwa.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-news-visits-ld-ukwa.png)

Our first large-scale 'frequent crawler' worked by re-starting the whole crawl job every time, but this stop-start approach meant the sites we visited very frequently would never be crawled very deeply - it's impossible to crawl all of BBC News in a day. The problem was the need to capture both depth and frequency.

[![Daily crawl pulse]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/daily-pulse.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/daily-pulse.png)

One approach would have been to create many different crawl jobs for different combinations of sites, depths and frequencies, but this ran into our second problem - the poor manageability of our tools and workflows. Managing multiple overlapping jobs in Heritrix has proven to be awkward, needing a lot of manual intervention to move different jobs around in order to balance out resource usage over time.[^1] Multiple jobs are also more difficult to monitor effectively.

We've learned that *everything* that can be scripted and automated *must* be done that way, in order to make the process explicit and repeatable.  We've also learned that *everything* must be able to be *seen* to be working. This is not just monitoring uptime or resources, but runs all the way up to automating quality assurance wherever possible.

However, while exploring how to improve our automated QA, we met the third problem. Our tools were failing us. Not only are they difficult to configure, manage and monitor, but they have fallen too far behind current web development practices. 

Those 'future web challenges' are now here.

Here's the BBC News homepage on the 20th of March last year:

[![BBC News on 20th March 2015]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-just-before.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-just-before.png)

<!--
This was fine: https://www.webarchive.org.uk/act/wayback/20150320152832/http://www.bbc.co.uk/news
-->

And here it is four days later:

[![BBC News on 24th March 2015]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-just-after-clipped.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/bbc-just-after.png)

<!--
This was not fine: https://www.webarchive.org.uk/act/wayback/20150324131847/http://www.bbc.co.uk/news
-->

We knew the growth in mobile browsing would change web archiving, and in this case the problems are due to the BBC's adoption of "responsive design". Like many other sites, they have chosen to create a site that uses JavaScript to adapt to different displays, although they have aggressively optimised for mobile first. The site delivers a basic, functional page (with only a few low resolution images), but then uses JavaScript to enhance the display by loading in different stylesheets and more, higher resolution images. Heritrix only gets the version intended for very tiny screens.

[![The Guardian on 31th March 2015]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/the-guardian-clipped.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/the-guardian.png)


We found similar problems with many sites, like The Guardian, even though their responsive design was more 'standard' and used e.g. the ```srcset``` attribute on images to provide different resolution versions.  Although the srcset image attribute [has been around since 2012][3] and [implemented widely since 2014][4], it's still not supported by Heritrix out-of-the-box and has only just become supported by OpenWayback ([in version 2.3.1][5]).

In summary, we needed a new crawl process that:

* Crawls more often as well as crawling sites deeply.
* Is easier to develop, monitor and managed.
* Uses a browser to render at least the main seed URLs in order to capture more dependencies.

<!--
* Can spot documents from selected sites that should be catalogued, and generates initial metadata for them.
-->

To do this, we've changed our crawling process away from being based on crawl jobs, and instead we run one continuous crawl job, all the time. In order to launch crawls for new material, we inject seeds into the crawl via a message-driven workflow.  The workflow approach attempts to break the overall crawl process down into smaller, separate modules that perform individual crawl tasks, and then we join them together using a standard message queue system.

[![Crawl System Overview]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-hires.png)

This architectural pattern, with relatively simple processes joined together with queues acting as buffers, is fairly common in mainstream distributed computing systems. As long as clear APIs are defined that describe how each microservice talks to the next, the individual components and be restarted, upgraded or replaced without bringing down the whole system. This chain of messages also provides a handy way of monitoring the overall progress of the crawler. This mindset also encourages a more modular design, where each component has a clear role and function, so that it's easier to understand what's happening and bring new developers up to speed.

[![Crawl System Crawl Stage 1]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-1.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-1.png)

The process starts with our annotation and curation tool. This is used by our staff to configure which sites should be visited on which frequencies, but unlike its predecessor, the Web Curator Tool, none of the more complex crawl logic is tightly bound to it. All it does is provide a crawl feed, which looks like this:

~~~
[
    {
        "id": 1,
        "title": "gov.uk Publications",
        "seeds": [
            "https://www.gov.uk/government/publications"
        ],
        "schedules": [
            {
                "frequency": "MONTHLY",
                "startDate": 1438246800000,
                "endDate": null
            }
        ],
        "scope": "root",
        "depth": "DEEP",
        "ignoreRobotsTxt": false,
        "documentUrlScheme": null,
        "loginPageUrl": null,
        "secretId": null,
        "logoutUrl": null,
        "watched": false
    },
    ...
~~~

A separate launcher process runs every hour, downloads this feed, and checks if any crawls should be launched in the next hour. If so, it posts the seeds of the crawl onto a message queue called 'uris-to-render'. It also posts a message to the 'uris-to-check' queue, which will be used to check if the crawl launched successfully.

~~~
{
    "clientId": "FC-3-uris-to-crawl",
    "isSeed": true,
    "metadata": {
        "heritableData": {
            "heritable": [
                "source",
                "heritable"
            ],
            "source": ""
        },
        "pathFromSeed": ""
    },
    "url": "https://www.gov.uk/government/publications"
}
~~~

[![Crawl System Crawl Stage 2]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-2.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-2.png)

As the name implies, the first step in each crawl is now a browser-based rending step. Before we do anything else, we run the seeds through PhantomJS and attempt to capture a good rendering of the original site. We keep the rendered pages, and extract the embedded resources and the navigational links we can find. These are then passed on to a 'uris-to-crawl' queue.

~~~
{
    "headers": {},
    "isSeed": true,
    "method": "GET",
    "parentUrl": "https://www.gov.uk/government/publications",
    "parentUrlMetadata": {
        "heritableData": {
            "heritable": [
                "source",
                "heritable"
            ],
            "source": ""
        },
        "pathFromSeed": ""
    },
    "url": "https://www.gov.uk/government/publications"
}
~~~

[![Crawl System Crawl Stage 3]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-3.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-3.png)

Our long-running Heritrix crawl is configured to pull messages off this queue and push the URLs into the crawl frontier. At this point, we have broken our rule of having small, simple processes, and we're using Heritrix in quite a similar way to our earlier crawls. The way it runs and the way it queues and prioritises URLs has been modified to suite this continuous approach, but it's still a rather uncomfortably monolithic chunk that manages a lot of crawl state in a rather difficult to monitor way.

Apart from the WARCs themselves, the main output of the crawler is the crawl log, and where we've adopted the so-called ELK stack (ElasticSearch, Logstash and Kibana), an off-the-shelf open source log indexing and visualisation system that lets us keep an eye on the overall crawl behaviour (been Monitrix in the past): <ICK

...kibana...

To complement these live statistics, we also configured Heritrix to push a message onto a further 'uris-to-index' queue after each resource is crawled. 

[![Crawl System Crawl Stage 4]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-4.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-4.png)

~~~
{
    "annotations": "ip:173.236.225.186,duplicate:digest",
    "content_digest": "sha1:44KA4PQA5TYRAXDIVJIAFD72RN55OQHJ",
    "content_length": 324,
    "extra_info": {},
    "hop_path": "IE",
    "host": "acid.matkelly.com",
    "jobName": "frequent",
    "mimetype": "text/html",
    "seed": "WTID:12321444",
    "size": 511,
    "start_time_plus_duration": "20160127211938966+230",
    "status_code": 404,
    "thread": 189,
    "timestamp": "2016-01-27T21:19:39.200Z",
    "url": "http://acid.matkelly.com/img.png",
    "via": "http://acid.matkelly.com/",
    "warc_filename": "BL-20160127211918391-00001-35~ce37d8d00c1f~8443.warc.gz",
    "warc_offset": 36748
}
~~~

This is very similar to the Heritrix crawl log, but in the form of a stream of crawl event messages, which are then submitted to a dedicated CDX server. This standalone component developed by the National Library of Australia provides a clear API for both adding as well as querying CDX data, and can cope with the submission of hundreds of URLs per second.

[![Crawl System Crawl Stage 5]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-5.png)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/crawl-agents-5.png)

Our QA Wayback is configured to use this real-time CDX server, and to be able to look at the WARC files that are currently being written as well as the older ones. This means that crawled resources become available in Wayback almost instantly. 

Under our previous crawl procedure, we were only able to update the CDX index overnight, so this live feedback is a big improvement. It also allows the part of the workflow that extracts documents from the crawl to check that those documents are available before passing them back to W3ACT for cataloguing.

Putting it all together, we have a robust crawl system where, depending on the complexity of the web site, the whole archiving process can complete in seconds.

[![Live to Archived in 20 seconds]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/success-kid-archived-in-20-seconds.jpg)]({{ site.baseurl }}/web-archiving-apis/images/iipc-ga-2016/success-kid-archived-in-20-seconds.jpg)

Overall, this more modular architecture is working well. Smaller components are easier for our developers to work on, and it's easy to scale up and tune the number of clients running at each individual stage. For example, if the system is under a lot of load, we can re-configure the number of renderers on the fly without bringing down the whole system.

Unfortunately, although adding the render step has improved things, it's not good enough.

...bbc...

To really solve these issues, we need to capture the resources precisely as the web browser received them, rather than downloading them once from and then passing the URLs to Heritrix to be downloaded again. We also need to be able to run more pages through browser engines, which means we need to find a way of making Heritrix itself more modular and scaleable.

To summarise, out of that big list of "future challenges" from 2012, the most critical ones we are facing right now are:

- Rich, streamed media
    - *Can often by captured, but tools are not integrated and storage and playback are problematic*
- Incremental display mechanisms
    - *Especially multi-platform 'responsive design'*
    - *The ```srcset``` attribute is still not supported by Heritrix3 out-of-the-box*
- Multi-sourced, embedded content
    - *Identifying embedded resources now requires JavaScript execution*
    - *Need to run more pages through browsers*
- Paywalls
    - *The crawlers need to be able to login*

And I'd now add to the list:

- SSL (almost) Everywhere
    - *OpenWayback support for SSL is poor out-of-the-box*
    - *and what of HTTP/2 around the corner?*

We need a big push to improve our tools, and we are running out of time. Fortunately, my organisation is willing to put some funding behind solving this problem over the next two years. But we'd really rather not do this alone. 

Whatever we do will be open source, but I'd really much rather be part of an *open source project*. Our tools and our results will be much better if we can find ways of pooling our resources, but more importantly, I think many of us enjoy working with our peers in other organisations. Simply put, open source projects are more fun, especially when you're working in a complex niche, like web archiving. Almost all of us are working in small teams or as individuals in much larger organisations, and I believe we can work best when work together.

I'm hoping APIs and a more modular crawler architecture might make these collaborations easier to get off the ground. With this kind of collaboration in mind, the IIPC has dedicated some time for exploration and discussion of these issues tomorrow. Please do come along if you're interested in building tools together.

Thank you.

[^1]: It also means we can unintentionally violate the per-host crawl delays due to running multiple crawlers over the same site simultaneously.

[1]: http://netpreserve.org/sites/default/files/resources/OverviewFutureWebWorkshop.pdf
[2]: http://blog.dshr.org/2012/05/harvesting-and-preserving-future-web.html
[3]: https://github.com/whatwg/html/commit/969543cd259a0cc41a0a5cbe97e0010c6999eb09?diff=split
[4]: http://caniuse.com/srcset
[5]: https://github.com/iipc/openwayback/issues/310
