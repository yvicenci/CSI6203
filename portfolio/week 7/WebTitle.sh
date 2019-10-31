#!/bin/bash

# call Downloader.sh from workshop 6
download=$(./../week\ 6/Downloader.sh)

# extract title of webpage downloaded
# webTitle=$(echo "$download" | sed -n 'p')

echo $download