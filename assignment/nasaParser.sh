# Assignment for CSI6203
# by Yvonne Vicencio

function downloadTitle(){
    local webpage=$1
    local title=$(echo "$webpage" | sed -rne "s@<b> (.+)<\/b> <br>@\1@p")
    echo $title
}

function downloadImage()
{
    local webpage=$1
    # used <img> since its only one in a page
    local imageSrc=$(echo "$webpage" | sed -rn "s@<IMG SRC=\"(.*)\"@\1@p")
    local title=$(downloadTitle $webpage)
    wget -O "$title.jpg" "$nasaSite$imageSrc"
    if [ $? = 0 ]; then
        echo -e "${green}Download Successful"
        exit 0
    fi
    echo -e "${red}Something went wrong. Image not downloaded."
    exit 1
}

function downloadExplanation()
{
    local webpage=$1
    local explanation=$(echo "$webpage" | awk '
    BEGIN { pattern="<p> <center>"}
    /<b> Explanation: <\/b>/ { 
        start=1
        while(start==1){
            if( $0 ~ pattern ){
                start=0
                break
            }
            else{
                getline
                print
            }            
        }
    }
    ' |
    # cleanup the tags and blank lines
    sed "s/<a href=\".*\"//g; s/<\/a>//g;
    s/<p> <center>[[:space:]]*//g;s/>//g;
    /^$/d")
    echo "$explanation"
}

function downloadImageWithRange()
{
    #d=$(date --date="$startdate +$n days")
    local startdate=20190512
    local enddate=20190515
    local d=
    local wpage=
    local n=0
    until [ "$d" = "$enddate" ]; do  
        d=$(date -d "$startdate + $n days" +%Y%m%d)
        ndate=$(date -d "$d" "+%Y %B %d")
       
        # combine NASA site and appropriate html page 
        url="$nasaSite$htmlPage"
        page=$(curl -s $url)
        wpage=$(getHtmlFile "$ndate")
        downloadImage "$wpage"
        echo "$ndate"
        ((n++))
    done
}
# get the html file name of the image or details to be downloaded
function getHtmlFile()
{
    local date=$1
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

function formatDate()
{
    $(date -d "$1")
    if [ $? != 0 ]; then
        echo -e "${red}Not a valid date. Exiting..."
        return 1
    else
        echo date -d "$1" "+%Y %B %d"
    fi
}

# setup
IFS=
# colours
red='\033[31m'
green='\033[32m'
purple='\033[35m'
cyan='\033[36m'

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

# Process command line options
if [ $# = 0 ]; then
    echo -e "${red}No arguments provided."
    exit 1
elif [ $# = 1 ]; then
    echo -e "${purple}Not enough arguments provided"
    exit 1
elif [ $# = 2 ]; then
    fullDate=$(formatDate "$2")
    echo "$fullDate"
    if [ $fullDate = 1 ]; then
        exit 1;
    fi
    htmlPage=$(getHtmlFile "$fullDate")
    # combine NASA site and appropriate html page 
    url="$nasaSite$htmlPage"
    page=$(curl -s $url)
    
    # check arguments
    case $1 in
        # download image
        "-i")
            downloadImage $page;;
            #downloadExplanation $page
            #downloadImageWithRange $page;;
        # download details
        "-d")
            echo "Distinction";;
        *)
            echo "${red}Unknown option."
            exit 1;;
    esac
elif [ $# = 3 ]; then
    echo "blah"
fi

echo -e "${cyan}Done!"
exit 0