#!/bin/bash

echo "How many vms do you want to create?"

read value

echo "Create $value vms...."

for ((i=0;i<value;i++))
do
    sudo xen-create-image --hostname=vm$vi --memory=1024mb --vcpus=1 --bridge=xenbr0 \
--ip=10.0.0.2 --gateway=10.0.0.1 --netmask=255.255.255.0 --size=1gb --password=a \
--dir=/home/beichen/xen-domains --genpass=0 --install-method=debootstrap --noswap
done
