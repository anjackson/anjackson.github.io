---
title: The Elephant in the Library
subtitle: "How the tools of data science can transform the way we work"
category: mining-web-archives
tags: ["Data Mining"]
layout: post
author: anj
shown: true
draft: true
---

1. WA:TNG
2. Curation for web archives
3. ACT/DDHAPT
4. Researcher Engagement

https://swap.stanford.edu/19940102000000/http://slacvm.slac.stanford.edu/FIND/slac.html

http://oldweb.today/nslinux/19940308213009/http://slacvm.slac.stanford.edu/FIND/slac.html

The Hadoop file system is a great basis to work from. It can be used to store petabytes of content, it has built-in checksumming, and it replicates the data in a way that protects it against most likely causes of loss. At scale, failure is expected. Networks drop during operations. Disks die. Servers die. Power supplies die. The way you store data and the way you run operations on data is all set up to expect the common forms of failure and recover from them.
But there's one thing about the Hadoop file system, or HDFS, that can come as something of a surprise. You can't edit files on HDFS.

You can create files, even append data to files, and of course you can move files around or delete them. But you simply cannot edit them in place.

This can be a bit of a shock at first, because what on earth else are computers for?! We edit emails, Word documents, spreadsheets -- for many people, editing is what computers *do*!

But it's hard to scale up. When your system is trying to carry out thousands of edits simultaneously, over hundreds of different hard disks, and something goes wrong, how do you know whether the edit worked or not? If it didn't, or maybe only half-worked, how can recover and re-run it reliably? If you're carrying out a handful of modifications manually, this is not such a big deal. But when you're trying to automate something so it can run many thousands of times, this problem becomes unavoidable.

For computer programming in general, and for data management in particular, these kind of problems become much more manageable if you can avoid editable data. But how can we get anything done if our data can't be modified?

The answer is that instead of editing data in place, we *transform* it. This process generates a new copy that has the necessary changes.

In audio, video and image editing, this is generally referred to as 'non-destructive editing' or 'non-linear editing'. If you've got a big stack of media files, the editing process is much faster and more robust using this approach, because instead of constantly chopping and reprocessing one big file, you just edit a set of instructions that tell the system how to assemble the final file from the sources you have. This is known as an 'Edit Decision List', and tells the computer to take a few seconds from this file, followed by a few more from another, and so on. The originals are never modified, but instead constantly revisited and used to generate new outputs.

Another example is the Adobe Lightroom image management and manipulation package, which never modifies your original photos, but remembers your edits as a sequence of alterations, such as rotation, cropping, re-colouring. A similar methodology is at work when you use the layers feature of a program like Adobe Photoshop.

Thinking in terms of layers of data is probably the best way to understand what's going on here. Like the art of a traditional cel animator, we can create the illusion of edits by composing fixed layers, and flipping and shifting each layer as necessary to generate a particular output.

This is how the web archive works. We never change the data we downloaded, but we can layer transformations on top of it. This can be hard work, because if we change one of the deeper layers, it means we have to re-process everything, but it makes re-processing a relatively straightforward option. This in turn allows us to be quite experimental in our approach, an things like trying new stacks of operations and iterative improvement come quite naturally.

I'd taken all of this for granted, but some recent work brought this into sharp focus.

---