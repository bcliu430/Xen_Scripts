#!/bin/bash

set -euxo pipefail

touch result_write.dat

for i in $(seq 1 20); do 
    postmark config| grep "megabytes write" >> result_write.dat
done

