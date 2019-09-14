#!/bin/bash
# created by Yvonne Vicencio

# shell colours
black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'

# check the math operation of the 2nd argument
case $2 in
# and perform the arithmetic operation
    "+")
        # Addition
        result=$(($1 + $3))
        colour=$blue;;
    "-")
        # subtraction
        result=$(($1 - $3))
        colour=$green;;
    "x")
        # multiplication
        result=$(($1 * $3))
        colour=$red;;
    "/")
        # division
        # check first if dividing by zero
        if [ $3 = 0 ]; then
            # display error message if yes and exit script
            echo -e "${red} Error: Cannot divide by zero."
            exit 0
        else
            result=$(($1 / $3))
            colour=$purple
        fi;;
    *)
        # exit script if 2nd argument is not a valid math operation
        echo "Unknown symbol. Cannot perform any opertion. Bye!"
        exit 0;;
esac

echo -e "The answer is ${colour} $result"
exit 0

