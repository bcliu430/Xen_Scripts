#!/bin/bash
set -euo pipefail

#dir="/root/xen-domains"
if [ ! "$#" == "2" ] ; then
    echo "Usage: $0 <prefix> <start> <stop>"
    echo "ex: $0 vm 0 5 "
    echo "Will delete vm0 to vm5"
    exit
fi


for i in `seq $2 $3`; do
   echo "Shuting $i"
   # shut vm
   sudo xl destroy ${1}${i}||true

   #delete vm images
   sudo xen-delete-image ${1}${i}||true
done
