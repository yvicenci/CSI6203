#!/bin/bash
# created by Yvonne Vicencio

black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'
# ping for 20 seconds only
ping -w 20 8.8.8.8

# check if ping is success
if [ $? = 0 ]; then
    # prompt user for the webpage to scrape
    echo -e "${blue} Internet seems to be connected."
    read -p "${grey}Please enter a website URL you wish to download: " url
    wget $url
else
    # display error message
    echo -e "${red}Error: Internet is disconnected. Please check your network."
fi

exit 0
