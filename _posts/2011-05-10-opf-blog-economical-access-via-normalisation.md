---
layout: post
type: blog
title: 'OPF Blog: Economical Access via Normalisation'
author: anj
category: Digital Preservation
tags:
- Normalisation
---
<p>
A new OPF blog entry: <a href="http://openpreservation.org/knowledge/blogs/2011/05/10/economical-access-normalisation/">Economical Access via Normalisation</a>. Reproduced below...
</p>
<!--break-->

<p>I’ve finally had time to consider <a class="external" href="http://blog.dshr.org/2011/01/why-migrate-formats-debate-continues.html">David Rosenthal’s response</a> to <a class="external" href="/2011/01/12/opf_blog_format_obsolescence_and_sustainable_access/">my argument</a> in favour of format normalisation as a preservation strategy. While I largely agree with his position on format obsolescence (with some caveats I’ll return to in a future post), we do appear to disagree on a more fundamental level – on what it is we are actually trying to preserve. In David’s post, my normalisation approach is described as simply ‘improving access’, and by implication, not about preservation. Certainly, if access is not taken into account at all, then preservation is just about keeping the bits safe (by definition). However, in many cases a blind bit-bucket is not sufficient, because <span><em>access</em> is what we are really</span> trying to preserve.</p>

<p>Most&nbsp;institutions will have to understand the content of their own collections – at least well enough to support full-text search and discovery. Most will also be tasked with helping their user community to interpret and re-use the items that they hold, and for some this may mean providing the entire access infrastructure. For example, when providing access to digitised material, libraries and archives tend not to just pass the TIFF files to the end user and call the job done. They create rich interfaces that place the items in context, include additional perspectives or layers (such as OCR text), and are appropriately optimised for particular platforms.</p>

<p>Unfortunately, I fear my description of normalisation may have confused things, as David appears to think I was talking about the creation of an access surrogate. This was not my intention. Rather, I was attempting to argue for the creation of a ‘master surrogate’ or ‘preservation master’&nbsp;from which access surrogates can be generated.&nbsp;This distinction is important because the goal of the preservation master is to be a lossless clone of the original. In general, this goal may not be fully achievable, and a high-fidelity clone may not be completely lossless. Where the degree of loss is uncertain or unacceptable, then we may wish to keep the original, but I do not consider this to be essential in all cases.</p>

<p>Under this kind of normalisation strategy, the choice of format for the preservation masters is primarily driven by what the institution is willing to commit to supporting. Of course, for the exact reasons David is presenting, the natural choice will lean towards formats that are currently widely used for access because they are likely to be cheaper to support in the future.&nbsp;With that in mind, I think the root cause of our disagreement is revealed in this quote:</p>

<blockquote><p>Unlike the original bits, the surrogate can be re-created at any time by re-running the tool that created it in the first place. If you argue for preserving the access surrogate, you are in effect saying that you don’t believe you will be able to re-run the tool in the future.</p></blockquote>

<p>I am arguing for preserving the preservation master, but this is not because I believe <em>no-one</em> would ever be able to re-run the tool in the future. Rather, I see the preservation master as a viable alternative to having to maintain the ability to run <em>all</em> the tools, <em>all</em> of the time, both now and in the future. Each format represents a significant commitment in terms of the cost of procuring, supporting and sustaining the necessary access software and infrastructure. Therefore, it may be preferable to migrate a collection in order to reduce the variety of archival formats, so that the overall access framework is cheaper to develop and maintain.</p>

<p>Of course, if we also keep the original objects, this will increase the cost of storage, and the argument comes down to a rather complicated cost comparison between storing extra preservation master copies versus sustaining the access infrastructure, per format. I’m not convinced there are any easy answers here, as the cost of storing data and the cost of maintaining the software stack will depend on the nature and growth of the collection, and on a number on messy institutional and economic factors, like the expertise of the staff you have available or can attract. Even at a single institution, the optimal strategy will depend on the collection – for example, while the Internet Archive do not attempt to normalise the content of their web archive, they have chosen to&nbsp;<a class="external" href="http://www.archive.org/help/derivatives.php">generate derivative copies</a>&nbsp;of content uploaded by contributors.</p>

<p>In summary, the need to adopt a normalisation strategy is driven primarily by the requirement to facilitate or maintain access to the content. It is not <em>directly</em> concerned with obsolescence, except to the extent that the progression towards obsolescence drives up access costs. Even when obsolescence is of no concern, a normalisation strategy can help mitigate the the cost of preserving access to digital items by reducing the complexity of the access infrastructure. To implement such a strategy, we need reliable, trustworthy format migration tools. I believe that the OPF has an important role to play here, finding ways to build that trust.</p>
 