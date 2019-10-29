#!/bin/bash

VAR1=$1

# This function prints a given error
printError()
{
    echo -e "\033[31mERROR: \033[0m" $VAR1
}

printError