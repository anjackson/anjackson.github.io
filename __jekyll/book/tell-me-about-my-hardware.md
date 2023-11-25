---
layout: default
type: book
promote: 0
status: 1
created_ts: 1159560221
changed_ts: 1217427157
node_id: 1685
title: Tell me about my hardware.
author: anj
created: '2006-09-29'
changed: '2008-07-30'
redirect_from:
- "/node/1685/"
permalink: "/2004/08/10/shell_tricks/tell_me_about_my_hardware/"
tags: []
---
This section covers ways of finding out about your hardware without opening the box.  It's mostly UNIX stuff to be used from the command line.  If you want to write programs that determine this stuff, you might find this [Rosetta Stone API](http://xaxxon.slackworks.com/rsapi/) page useful.
<!--break-->
###  Linux

    $ uname -a
    Linux green.ph.ed.ac.uk 2.6.9-42.0.3.ELsmp #1 SMP Mon Sep 25 17:28:02 EDT 2006 
    i686 i686 i386 GNU/Linux

##  Memory
On linux, you can find out what memory your machine has like this:

    $ free -m
                total       used       free     shared    buffers     cached
    Mem:           239        235          4          0          0         31
    -/+ buffers/cache:        202         36
    Swap:         2000        216       1783

Or you can use 

    $ cat /proc/meminfo       
    MemTotal:       245228 kB
    MemFree:          5264 kB
    Buffers:           408 kB 
    Cached:          40896 kB
    SwapCached:      92316 kB
    Active:         168328 kB
    Inactive:        54412 kB
    HighTotal:           0 kB
    HighFree:            0 kB
    LowTotal:       245228 kB
    LowFree:          5264 kB
    SwapTotal:     2048248 kB
    SwapFree:      1891664 kB
    Dirty:             148 kB
    Writeback:           0 kB
    Mapped:         185496 kB
    Slab:            12484 kB
    CommitLimit:   2170860 kB
    Committed_AS:   416392 kB
    PageTables:       1996 kB
    VmallocTotal:   782328 kB
    VmallocUsed:      2260 kB
    VmallocChunk:   780052 kB

Or even:

    $ dmesg | grep MEM
    0MB HIGHMEM available.
    247MB LOWMEM available.
    MEM window: ea000000-ebffffff

Or, if you can access the machine, watch out for it on boot or check via the BIOS.  More info can be found on this [Linux and Memory](http://www.cpqlinux.com/memory.html) web page, including how to get a machine to recognise memory that is going unnoticed.

##  What about my CPUs?
You can find out about the CPU's on your machine using this command:

    cat /proc/cpuinfo

Or using this command:

    /usr/sbin/x86info

Be warned that on hyperthreaded systems, one or more real CPUs may be managed as two or more virtual processors.  My machine in Edinburgh shows up 4 CPU cores, but actually only has two.  I'm not sure how to detect this from the command line.

###  Solaris

    $ uname -a
    SunOS frontend 5.9 Generic_112233-12 sun4u sparc SUNW,Sun-Fire-15000

##  Memory
You can find out about your memory, cpu's and peripherals using

    /usr/sbin/prtdiag

Or, if that doesn't work, you could try:

    /usr/platform/`uname -i`/sbin/prtdiag

##  CPU
This will provide more wordy CPU info:

    /usr/sbin/psrinfo -v

##  All sorts of kernel info
A remarkably large about of impenetrable information is unleashed my typing:

    kstat

Not sure what much of it means though.

###  Windows
Much information is available via 

    systeminfo

###  OS X
To look up the available memory, you can use this

    sysctl -n hw.physmem
