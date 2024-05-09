---
title: Rummaging in the iPRES Pantry with Rclone
subtitle: Preparing for experimentation with digital preservation tools
date: 2024-05-09
category: registries-of-practice
tags:
  - Digital Preservation
layout: post
author: anj
draft: false
---
Yesterday I was reading about how I should [Get Ready for the Great Digital Preservation Bake Off at iPRES 2024!](https://ipres2024.pubpub.org/pub/jgwgbhi4/release/2) It's a showcase where digital preservation tools can be demonstrated, and comes with a complicated set of test files called the iPRES Pantry.

As I'm circling around to look at format identification tools and their related registries (for the [project I'm working on](https://github.com/digipres/registries-of-practice-project)), I thought it would be a good idea to see if I could use the iPRES Pantry as a test corpus. It's easy enough to browse, thanks to [being available as an openly shared folder on Google Drive](https://drive.google.com/drive/folders/1_BFjNw95HhH45VO-Y2gmJTbd6kfYAtuY). But how to get a hold on it for experimentation?

Before going into the details, it's important to use a wallet, purse or hand mirror to check if you are [Nathan Tallman](https://nathantallman.com/) . This is important because Nathan Tallman is the person who has write access to the iPRES Pantry shared folder.  We don't want to accidentally modify these files, and fortunately, if you are not Nathan Tallman, you will be unable to make any change to either the data or metadata associated with these files. However, if you are Nathan Tallman, please bear in mind that this post was not written with being Nathan Tallman in mind, and you should take the consequences of being Nathan Tallman into consideration when referring to this document.

As I've [blogged before](https://anjackson.net/2023/07/04/robust-file-transfers-with-rclone/), I like using [Rclone](https://rclone.org/) for this kind of thing, and as it [supports Google Drive](https://rclone.org/drive/) it makes sense to use it here. Configuring the 'remotes' can be a bit fiddly, but I managed to come up with this `rclone-pantry.conf` configuration file, including some Google Drive specific options:

```
[pantry]
type = drive
scope = drive.readonly
root_folder_id = 1_BFjNw95HhH45VO-Y2gmJTbd6kfYAtuY
acknowledge_abuse = true
stop_on_download_limit = true
metadata_permissions = read
metadata_labels = read
description = The iPRES Pantry
```

The crucial bit is the `root_folder_id`, which is taken from the Google Drive URL and points Rclone to the iPRES Pantry folder, rather than your own files.  The other fields are described in the Rclone docs, but it's worth noting that I've limited the access to Read Only using `scope = drive.readonly`, just in case you are Nathan Tallman. I've also used the `acknowledge_abuse` flag to ensure the client will still download files even if Google thinks they might be dodgy, and the `stop_on_download_limit` flag so the process will alert you if Google stops the downloads. You can use this config file in a couple of ways, either as an explicit argument:

```
rclone --config ./rclone-pantry.conf ls pantry:
```

Or via an environment variable:

```
export RCLONE_CONFIG=$PWD/rclone-pantry.conf
rclone ls pantry:
```

However, it won't quite work yet as you need to authenticate with Google Drive, even in cases like this where the files are openly shared.  To add the necessary `token` to the configuration, you need to run:

```
rclone config reconnect pantry:
```

You should hopefully be able to use your browser to pick a Google user to log in as, and authorise this access. During this process Rclone also asks if this is a 'Team folder', which I'm not sure about the meaning of, but saying 'No' seemed to work. The resulting credentials will be recorded under the `token` field in the configuration file. This token should not be checked into Git or shared in any other way. Especially if you are Nathan Tallman.

We can now run:

```
rclone ls pantry:
```

And we should get a long list of everything there. The `ls` option recurses into folder by default, so you see every file.  Other options don't automatically recurse, like `lsjson` below, where I've added the flag for recursion along with another that also retrieves any content hashes stored in the system:

```
rclone lsjson -R --hash pantry: > ipres-pantry.json
```

This produces a JSON file with all the metadata, which looks like this for a single file:

```
{
    "Path": "Office/govdocs1/261779.ppt",
    "Name": "261779.ppt",
    "Size": 4220416,
    "MimeType": "application/vnd.ms-powerpoint",
    "ModTime": "2022-09-01T07:30:37.000Z",
    "IsDir": false,
    "Hashes": {
        "md5": "a5b6631bb0a7c555036b9bdcead4f745",
        "sha1": "898f90603697e3378659f8fe7640a1372a506f96",
        "sha256": "0265bb5a11f3a5cac4a6fe507f880bae114ccc57d3ff5b927df4e82f3a96c051"
    },
    "ID": "1lEegWUDVg1OVTMtA4IAJdoAMoe2211f5"
}
```

You can see that there are three hashes recorded for this item, so there's something that Rclone can use to check when downloading files.  I then used the following command to download the full set to my local drive:

```
rclone copy -vvvv pantry: ipres-pantry 2> ipres-pantry.copy.log
```

The `-vvvv` makes the logging very verbose, and the `2> ipres-pantry.copy.log` makes sure the logging gets recorded somewhere useful. Once this completed, the log file ended with:

```
Transferred:       20.150 GiB / 20.150 GiB, 100%, 2.329 MiB/s, ETA 0s
Transferred:          489 / 489, 100%
Elapsed time:   1h39m16.3s
```

This might be down to my not-particularly-fast internet connection, but downloading the 20GiB collection of 489 files took over an hour and a half. The activity log can be tricky to follow, as it Rclone runs multiple processes in parallel, but we can check what's happened for individual files easily enough:

```
$ grep 261779 ipres-pantry.copy.log 
2024/05/08 18:18:07 DEBUG : Office/govdocs1/261779.ppt: Need to transfer - File not found at Destination
2024/05/08 18:21:24 DEBUG : Office/govdocs1/261779.ppt: md5 = a5b6631bb0a7c555036b9bdcead4f745 OK
2024/05/08 18:21:24 DEBUG : Office/govdocs1/261779.ppt.xafavag1.partial: renamed to: Office/govdocs1/261779.ppt
2024/05/08 18:21:24 INFO  : Office/govdocs1/261779.ppt: Copied (new)
```

Here, we can see Rclone downloaded the file using a temporary file name, checked the MD5 checksum was correct, and then moved the newly-downloaded file into place.

Now we have all those files available for local testing, and can easily update this copy in the future. Even if we're not Nathan Tallman.
