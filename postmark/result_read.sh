#!/bin/bash
set -euo pipefail


    postmark postmarkpara
    cat pm-output | grep "megabytes read" | sed 's\(\\g' | awk -F' '  ' {print $4}'  >> result_read_$(hostname).dat
