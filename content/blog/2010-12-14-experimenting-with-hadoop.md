---
layout: post
type: blog
promote: 1
status: 1
created_ts: 1292357861
changed_ts: 1292613062
node_id: 1884
title: Experimenting with Hadoop
author: anj
created: '2010-12-14'
changed: '2010-12-17'
category: mining-web-archives
tags: ["Data Mining", "Web Archives", "Digital Preservation"]
url: "/2010/12/14/experimenting_hadoop/"
aliases:
  - "/node/1884/"
date: '2010-12-14'
---
Thanks to our [web archiving team](http://www.bl.uk/aboutus/stratpolprog/digi/webarch/) (who lead the [uk web archive project](http://www.webarchive.org.uk/ukwa/)), I was given a day of training on using [Hadoop](http://hadoop.apache.org/) today. I was already fairly familiar with the map-reduce and HDFS architecture, but I'd not had a chance to actually develop a map-reduce task or run one on a real cluster with some real data. Today's training gave me that chance, and I'm really pleased the results...
<!--break-->
Firstly, I was pleased because developing the map-reduce tasks was pretty easy. We went through the first two [Cloudera training examples](http://www.cloudera.com/downloads/virtual-machine/), and after that developing my own task took about half an hour. Furthermore, because the web archiving team were leading the training, we had a 23-node cluster with some genuine data to play with, in the form of a 50GB crawl log generated by Heretrix.

This log contained summaries of the requests and responses from a large web crawl of hundreds of millions of URLs. This log includes information on the response status codes, sizes, dates, mime-types, and so on ([see this page for details](http://crawler.archive.org/articles/user_manual/analysis.html#crawllog)). My 30-minute coding exercise simply filtered out the 125,295,840 HTTP 200 OK responses and emitted the individual mime-types during the 'map' phase, and counted up the frequency of each mime-type during the 'reduce' phase. The job took about a minute to run, and the basic results are shown below. 

The first graph shows the top ten mime-types encountered during the crawl.

<div class="google-chart">
<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/1a8RgOQ2LGEsI-a77EOf8Svc-oznIOwYSRU-wUZxKsRQ/pubchart?oid=1&amp;format=interactive"></iframe>
</div>

However, this is a little misleading, as the linear scale hides the long tail of file formats. A full chart showing all 637 mime-types in the data set requires a logarithmic vertical scale in order to be examined properly.

<div class="google-chart">
<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/1a8RgOQ2LGEsI-a77EOf8Svc-oznIOwYSRU-wUZxKsRQ/pubchart?oid=2&amp;format=interactive"></iframe>
</div>

So, we find that although the set is dominated by a few main formats, the problem is that the long-tail of minor formats still makes up a significant proportion of the overall data set. About 66% of the file are HTML, and the ten most popular types combined make up about 90% of the content. The remaining 10% is made up of the other 627 mime-types, which makes it very difficult to deal with.

I'm sure this is just reproducing some well-known findings in the field, but that's not really the point. The point is that, once the Hadoop infrastructure is in place, these kind of explorations are very quick, easy, and great fun to do.

(Updated: Re-ran experiment and analysis, correcting for non lower-case MIME type.)