#!/bin/bash
# Calculate area of a triangle with base or height from 1 to 100
# using awk ( from workshop 7)
# by Yvonne

# preserve newline
IFS=

# get output from week 6, Triangles
triangles=$(./../week\ 6/Triangles.sh)

# format using awk
echo "$triangles" | awk '{ printf "Base: %3d\t Height: %3d\t Area: %3d\n", $8, $11, $13}'