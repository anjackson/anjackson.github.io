---
title: Updating the data on British Library funding
subtitle: Reproducing and extending DSHR's 2017 inflation-adjusted income analysis
date: 2024-11-27
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
images:
  - /assets/images/uploads/bl-funding-bars.png
description: Revisiting and extending DSHR's 2017 analysis of the rise and fall
  of the real-terms income of the British Library.
---
I often refer back to [this 2017 analysis by DSHR](https://blog.dshr.org/2017/08/preservation-is-not-technical-problem.html), which documents how the inflation-adjusted income of the British Library fell between 1999 and 2016. I referenced it in [Invisible Memory Machines](/2024/05/14/invisible-memory-machines/), but of course I was missing the data from the last eight years. Perhaps it's all turned around since then!

## Reconstructing the analysis

I went back and grabbed the data from that original blog post, and started to gather the newer information from more recent [annual reports](https://www.gov.uk/search/transparency-and-freedom-of-information-releases?organisations[]=british-library&parent=british-library). Once I'd understood that when DSHR says "2016", this corresponds to the annual report for 2016/2017, it was easy enough to fill in the gaps up to 2023/2024.

However, to my surprise, the actual inflation adjustment was more difficult to reproduce. I went to the [current version of the Bank of England inflation calculator](https://www.bankofengland.co.uk/monetary-policy/inflation/inflation-calculator) and put in the original numbers, but got an answer that was clearly different to those in the original post.  What was going on?

## Web archives to the rescue!

I thought perhaps the old calculator used a different definition of inflation, so I looked it up on the Internet Archive. [This is what it looked like back in 2017](https://web.archive.org/web/20170711171621/http://www.bankofengland.co.uk:80/education/Pages/resources/inflationtools/calculator/default.aspx).

This seemed to rule out my hypothesis, as both versions say they use the Consumer Price Index. So something more subtle must be going on.

I'm not sure why I bothered trying, as dynamic features of websites rarely work in archives, but I tried putting the numbers into the archived version of the calculator page. Much to my amazement, it actually worked, and I could reproduce the numbers in the original post!

![The Bank of England Inflation Calculator from 2017, still working despite being the archived version.](/assets/images/uploads/2017-ia-uk-inflation-calculator-bank-of-england.png "The Bank of England Inflation Calculator c. 2017, Internet Archive.")

## Rewritten histories

So, I was doing the right analysis, but I was wrong to assume that historical inflation adjustment figures would remain the same over time.  In 2017, 112.30 Y1999 GBP was worth 115.62 Y2000 GBP, but by 2024 this view had changed and it was now worth 113.19 Y2000 GBP.

So, I had to go back and gather fresh inflation-adjustment factors for every year. But once I'd done that, the remaining analysis was pretty simple. 

## Filled gaps

Using the updated data, DSHR's original graph now looks like this:

![British Library inflation-adjusted income over time, showing how funding has fallen in real terms.](/assets/images/uploads/bl-funding-adjusted-1999-2023.png "British Library Income Over Time, Inflation-Adjusted to Year 2000 GBP.")

If you want to check my working, you can access the Google Sheet here: [BL Funding Over Time](https://docs.google.com/spreadsheets/d/1uxjiuWYZrALF2mthmiYbUPieu1dEdEwv9GB8dEAizso/edit?gid=0#gid=0) - note that comments are enabled, but not edits.

## Funding gaps

Overall, while the inflation-adjustment has shifted, the funding picture remains essentially the same. 

I've modified the graph to highlight the year 2013, as that's when Non-Print Legal Deposit regulations kicked in and the British Library started to collect around one hundred TB of digital history every year. The [global financial crisis of 2007-2008](https://en.wikipedia.org/wiki/2007%E2%80%932008_financial_crisis) kinda highlights itself.

The bump in 2021 is welcome, but reading the [corresponding annual report](https://assets.publishing.service.gov.uk/media/62d7f0d2e90e071e82002418/British_Library_Annual_Report_and_Accounts_2021-22_FINAL.pdf) makes it clear that this is a blip, mostly caused by short-term grants from the Public Sector Decarbonisation Scheme and National Lottery Heritage Fund. Neither appears to be directed towards digital preservation.

Sadly by 2023 the lift is lost, and the real-terms income of the British Library is down to 76% of what it was in 2000. Despite a massive increase in regulatory remit and digital responsibilities.

Digital preservation: it's still not a technical problem.

## Updates

* 2024-11-28: I added[ a comment to link to this post from the original 2017 analysis](https://blog.dshr.org/2017/08/preservation-is-not-technical-problem.html?showComment=1732749829332#c3303344560660499971), and DSHR responded to say that he has a fresh take in the works. I'm looking forward to seeing what he says.
* 2024-11-29: Based on DSHR's comments, I decided to go back and [separate out the different sources of income, so the trends are a bit clearer](/2024/11/29/british-library-funding-breakdown-trends/).
