---
layout: post
type: blog
title: Sentiment Trajectories
author: anj
category: Data Mining
tags: ["Data Mining","Digital Humanities"]
---

Although I work at a web archive, with humanities curators and researchers, and on projects that fit somewhere under the 'Big Tent' of the digital humanities, my background is in the sciences (specifically computational physics). Therefore, as my background differs so greatly from many of the individuals I work with (and whose needs I am trying to meet), I do try to spend some time following developments in the digital humanities more generally, trying to understand the kinds of questions being asked, the techniques that are being used, and the assumptions that lie beneath.


## Sentiment & Smoothing

A particularly interesting example came up recently in a blog entry called ["Revealing Sentiment and Plot Arcs with the Syuzhet Package"](http://www.matthewjockers.net/2015/02/02/syuzhet/) by [Matthew L. Jockers](http://www.matthewjockers.net/). This new package sparked a lot of interest, especially the idea of revealing that there are just six-or-seven plot archetypes. But it also received a lot of (largely constructive!) criticism, particularly around the use of a Fourier-transform low pass filter to iron out the 'noise' and reveal the 'arcs', but also with respect to the accuracy of sentiment analysis (see e.g. [Problems with the Syuzhet Package](https://annieswafford.wordpress.com/2015/03/02/syuzhet/), [Why it’s hard for syuzhet to be right or wrong yet](http://tedunderwood.com/2015/03/24/why-its-hard-for-syuzhet-to-be-right-or-wrong-yet/))[^1].

I agree with much of the criticism, but I think this is still an interesting way of exploring a text, if only as a kind of visualization trick that might let you explore a text in a new way. So I started to think about ways of getting the most our of this kind of data.


## The Meaning of Noise

So, it we assuming the basic sentiment analysis tactic is of interest, there are two possible sources of 'noise':

* Algorithmic Noise - arising because the sentiment analysis makes mistakes.
* Narrative Noise - arising from the prose itself.

Neither of these is likely to be the kind of unbiased, random noise than most filtering or smoothing techniques are intended for. In particular, I am very uncomfortable treating the second class of dynamics as 'noise' - many data sets are echoes of human utterances or actions[^2] and the quashing or discarding of data points should be carried out with much more care.

Instead, my tactic was to avoid discarding or smoothing the data, and to defer any interpretation of 'noise' as long as possible. Rather, my preference is find different ways to present or project the data that might make any underlying structure clearer.


## Summing the Signal

My background and research history mean I've spent quite a lot of time staring at time-series data that look very similar to the kind of noise plots that raw sentence-level sentiment analysis produces. As I looked at the example provided by the Syuzhet blog post:

![Portrait, Sentiment, Jockers]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-sent-jockers.png)

I realised that a simple but potentially powerful way of re-plotting this data would be to use the cumulative sum rather than the raw value, i.e. instead of plotting the raw values for each sentence, we add-up the 'total sentiment', sentence by sentence, and plot that instead (what I'll call the Cumulative Emotional Valance). To test this approach, I first needed to reproduce the raw sentiment data. With a copy of the AFINN algorithm to hand, I came up with this analysis of "A Portrait"

![Portrait, Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-sent.png)

This seems broadly similar to the one [here], which seems acceptable given that the original was produced using the 'bing' rather than 'AFINN' sentiment algorithm. Performing the cumulative sum, we see how this approach reduces the impact of the 'noisy' part and makes runs of consistent sentiment much clearer:

![Portrait, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-cuml.png)

Cumulative loses nothing, you can tell because you can transform it back.

Actually discrete calculus, but leading with integration rather than the differentiation in this blog post OI discovered later on: [A Sentimental Derivative](http://www.lagado.name/blog/?p=137)

![Da Vince Code, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/tdvc-cuml.png)

![Picture, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/pdg-cuml.png)

![Tragedy, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/trj-cuml.png)

![Rescaled Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/pdg-and-trj-cuml-rescaled.png)


My working is shown [in this iPython Notebook](http://nbviewer.ipython.org/github/anjackson/keeping-codes/blob/gh-pages/experiments/sentimental-trajectories.ipynb) and I'm happy for any of it to be re-used.


[^1]: For more details of the discussion on Twitter, see the excellent [A Fabula of Syuzhet](https://storify.com/clancynewyork/contretemps-a-syuzhet) and [A Fabula of Syuzhet II](https://storify.com/clancynewyork/a-fabula-of-syuzhet-ii/), collected by [Eileen Clancy](https://twitter.com/clancynewyork).
[^2]: As [Tim Sherratt](https://twitter.com/wragge) put it, ["Big data is made up of many small acts of living."]().
