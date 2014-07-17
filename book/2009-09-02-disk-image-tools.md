---
layout: post
title: Disk Image Tools
created: 1251885671
permalink: "/digital_preservation_notebook/physical_media/disk_image_tools/"
---
All disks are block devices... blah...
Volumes, partitions, file systems, ???

Imaging Tools
=============

Software for pulling the bits off a disk. Note that [forensicswiki.org](http://www.forensicswiki.org) has some useful info on this.

 * [Disk Imaging@forensicswiki.org](http://www.forensicswiki.org/wiki/Category:Disk_Imaging)
 * [AIR - Automated Image and Restore](http://air-imager.sourceforge.net/)
 * [dskdump](http://linux.die.net/man/1/dskdump)
 * [ddrescue@forensicswiki.org](http://www.forensicswiki.org/wiki/Ddrescue)
 * [dcfldd@forensicswiki.org](http://www.forensicswiki.org/wiki/Dcfldd)
 * [rdd](http://sourceforge.net/projects/rdd/), 'robust with respect to read errors'.
 * [AcetoneISO](http://sourceforge.net/projects/acetoneiso2/)
 * [Snorkel](http://www.holmes.nl/NFIlabs/Snorkel/), which is Java, and interesting, but closed-source and by-arrangement.
 * [PyFlag](http://www.pyflag.net) includes disk forensics

Drive Emulation
---------------

 * [CDemu, a CD/DVD drive emulator for Linux](http://cdemu.sourceforge.net)
 * [Mount raw CD-ROM image](http://superuser.com/questions/27895/mount-raw-cd-rom-image) - this has some good info.
 * [DAEMON Tools for Windows](http://www.daemon-tools.cc/)

Converting between image formats
--------------------------------

 * [A list of tools for linux](http://qgqlochekone.blogspot.com/2008/04/iso-linux-debian-venenux-tools.html)
 * [CloneCD image to ISO image file converter](http://sourceforge.net/projects/ccd2iso)

File System Support
===================

How to interpret the bits of a disk image and turn it into a set of files. e.g. NTFS, FAT, ADFS, ISO, etc.

 * [Comparison of file systems](http://en.wikipedia.org/wiki/Comparison_of_file_systems)
 * [File Systems@forensicswiki.org](http://www.forensicswiki.org/wiki/File_Systems)
 * [LIBDSK](http://www.seasip.demon.co.uk/Unix/LibDsk/) is a library for accessing discs and disc image files.
 * [ADFS](http://mdfs.net/Docs/Comp/Disk/Format/ADFS)
   * [Reading DFS and ADFS floppy disks under Linux](http://www.adsb.co.uk/bbc/linux/)
   * [FUSE ADFS](http://www.boddie.org.uk/david/Projects/Python/FUSE)
 * [Linux kernel file system support](http://howto.wikia.com/wiki/Howto_configure_the_Linux_kernel/fs)
