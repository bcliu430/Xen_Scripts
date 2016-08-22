#!/bin/bash
set -euo pipefail

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
            --vcpus=${VCPUS} \
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

# TODO here check if we have enough loop device to launch everything, check hereif its built in:
# - http://askubuntu.com/questions/666880/loop-module-not-present-on-ubuntu-installation
# Or here if it's a module:
# https://yeri.be/xen-failed-to-find-an-unused-loop-device
