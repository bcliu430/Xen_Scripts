###
#This script is used to delete spefific vm (for example from 1 to 3 ) in specific directory
#TO DO
#    check if the vm exists before executing.

###
#! /bin/bash
set -euo pipefail

if [ ! "$#" = "1" ]; then
    echo "Usage:$0 <config file>"
fi

source $1

echo "Delete vm $start to $stop"

for ((i=${start};i<${stop}+1;i++))
do
   echo "pass $i"
   #stop vm
   sudo xl destroy vm$i
   #delete image file from directory given in config
   sudo xen-delete-image vm$i --dir=$dir
done
