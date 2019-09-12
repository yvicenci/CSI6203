#!/bin/bash
# Script that creates a folder specified by the user in the current directory

# Prompts the user for the folder name
read -p "Type the name of the folder you want to create: " folderName
# Create the folder
mkdir "$folderName"