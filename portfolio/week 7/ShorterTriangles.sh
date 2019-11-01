#!/bin/bash

# preserve newline
IFS=

# prints the output of Triangles.sh in the format Base: b Height: h Area: a
triangles=$(./../week\ 6/Triangles.sh)

theFormat=$(echo "$triangles" | sed 's/The area for a triangle with base /Base: /; s/and height /Height: /; s/is/Area: /')

echo $theFormat