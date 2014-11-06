---
layout: default
type: book
promote: 0
status: 1
created_ts: 1092655249
changed_ts: 1103585689
node_id: 1304
title: Website Management
author: anj
created: '2004-08-16'
changed: '2004-12-20'
redirect_from: []
permalink: "/node/1304/"
tags: []
---
# Content Management Systems
Looking at content management systems for public websites.
<!--break-->

* PHP
    * [Drupal](http://www.drupal.org/)
    * [Xaraya](http://xaraya.com/)
    * [Comparisons at OpenSourceCMS](http://www.opensourcecms.com/)
* Java
    * [A list at java-source.net](http://java-source.net/open-source/content-managment-systems)
    * [Apache Lenya](http://cocoon.apache.org/lenya/) - Looks like it could be good, but having tried the 'incubating' release it seems to be _very_ slow and rather buggy.  This could due to the demo site being unfinished, rather than the engine itself being poor.  
        * Note added 21 Dec 04:  Lenya is slowly moving out of incubating status, and looks like being a rather useful CMS - I should test it again soon.
    * [Magnolia](http://www.magnolia.info/) - Looks good, probably full featured, but has an enforced dual-server (admin and public Tomcats) system which is a bit annoying.  I simply want to drop a CMS into a Tomcat running behind Apache via a mod_jk connector.  Telling me I have to run two instances of Tomcat on 8081 and 8082 is not helpful, although presumably one can get around this.  The Windows startup.bat doesn't work either, and so presumably I have to find a free UNIX machine.  I spent an hour faffing and could not get it started.  It may require JBoss (it did say it was a J2EE thang), which would explain some of my trouble installing it.
    * [Daisy](http://new.cocoondev.org/daisy) Another CMS based on Cocoon.  Looks quite good.
    * [ION](http://ion-cms.sourceforge.net/)
    * [OpenCMS](http://www.opencms.org/)
    * [CoFax](http://www.cofax.org/)
    * [eAdmin/OWX](http://www.eadmin.ch/pages/en/home/)
    * [MMBase](http://www.mmbase.org/) - Multimedia oriented.
    * [SnipSnap](http://www.snipsnap.org) - Primarily a Wiki, but a competent CMS too.  Easy to get started, just use the WAR file.

# Photo Albums
* PHP
    * Giffle:linpha, [link](http://linpha.sourceforge.net/)
    * Giffle:phpDPA
