---
layout: project
type: project
created: '2004-05-17'
tags: [computational-physics, development]
fa-icon: fa-code-fork
title: MCSiMPI
summary: Monte Carlo Simulation via MPI
screenshot: /projects/images/mcsimpi.png
year: 2006
#url: "/projects/mcsimpi/"
aliases:
  - "/projects/mcsimpi.html"
date: '2006-01-01'
showDate: false
showSummary: false
showHero: false
showAuthor: false
---

While working as a post-graduate researcher in computational physics, I invented a new, optimally efficient parallisation scheme for Monte Carlo simulations of systems with short-range interactions. Unlike other schemes, it maintains the global Markov chain, making it possible to directly compare runs and results between serial and parallel computations and ensure the integrity of the simulation is not compromised when run at scale. It is written in C++ and uses [MPI][1], and is designed so that the exact same algorithm is executed whether the simulation runs in two or three spatial dimensions.

The following animation shows a brief simulation of a 'sticky hard disk fluid', and shows how after the fluid has been mixed up, the disks rapidly aggregate to form a space filling structure. The simulation has a gravitational force applied, which leads to the structure sinking slightly before stablising.

<div class="image-box" style="width: 350px; margin: 0 auto;">
<img src="/projects/mcsimpi/mcsimpi-movie-noloop.gif" id="mcsimpi-animation"/>
<div class="image-box-title">
2D simulation of 'sticky' disks &mdash;&nbsp;<button class="!rounded-md bg-primary-600 px-4 py-2 !text-neutral !no-underline hover:!bg-primary-500 dark:bg-primary-800 dark:hover:!bg-primary-700" id="replayAnimation" title="Click here to replay the animation." onclick="document.getElementById('mcsimpi-animation').src = document.getElementById('mcsimpi-animation').src">Replay</a>
</div>
</div>

<style type="text/css">
#replayAnimation:hover {
	cursor: pointer;
}	
</style>

The picture on the below shows a visualisation of the same simulation, but running in three dimensions.

![](mcsimpi-fullsize.png)

[1]: http://en.wikipedia.org/wiki/Message_Passing_Interface

