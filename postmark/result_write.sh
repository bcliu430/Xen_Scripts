#!/bin/bash

set -euxo pipefail
#This script is used to run the script and gather result using postmark benchmark
#Usage ./result_capture.sh <config>

# script -c 'postmark config|grep read'  -q result_read
script -c 'postmark config|grep write' -q result_write 
