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
