---
title: Updating our historical search service
subtitle: 3.5 billion fragments of UK web history, from 1996 to 2013.
category: Digital Preservation
tags: ["Keeping Codes", "Web Archiving", "BUDDAH"]
layout: post
author: anj
shown: false
---

Earlier this year, as part of the [Big UK Domain Data for the Arts and Humanities][1] project, we released [our first 'historical search engine' service][2]. We've [publicised it][3] at [IDCC15][4], the [2015 IIPC GA][5] and at the [first RESAW conference][6], and it's been very well received. Not only has it lead to some [excellent case studies][7] that we can use to improve our services, but other web archives have shown interest in re-using [the underlying open source code][8]. In particular, some of our Canadian colleagues have successfully launched [webarchives.ca][9], which lets users search ten years worth of archived websites from Canadian political parties and political interest groups (see [here][10] for more details). 

But we remained frustrated, for two reasons. Firstly, when we built that first service, we could not cope with the full scale of the 1996-2013 dataset, and we only managed to index the two billion resources up to 2010. Secondly, we had not yet learned how to cope with more than one or two users at a time, so we were loath to publicise the website too widely in case it kept falling over. So, over the last six months, and with the guidance of [Toke Eskildsen][11] and Thomas Egense at the [State Library of Denmark][13], we've been working on resolving these scaling issues (their [tech blog][14] is definitely worth a look if you're into this kind of thing).

Thanks to their input, I'm happy to be able to announce that our [historical search prototype][15] now spans the whole period from 1996 to [the 6th April 2013][16], and contains 3,520,628,647 distinct records.

![Total Resource By Crawl Year]({{ site.baseurl }}/blog/images/shine-release-two-total-resources-over-time.png)

Broken down by year, you can see there's a lot of variation, depending on the timings of the global crawls from which this collection was drawn. This is why [our trends visualisation][15] plots query results as a percentage of all the resources crawled in each year rather than absolute figures. However, the overall variation and the fact that the 2013 chunk only covers the first three months should be kept in mind when interpreting the results.

You might also notice there seem to be a few data points from as early as 1938, and even from 2072! This tiny proportion of results correspond to malformed or erroneous records, although currently it's not clear if the [1,714 results from 1995][17] are genuine or not. No one ever said **Big Data** would be *Clean Data*.

Furthermore, we've decided to change the way we handle web archiving records that have been '[de-duplicated][18]'. When the crawler visits a page and finds the *precisely* the same item as before, instead of storing another copy, we can store a so-called "revisit record" and refer to the earlier copy rather than duplicating it. This crude form of data compression can save a lot of disk space for frequently crawled material, and it's use has grown over time. For example, looking at the historical dataset, you can see that 30% of the 2013 results were duplicates.

[![Total Resource By Crawl Year]({{ site.baseurl }}/blog/images/shine-release-two-revisits.png)](https://www.webarchive.org.uk/shine/graph?query=record_type:%22revisit%22)

However, as these records don't hold the actual item, our indexing process was not able to properly index these items yet. Over the next few weeks, we shall scan through these 65 million revisit records and 'reduplicate' them. This does mean that, for now, the results from 2013 might be a bit misleading in some cases. We also failed to index the last 11,031 of the 515,031 WARC files that make up this dataset (about 2% of the total, likely affecting the 2010-2013 results only), simply because we ran our of disk space. The index is using up 18.7TB of SSD storage, and if we can find more space, we'll fill in the rest.

In the meantime, please explore our historical archive and tell us what you find! It might be slow sometimes (maybe 10-20 seconds), so please be patient, but we're pretty confident that it will be stable from now on.

[![Early social media]({{ site.baseurl }}/blog/images/shine-release-two-early-social-media.png)](https://www.webarchive.org.uk/shine/graph?query=%22geocities%22%2C%22friendster%22%2C%22orkut%22&year_start=1996&year_end=2013&action=update)

[![Later social media]({{ site.baseurl }}/blog/images/shine-release-two-later-social-media.png)](https://www.webarchive.org.uk/shine/graph?query=%22myspace%22%2C%22facebook%22%2C%22twitter%22&year_start=1996&year_end=2013&action=update)

[![Austerity]({{ site.baseurl }}/blog/images/shine-release-two-austerity.png)](https://www.webarchive.org.uk/shine/graph?query=%28%22sub-prime%22+OR+%22subprime%22%29+AND+mortgage%2C+austerity+NOT+domain%3Amotorbooks.co.uk%2C+%22financial+crisis%22&year_start=1996&year_end=2013&action=update)

Anj


[1]: http://buddah.projects.history.ac.uk/
[2]: http://britishlibrary.typepad.co.uk/webarchive/2015/02/building-a-historical-search-engine-is-no-easy-thing.html
[3]: britishlibrary.typepad.co.uk/webarchive/2015/06/towards-a-macroscope-for-uk-web-history.html
[4]: http://www.dcc.ac.uk/events/idcc15/programme-presentations
[5]: http://netpreserve.org/general-assembly/2015/overview
[6]: http://events.netlab.dk/conference/index.php/resaw/june2015
[7]: http://buddah.projects.history.ac.uk/2015/07/09/project-case-studies-now-available/
[8]: https://github.com/ukwa/shine
[9]: http://webarchives.ca/
[10]: http://webarchives.ca/about/
[11]: https://twitter.com/TokeEskildsen
[12]: https://twitter.com/thomasegense
[13]: https://en.statsbiblioteket.dk/
[14]: https://sbdevel.wordpress.com/
[15]: https://www.webarchive.org.uk/shine/graph
[16]: http://www.bl.uk/catalogues/search/non-print_legal_deposit.html#april
[17]: https://www.webarchive.org.uk/shine/search?query=*:*&tab=results&action=search&facet.in.crawl_year=%221995%22
[18]: https://iipc.github.io/warc-specifications/specifications/warc-deduplication/recording-arbitrary-duplicates-1.0/
