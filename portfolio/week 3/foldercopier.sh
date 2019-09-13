#!/bin/bash
# written by Yvonne Vicencio

# prompt user for a folder name to copy
read -p "Enter the name of the folder you would like to copy: " folderName
# if the name is a valid directory
if [ -d "$folderName" ]; then
    # copy folder to a new location
    read -p "Enter the name of the destination folder: " newFolderName
    cp -r "$folderName" "$newFolderName"
else
    # print an error message
    echo "Error: Folder cannot be found. Please try again with a different folder."
fi

