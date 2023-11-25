---
title: "Unsafe Device Removal: The Results"
subtitle: "\"It's Complicated\""
category: digipres-lessons-learned
tags: ["Digital Preservation", "Keeping Codes", "Lessons Learned"]
layout: post
author: anj
shown: true
---

Following my [proposed experiment in data destruction](/2017/04/10/unsafe-device-removal/), a few kind readers tried it out and let me know what happened[^1]. I've summarised the results below, to try and see if there's any common pattern.

<!--break-->

| Software | Format | Was recovery possible? |
| ---------|--------|------------------------|
| Apple Preview | JPEG | No (rendered image still shown and could be captured via screenshot)[^2] |
| GIMP | JPEG | Yes (with minor alterations to the data, likely [within allowed limits for JPEG][1])[^2] |
| Imagemagick display | JPEG | Yes (result not binary-identical)[^3] |
| Ubuntu Image Viewer | JPEG | No[^4] |
| Ubuntu Document Viewer | PDF | Yes[^4] |
| PDF reader | PDF | PDF from a browser, stay in a PDF reader after the browser closes but can't be saved[^5] |
| Word (Windows 95) | DOC (on a floppy!) | No (but re-inserting the floppy worked!)[^6] |

As far as I can tell from this data, there isn't much of a pattern here. Broadly, the observed behaviour seems to depend on the software rather than the format, and 'viewer' style applications appear less likely to allow re-saving than 'editor' apps (but the behaviour of the Ubuntu Document Viewer shows this is not a robust finding). All we can be sure of at this point is this: "It's complicated".

To find out what's going on, we'll need to look more closely at what happens when we open a file...

----

[^1]: Thanks also to [Nick Krabbenhöft][2] for [pointing out][3] that I could have been a bit more careful about my original experiment, and that would have helped work out where the JPEG differences came from in the case of re-saving the image from GIMP.  That said, I expect such minor differences are down to small variations in the implementation of the JPEG decompression scheme, [as permitted by the standard][1]. i.e. my final image is likely the no *more* different that the *same original image* might be when rendered by a *different software application*.
[^2]: See [the original post](/2017/04/10/unsafe-device-removal/)
[^3]: Result from [@atomotic](http://anjackson.net/2017/04/10/unsafe-device-removal/#comment-3249487142)
[^4]: Result from [@archivalistic](https://twitter.com/archivalistic/status/851907815673286656)
[^5]: From [@andrewjbtw](https://twitter.com/andrewjbtw/status/851530416590790656)
[^6]: Also from [@andrewjbtw](https://twitter.com/andrewjbtw/status/851531680632365056)

[1]: https://photo.stackexchange.com/a/83892/62442
[2]: https://twitter.com/nkrabben
[3]: /2017/04/10/unsafe-device-removal/#comment-3249002689