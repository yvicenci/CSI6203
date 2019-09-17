#!/bin/bash
# written by Yvonne Vicencio

black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'

quit="no"
while [ $quit = 'no' ]; do
# Display options to user
echo -n -e "
What would you like to do?
   ${blue}
1. Create a new folder
2. List files in a folder
3. Copy a folder
4. Save a password
5. Read password
6. Print newest file

${grey}Enter 0 to exit

"
# Prompt user for a number 
read -p "Please enter the number of the action you want: " choice
# Execute the corresponding script for the choice
    case $choice in
        "1")
            ./../week\ 4/foldermaker.sh;;
        "2")
            ./../week\ 4/folderLister.sh;;
        "3")
            ./../week\ 4/foldercopier.sh;;
        "4")
            ./../week\ 4/savePassword.sh;;
        "5")
            ./../week\ 4/readSecret.sh;;
        "6")
            read -p "Please enter three file names: " fileOne fileTwo fileThree
            "./../week 4/newestFile.sh" "$fileOne" "$fileTwo" "$fileThree";;
        "0")
            quit="yes";;
        *)
        echo "Unknown option.";;
    esac
done
echo -e "${purple}Exiting... Goodbye!"
exit 0