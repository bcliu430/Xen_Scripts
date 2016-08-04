#!/bin/bash
set -euxo pipefail

#dir="/root/xen-domains"
if [ ! "$#" == "3" ] || [ ! "$#" == "2" ]; then
    echo "Usage: $0 <prefix> <start> [stop]"
    echo "ex: $0 vm 0 5 "
    echo "Will start vm0 to vm5"
    exit
fi

if ["$#" == "2"]; then
    ${3} = ${2}
    exit
fi

for i in `seq $2 $3`; do
   echo "Starting $i"
   # start vm
   sudo xl create /etc/xen/${1}${i}.cfg ||true
done
