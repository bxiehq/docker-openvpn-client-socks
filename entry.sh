#!/bin/bash
set -e

#DEV="$1"
#GW="$4"
#echo "Adding route"
#ip route add default via $GW dev $DEV


echo "Running microsocks..."
microsocks &

echo "IP address:"
curl ipinfo.io &
