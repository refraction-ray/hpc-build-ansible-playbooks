#!/bin/bash
# written by refraction-ray@Aug 2019

GMETRIC=/usr/bin/gmetric
LOG=/tmp/.gpu.log

nvidia-smi -q > $LOG

a=( $(cat $LOG |grep "Fan Speed"|awk '{print $4}') )
j=1
for i in "${a[@]}"; do
    $GMETRIC -t float -n "gpu_${j}_fan_speed" -g "GPU" -u "percent" -v $i
    j=$[$j+1]
done
a=( $(cat $LOG |grep "GPU Current Temp"|awk '{print $5}') )
j=1
for i in "${a[@]}"; do
    $GMETRIC -t float -n "gpu_${j}_temp" -g "GPU" -u "Celcius" -v $i
    j=$[$j+1]
done
a=( $(cat $LOG |grep "Power Draw"|awk '{print $4}') )
j=1
for i in "${a[@]}"; do
    $GMETRIC -t float -n "gpu_${j}_power_draw" -g "GPU" -u "Watt" -v $i
    j=$[$j+1]
done
a=( $(cat $LOG |grep "FB Memory Usage" -A 3|grep "Used"|awk '{print $3}') )
j=1
for i in "${a[@]}"; do
    $GMETRIC -t float -n "gpu_${j}_mem_used" -g "GPU" -u "MiB" -v $i
    j=$[$j+1]
done
a=( $(cat $LOG |grep "Utilization" -A 3|grep "Gpu"|awk '{print $3}') )
j=1
for i in "${a[@]}"; do
    $GMETRIC -t float -n "gpu_${j}_utilization" -g "GPU" -u "persent" -v $i
    j=$[$j+1]
done
