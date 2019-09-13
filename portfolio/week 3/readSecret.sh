#!/bin/bash
# written by Yvonne Vicencio

fileName="secret.txt"
# check if secret.txt can be read
if [ -r $fileName ]; then
    # display content of secret.txt
    cat $fileName
else
    # display error message
    echo "Cannot read file $fileName."
fi
exit 0