#!/bin/bash

# Prompt user for the name of the new folder to be created
read -p "Type the name of the folder you want to create: " folderName
#Prompt the user for the secret password to be stored
read -p "Type a secret password you want to store: " secretPswd
# Create the directory specified by the user
mkdir "$folderName"
# Save secret password in the file 'secret.txt' under the newly created folder
echo "$secretPswd" > "$folderName"/secret.txt

