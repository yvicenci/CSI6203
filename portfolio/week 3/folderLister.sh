#!/bin/bash

# Prompt user for the folder name to display
read -p "Enter the name of the folder you want the contents to be displayed: " folderName
# Display the content of the given folder
ls -a "$folderName"