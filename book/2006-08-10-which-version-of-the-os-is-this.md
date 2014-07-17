---
layout: post
title: Which version of the OS is this?
created: 1155210488
permalink: "/2006/08/10/which_version_of_the_os_is_this/"
---
I have access to a number of machine through work, and it's sometimes hard to find adequate information about the operating systems that are installed on them.  The first problem is finding out what version of what operating system they are using.  Usually, the <tt>uname -a</tt> command is enough to work out what's running on a UNIX machine, but sometimes (particularly with Linuxes) it does not provide quite enough info.  This page contains a list examples for determining exactly what your working on.
<!--break-->

# RedHat Linux
 $ uname -a
 Linux green.ph.ed.ac.uk 2.4.21-47.ELsmp #1 SMP 
 Wed Jul 5 20:38:41 EDT 2006 i686 i686 i386 GNU/Linux
 $ rpm -q redhat-release
 redhat-release-3WS-13.8.3
So, we are running [Red Hat Enterprise](http://www.redhat.com/rhel/) 3, with the AS/ES/WS/D suffix indicating the flavour as follows:
* Red Hat Enterprise Linux AS â€” for high-end and mission-critical systems
* Red Hat Enterprise Linux ES â€” for small/mid-range servers
* Red Hat Enterprise Linux WS â€” for technical/design workstation clients
* Red Hat Desktop â€” for secure, managed clients

It's not clear if you can work out which RHEL Update is installed, at least without explicitly comparing version numbers of installed packages.  The <tt>13.8.3</tt> bit should tell us, but I don't know where to look it up.

#  Debian
 $ uname -a
 Linux p15187550 2.6.16-rc6-060319a #1 SMP 
 Sun Mar 19 16:28:15 CET 2006 i686 GNU/Linux
 $ cat /etc/debian_version 
 3.1
Also known as [Sarge](http://www.debian.org/releases/sarge/).

#  Mac OS X
 $ uname -a
 Darwin stoat.local 8.7.0 Darwin Kernel Version 8.7.0: 
 Fri May 26 15:20:53 PDT 2006; root:xnu-792.6.76.obj~1/RELEASE_PPC 
 Power Macintosh powerpc
 $ sw_vers 
 ProductName:    Mac OS X
 ProductVersion: 10.4.7
 BuildVersion:   8J135
a.k.a. [Tiger](http://www.apple.com/macosx/tiger/).

# Solaris
 $ uname -a
 SunOS frontend 5.9 Generic_112233-12 sun4u sparc SUNW,Sun-Fire-15000
In Sun-speak, this means we are running on [Solaris 9](http://www.sun.com/software/solaris/9/).  The leading digit in the version number got cast aside when SunOS was renamed Solaris, I think.

#  AIX
 $ uname -a
 AIX l1f401 3 5 00CD7EAF4C00
 $ oslevel
 5.3.0.0
This machine is running IBM's [AIX 5.3](http://www-03.ibm.com/servers/aix/os/53desc.html).  As an aside, on AIX you can use the <tt>lslpp</tt> command to determine the versions of the installed software packages.
