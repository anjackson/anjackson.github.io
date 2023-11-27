---
layout: project
type: project
category: Data Mining
tags: [data-mining, digital-preservation]
fa-icon: fa-code-fork
background: /projects/images/aadda.png
screenshot: /projects/images/aadda.png
title: AADDA
summary: Analytical Access to the Dark Domain Archive
year: 2012
url: "/projects/aadda/"
aliases: null
date: '2012-01-01'
---

In 2012, JISC funded two projects based on the idea of exploring the ways in which researchers might exploit the [JISC UK Web Domain Dataset (1996-2013)][2].

The [Analytical Access to the Dark Domain Archive][1] project built our first historical search service, and helped us to understand the issues around providing rich interfaces and search capabilities on large-scale collections. You can find out more about the project by visiting the [IHR AADDA project page][4] or by [reading the project blog][5].

The [Big Data (Demonstrating the Value of the UK Web Domain Dataset for Social Science Research)][3] project took a different approach. Rather than building a user interface and providing a search service, the raw data was passed to the researchers in order to see how they might best exploit it using their own infrastructure and capabilities. This led to the publication of [a conference paper at the WebSci'14 conference][7]. For more information, you can refer to the [OII project page][6].

I led the technical development of the [AADDA service][9]. I began learning how to scale [Apache Solr][10] from millions to hundreds of millions of resources, and started building up our [open source code base]({{site.baseurl}}/projects/webarchive-discovery/) for indexing web archives. I also developed our initial user interface based on [Drupal Sarnia][8] (as shown here).

The work we began in AADDA was later continued under the [BUDDAH project]({{site.baseurl}}/projects/buddah/).

[1]: http://www.webarchive.org.uk/wayback/archive/20140614000820/http://www.jisc.ac.uk/whatwedo/programmes/preservation/AADDA.aspx
[2]: http://data.webarchive.org.uk/opendata/ukwa.ds.2/
[3]: http://www.webarchive.org.uk/wayback/archive/20140614062452/http://www.jisc.ac.uk/whatwedo/programmes/preservation/BigData.aspx
[4]: http://www.history.ac.uk/projects/digital/AADDA
[5]: http://domaindarkarchive.blogspot.co.uk/
[6]: http://www.oii.ox.ac.uk/research/projects/?id=88
[7]: http://arxiv.org/abs/1405.2856
[8]: https://www.drupal.org/project/sarnia
[9]: http://www.webarchive.org.uk/aadda-discovery/
[10]: http://lucene.apache.org/solr/
