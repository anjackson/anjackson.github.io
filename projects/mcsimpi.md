---
layout: project
type: project
created: '2004-05-17'
tags: [computational-physics, development]
fa-icon: fa-code-fork
title: MCSiMPI
summary: Monte Carlo Simulation via MPI
screenshot: /projects/images/mcsimpi.png
---

Monte Carlo simulation of short-range potentials, efficiently parallelised.


<div class="image-box" style="width: 300px;">
<img src="{{ site.baseurl }}/projects/images/mcsimpi-movie-noloop.gif" id="mcsimpi-animation"/><br/>
<div class="image-box-title">
2D simulation of 'sticky' disks &mdash;&nbsp;<a href="#" class="no-outline" id="replayAnimation" title="Click here to replay the animation."><i class="fa fa-repeat"></i></a>
</div>
</div>

<script>
$(function() {
    var loadImg = document.getElementById('mcsimpi-animation');

    $("#replayAnimation").click(function() {
        loadImg.src = loadImg.src;
    }).click();

});
</script>
