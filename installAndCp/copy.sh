#!/bin/bash

set -euo pipefail

if [ ! "$#" = "1" ];then
    echo "Usage: $0 <config file>"
    exit
fi

while IFS='' read -r line; do

    awk -F ';' 'echo $0' $1
   
done < $1
