---
title: Digital Storage at the British Library
subtitle: Intertwingerling Your Fixity
category: digital-preservation
tags: ["Data Storage"]
layout: post
author: anj
shown: true
draft: true
---

*Brief presentation from Designing Storage Architectures for Digital Collections 2017*

For those of you that don't know about us, the British Library is one of six Legal Deposit libraries in the United Kingdom. The Legal Deposit part dates back to 1710, and means that rather then the library only holding purchased content, publishers are obliged to provide us with copies of their publications so that we can preserve them for the future. 

This means we have a very large collection of printed material, and since the nineties we have been using digitisation as a way of making this material available online. Because of this we now hold a substantial amount of digital images and OCR text. 

Furthermore, the Legal Deposit legislation as been extended to cover digital publications, meaning we now have a much wider range of content. Some of this came in through a voluntary deposit program set up to help the publishers and the libraries explore the issues around digital Legal Deposit together. But the majority of the material has arrived since the 2013 regulations came into force and we started taking in much more content, including attempting to archive all U.K. web sites.

While we currently hold about a petabyte of data in our archival store, we are seeing rapid growth, particularly in our digital audio and video holdings, and we expect new challenges from research data are just around the corner.

So, how to we keep this data safe?

Our current digital library store is geographically distributed, with four RAID6 mirrors held on hard disk drives hosted at three different Legal Deposit libraries. Of these, one runs Linux and the others run on Windows, but otherwise the platforms are identical. It's worth noting that we do not generally have separate access copies of our material, but instead use proxy services to allow users to safely access the contents of their nearest preservation store.

Although the initial replication of data is coordinated, each node runs autonomously when it comes to checking the digital signatures for each item. These signatures verify the ingest time and the checksum of the content, and if any item appears to be damaged, each node can request a suitable copy from one of the others.

This custom check and repair protocol was developed almost entirely in-house, and has run for nearly a decade, but the implementation has reached it’s limits. We need to be able to ingest more content, but we also need to review our threat model and see if we can better mitigate a wider range of risks within broadly the same budget. We suspect we need to pull our custom protocol apart and separate the replication and routine checksum checks from the cryptographic verification of provenance. This separation should allow us to build on layers of open standards rather than having an entirely custom approach.

Furthermore, in at least one location, we must meet the growing needs of our research users, who increasing demand computational, analytical access to content at scale.

So these are some of the things we need to do to keep the content safe and usable. But how do we prove we've kept it safe?

Everyone makes mistakes, and over time, eventually, all organisations will risk losing digital content due to innocent errors. On top of this, as digital resources become increasingly important as historical records, we must expect more and more attempts to hack our archives. Obviously, we all take steps to prevent ourselves from being hacked, but how on earth do we prove to the world that we've done a good job? If "not screwing up" is our only answer, it just becomes a massive single point of failure. One mistake, and the authenticity of every digital item we hold is brought into question. Or the breach goes unnoticed, and in two hundred years time, historians conclude Leonardo da Vinci invented the iPhone.

When building large, distributed computer systems, you have to engineer for failure. When we build large, long-lived information systems, we have to take the same approach.  We have to build storage systems that are designed to mitigate against user errors. We have to work out how to ensure the historical record is trustworthy, even if our institution is hacked. 

A hacker may be able to hack one organisation, but simultaneously and consistently hacking multiple independent organisations worldwide is much, much harder. As our historical record becomes born-digital, the libraries and archives of the world are going to have to find ways to support each other, and build a chain of care that is so wide and so entangled, it simply can't be damaged without leaving a trace. 

Obviously, blockchains like the one that powers Bitcoin are one way to achieve this, but I'd like to explore a range of options, and drive the process by focussing on how our it would work for our end users, and on whether we can get started by leveraging more basic technologies that organisations like mine already know how to deploy and maintain.

I'm also interested how this kind of external verification would be integrated into our own storage systems, and in how we can learn from the current state-of-the-art distributed data stores to improve the way we manage our data. I hope that by doing so, we can make it easier to combine data from many sources, as well as insulate ourselves against deliberate attacks.

Thank you.


