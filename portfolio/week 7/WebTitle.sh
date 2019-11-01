#!/bin/bash

IFS#=
# call Downloader.sh from workshop 6
download=$(./../week\ 6/Downloader.sh)

# extract title of webpage downloaded
sed -i 's/<title>/<Title>/; /<Title>/p' index.html