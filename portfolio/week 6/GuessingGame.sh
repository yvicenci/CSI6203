#!/bin/bash

# This function prints the argument as the error message
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

# This function will get a value between the 2nd and 3rd arguments
getNumber()
{
    read -p "$1: "
    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1: "
    done
}

# main
min=1
max=100
magicNumber=42

echo "--------------------------------"
echo "Welcome to the Guessing Game!"
echo "--------------------------------"
getNumber "Guess the magic number between 1 and 100: " $min $max
until [ $REPLY -eq $magicNumber ]; do
    if (( $REPLY < $magicNumber )); then
        echo "Too low!"
    elif (( $REPLY > $magicNumber )); then
        echo "Too hight!"
    fi
    getNumber "Guess the magic number between 1 and 100: " $min $max
done
echo -e "Correct!"
exit 0