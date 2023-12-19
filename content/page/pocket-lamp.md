---
layout: default
type: page
promote: 0
status: 1
created_ts: 1094465904
changed_ts: 1104670224
node_id: 1421
title: Pocket LAMP
author: anj
created: '2004-09-06'
changed: '2005-01-02'
tags: []
url: "/2004/09/06/pocket-lamp/"
aliases:
  - "/node/1421/"
date: '2004-09-06'
---
### Pocket LAMP
LAMP is a very popular web development platform, and my Zaurus is a very nice way to keep a portable web server in my pocket.
<!--break-->

## MySQL
The standard download for MySQL on the Zaurus is [here](http://www.caulfei.demon.co.uk/zaurus/).  This has been very useful, but that version of MySQL (3.22.xx) is a little old and does not support the now very popular _INNER JOIN_ syntax.  So, I have hacked the latest stable [Debian ARM](http://www.debian.org/ports/arm/) [packages](http://packages.debian.org/cgi-bin/search_packages.pl?version=stable&subword=1&exact=&arch=any&releases=all&case=insensitive&keywords=mysql-&searchon=names) in order to bring a 3.23.xx version of MySQL to the Zaurus.  

After stealing a couple of files from the 3.22.xx distribution, I managed to [to build an ipk distribution](http://docs.zaurus.com/index.php?id=ipkg_howto) that deploys successfully on my Zaurus.  Be warned that I have not stripped the original MySQL 3.23.49-8.7 distribution down very much, and you'll need a fair bit of space for the install.  I put it onto my SD card and then ipkg-link'ed it in from there.

Note that this package MUST be installed to a proper linuxy filesystem - the FAT32 filesystem that is the default for SD/CF cards is no good and the ipkg install should/will fail.  See [this page](http://anjackson.net/2005/01/02/formatting-an-sd-card-as-ext2) for information on formatting a card appropriately.

# Installation
* Download the ipk here: [mysql_3.23.49-8.7_arm.ipk](http://anjackson.net/extras/mysql_3.23.49-8.7_arm.ipk).
* Backup your databases - including the 'mysql' one that holds your user info.
* Uninstall any previous mysql package.
* Transfer the 3.23 ipk to the Z and install it.  It must be installed on a proper linux filing system (see note above).
* Ensure the database files in `/var/lib/mysql` are writable by user '`daemon`'.
* Start up the server with a `mysqlstart`.
* Run `mysql_install_db` to initialise the database.
* Restart the server with a `mysqlstop` and then a `mysqlstart`.
* Update you're database tables from your backup.
* If you are running low on space...
    * Move your database files from `/var/lib/mysql` to some other storage like SD or CF, and symlink them back to the original location.
    * Delete extra localization/language files that you don't need.
    * Delete any binaries you don't need.  I think only `mysqlstart`,`mysqlstop`,`mysqld`,`safe_mysqld` and `mysql` are _absolutely_ required, but YMMV.  DO NOT remove any of the dynamic libraries - they are all required.

I've tested the package on my SL-5500 with the v3.1 Sharp ROM, and I know someone got it working on a C750.  Please get [in touch](http://anjackson.net/contact) if you have any questions, or if you can confirm that the package works on other Zaurii/ROMs.

# Known problems with this MySQL 3.23 ipk
* None at present.

Share and Enjoy.

----

## Notes on hacking debian packages
I originally tried to pick the packages apart under Cygwin using dpkg version 1.10.4, but the relavent command for turning a Debian package (.deb) into a tar archive (.tar):
    dpkg-deb --fsys-tarfile package_name.deb > package_name.tar
kept dying with wierd errors in 'subprocess paste', whatever that means.  Eventually tried version 1.6.14 on Solaris and it worked a treat.

Once this was working, I got the mysql packages and their dependencies (ignoring libc6 as the Zaurus already has this) and turned them all into tar archives using the syntax above.  The required files can then be pulled from the tarchives and blatted together to create a suitable distribution.  The only tricks were finding a machine I could use where I could set the UID and GID to be 0 (root:root on the Z), and getting the file permissions right so that the package deployed cleanly.
