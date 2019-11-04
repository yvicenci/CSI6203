#!/bin/bash

# newlines preserved
IFS=
# get web content
ecu=$(curl -s https://www.ecu.edu.au/degrees/study-areas/science)

# use sed and awk to get disciplines in ECU Science
echo "$ecu" | sed -rn "s@<a href=\"https://www.ecu.edu.au/degrees/study-areas/science.*\" title=\".*\">(.*)</a>@\1@p" | awk '
    BEGIN { i=0; used[0]=""}
    {
        i+=1
        if($0 in used)
            next
        else {
            used[$0]=i
            print $0
        }
    }
'
