---
layout: post
type: blog
title: Sentiment Trajectories
author: anj
category: 
tags: ["Visualisation", "Data Mining","Digital Humanities"]
---

As a computational physicist working in a library, my background and training is quite different to the curators and researchers I now work with. Therefore, I do try to spend some time following developments in the digital humanities more generally, trying to understand the kinds of questions being asked, the techniques that are being used, and the assumptions that lie beneath.

A particularly interesting example came up recently in a blog entry called ["Revealing Sentiment and Plot Arcs with the Syuzhet Package"](http://www.matthewjockers.net/2015/02/02/syuzhet/) by [Matthew L. Jockers](http://www.matthewjockers.net/).

<!--break-->

## Sentiment & Smoothing

This new package sparked a lot of interest, especially the idea of revealing that there are just six-or-seven plot archetypes. But it also received a lot of criticism, particularly around the use of a Fourier-transform low-pass filter to iron out the 'noise' and reveal the 'arcs', but also with respect to the accuracy of sentiment analysis (see e.g. [Problems with the Syuzhet Package](https://annieswafford.wordpress.com/2015/03/02/syuzhet/), [Why it’s hard for syuzhet to be right or wrong yet](http://tedunderwood.com/2015/03/24/why-its-hard-for-syuzhet-to-be-right-or-wrong-yet/))[^1].

I agree with much of the criticism, but I think this is still an interesting way of exploring a text, if only as a kind of visualization trick that might let you approach a text in a new way. So I started to think about ways of getting the most out of this kind of data.


## The Meaning of Noise

If we assuming the basic sentiment analysis tactic is of interest, there are two possible sources of 'noise':

* Algorithmic Noise - arising because the sentiment analysis makes mistakes.
* Narrative Noise - arising from the prose itself, i.e. shifts in sentiment that are present but not part of the overall plot arc.

Neither of these is likely to be the kind of unbiased, random noise than most filtering or smoothing techniques are intended for. In particular, I am very uncomfortable treating the second class of dynamics as 'noise' - many data sets are echoes of human utterances or actions[^2] and the quashing or discarding of data points should be carried out with great care.

Instead, my tactic was to avoid discarding or smoothing the data, and to defer any interpretation of 'noise' as long as possible. My preference is to find different ways to present or project the data that might make any underlying structure clearer.


## Summing the Signal

I've spent quite a lot of time staring at time-series data that look very similar to the kind of plots that raw sentence-level sentiment analysis produces. As I looked at the example provided by the [Syuzhet blog post](http://www.matthewjockers.net/2015/02/02/syuzhet/):

![Portrait, Sentiment, Jockers]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-sent-jockers.png)

I realized that a simple but potentially powerful way of re-plotting this data would be to use the cumulative sum rather than the raw value, i.e. instead of plotting the raw values for each sentence, we add-up the 'total sentiment', sentence by sentence, and plot that instead (what I'll call the *Cumulative Emotional Valence*). To test this approach, I first needed to reproduce the raw sentiment data. With a copy of the AFINN algorithm to hand, I came up with this analysis of "A Portrait"

![Portrait, Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-sent.png)

This seems to be similar to the original, which I think is acceptable given that the original was produced using the 'bing' rather than the 'AFINN' sentiment algorithm. 

Performing the cumulative sum, we see how this approach reduces the impact of the 'noisy' part and makes runs of consistent sentiment much clearer:

![Portrait, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/portrait-cuml.png)

Remember, there has been no rounding or approximation at this stage. Shifting to a cumulative representation loses nothing. It's a reversible transformation -- just another way of looking at the same data.

Indeed, I'm tempted to propose that this cumulative measure more closely approximates the effect of reading a text -- the cumulative effect upon the reader seems like a more meaningful perspective to attempt to model, rather than taking each sentence in isolation.

## Comparing Trajectories

Repeating the same analysis for *The Picture of Dorian Gray* and *Romeo and Juliet*, we find:

![Picture, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/pdg-cuml.png)

![Tragedy, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/trj-cuml.png)

The apparent similarity between the last two is quite striking. Indeed, if you rescale and overlay the two trajectories, the overall forms are rather close:

![Rescaled Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/pdg-and-trj-cuml-rescaled.png)


## Statistical Significance

But are these trends significant? For example, if we look at *The Da Vinci Code*:

![Da Vinci Code, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/tdvc-cuml.png)

...and then compare it with a trajectory of the same length, but generated using *randomly generated sentiment values*:

![The Random Walker, Cumulative Sentiment]({{ site.baseurl }}/blog/images/sentiment-trajectories/random-cuml.png)

...it's not immediately clear that the apparent trends in former are any more significant than those in the latter. Therefore, to utilize these methods, the evaluation process must include some analysis of the probably that any given trend could have been generated by a random process.[^3]


## Understanding The Noise

With the above caveat in place, I still think this might be an interesting way of exploring texts. Certainly, the trend for *A Portrait of the Artist as a Young Man* looks statistically significant to me, and you can imagine how an enriched version of this visualization tactic might actually be quite useful. For example, if we could overlay the chapter boundaries (if any), and add a mechanism to make it possible to quickly get to the text underlying each point on the trajectory, that would make it much easier to see what was going on. 

Additionally, as this approach seems to make any apparent order much clearer, I'm much more comfortable with the idea of applying smoothing techniques to the cumulative plots rather than the raw noisy form. If that seems to work well, the accumulation process could be reversed to regenerate the smoothed form of the *Emotional Valence* data.[^4]

If it's of interest, my analysis is [in this iPython Notebook](http://nbviewer.ipython.org/github/anjackson/keeping-codes/blob/gh-pages/experiments/sentimental-trajectories.ipynb) and I'm happy for any of it to be re-used.

[^1]: For more details of the discussion on Twitter, see the excellent [A Fabula of Syuzhet](https://storify.com/clancynewyork/contretemps-a-syuzhet) and [A Fabula of Syuzhet II](https://storify.com/clancynewyork/a-fabula-of-syuzhet-ii/), collected by [Eileen Clancy](https://twitter.com/clancynewyork).
[^2]: As [Tim Sherratt](https://twitter.com/wragge) puts it, ["Big data is made up of many small acts of living."](http://discontents.com.au/stories-for-machines-data-for-humans/). Or in other words, Big Data is usually Soylent Data.
[^3]: Alternatively, you could keep the sentiment algorithm in place and instead randomize the order of the sentences.
[^4]: We're actually doing finite-difference calculus calculus here. It's rather like the analysis proposed in [A Sentimental Derivative](http://www.lagado.name/blog/?p=137), but leading with integration rather than differentiation.
