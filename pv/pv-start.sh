#!/bin/bash
set -euo pipefail

#dir="/root/xen-domains"
if [ ! "$#" == "3" ]; then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: $0 vm 0 5 "
    echo "Will start vm0 to vm5"
    exit
fi


for i in `seq $2 $3`; do
   echo "Starting $i"
   # start vm
   sudo xl create /etc/xen/${1}${i}.cfg ||true
done
