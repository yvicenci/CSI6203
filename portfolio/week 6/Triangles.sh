#!/bin/bash

calculateTriangleArea()
{
    local base=$1
    local height=$2
    local triangleArea=$(( ($base*$height)/2 ))
    echo $triangleArea
}

# main
for((base=1; base<=10; base++))
do
    for((height=1; height<=10; height++))
    do
        echo -e 'The area for a triangle with base ' ${base} 'and height ' ${height} 'is ' $(calculateTriangleArea $base $height) '\n'
    done
done
exit 0