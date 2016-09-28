#!/bin/bash
set -euo pipefail

echo -n "" > result_read_$(hostname).dat

for i in $(seq 1 5); do 
    postmark config
    cat pm-output | grep "megabytes read" | sed 's\(\\g' | awk -F' '  ' {print $4}'  >> result_read_$(hostname).dat
done

