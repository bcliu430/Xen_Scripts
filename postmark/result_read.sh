#!/bin/bash

set -euo pipefail

touch result_read_$(hostname).dat

for i in $(seq 1 20); do 
    postmark config| grep "megabytes read" >> result_read_$(hostname).dat
done

