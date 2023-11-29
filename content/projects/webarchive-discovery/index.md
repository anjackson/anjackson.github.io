---
layout: project
type: project
category: Development
tags: [development, digital-preservation]
fa-icon: fa-code-fork
screenshot: /projects/images/webarchive-indexer-both.png
title: Web Archive Discovery Toolkit
summary: Tools for analysing and indexing web archives
year: 2014
url: "/projects/webarchive-discovery/"
aliases: null
date: '2014-01-01'
showDate: false
showSummary: true
showHero: false
heroStyle: background
showAuthor: false
---

The open source codebase that powered the [AADDA](/projects/aadda/) and [BUDDAH](projects/buddah/) projects and all the other UK Web Archive search services is called [webarchive-discovery][1].

{{< github repo="ukwa/webarchive-discovery" >}}

It combines an extended version of [Apache Tika][2] and WARC and ARC reading software with a number of other data and text analysis systems.  Via a command line interface, or as a [Hadoop task][3], it can parse large volumes of web archives and submit the data to a suitably configured [Apache Solr][4] index. For more information, please refer to the [webarchive-discovery wiki][5]

![](webarchive-indexer-both.png)

![](SolrWayback-map.jpg)

[1]: https://github.com/ukwa/webarchive-discovery
[2]: http://tika.apache.org/
[3]: http://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html
[4]: http://lucene.apache.org/solr/
[5]: https://github.com/ukwa/webarchive-discovery/wiki

