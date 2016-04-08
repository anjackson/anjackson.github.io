---
title: Building Tools to Archive the Modern Web
subtitle:
layout: post
category:
tags: ["Web Archives"]
---

<!--
Last year, I showed you this graph. Is shows how much has been lost from the web over the years, and how much we've saved. 

But that was last year, when I was the good cop.

This year, I'm here to play the bad cop.
-->

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

I wish I could stand here and tell you how much great progress we've made in the last four years, ticking entries off this list, but I can't. Although we've made some progress, our crawl development resources have been consumed by more fundamental needs.

In 2013, the UK Legal Deposit legislation came in, and in truth, we are still recovering from the consequences. At first, we believed the challenge was all about scale -- in the sense of the number of resources to be archived -- and indeed learning to capture and index such large collections has been a major challenge. But I'd underestimated how much the *dynamics* of the archiving process would need to change.

<!--
In the old days, before Legal Deposit, and powered by the Web Curator Tool, we archived a few thousand websites, and the archiving activity was generally focussed around themes or events. Very long running crawls were rare. But under Legal Deposit, we don't just need to collect more sites, but we need to collect them more frequently as well as completely.
-->

The archetypal example is the news. Under selective archiving, we would generally only archive specific articles, relating to themes or events. For example, since 2008, we had captured just 271 snapshots of BBC News pages.

Under Legal Deposit, we expect to archive *every single news article*. This means we need to visit at least once a day, and ideally more frequently than that, while also going back and re-crawling everything at least once every few months in case the contents or presentation is changed.

<!--
News publications are an important part of the library's collections, and maintaining good coverage of the news is an important goal for us. As news has gone from print to broadcast, and then online, we have had to adapt in order to fulfil the reasonable expectation that we will preserve this important stream of information.
-->

Similarly, we need to capture official publications in new ways. Documents we used to get as regular and well-defined submissions in paper formats are now moving online, and so we need to find those documents to allow them to be catalogued and merged into the libraries collections. These documents need to be picked up shortly after publications, and these sites are often large and need to be captured completely.

Our first large-scale 'frequent crawler' worked by re-starting the whole crawl job every time, but this stop-start approach meant the sites we visited very frequently would never be crawled very deeply - it's impossible to crawl all of BBC News in a day. The problem was the need to capture both depth and frequency.

One approach would have been to create many different crawl jobs for different combinations of sites, depths and frequencies, but this ran into our second problem - the poor manageability of our tools and workflows. We've learned that *everything* that can be scripted and automated *must* be done that way, in order to make the process explicit and repeatable. It's not just a way of coping with the scale of the work - it goes deeper than that - it's about ensuring the knowledge we need to run the system is made explicit.

We've also learned that *everything* must be able to be *seen* to be working. That means not simply building a system that appears to works, but also building in enough monitoring to make sure we know how and how well it's working. This is not just monitoring uptime or resources, but runs all the way up to automating quality assurance wherever possible.

However, while exploring how to improve our automated QA, we met the third problem. Our tools were failing us. Not only are they difficult to configure, manage and monitor, but they have fallen too far behind current web development practices.

Here's the BBC News homepage on the 20th of March last year:

And here it is four days later:

<!--
This was fine: https://www.webarchive.org.uk/act/wayback/20150320152832/http://www.bbc.co.uk/news
This was not fine: https://www.webarchive.org.uk/act/wayback/20150324131847/http://www.bbc.co.uk/news
-->

We knew the growth in mobile browsing would change web archiving, in this case the problems are due to the BBC's adoption of "responsive design". Like many other sites, they have chosen to create a site that uses JavaScript to adapt to different displays, although they have aggressively optimised for mobile first. The site delivers a basic, functional page (with only a few low resolution images), but then uses JavaScript to enhance the display by loading in different stylesheets and more, higher resolution images.

We found similar problems with many news sites, like The Guardian, even though their responsive design was more 'standard' and used e.g. the ```srcset``` attribute on images to provide different resolution versions.  Although the srcset image attirbute has been around since 2012 and implemented widely since 2014, it's still not supported by Heritrix or OpenWayback out-of-the-box. To give you an idea of the scale of the problem, out of 230 requests made when playing back this page, only 28 went through OpenWayback. The other 202 request leaked out into the live web.

It's important to emphasis that this kind of thing does not only cause problems when playing-back the material in OpenWayback. Most of the time we never get these additional resource at all, and you can't play back what you don't have. Although H3 includes a module to perform smarter JavaScript extraction, we've not found them reliable, and using it has caused web site owners to block us.

So, to summarise, we needed a new crawl process that:

* Crawls more often as well as crawling sites deeply.
* Is easier to develop, monitor and managed.
* Uses a browser to render at least the main seed URLs in order to capture more dependencies.

To do this, we've changed our crawling process away from being based on crawl jobs, and instead we run one continuous crawl job, all the time. In order to launch crawls for new material, we inject seeds into the crawl via a message-driven crawl workflow.  The workflow approach attempts to break the crawl process down into small, separate modules that perform individual crawl tasks, and then we join them together using a standard message queue system.

This architectural pattern, with relatively simple processes joined together with queues, is fairly common in mainstream distributed computing systems. As long as clear APIs are defined that describe how each microservice talks to the next, the individual components and be changed, upgraded or replaced without bringing down the whole system. This chain of messages also provides a handy way of monitoring the overall progress of the crawler. This mindset also encourages a more modular design, where each component has a clear role and function, so that it's easier to understand what's happening and bring new developers up to speed.

The process starts with our annotation and curation tool. This is used by our staff to configure which sites should be visited on which frequencies, but unlike WCT, none of the more complex crawl logic is embedded inside it. All it does is provide a crawl feed, which looks like this:

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

Our long-running Heritrix crawl is configured to pull messages off this queue and push the URLs into the crawl frontier. At this point, we have broken our rule of having small, simple processes, and we're using Heritrix in a very similar way to our earlier crawls. The way it runs and the way it queues and prioritises URLs has been modified to suite this continuous approach, but it's still a rather uncomfortably monolithic chunk that manages a lot of crawl state in a rather difficult to monitor way.

The main output of the crawler is the crawl log, and here we've adopted the so-called ELK stack (ElasticSearch, Logstash and Kibana), an off-the-shelf open source log indexing and visualisation system that lets us keep an eye on the overall crawl behaviour:

...

To complement these live statistics, we also configured Heritrix to push a message onto a further 'uris-to-index' queue after each resource is crawled. 

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

This is very similar to the Heritrix crawl log, but in the form of a stream of crawl events messages, which are then submitted to a dedicated CDX server. This standalone component developed by the National Library of Australia provides a clear API for both submitting and reading CDX data, and can cope with the submission of hundreds of URLs per second.

Our QA Wayback server is configured to use this real-time CDX server, and to be able to look at the WARC files that are currently being written as well as the older ones. This means that crawled resources become available in Wayback almost instantly. 

Under our previous crawl procedure, we were only able to update the CDX index overnight, so this live feedback is a big improvement. It also allows the part of the workflow that extracts documents from the crawl to check that those documents are available before passing them back to W3ACT for cataloguing.

Putting it all together, we have a robust crawl system where, depending on the complexity of the web site, the whole archiving process can complete in seconds.

...in 20 seconds...

Overall, this more modular architecture is working well. Smaller components are easier for our developers to work on, and it's easy to scale up and tune the number of clients running at each individual stage. For example, if the system is under a lot of load, we can re-configure the number of renderers on the fly without bringing down the whole system.

However, the Heritrix crawler itself remains difficult to manage and scale. We can add more parallel threads to a single Heritrix job, but we're finding this gets more brittle as we scale up. Of course, Heritrix does come with some distributed crawling support (the HashCrawlMapper, which we've used for domain crawls), but this does not allow the number of crawlers to be tuned up and down over time during a single crawl. We can live with this situation for now, but it prevents us from bringing significant improvements to the crawl process.

More seriously, although running the renderer to capture the URLs has definitely improved the crawl quality, we're still not getting the results we want, due to differences between rendered form and archived capture. 

...bbc...

It is unfortunately rather common to embed session identifiers or other transient information in HTML pages and URLs, and this means the version of a page downloaded by Heritrix requires different URLs to the one the renderer saw. It's possible to counteract this by adding lots of brittle, site-specific crawl canonicalisation rules, but this is messy, complicates playback, and will break over time. The only solution that is manageable over the long term is to run the renderer behind an archiving proxy, and capture the resources precisely as the browser saw them.

...with a proxy...

If we're going to the trouble of having a scalable archiving proxy that can write our WARCs, then rather than maintain two separate stacks that do the same job, it makes more sense to move all the WARC writing out to the proxy and run Heritrix behind it too. This would allow us to snip a significant chunk of complexity out of Heritrix and reduce the amount of crawl status information being managed by the one process.[^1]

...all with a proxy...

To try to break the monolith down further, we are considering ways to move the frontier queues themselves out of Heritrix and into a standard database engine. If we can do this, it would them make sense to break Heritrix down into it's major components and look at ways of transplanting them into a standard distributed processing framework.  Multi-process and multi-threaded code is difficult to write and maintain, so it makes sense to use a proven system rather that write our own.



To summarise, I think the most critical challenges we face are:

- Rich, streamed media
    - *Can often by captured, but storage and playback are problematic*
- Incremental display mechanisms
    - *Especially multi-platform 'responsive design'*
    - *The srcset attribute is still not supported by Heritrix3 and OpenWayback out-of-the-box*
- Multi-sourced, embedded content
    - *Identifying embedded resources is getting harder*
- Paywalls
    - *Some newspapers and journals need credentials*

And I'd now add the following to that list:

- Scalable continuous crawling and re-crawling
    - *Delegate WARC writing to archiving proxies*
    - *Move complex state our of Heritrix and into separate scalable systems where possible*
- SSL (almost) Everywhere
    - *OpenWayback support for SSL content is poor/non-existent out-of-the-box*
    - *and what of HTTP/2 around the corner*

Clearly, we need a big push to improve our tools. Fortunately, my organisation is willing to put some funding behind solving this problem over the next year. But we'd really rather not do this alone. 

Whatever we do will be open source, but I'd really much rather be part of an open *project*. Our tools and our results will be much better if we can find ways of pooling our resources, but more importantly, I think many of us enjoy working with our peers in other organisations. Simply put, open source is more fun, especially when you're working in a complex niche, like web archiving. We can support 

I'm hoping a more modular architecture might these collaborations easier to get off the ground. Smaller components are easuer to get working on more quickly, and clearer APIs should make it possible to re-use components for small and large scale crawls. With this in mind, the IIPC has dedicated some time for exploration and discussion of these issues tomorrow.


----

Sketch ways H3 could be decoupled.

H3
- AlreadySeen cache -> redis, 
- AlreadySeen and persistLog -> HBase/warcbase and/or Wayback?
- Queues out to ElasticSearch or some sorted key-value engine.
- Extract H3 'brain' for separate stages and embed in a off-the-shelf framework


This presentation will revisit those challenges and explore the degree to which we have met or failed to meet them in the three years since then.  We will look at some of the problems the UK Web Archive found when crawling the dynamic, responsive web, and discuss our current tactics where we blend browser-based crawling with more traditional Heritrix crawls. Our approach will also be compared against the approaches used by other organisations.  We will then look at potential options for future development of our shared crawl capability, and call for coordinated effort among the web archiving community to prevent our tools falling even further behind.

[^1]: Having said that, the warc-writing proxy itself becomes fairly complex, as it would also need to handle de-duplication and (for us at least) virus scanning too (because we prefer to scan mid-crawl and redirect the suspected viruses into a separate stream of WARC files). 

[1]: http://netpreserve.org/sites/default/files/resources/OverviewFutureWebWorkshop.pdf
[2]: http://blog.dshr.org/2012/05/harvesting-and-preserving-future-web.html
