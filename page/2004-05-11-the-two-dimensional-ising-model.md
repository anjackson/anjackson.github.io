---
layout: post
title: The Two-Dimensional Ising Model
created: 1084238305
permalink: "/ix2v/comphys/docs/phd/IsingMCMC.pdf/"
---
### An Introduction To Monte Carlo Statistical Mechanics ###
A report written in the 1st year of my Ph.D. (November 1997).
<!--break-->
This acted as my initial introduction to the multicanonical Monte Carlo method.  Here is the introduction - the full text can be downloaded in PDF format from the link at the bottom of this page.

----

#### Introduction ####
This report will outline the theory and findings of a simple Ising model simulation, and is intended
to act as an introduction to the general concepts involved in applying Monte Carlo techniques to
statistical physics. The two-dimensional Ising ferromagnet model is one of the simplest examples
from this field, and yet its implementation allows many of the techniques of this kind of Monte
Carlo simulation to be demonstrated. Also, the 2-D Ising model is one of the few statistical physics
models that can be solved analytically, and so it provides a "gold standard" against which to test
numerical simulation techniques.

Firstly, the theory behind the Ising model will be examined, from the basic concepts of statistical
physics to the specific implementation of the Ising ferromagnet. Also, the general behaviour
expected from the Ising model (including the phase change behaviour) will be discussed.

Following the theory, the concepts of the Monte Carlo approach to statistical physics problems
will be outlined, with the Ising model being used as an example. The basic methods of canonical
Monte Carlo will be explained, along with the limitations of such simulations. Following this the
concepts of multi-canonical Monte Carlo simulation will be introduced. The next step will be to
outline the ways in which properties such as the magnetisation of a system can be extracted from
the simulation, and how the errors in these results can be estimated.

Results will be presented for the canonical and multi-canonical approaches. This will lead to a
discussion on the performance of the simulations, including notes on how the techniques might
be improved. Finally, the wider applicability of this work will be examined, with reference to the
recently developed lattice-switch MCMC technique.
