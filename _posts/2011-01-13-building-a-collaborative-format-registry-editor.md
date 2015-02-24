---
layout: post
type: blog
promote: 1
status: 1
created_ts: 1294915974
changed_ts: 1295001803
node_id: 1887
title: Building A Collaborative Format Registry Editor
author: anj
created: '2011-01-13'
changed: '2011-01-14'
redirect_from:
- "/node/1887/"
permalink: "/2011/01/13/building_collaborative_format_registry_editor/"
category: Digital Preservation
tags:
- Format Registry
---
<p>
New OPF Blog: <a href="http://openpreservation.org/knowledge/blogs/2011/01/14/building-collaborative-format-registry-editor/">Building A Collaborative Format Registry Editor</a>. Reproduced below...
</p>
<!--break-->
<p>
After <a href="http://openpreservation.org/knowledge/blogs/2011/01/03/format-registry-challenge-part-three/">Ross's post</a>, I thought I'd better follow up on <a href="/2010/12/09/opf_blog_breaking_down_format_registry/">my format registry thoughts</a> and show you all my response to <a href="http://openpreservation.org/knowledge/blogs/2010/11/10/rethinking-file-format-registry/">Adam's challenge</a>. Using <a href="http://drupal.org/">my weapon of choice</a>, I was able created and populated <a href="http://beta.domd.info/">a web site for collaboratively editing PRONOM data</a> in just over one week's worth of my spare time (six days FTE).
</p><p>
About half the time was spent configuring the web interface. No coding was required in order to do this - I just installed off-the-shelf <a href="http://drupal.org/project/modules">Drupal modules</a> and configured them. Perhaps the most critical module is the <a href="http://drupal.org/project/cck">Content Construction Kit</a>, as this allows custom content types to be built on top of the basic Drupal 'node' type. For example, I needed a 'file extension' field for each record, and this was implemented by creating a taxonomy field called 'file_extensions' and adding it to my Format content type. This makes it easy to discover known extensions and to group format records by extension.
</p><p>
The rest of the time was spent creating the script to upload the data from the PRONOM files into the site over XML-RPC. It's not that much code, but I've never used XML-RPC before and don't use Python all that often, so it took me a little while to make it work. The code is <a href="https://github.com/anjackson/foreg">on github</a> if you want to have a look. It's not production-ready, but I think that's okay for a <a href="http://beta.domd.info">proof-of-concept prototype</a>. As I say on the site, please use the <a href="http://beta.domd.info/user/register">register</a> link if you want an account so you can have a look at the content editing interface. Of course, it may not be precisely the interface one might choose to design, but I think this is a point worth compromising on. In return, we get a lot of stuff for free:
</p>
<ul>
<li>A browsing and editing interface with <i>no coding required</i>. Note that the <i>data schema</i> can be edited through the web interface almost as easily as the content itself.</li>
<li>User sessions and account management, <a href="http://openid.net/">OpenID</a>, authentication, authorisation, user roles etc.</li>
<li>Content management and workflow tools (drafts, editorial control, notification, etc.).</li>
<li>User comments (e.g. <a href="http://beta.domd.info/pronom/x-fmt/392#comment-1">this one</a>), user content rating.</li>
<li>Easy access to the <a href="http://beta.domd.info/">latest additions</a> (<a href="http://beta.domd.info/rss.xml">RSS</a>) and the <a href="http://beta.domd.info/tracker">latest edits</a> (<a href="http://beta.domd.info/recent-edits.rss.xml">RSS</a>).</li>
<li><a href="http://beta.domd.info/facets">Faceted search</a> and <a href="http://beta.domd.info/glossary">an index</a>. I'm particularly please with the faceted search.</li>
<li>Content with nice URLs, tagging, versioning and <a href="http://beta.domd.info/node/1338/revisions/view/9074/18869">version comparison.</a></li>
<li>Direct export as <a href="http://beta.domd.info/node/1338/xml">XML</a> or as <a href="http://beta.domd.info/node/1338/rdf">RDF</a>.</li>
<li>A <a href="http://drupal.org/project/services">programmatic service interface</a> to the content and some site features (e.g. search).</li>
</ul>
<p>
It's not a complete, polished implementation, but I just wanted to show that web interfaces are not that much work if you use the right tool for the job. In my opinion, if you find yourself writing things like user session management or URL aliasing code, you are probably Doing It Wrong. This stuff has been coded thousands of times, and there are multiple implementations on every platform (and available under open licenses) that will help you get started. By relaxing some of our more superficial constraints, we can get a long way very quickly by standing on the shoulders of the giants of web content management.
</p>
