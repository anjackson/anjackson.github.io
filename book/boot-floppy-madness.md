---
layout: default
type: book
promote: 0
status: 1
created_ts: 1106625740
changed_ts: 1159004647
node_id: 1592
title: Boot floppy madness
created: '2005-01-25'
changed: '2006-09-23'
aliases:
- "/2005/01/25/boot-floppy-madness/"
- "/node/1592/"
permalink: "/2005/01/25/boot-floppy-madness/"
tags: []
---
----
From [here](http://www.knoppix.net/forum/viewtopic.php?t=279)
----
My solution to boot using a floppy disk might help. I boot of the floppy and am able to run from my USB CD-ROM. You will need to boot from the Knoppix CD first to get to the modules you need.

1) Boot up Knoppix, with your USB HDD attached and do an lsmod from a shell or command prompt. Locate the stuff used for USB. In my case, my USB CD-ROM uses usbcore for the bus, usb-uhci for the interface on the drive, and usb-storage to access the drive.

2) Then go to /lib/modules/2.4.20-xfs/kernel/drivers/usb. There you should find usbcore and usb-uhci for example (notice they and in .o). I also had to cd to storage to get usb-storage.o.

3) Copy the needed module files to a blank floppy. (This can also be used for you config saves)

4) Make a boot floppy from the CD using another floppy.

5) Shut down and reboot with the floppy. Choose expert mode when booting. It will go to spot where it asks you if you want to load additional modules, and it will list all the ones that are on the boot floppy. You do not want any of these so continue. It will then ask if you want to load additional modules from another floppy, yes you do. It will prompt you to insert that floppy, do so. Then it will list the modules you coppied. In my case I first load usbcore.o then usb-uhci.o and lastly usb-storage.o.

6) Then continue, it should locate your device and search it for a Knoppix install.

Good Luck, let me know if that works for you.
----
