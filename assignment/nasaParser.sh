# Assignment for CSI6203
# by Yvonne Vicencio

function downloadTitle()
{
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
    # check 2nd argument for filename
    if [ $# = 2 ]; then
        title="$2"
    fi

    wget -O "$title.jpg" "$nasaSite$imageSrc"
    if [ $? = 0 ]; then
        echo -e "${green}$title.jpg downloaded successful!\n"
    else
        echo -e "${red}Something went wrong. $title.jpg not downloaded."
        exit 1
    fi
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

function downloadImagesWithRange()
{
    local startdate=$(date -d "$2" +%Y%m%d)
    local enddate=$(date -d "$3" +%Y%m%d)
    local n=0

    until [ "$d" = "$enddate" ]; do  
        d=$(date -d "$startdate + $n days" +%Y%m%d)
        echo $d
        ndate=$(date -d "$d" "+%Y %B %d")
       
        wpage=$(getHtmlFile "$ndate")
        downloadImage $wpage
        echo -e "${cyan}ndate"
        ((n++))
    done
}
# get the html file name of the image or details to be downloaded
function getHtmlFile()
{
    local date=$1
    htmlPage=$(awk -v date="$date" ' 
    BEGIN { print date }
    {
        if( $0 ~ date ){
            print $0
        }
    }
    ' $archive | sed -rne "s@$date:  <a href=\"(.*)\">(.*)</a><br>@\1@p")

    # combine NASA site and appropriate html page 
    url="$nasaSite$htmlPage"
    page=$(curl -s $url)
    echo $page
}

function formatDate()
{
    echo $(date -d "$1" "+%Y %B %d")
}

# setup
IFS=
# colours
red='\033[31m'
green='\033[32m'
purple='\033[35m'
cyan='\033[36m'

nasaSite="https://apod.nasa.gov/apod/"
archive="etc/nasaArchive.html"

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
if [ $# < 2 ]; then
    echo -e "${red}Not enough arguments provided."
    exit 1
else
    fullDate=$(formatDate "$2")
    # get the nasa archive page 
    wget -O "$archive" https://apod.nasa.gov/apod/archivepix.html
    page=$(getHtmlFile $fullDate)

    # check arguments
    case $1 in
        "-i")
            downloadImage $page;;
        "-d")
            echo "TITLE:"
            downloadTitle $page
            echo "EXPLANATION:"
            downloadExplanation $page;;
        "-r")
            if [ $# < 3 ]; then
                echo -e "${red}Not enough arguments."
                exit 1
            fi
            downloadImagesWithRange $page $2 $3;;
        # specify image filename
        "-if")
            downloadImage $page $3;;
        # specify details output file
        "-do")
            title=$(downloadTitle $page) 
            exp=$(downloadExplanation $page)
            echo -e "TITLE: $title \n EXPLANATIION $exp" > "$3"
            echo -e "${green}Details successfully saved.";;
        *)
            echo -e "${red}Unknown option."
            exit 1;;
    esac
fi