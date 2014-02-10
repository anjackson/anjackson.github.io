---
layout: default
title: the science of digital preservation
created: 1214591133
---
> 
> *UPDATE*: I've reconsided my position on this, and I think I've underestimated the issues involved in keeping the bytes safe.  I'll write up some notes [here](/digital_preservation_notebook/bit_preservation).

I've not really had a chance to blog about what I do now, and how it's different from what I did before.  In a nutshell, I help create software for [Digital Preservation](http://en.wikipedia.org/wiki/Digital_preservation). This is an interesting field, as it is full of problems that sound like they should have been solved, but haven't...
<!--break-->
As an example of a digital preservation project that faces these problems, check out [Digital Lives](http://www.bl.uk/digital-lives/about.html).  The preservation community has a lot of experience in preserving the physical artefacts created during someone's life, but digital artefacts are becoming increasingly important. How can we preserve all of the sounds, pictures, videos, emails, documents and other electronic files created during an entire lifetime?

There are two main problems, one which sounds hard but is relatively easy, and another which might appear straightforward, but isn't.  The first problem is how to store the files themselves - how to maintain the stream of zeros and ones while ensuring that they don't get lost or corrupted over time.  Although this is a challenging problem, it is in the process of being successfully solved by data replication methods (like [RAID](http://en.wikipedia.org/wiki/Redundant_array_of_independent_disks)) combined with media replacement strategies (called [Refreshing](http://en.wikipedia.org/wiki/Digital_preservation#Refreshing)). Of course, the storage of large collections of data can be expensive, but the cost of storing a gigabyte of data continues to drop and the robustness of the storage media keeps improving. 

That's the good news.  The other, altogether subtler, problem is how to make sure that you can still make any sense of those bits and bytes in the future.  Without the specifications or software required to interpret those bits, the encoded information is impossible to extract.  A number of digital file formats have already become obsolete, and it is difficult to predict which current formats will go the same way. Furthermore, the increasing number of operating systems, programming languages, software projects and file formats is not working in our favour. The challenge is to manage this deluge of digital media so that the computer users of the future will be able to access the digital objects of today.

The project I'm working on, [Planets](http://www.planets-project.eu/), attempts to tackle these issues.  Amongst other things, we are trying to establish a scientific basis for the evaluation of strategies for digital preservation.  The details of this aspect of the project have just been published in a paper called [The Planets Testbed: Science for Digital Preservation](http://journal.code4lib.org/articles/83).  The central idea is that by adopting a scientific approach focused on experimentation and reproducibility, we can generate a body of knowledge about digital preservation approaches that will help the digital preservation community to find ways of preventing our zeros and ones from becoming little more than white noise.

A
