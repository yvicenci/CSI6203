#!/bin/bash

IFS=
# call Downloader.sh from workshop 6
./../week\ 6/Downloader.sh

# extract title of webpage downloaded
webpage=$(cat index.html)

webTitle=$(echo "$webpage" | sed -n -e '/<title>/ p' )

# format output
echo -e "Web page is $webTitle"
exit 0