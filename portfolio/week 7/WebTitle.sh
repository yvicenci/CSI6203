#!/bin/bash

IFS=
# call Downloader.sh from workshop 6
./../week\ 6/Downloader.sh

# extract title of webContent downloaded
webContent=$(cat index.html)

webTitle=$(echo "$webContent" | sed -rn "s@<title>(.*)</title>@\1@p")

# format output
echo "Downloaded page with the title $webTitle"
exit 0