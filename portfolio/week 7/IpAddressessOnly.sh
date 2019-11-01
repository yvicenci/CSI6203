#!/bin/bash

# preserve newline
IFS=
ipInfo="$(./IpInfo.sh)"

ipAddresses=$(echo "$ipInfo" | sed -n '/IP Address/ p')

echo $ipAddresses

exit 0