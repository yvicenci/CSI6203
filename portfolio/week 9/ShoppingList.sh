#!/bin/bash
# prints and formats the shopping list items, quantity and price into
# a nice readable format from shopping.csv
# by Yvonne Vicencio

# message and heading
echo "Your shopping list is as follows:"
echo -e "Item\t\t | Quantity | Price "
echo "-----------------|----------|---------"

# shopping list format using awk
awk 'BEGIN { FS=","; currency="$"}
    { printf "%16s | %2d       | %c%1.2f\t\n", $1, $2, currency, $3 }' ./shopping.csv