#!/bin/bash
suffix="dpc3_traces/"
a=1
p=98
while [ $a -lt 97 ]
do
        # ssh into new machine
        if ping -c 1 -W 1 "172.27.19.${p}"; 
        then
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run1_parallelhetro1 $a &
        a=$((a+1))
        echo $a
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run1_parallelhetro1 $a &
        a=$((a+1))
        echo $a
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run1_parallelhetro1 $a &
        a=$((a+1))
        echo $a
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run1_parallelhetro1 $a &
        a=$((a+1))
        echo $a
        ssh -o "StrictHostKeyChecking no"  jatindev@172.27.19.${p}  ~/ChampSim-master/./run1_parallelhetro1 $a &
        a=$((a+1))
        echo $a
        fi
        p=$((p+1))
done

