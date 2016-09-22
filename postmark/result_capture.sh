#!/bin/bash

set -euxo pipefail
#This script is used to run the script and gather result using postmark benchmark
#Usage ./result_capture.sh <config>

if [ "$#" -gt 1 ]; then
	echo "usage: $0 <config>"
	exit
fi


 script -c 'postmark $1|grep read'  -q result_read   && script -c 'postmark $1|grep write' -q result_write  
