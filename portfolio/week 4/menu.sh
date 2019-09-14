#!/bin/bash
# written by Yvonne Vicencio

# Display options to user
echo -n "
What would you like to do?

1. Create a new folder
2. List files in a folder
3. Copy a folder
4. Save a password
5. Read password
6. Print newest file
"
# Prompt user for a number 
read -p "Please enter the number of the action you want: " choice
# Execute the corresponding script for the choice
case $choice in
    "1")
        ./folderMaker.sh;;
    "2")
        ./folderLister.sh;;
    "3")
        ./foldercopier.sh;;
    "4")
        ./savePassword.sh;;
    "5")
        ./readSecret.sh;;
    "6")
        ./newestFile.sh;;
    *)
        echo "Unknown option.";;
esac
exit 0