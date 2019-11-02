#!/bin/bash
# Prints out the shopping list items from shopping.csv using awk
# by Yvonne Vicencio

echo "The items on your shopping list is as follows:"
awk 'BEGIN {FS=","}
{ print $1 }' shopping.csv