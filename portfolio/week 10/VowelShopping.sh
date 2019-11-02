#!/bin/bash

echo "Your shopping list is as follows:"
awk 'BEGIN { FS="," }
/^[aeiou]/ { print "starts with a vowel: " $1 }
/^o/ { print "starts with letter o: " $1 } 
/[[:alpha:]]+[[:space:]]/ { print "more than one word: " $1 }
/[[:digit:]]+[^.][[:digit:]]+/ { print "whole number price: " $1 }' ../week\ 9/shopping.csv