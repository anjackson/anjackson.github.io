---
title: Speeding Up Format Identification
subtitle: Fast versus fastidious?
date: 2023-03-21T09:38:12.447Z
category: format-identification
tags:
  - Digital Preservation
layout: post
author: anj
shown: true
---
In the last few days, I've been going through the process of updating my [Nanite wrapper for DROID](https://github.com/openpreserve/nanite#readme), which I built to make it easier to re-use DROID's identification engine in other contexts -- especially in large-scale Hadoop jobs where we want to [process every record in our WARCs](https://github.com/ukwa/webarchive-discovery).

_UPDATED: 2023-03-22_

<!--break-->

## Keeping Up To Date

Over recent years, the National Archive of the UK have made a lot of improvements to DROID, so it's important to keep the code up to date as well as the signature files.  It's been especially gratifying to be able to delete more and more of my code as the developers have made DROID itself easier to re-use.

Now, as of DROID 6.6, there is a [new API](https://github.com/digital-preservation/droid/wiki/How-to-use-DROID-internal-API) and a simplified JAR dependency chain.  The API is _very_ new, and marked as _INTERNAL USE ONLY_ (as it's expected to change), but it was nevertheless possible to use it to replace most of my implementation (with a few extensions I need, for the time being anyway).

## Signatures Going Wild

During the upgrade work, [Ross Spencer directed me](https://digipres.club/@beet_keeper/110055352061211512) to an [apparent issue with DROID's performance on ZIP files](https://github.com/digital-preservation/droid/issues/906). The bug report states that identifying a large ZIP used to be very fast, but now the whole ZIP file is being scanned, and as it's 4GB in size this is making the process unacceptably slow.

This left me wondering if I've misunderstood the binary signature matching algorithm. Because, as I understand it, scanning the whole file is something DROID does sometimes, depending on the signatures and the file in question. i.e. I think the reported behaviour is the expected behaviour for ZIP files.

This is because PRONOM supports unlimited wildcard pattern matches, like this one (from [x-fmt/412 - Java Archive Format](https://www.nationalarchives.gov.uk/PRONOM/x-fmt/412)):

```
^504B0304*4D4554412D494E462F4D414E49464553542E4D46
```

That `*` can match any number of bytes of any value, so if a file matches the bit before the `*`, DROID will keep scanning the rest of the file looking for the `4d45...` bit.  Unfortunately, that first bit (`504B0304`) is the binary signature of [x-fmt/263 - ZIP Format](https://www.nationalarchives.gov.uk/PRONOM/x-fmt/263). This means every ZIP which is _not_ a JAR will be scanned all the way to the end. As DROID [_always_ runs _all_ valid signatures over each file](https://github.com/digital-preservation/droid/blob/6.6.1/droid-core/src/main/java/uk/gov/nationalarchives/droid/core/signature/droid6/InternalSignatureCollection.java#L87-L108), it will re-scan the whole file for _every_ signature that follows this pattern (like [fmt/161 - SIARD](https://www.nationalarchives.gov.uk/PRONOM/fmt/161)).

_UPDATED: 2023-03-22: Additionally, further discussions on the issue have made me realise I'd missed a part of the container signature logic.  If container signatures are enabled, [the initialisation code explicitly drops any binary signatures for which container signatures are provided](https://github.com/digital-preservation/droid/blob/a977e74b3ad791af2cefce43ea797aafd81c490f/droid-container/src/main/java/uk/gov/nationalarchives/droid/container/ContainerIdentifierInit.java#L79). As JAR has a container signature, the wildcard binary signature is not used. However, SIARD has no container signature, so in that case the analysis above still stands, and a full scan will be performed on ZIP files that are not SIARD files._

_The issue thread also made me realize I'd forgotten about 'Variable position' signatures, e.g. [fmt/1649 - AGS 4 Data Format](https://www.nationalarchives.gov.uk/PRONOM/fmt/1649). Variable matches can occur anywhere in a file, and unless there is an additional BOF/EOF signature, a full file scan will be performed (unless the file matches). The PRONOM/DROID team are looking at avoiding any binary signature matches that are on this form._

This is why the DROID tools allow you to set a maximum number of bytes to scan. This prevents DROID from scanning every byte of each file, at the cost a possible drop in accuracy.

The bug report made it clear that the reporter was operating with _no_ limit set on the number of bytes to be scanned. So rather than wondering why a fast process suddenly seems to be running slower, I'm left wondering why a process that *should* be slow ever managed to appear fast at all.


## Making Slow Things Faster

Despite being [one of the two hardest problems in computer science](https://martinfowler.com/bliki/TwoHardThings.html), this answer to this performance problem is caching.

This is why [DROID uses](https://github.com/digital-preservation/droid/blob/a977e74b3ad791af2cefce43ea797aafd81c490f/droid-core-interfaces/src/main/java/uk/gov/nationalarchives/droid/core/interfaces/resource/FileSystemIdentificationRequest.java#L80-L88) the [caching features of the underlying `byteseek` library](https://github.com/nishihatapalmer/byteseek#io) to cache the start and end of the file. This cache is re-used for every signature pass, and is a very effective way to speed up a critical part of the process. 

But this does not cache large files, so _wild_ signatures like the ones above will re-read the whole file each time. However, this is where the operating system can help us.

All modern operating system use any available system RAM to cache the contents of files that are in use. This means that, if we make multiple passes on a single file, but have plenty of RAM available, the file will only be read from disk once, and will be re-read from RAM for any subsequent passes.

This often ends up interfering with things like benchmarking of tasks like format identification, or checksum calculation.  It's easy to end up thinking everything is super-fast, but then find out it's only because your test files were so small that everything was cached in RAM. 

Based on this, my suspicion is that the bug report is not a problem with DROID, but something else has changed that has lead to cache exhaustion. For example, other process on the machine in question may be consuming a large amount of RAM, or may be simultaneously scanning a large volume of _other_ files. Either of these things would interfere with the operating system's ability to cache the ZIP file in question.

But, having said all that, it's perfectly possible that I've simply not understood how DROID _actually_ works. Please [let me know](https://digipres.club/@anj) if I'm mistaken!

_UPDATED: 2023-03-22: It looks like the issue isn't RAM caching, but is more related to modifications that were being made to the signature files to avoid some of the issues discussed above. See [the original thread](https://github.com/digital-preservation/droid/issues/906) for details._

## Alternative Matching Algorithms

Finally, I want to highlight [the different approach taken by the Siegfried tool](https://www.itforarchivists.com/#changes-to-the-matching-algorithm). This makes some pretty reasonable assumptions that allow it to avoid scanning _all_ the signatures. It also uses explicit memory-mapped I/O where possible, which should be a bit faster than DROID's approach, and should help ensure the identification process can continue without the RAM cache of the current file getting dropped.

Finally, I wonder if it's possible to compile a large set of format signatures down into a single finite state machine (along the lines of e.g. [the Ragel State Machine Compiler](http://www.colm.net/open-source/ragel/)). This would be like a single massive regular expression, with multiple possible end states corresponding to different formats (and combinations of formats?!).

If such a thing is possible, then it would always complete in a single pass, and should only require caching the current 'chunk' of file being scanned. But frankly, even if it is possible, I'm not sure it would be worth the effort in terms of implementation complexity and maintenance load.

Just buy more RAM!