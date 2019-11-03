#!/bin/bash

# newlines preserved
IFS=
# get web content
ecu=$(curl -s https://www.ecu.edu.au/degrees/study-areas/science)

echo "$ecu" | awk '
BEGIN { startProcess=0 }
{
    regexStart="<section id=\"disciplines\".*"
    if( $0 ~ regexStart ){
        startProcess=1
        regexScrape="<a href=\"https://www.ecu.edu.au/degrees/study-areas/science/.*\""
        regexEnd="</section>"
        print $0
        while(startProcess==1){
            if( $0 ~ regexScrape ){
                print $0
        }
        else if( $0 ~ regexEnd ){
            startProcess=0
        }
    }
    }

}
' #| sed -rn "s@<a href=\"https://www.ecu.edu.au/degrees/study-areas/science.*\" title=\".*\">(.*)</a>@\1@p"
