#!/bin/bash

ipInfo="$(./IpInfo.sh)"

ipAddresses=$(echo "$ipInfo" | sed -n '/IP Address/ p')

echo $ipAddresses