#!/bin/bash
# prints and formats the shopping list items, quantity and price
# with totals into a nice readable format from shopping.csv
# by Yvonne Vicencio

# message and heading
echo "Your shopping list is as follows:"
echo -e "Item\t\t | Quantity | Price   | Total "
echo "-----------------|----------|---------|-------"

# shopping list format using awk
awk 'BEGIN { FS=","; currency="$";}
    { totalItemPrice = $2*$3 }
    { printf "%16s | %2d       | %c%2.2f   | %c%2.2f \n", $1, $2, currency, $3, currency, totalItemPrice }
    { quantitySum += $2; priceSum += $3; overallCost += totalItemPrice}
    END { printf "TOTAL:\t\t | %2d       | %c%2.2f   | %c%2.2f \n", quantitySum, currency, priceSum, currency, overallCost }' ./shopping.csv
