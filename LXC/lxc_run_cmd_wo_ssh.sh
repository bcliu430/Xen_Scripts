#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ]; then
	echo "usage: $0 <vm_name> <cmd>"
	exit
fi

lxc-attach -n $1 ${*:2} 2>&1 | sed "s/^/[$1] /"


#ssh root@$1 ${*:2} 2>&1 | sed "s/^/[$1] /"
