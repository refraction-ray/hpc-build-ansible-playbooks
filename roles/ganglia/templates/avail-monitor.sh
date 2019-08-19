#!/bin/bash
# refraction-ray @ AUG 2019
# Work in Progress
############################
## general variables
hostname=$(hostname)
tag="avail-monitor-warning"

## slurm nodes availability
errornum=$(sinfo -N|grep "down\|alloc\*\|idle\*\|mix\*"|wc -l)
if [ $errornum -ne 0 ]; then
  logger -t $tag "${errornum} nodes are down in slurm"
fi

## wanip fixed check
if [ "$hostname" == "{{ master_name }}" ]; then
    wanip=$(/sbin/ifconfig|grep {{ ln_wan_nic }} -A1|grep inet|awk '{print $2}')
    if [ "$wanip" != "{{ wan_ip }}" ]; then
	logger -t $tag "wan ip for master has changed to ${wanip}"
    fi
fi

## filesystem mount check
if [ "$hostname" == "{{ master_name}}" ]; then
    extnum=$(df -T|grep ext4|wc -l)
    if [ $extnum -ne {{ num_ext_ln }} ]; then
        logger -t $tag "ext4 mount is missing"
    fi
else
    nfsnum=$(df -T|grep nfs4|wc -l)
    if [ $nfsnum -ne {{ num_nfs_cn }} ]; then
        logger -t $tag "nfs4 mount is missing"
    fi
fi

## load check on master
if [ "$hostname" == "{{ master_name}}" ]; then
    l=$(uptime|awk '{print $12}')
    if (( $(echo "$l > 70" |bc -l) )); then 
        logger -t $tag "the load on master cpu is too high: ${l}" 
    fi
fi

## check the disk usage
st=$(df -HT|grep "/dev/sda2"|awk '{print $4}')
stn=${st%?}
if [ $stn -gt {{ disk_warning }} ]; then
    logger -t $tag "the disk usage is too much"
fi

## check the memory usage on master
if [ "$hostname" == "{{ master_name}}" ]; then
   mem=$(free|grep Mem|awk '{print $7}')
   if [ $mem -lt {{ memory_avail_warning }} ]; then
       logger -t $tag "available memory is draining on master!"
   fi
fi

## check nics
if [ "$hostname" == "{{ master_name }}" ]; then
    nonic=$(/sbin/ifconfig|grep flags|wc -l)
    if [ $nonic -ne {{ master_nic_no }} ]; then
        logger -t $tag "nics seem to be missing on master!"
    fi
fi
