---
layout: default
type: page
promote: 0
status: 1
created_ts: 1084352440
changed_ts: 1170907815
node_id: 582
title: Demonstration Of The Ill-Conditioned Nature Of Hilbert Matricies
created: '2004-05-12'
changed: '2007-02-08'
aliases:
- "/ix2v/comphys/docs/ug/y3-na-hilbert.pdf/"
permalink: "/ix2v/comphys/docs/ug/y3-na-hilbert.pdf/"
tags: []
attachments:
- - src: page/files/y3-na-hilbert.pdf
    name: y3-na-hilbert.pdf
---
### Demonstration Of The Ill-Conditioned Nature Of Hilbert Matricies
## An application of numerical analysis techniques
In this assignment I used LU decomposition to solve
the matrix equation `H . X = B` where `H` corresponds to
a Hilbert matrix of order `n`, and all elements of `B` are
unity, and compare these results with those given by
more accurate integer methods. I found that while the
error from the LU decomposition increase
exponentially with `n`, the routine still coped very well
with quite extremely ill-conditioned matrices over the
range of `n` used (`2` to `10`). However, for
characteristically ill-conditioned matrix systems, one
should generally endeavour to find analytical solutions
as opposed to utilising numerical methods when
accuracy is of primary importance.

An application of LU-decomposition. (3rd Year)
