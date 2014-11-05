---
layout: default
type: book
promote: 0
status: 1
created_ts: 1104669542
changed_ts: 1104670082
node_id: 1581
title: Formatting an SD card as ext2
created: '2005-01-02'
changed: '2005-01-02'
redirect_from:
- "/node/1581/"
permalink: "/2005/01/02/formatting-an-sd-card-as-ext2/"
tags: []
---
### FAT ain't good enough
The FAT32 filing system that most SD/CF cards come formatted as if rather handy in that it can be read 'most anywhere.  However, it does not support things like symbolic links, and so cannot be used reliably when trying to install ipks onto them.  I keep a 128MB SD card in my Zaurus, formatted as ext2 so that I can use it to hold the big stuff like Apache, PHP and MySQL (see [Pocket LAMP](http://anjackson.net/2004/09/06/pocket-lamp)).

## Formatting the SD Card
To install software on an SD card, it needs to be ext2 formatted. You need Fdisk to do this.
If you haven't already, insert the SD/MMC card into Zaurus and type the following commands within Terminal program.
    umount /dev/mmcda1
    fdisk /dev/mmcda
    o [[ENTER]
    n [[ENTER] p [[ENTER] 1 [[ENTER] [[ENTER] [[ENTER]
    t [[ENTER] 1 [[ENTER] 83 [[ENTER]
    w [[ENTER]
In a few moments fdisk will finish and you will be back to console. Next type in following:
    mkfs.ext2 /dev/mmcda1
above command will convert the SD card to ext2 file format. Once the formatting finishes type in the command below to mount the SD card.
    mount /dev/mmcda1 /mnt/card
