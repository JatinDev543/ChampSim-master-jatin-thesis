#!/bin/bash
suffix="dpc3_traces/"
a=1
p=82
while [ $a -lt 25 ]
do
        # ssh into new machine
        if ping -c 1 -W 1 "172.27.19.${p}"; 
        then
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run_p1.sh $a &
        a=$((a+1))
        echo $a
        fi
        p=$((p+1))
done

