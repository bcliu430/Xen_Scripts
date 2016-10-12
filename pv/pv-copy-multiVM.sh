###
# file name: pv-copy-multiVM.sh
# last modified: 10-12-2016 By BL
# description: create several vm by copying source vm
###


#!/bin/bash
set -euo pipefail

source $1;

XEN_DOMAINS_DIR=/root/xen-domains/domains
DISK_IMG=disk.img
IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`
START=$(($ID+1));
STOP=$(($ID+$VM_NUM));
if [ ! $# == 1 ]; then
	# echo "Usage: $0 <source vm> <target vm> <target ip>"
    echo "Usage: $0 <config>"
	exit
fi

if [ ! -d $XEN_DOMAINS_DIR/$PREFIX$ID ]; then
	echo "Cannot find VM xen-tools folder, tried $XEN_DOMAINS_DIR/$PREFIX$i."
	exit
fi

if [ ! -e /etc/xen/$PREFIX$ID.cfg ]; then # check if the source vm exists
	echo "Cannot find VM conf file, tried /etc/xen/$PREFIX$ID.cfg."
	exit
fi

# TODO check existence

for i in `seq $START $STOP`; do
    #1. Copy cfg
    cfg=/etc/xen/$PREFIX$i.cfg
    cp -f /etc/xen/$PREFIX$ID.cfg $cfg

    #2. edit cfg
    sed -i s/^.*vif.*$/"vif = \[ \'bridge=xenbr0\' \]"/ $cfg
    sed -i s/"^name .*$"/"name = '$PREFIX$i'"/ $cfg
    sed -r "s/(file:.*)($PREFIX$ID)(.*)$/\1$PREFIX$i\3/" $cfg

    #3. copy image
    rm -r $XEN_DOMAINS_DIR/$PREFIX$i #rm previous vm if exists
    mkdir  $XEN_DOMAINS_DIR/$PREFIX$i
    cp -r $XEN_DOMAINS_DIR/$PREFIX$ID/$DISK_IMG $XEN_DOMAINS_DIR/$PREFIX$i/$DISK_IMG

    root=$XEN_DOMAINS_DIR/$PREFIX$i/mnt/
    mkdir $root
    mount $XEN_DOMAINS_DIR/$PREFIX$i/$DISK_IMG $root

    echo $PREFIX$i > $root/etc/hostname
    if=$root/etc/network/interfaces
    echo "" > $if
    echo "auto lo" >> $if
    echo "iface lo inet loopback" >> $if
    echo "auto eth0" >> $if
    echo "iface eth0 inet static" >> $if
    echo " address $IP_BASE.$(($BASE_IP_NUM+$i))" >> $if
    echo " gateway ${GATEWAY}" >> $if
    echo " netmask 255.255.255.0" >> $if

    hosts=$root/etc/hosts
    echo "" > $hosts
    echo "127.0.0.1	localhost" >> $hosts
    echo "$IP_BASE.$(($BASE_IP_NUM+$i)) 	$PREFIX$i $PREFIX$i" >> $hosts

    echo "$$IP_BASE.$(($BASE_IP_NUM+$i))     $PREFIX$i $PREFIX$i" >> /etc/hosts

    umount $root
    rm -r $root

done
