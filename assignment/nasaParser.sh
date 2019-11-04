# Assignment for CSI6203
# by Yvonne Vicencio

function downloadImage()
{
    # combine NASA site and appropriate html page 
    local url=$nasaSite$1
    local webpage=$(curl -s $url)
    # used <img> since its only one in a page
    local imageSrc=$(echo "$webpage" | sed -rn "s@<IMG SRC=\"(.*)\"@\1@p")
    wget -O image.jpg "$nasaSite$imageSrc"
    if [ $? = 0 ]; then
        echo -e "${green}Download Successful"
        exit 0
    fi
    echo -e "${red}Something went wrong. Image not downloaded."
    exit 1
}

function scrapeImage()
{
    local date="2019 November 03"
    local archive="etc/nasaArchive.html"
    #wget -O "$archive" https://apod.nasa.gov/apod/archivepix.html
    awk -v date="$date" ' BEGIN { print date }
    {
        if( $0 ~ date ){
            print $0
        }
    }
    ' $archive | sed -rne "s@$date:  <a href=\"(.*)\">(.*)</a><br>@\1@p"
}

# setup
IFS=
# colours
black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'

nasaSite="https://apod.nasa.gov/apod/"

# main
# ping for 10 seconds only
# ping -w 2 apod.nasa.gov

# Exit script if unable to ping NASA website
# if [ $? = 0 ]; then
#     # prompt user for the webpage to scrape
#     echo -e "${red} Sorry, unable to connect to the internet."
#     exit 1
# fi

htmlPage=$(scrapeImage)
downloadImage $htmlPage
exit 0