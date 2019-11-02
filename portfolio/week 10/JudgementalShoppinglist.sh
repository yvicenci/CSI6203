#!/bin/bash

# message and heading
echo "Your shopping list is as follows:"
echo -e "Item\t\t | Quantity | Price   | Total | Comment"
echo "-----------------|----------|---------|-------|--------------"

# shopping list format using awk
awk 'BEGIN { FS=","; currency="$"; comment=""}
    { totalItemPrice = $2*$3 }
    { if(totalItemPrice > 5) 
        comment="Thats a bit expensive!" 
      if($2 > 5 ) 
        comment="Do you really need that many?" 
      if(totalItemPrice < 3) 
        comment="Such a cheap skate!"
    }
    { printf "%16s | %2d       | %c%2.2f   | %c%2.2f | %s \n", $1, $2, currency, $3, currency, totalItemPrice, comment}
    { quantitySum += $2; priceSum += $3; overallCost += totalItemPrice}
    { comment=""}
    END { printf "TOTAL:\t\t | %2d       | %c%2.2f   | %c%2.2f \n", quantitySum, currency, priceSum, currency, overallCost }' ./../week\ 9/shopping.csv
