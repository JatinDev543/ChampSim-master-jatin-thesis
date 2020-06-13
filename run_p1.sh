#!/bin/bash
suffix="dpc3_traces/"
a=$1
# x=0
# while [ $x -lt 5 ]
# do 
    foo1=$(sed "${a}q;d" traces1);
    foo1=${foo1#$suffix}
    foo2=$(sed "${a}q;d" traces2);
    foo2=${foo2#$suffix}
    foo3=$(sed "${a}q;d" traces3);
    foo3=${foo3#$suffix}
    foo4=$(sed "${a}q;d" traces4);
    foo4=${foo4#$suffix}
    # a=$((a+1))
    # x=$((x+1))
    cd ChampSim-master
    ./run_4core.sh bimodal-no-spp_dev-no-lru-4core 50 200 0  $foo1 $foo2 $foo3 $foo4 &
    echo $foo1-$foo2-$foo3-$foo4 
# done

