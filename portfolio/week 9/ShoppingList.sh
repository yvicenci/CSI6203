#!/bin/bash

echo "Your shopping list is as follows:"
echo -e "Item\t\t | Quantity | Price "
echo "-----------------|----------|---------"
# shopping list format
awk 'BEGIN { FS=","; currency="$"}
    { printf "%16s | %2d       | %c%1.2f\t\n", $1, $2, currency, $3 }' ./shopping.csv