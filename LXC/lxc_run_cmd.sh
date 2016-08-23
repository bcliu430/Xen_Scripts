#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "usage: $0 <vm_name> <cmd>"
	exit
fi

ssh ubuntu@$( lxc-ls -f |grep $1 |( awk -F ' ' '{print$3}' )) ${*:2} 2>&1 | sed "s/^/[$1] /"


#ssh root@$1 ${*:2} 2>&1 | sed "s/^/[$1] /"
