---
title: Finding Formats in WikiData
subtitle: Where oh where are my PSDs?
date: 2024-07-10
category: digital-footprint
tags:
  - Digital Preservation
layout: post
author: anj
draft: true
---

As part of the [Registries of Good Practice project](https://github.com/digipres/registries-of-practice-project#readme), I'm looking at various sources of information about digital formats.  This builds on work from my existing [format registry aggregator](http://www.digipres.org/formats/), which will be improved and extended to include more information over the next weeks and months.

The aggregator already includes [some information from WikiData](http://www.digipres.org/formats/sources/wikidata/), but I hadn't done any deeper analysis or comparison with other sources. In recent weeks, I've started comparing the coverage of different registries, during which I noticed something a bit odd. A really well-known file extension that was in [PRONOM](https://www.nationalarchives.gov.uk/PRONOM/x-fmt/92) and [LC-FDD](https://www.loc.gov/preservation/digital/formats/fdd/fdd000523.shtml), but not in WikiData: PhotoShop Documents a.k.a. PSD! According to the aggregator, anyway.


## Querying For Formats

Of course, a quick search of WikiData shows there is a [record that covers PSD files](https://www.wikidata.org/wiki/Q2141903), so there is clearly some problem with the aggregator.

The code it uses to gather data from WikiData is [here](https://github.com/digipres/digipres.github.io/blob/59df7bccf3b9cf6c2fbb1e13ca2e223585b656e0/_sources/registries/wikidata/download-wikidata-formats.py#L16), and was taken from [this page on the Siegfried wiki](https://github.com/richardlehane/siegfried/wiki/Wikidata-identifier#harvesting).  The underlying SPARQL query, and the corresponding (live) results, are available below:


```wdq
SELECT DISTINCT ?uri ?uriLabel ?puid ?extension ?mimetype ?encodingLabel ?referenceLabel ?date ?relativityLabel ?offset ?sig
WHERE
{
  ?uri wdt:P31/wdt:P279* wd:Q235557.               # Return records of type File Format.
  OPTIONAL { ?uri wdt:P2748 ?puid.      }          # PUID is used to map to PRONOM signatures proper.
  OPTIONAL { ?uri wdt:P1195 ?extension. }
  OPTIONAL { ?uri wdt:P1163 ?mimetype.  }
  OPTIONAL { ?uri p:P4152 ?object;                 # Format identification pattern statement.
    OPTIONAL { ?object pq:P3294 ?encoding.   }     # We don't always have an encoding.
    OPTIONAL { ?object ps:P4152 ?sig.        }     # We always have a signature.
    OPTIONAL { ?object pq:P2210 ?relativity. }     # Relativity to beginning or end of file.
    OPTIONAL { ?object pq:P4153 ?offset.     }     # Offset relative to the relativity.
    OPTIONAL { ?object prov:wasDerivedFrom ?provenance;
       OPTIONAL { ?provenance pr:P248 ?reference;
                              pr:P813 ?date.
                }
    }
  }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE], en". }
}
ORDER BY ?uri
```

This seems to be aligned with [the expected WikiData structure for file formats](https://www.wikidata.org/wiki/Wikidata:WikiProject_Informatics/Structures/File_formats#Properties_&_structure_of_items), so everything looks fine.

## Instances and Subclasses

I floundered around for a while, trying different queries and getting confused. Eventually, I realised I didn't actually understand what the core of that query was doing. The crucial part, the part that identifies File Format records, looks like:

```
?uri wdt:P31/wdt:P279* wd:Q235557
```

The [`wd:Q235557`](https://www.wikidata.org/wiki/Q235557) refers to the concept of `File Format`, and the query essentially means 'match all records that are File Formats'. Here's an example query, which shows how many matches that gets:

```wdq
SELECT (COUNT (DISTINCT ?uri) AS ?count)
WHERE
{
  # Return records of type File Format (via instance of subclass-chain):
  { ?uri wdt:P31/wdt:P279* wd:Q235557 }
}
```

But I hadn't really looked at the `wdt:P31/wdt:P297*` bit too hard, and it's more complicated than I realised.  The `wdt:31` but means `instance of` and `wdt:P297` means `subclass of`, but I'd assumed the expression meant matching:

```
<WikiData Entity> any instance of OR any subclass of <File Format>
```

but it means something more like:

```
<WikiData Entity> instance of <X> where <X> is a <File Format> or any subclass of <File Format>
```

Looking more closely at the [entry corresponding to PSD](https://www.wikidata.org/wiki/Q2141903) and comparing that with the [entry for PDF](https://www.wikidata.org/wiki/Q42332), the reason for the different results became a bit clearer.

- The PDF is:
  - an `instance of`:
    - [file format family](https://www.wikidata.org/wiki/Q26085352)
    - [file format](https://www.wikidata.org/wiki/Q235557)
    - [e-book file format](https://www.wikidata.org/wiki/Q81986407)
    - [electronic document](https://www.wikidata.org/wiki/Q694975)
  - a `subclass of`:
    - [document file format](https://www.wikidata.org/wiki/Q336705)
- Whereas a PSD is:
  - an `instance of`:
    - [file format family](https://www.wikidata.org/wiki/Q26085352)
  - a `subclass of`:
    - [image file format](https://www.wikidata.org/wiki/Q1572121)
    - [proprietary file format](https://www.wikidata.org/wiki/Q2720536)

So, in this case, the PSD wasn't being picked up because it's not an `instance of` a `File Format`. It's a `File Format Family` only.

## Including Format Families

Based on that, I tried to work out how to include `File Format Family` records. I eventually came up with:

```wdq
SELECT (COUNT (DISTINCT ?uri) AS ?count)
WHERE
{
  # Return records of type File Format or File Format Family (via instance or subclass chain):
  { ?uri wdt:P31/wdt:P279* wd:Q235557 } UNION 
    { ?uri wdt:P31/wdt:P279* wd:Q26085352 } 
}
```

This could then be used to poke around and see what was different. For example, this query uses the new `UNION` query and then filters out everything the original query would have caught, so we can see the difference:

```wdq
SELECT ?uri ?uriLabel ?extension ?class ?classLabel ?superClass ?superClassLabel
WHERE
{
  # The new query, including Families:
  { ?uri wdt:P31/wdt:P279* wd:Q235557 } UNION 
    { ?uri wdt:P31/wdt:P279* wd:Q26085352 }.

  # Strip out the File Formats that the original query would have caught:
  FILTER NOT EXISTS { ?uri (wdt:P31/wdt:P279*) wd:Q235557 }
  
  OPTIONAL { ?uri wdt:P31 ?class }.
  OPTIONAL { ?uri wdt:P279 ?superClass }.
  OPTIONAL { ?uri wdt:P1195 ?extension. }.
  
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE], en". }
}
ORDER BY ?uri LIMIT 1000
```

If you search the results, you'll see the PSD entry is there. This query form does fill some gaps, but it also introduces some records that don't really make sense as we're not really interested in `File Format Families`. 

## Query Limits

There are other possible approaches, like allowing there to be a chain of `instance of` relationships between the item and the `File Format` class:

```wdq
SELECT (COUNT (DISTINCT ?uri) AS ?count)
WHERE
{
  # Return records of type File Format (via instance chain or subclass chain):
  { ?uri wdt:P31*/wdt:P279* wd:Q235557 }
}
```

Again, focussing on the differences:

```wdq
SELECT ?uri ?uriLabel ?extension ?class ?classLabel ?superClass ?superClassLabel
WHERE
{
  # Allowing instance-of chains:
  { ?uri (wdt:P31*/wdt:P279*) wd:Q235557 }

  # Strip out the ones that the original query would have caught:
  FILTER NOT EXISTS { ?uri (wdt:P31/wdt:P279*) wd:Q235557 }
  
  OPTIONAL { ?uri wdt:P31 ?class }.
  OPTIONAL { ?uri wdt:P279 ?superClass }.
  OPTIONAL { ?uri wdt:P1195 ?extension. }.
  
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE], en". }
}
ORDER BY ?uri LIMIT 1000
```

This seems to bring in quite a lot of records that are not a great deal of use, but does pick up the odd thing that wasn't being picked up before, like [.clr files](https://www.wikidata.org/wiki/Q28846076) which are a direct `subclass of` `File Format`.

At this point, I started getting a bit lost. Not only in the data, but also in the kinds of queries that get used. Seeing things like `(p:P31*/ps:P31*/wdt:P279*)` and realising I don't know what those query prefixes mean. I tried reading the documentation. It made my brain hurt.

## Questions

At this point, I think it's time to stop and ask for help. I have a lot of questions...

- Is futzing with the query a reasonable approach? Or should I just work on improving the data?
- How should `instance of` and `subclass of` be used in these cases? Is the existing documentation clear enough on this point?
- Is it okay for me to just go in and change that stuff? Do I need to point to a policy?
- Who decides what the form should be?
- Do I need to tell someone they are doing it 'wrong'?
- If these policies change, how would I know?
- Should I try to set something up that will find and flag 'broken' `File Format` records?
- Are there other ways I can help?

Fortunately, through the partnership with Yale University Libraries, I have a contact who knows WikiData very well. Hopefully, they'll be able to help me work out what to do next.