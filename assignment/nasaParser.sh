# Assignment for CSI6203
# by Yvonne Vicencio

black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'

nasaSite="https://apod.nasa.gov/apod/"

function downloadImage()
{
    local url=$nasaSite$1
    echo $url

}

function scrapeImage()
{
    date="2019 November 03"
    local archive="etc/nasaArchive.html"
    content=$(curl -s $archive)
    echo "$content" | sed -n '/'"$date"'/ p'

}

# main
# ping for 10 seconds only
ping -w 5 apod.nasa.gov

# Exit script if unable to ping NASA website
if [ $? = 0 ]; then
    # prompt user for the webpage to scrape
    echo -e "${red} Sorry, unable to connect to the internet."
    exit 1
fi

scrapeImage