#!/bin/bash

# newlines preserved
IFS=
# get web content
ecu=$(curl -s https://www.ecu.edu.au/degrees/study-areas/science)

echo "$ecu" | awk '
BEGIN { startProcess=0 }
/section id="disciplines"/{
    startProcess=1
}
{
    while(startProcess==1){
    next
    /<a href="https:\/\/www.ecu.edu.au\/degrees\/study-areas\/science\/.* title/  print $0 }
    /<\/section>/ { startProcess=0 }
    }
}

' #| sed -rn "s@<a href=\"https://www.ecu.edu.au/degrees/study-areas/science.*\" title=\".*\">(.*)</a>@\1@p"
