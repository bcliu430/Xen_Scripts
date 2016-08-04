#!/bin/bash
set -euxo pipefail

if [ ! "$#" = "1" ]; then
    echo "Usage: $0 <config file>"
    exit
fi

source $1

first_vm_id="$ID"
let last_vm_id="$ID + VM_NUM - 1" || true

first_ip_part=`echo $GATEWAY | cut -d"." -f1-3`

for i in `seq $first_vm_id $last_vm_id`; do
    let second_ip_part="$BASE_IP_NUM + $i" || true
        sudo xen-create-image \
            --hostname=$PREFIX$i \
            --memory=${MEMORY}mb \
            --hostname=$PREFIX$i \
            --bridge=$BRIDGE \
            --ip=$first_ip_part.$second_ip_part \
	    --gateway=$GATEWAY \
            --netmask=$NETMASK \
            --size=${DISK_SIZE}gb \
            --password=a \
            --dir=$XT_DIR \
            --genpass=0 \
            --install-method=debootstrap \
	    --noswap

done
