---
layout: post
type: blog
promote: 0
status: 0
created_ts: 1299274633
changed_ts: 1301501212
node_id: 1888
title: 'OPF Blog: Normalisation Strategies & Trimming The Access Stack'
author: anj
created: '2011-03-04'
changed: '2011-03-30'
redirect_from:
- "/node/1888/"
permalink: "/2011/03/04/opf_blog_normalisation_strategies_trimming_access_stack/"
category: Digital Preservation
tags:
- Access
- Format Obsolescence
---
<p>
A new OPF blog: <a href="http://www.openplanetsfoundation.org/node/647">Normalisation & Trimming The Access Stack</a>. Reproduced below...
</p>
<!--break-->
<p>
I've finally had some time to properly consider <a href="http://blog.dshr.org/2011/01/why-migrate-formats-debate-continues.html">David's response</a> to <a href="http://www.openplanetsfoundation.org/node/592">my argument</a> that normalisation is a valid preservation strategy in some cases. To be clear, I do agree with David's main argument: that widely-shared formats are not going obsolete any time soon. However, I don't think that argument covers everything I need to worry about, and his post has helped me to understand the different assumptions that underly our positions on this issue.
</p><p>
One area of disagreement is that David sees my normalisation case as an access issue only, and not a preservation issue. I think this separation is false, and that access is what we are really preserving. But perhaps this stems from some lack of clarity on my part, as David appears to think I was talking about the creation of an access surrogate. This was not my intention. Rather, I was attempting to argue for the creation of a 'master surrogate'. This distinction is important because the <i>goal</i> of the master surrogate is to be a <i>lossless</i> clone of the original, and not to down-sample the original or in any other way reflect the nature of current access channels. It is the item from which access surrogates are generated, rather than being intended for direct access. Of course, in general, this goal may not be fully achievable, and the high-fidelity clone may not be completely lossless. Where the degree of loss is uncertain or unacceptable, then we may wish to keep the original, but I do not consider this to be essential in all cases.
</p><p>
Under this kind of normalisation strategy, the choice of format for the 'master surrogates' is primarily driven by what the institution is willing to commit to supporting. Of course, for the exact reasons David is presenting, the natural choice will lean towards formats that are currently widely used and accessible. But this is <i>not</i> because we are trying to guess which formats will be easy to access in the future. We are looking to today's easily accessible formats because we <i>hope</i> they are more likely to be <i>cheaper</i> to access tomorrow, but we have committed to support them either way.
</p><p>
With that in mind, I think the root cause of our disagreement is revealed in this quote:
</p>
<blockquote>
Unlike the original bits, the surrogate can be re-created at any time by re-running the tool that created it in the first place. If you argue for preserving the access surrogate, you are in effect saying that you don't believe you will be able to re-run the tool in the future.
</blockquote>
<p>
I am arguing for preserving the master surrogate, but this is not because I believe <i>no-one</i> will be able to access the original in the future. The purpose of the master surrogate is to reduce costs by reducing the number of software tools that an institution must support in order to preserve access to its collections. Each format represents a significant commitment in terms of the cost of procuring, supporting and sustaining the necessary access software and infrastructure. Therefore, it may be preferable to migrate a collection in order to reduce the variety of archival formats, so that the overall access framework is cheaper to develop and maintain. 
</p><p>
Of course, if we keep the original objects, this will necessarily increase our storage costs, so then the argument comes down to a rather complicated cost comparison between storing 'extra' master surrogates versus sustaining the original access infrastructure, per format. I'm not convinced there are any easy answers here, as the cost of storing data and the costs of maintaing the software stack will depend on the nature and growth of the collection, and on number on messy institutional and economic factors, like the expertise of the staff you have available or can attract. Can you afford enough developers to support your collection in it's native formats? It depends.
</p><p>
My previous post mentioned the UK Sound Map because it seemed to be a particularly compelling example. Unfortunately, while <a href="http://www.ariadne.ac.uk/issue66/pennock-clark/">this recent publication</a> contains some useful details, it was rather inappropriate for me to drag them into this discussion at this stage. However, it's not too hard to find others because I was not trying to refute David's main argument and present obsolete formats. While widely shared formats may only slide slowly into obsolescence, there is a lot of data that is not so widely shared but must still be preserved.
</p><p>
For example, some formats are widely used but not widely shared. A basic example would be a user's desktop files, for which emulation is probably the best approach (as in <a href="http://www.emory.edu/home/academics/libraries/salman-rushdie.html">this notable example</a>). A more interesting example is that of database files, for which a normalisation strategy may well be appropriate. When archiving databases, one <i>could</i> commit to supporting Oracle, DB2, MySQL, Postgres and so on natively, but if the degree of loss is acceptable, we might prefer to migrate to a slightly more transparent format (e.g. a raw SQL dump, or <a href="http://www.bar.admin.ch/dienstleistungen/00823/00825/index.html?lang=en">SIARD</a> XML) and support access to that instead. To be clear, I am not saying that the native data files are obsolete - just that normalisation to one format may provide a cheaper access route than running the full range of original access software.
</p><p>
For the remainder - formats that are neither widely used or shared - the picture is less clear. As <a href="http://blog.dshr.org/2010/11/half-life-of-digital-formats.html?showComment=1291163020480#c3279152844671257639">David argues in this comment</a>, for some formats, the content may be economically valuable enough that companies can offer commercial access or migration services. However, this does not guaranteed that the British Library or its readers can afford these services! In the long tail of data formats, even a lossy migration may be an acceptable compromise in order to ensure the information is accessible to a wider audience. 
</p><p>
In the most extreme cases, a niche format can be a niche of size 'one person', such as a scientist's code and data files. This is why the <a href="http://www.data-archive.ac.uk/">UK Data Archive</a> <a href="http://www.data-archive.ac.uk/media/54770/ukda081-ds-quantitativedataprocessingprocedures.pdf">attempts to migrate the data they receive to a normalised format wherever possible</a>. It seems rash to expect a rush of startups supporting such maximally rare data formats, but the rarity of the format does not negate the value of the content.
</p><p>
By now, it should be clear that I am not saying that I consider format obsolescence to be the major preservation threat that the Planets tools must address. There are much more pressing issues, from legal constraints through to whether the concept of file format can ever be successfully divorced from the details of the software stack. I am merely arguing that migrations tools have their place nonetheless, and that one such place is where normalisation can mitigate the cost of preserving access to digital items.
</p>
