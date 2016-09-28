#!/bin/bash
set -euo pipefail


    postmark config
    cat pm-output | grep "megabytes read" | sed 's\(\\g' | awk -F' '  ' {print $4}'  >> result_read_$(hostname).dat
