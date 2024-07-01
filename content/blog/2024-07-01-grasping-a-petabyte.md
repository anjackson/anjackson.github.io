---
title: Grasping a Petabyte
subtitle: The impact of replicating the UK Web Archive
date: 2024-07-01
category: digital-footprint
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
---
I was the Technical Lead for the UK Web Archive at the British Library for twelve years. Now that I've left, I can't help but wonder which of the things I started will stick around? And which will fall away?

Just a few days after I submitted my resignation, we discovered that [the British Library had been hacked](https://en.wikipedia.org/wiki/British_Library_cyberattack). All the British Library systems were shut down, including those holding copies of the UK Web Archive. It was a very stressful period of time, and the remainder of my three-month notice period was spent trying to guess the future and plan for it.

But at least we knew there was an independent copy of the vast majority of the collection.

As described in [this technical update](https://blogs.bl.uk/webarchive/2023/10/uk-web-archive-technical-update-autumn-2023.html) (published just ten days before the attack was discovered!), one of our major achievements in 2023 was replicating over a petabyte of UK web history and moving it to the National Library of Scotland. From April 2013 up to February 2023, the web archive part of the Non-Print Legal Deposit collection was safely held *elsewhere*. Not just geographically distributed, but independently managed and maintained.

In just a few months, this replication project went from being a cumbersome mitigation of a theoretical risk, to an absolutely crucial part of an active disaster recovery plan. 

Of course, I didn't do this on my own. Most of the actual work was done by a member of my team (thanks GH!), working alongside the wonderful team at the National Library of Scotland. And then there's the work before the work: building the case and gathering the funding, convincing the various stakeholders. None of that would have been possible without the support of UK Web Archive curatorial team, my line manager, and the Head of Liaison and Governance for the Legal Deposit Libraries. I can't thank them enough.

But being closely involved in this work had another unexpected benefit...

I got to *see* a petabyte. *In the flesh.*

## Lift

Before I tell this story, I want you to guess how big you think a petabyte has to be... How many servers? How much does it weigh? What would it look like, sitting on pallets in the back of a truck?

Some details might help. These were dedicated compute and storage servers, purchased especially for the replication project. Like our main storage and processing cluster, it was set up to run the [Hadoop distributed file system](https://hadoop.apache.org/docs/r1.2.1/hdfs_design.html). Under this model, we need enough disk space to store *three* copies of every block of data, so that's actually three petabytes of raw storage. Along with enough computing power to actually do something useful with the data.

Here's what one of the servers looked like in the rack...

![One server from the front](/assets/images/uploads/img_3391.jpeg)

Each one is 4[U](https://en.wikipedia.org/wiki/Rack_unit)/7' tall, 19' across, and just over 3 feet long/deep. This is what they looked like as they were being lifted onto a pallet for transport...

![Lifting a fifth of a petabyte.](/assets/images/uploads/img_3389.jpeg)

They're pretty heavy. I can't remember the exact figure but it's over 100kg for each server. 

So what do you think? How many of these do we need to safely store a three-fold replicated petabyte of web history?

It's five. Five servers.

Here they are, packed onto three pallets, in the back of the truck, about to head north...

![Pallets in the truck](/assets/images/uploads/img_3394.jpeg)

If you stacked them directly on top of each other, they'd be just under three feet high. 

This petabyte would probably fit under your desk[^0].

To put this in context, think about all the PC, laptops and tablets sitting *on* all the desks. According to their 2022-23 annual report, the British Library has over 3,000 devices[^1]. These five servers represent less that 0.2% of that total. Perhaps a few percent of the total physical hardware estate in terms of mass or volume.

## Energy

But what about all the power those things need, and the cooling? Well, according to the on-server metrics, each one uses at most 0.5kW of power (usually less). But to be honest, I never got fully to the bottom of how power draw metrics worked on those servers. So let's be conservative and say each server draws 1kW of power constantly. Like running a camping kettle all the time.

For cooling, a reasonable rule of thumb is that for each kW of power each server draws, you need a kW of cooling to counter the heat of the drawn power being dissipated.  So lets say 2kW per server. Like running a standard kettle all the time[^2].

For a year, we get:

```
5 * 2kW * 1 year = 87.6581277 MWh
```

Again, it's important to put this number in some kind of context. Going back to the 2022-23 annual report, the total energy consumption of the British Library is 32,486 MWh[^1]. In other words, keeping that petabyte online takes about 0.3% of the energy consumption of the institution[^3].

And even *all of the power it takes to run the British Library* amounts to less than 0.04% of the lower-bound (conservative) estimate for the power used by the Bitcoin network[^4]. Our petabyte needs just 0.0001%, or one millionth of the power Bitcoin consumes.

## Balance

I'm absolutely *not* trying to say we shouldn't be more careful, more mindful of what we store and how we store it.  But it's frustrating to see facts and figures about the whole IT industry being used to denigrate the tiny sliver of resources being dedicated to digital memory.

When I was at the UK Web Archive, we were always trying to strike a balance between size, coverage, depth, quality and frequency. We were always on the look out for ways to keep existing hardware running rather than replace kit prematurely. Always scanning the horizon for more efficient approaches to digital storage[^5]. This is part of the job. 

But digital history deserves a fair slice of our financial and environmental budgets.

Careful curation is part of the solution. But so is building systems of care capable of seeking a balance between credible long-term risks and short-term pressures. Systems of care capable of responding to sudden new risks and unpredictable events.

We had to fight for that replicated petabyte. After all, every ounce of redundancy  looks like waste.

Until you need it.



[^0]: But it would cease to be a usable desk, as there would be no room for your legs. Please note this is not a recommended operating environment for this kind of server and you may void your warranty by attempting to store a petabyte under your desk.
[^1]: From the [British Library Annual Report and Accounts 2022-23](https://www.gov.uk/government/publications/british-library-annual-report-and-accounts-2022-23). 
[^2]: But less than your fancy 3kW "rapid boil" one.
[^3]: Maintaining comfortable environments for people and print takes power too.
[^4]: From the [Cambridge Bitcoin Electricity Consumption Index](https://ccaf.io/cbnsi/cbeci).
[^5]: Although the current regulatory framework rules out e.g. the [appropriate use of cloud storage](https://www.dpconline.org/blog/is-digital-preservation-bad-for-the-environment).
