#!/bin/bash
# prints logs from the current month that involve 'root' user

awk -v month="$(date +"%b")" '
    BEGIN { print "Auth Log:"}
    /root/{
        if($1==month){
            printf "\n%s %d - %s:\n", $1, $2, $3
            printf "Source: %s \n", $5
            message=""
            for(i=6; i<=NF; i++){
                message=message" "$i
            }
            print "\t"message
        }
    }
' /var/log/auth.log

exit 0