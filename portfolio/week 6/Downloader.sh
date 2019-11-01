#!/bin/bash

# colours
red='\033[31m'
clear='\033[0m'
cyan='\033[36m'

# downloads files from the internet and saves in the specified location
downloadFromInternet()
{
    read -p "Type the URL of a file to download: " url
    read -p "Type the location of where you would like to download the file to: " fileLocation
    wget $url -P $fileLocation
}

downloadFromInternet
#if [ $? = 0 ]; then
#        echo -e "${cyan}Download complete${clear}"
#    else
#        echo -e "${red}Sorry, something went wrong :( ${clear}"
#fi
exit 0