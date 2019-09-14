#!/bin/bash
# created by Yvonne Vicencio

IFS=$'\n'
# loop through file names in filenames.txt
for fileName in $(cat filenames.txt); do
    echo -n "$fileName - "
    if [ -f "$fileName" ]; then
        echo "That file exists"
    elif [ -d "$fileName" ]; then
        echo "That's a directory"
    else
        echo "I don't know what that is!"
    fi
done
exit 0