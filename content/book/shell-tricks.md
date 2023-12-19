---
layout: default
type: book
promote: 0
status: 1
created_ts: 1092135347
changed_ts: 1159560302
node_id: 985
title: Shell Tricks
author: anj
created: '2004-08-10'
changed: '2006-09-29'
redirect_from:
- "/node/985/"
permalink: "/2004/08/10/shell_tricks/"
tags: []
---
A repository for useful bits and bobs I've found good at the shell prompt.  Mostly in bash (Giffle:bash-shell).
<!--break-->
## Unpacking an RPM without installing it
As I don't have admin privileges at work, it's handy to be able to unpack a binary RPM so I can use recent software without properly installing it.  I was wanting to use wxPython, so I downloaded the RPMs and unpacked them in my home space:

    rpm2cpio wxPython-common-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.rpm > \
       wxPython-common-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.cpio
    cpio -idv < wxPython-common-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.cpio 
    rpm2cpio wxPython2.6-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.rpm > \
       wxPython2.6-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.cpio
    cpio -idv < wxPython2.6-gtk2-ansi-2.6.3.3-fc2_py2.3.i386.cpio 

I could then twiddle with my PYTHONPATH and LD_LIBRARY_PATH so that python would see these new libraries, and so can now run wxPython apps at work. (Something like this, although I may has mis-remembered the paths).
    export PYTHONPATH=$HOME/usr/local/lib/python2.3/site-packages
    export LD_LIBRARY_PATH=$HOME/usr/local/lib


## Gunzip and unTar over a pipe
    gzip -dc <filename>.tar.gz | tar -xvf -

## Shell-script for acting on multiple files
To execute a shell command on every file in a directory, as separate execs, we can use
    #!/bin/bash
    
    for file in \`ls $1\`
    do
    echo eins;
    cat header $1$file > /tmp/temp
    cat /tmp/temp > $1$file
    done
    exit 0;
OR
    find ./ -name "*.ext" -exec chmod a+r {} \;
but this works recursively.

Another quite nice thing, used for updating CVS/Root files on a Zaurus:
    find . -name Root | xargs cp newRoot 
Just copies the contents of newRoot into every Root file.  I think this works too:
    find . -name Root | xargs 'echo user@machine.dom:/dir/root >'
as long as the quote are used to avoid the initial interpretation of the >.
## Slicing
These pieces of randomness will look for all .sh files in PWD and print the 41st line of each - don't ask me why I wanted to know.  Thanks to Brian R for these.
    for f in *.sh; do sed -n '41p' $f; done
or
    ls *.sh | xargs -l sed -n '41p'

## Perl One-Liners
I'm always forgetting how these work, so here goes... To perform a regex replace on a set of files, I do stuff like this:
    perl -pi -e's/ukqcd2/trumpton/' `find ./ -name Root`
    perl -pi -e's/\@SHELL\@/sh/' `find ./ -name Makefile`

Just found a better way to do perl one-liners. You tend to get a command-line buffer overflow using the previous technique on some OSs. This works better:
    find . -name Makefile -exec perl -pi -e "s/e/f/g" {} \;
    find . -type d -exec chmod 755 {} \;
The ; at the end *must* be escaped with a backslash.

<code>
    for i in *.wma ; do mplayer.exe -vo null -vc dummy -af resample=44100 -ao pcm -waveheader "$i"; mv audiodump.wav "`basename "$i" .wma`.wav";done
</code>
