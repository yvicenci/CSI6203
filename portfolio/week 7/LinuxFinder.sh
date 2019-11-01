#!/bin/bash 

# Adds the sentence before the lines containing 'Linux'
sed '/Linux/ i\The next line contains the word Linux' $1

exit 0