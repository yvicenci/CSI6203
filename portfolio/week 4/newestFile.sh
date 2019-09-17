#!/bin/bash
# written by Yvonne Vicencio

if [ $# = 3 ]; then
    # check if all three arguments are file names
    if [ -f "$1" ] && [ -f "$2" ] && [ -f "$3" ]; then
        # assume argument 3 is the newest file
        newestFile=$3
        # check if argument 2 is newer than argument 1
        if [ "$1" -nt "$2" ]; then
            # check if argument 1 is also newer than argument 3
            if [ "$1" -nt "$3" ]; then
            # make arugment 1 the newest file
                newestFile=$1
            fi
        else 
            # check if argument 2 is newer than argument 3
            if [ "$2" -nt "$3" ]; then
                # make argument 2 the newest file
                newestFile=$2
            fi
        fi
            # display the newest file
        echo "The newest file is $newestFile."
    else
        # display message because at least one name if not a file
        echo "One or more of the names provided were not actual files."
    fi
else
    # display error message if argument count is not 3
    echo "Error. Need three (3) file names to proceed."
    exit 1
fi