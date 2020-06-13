#!/bin/bash
suffix="dpc3_traces/"
for foo in dpc3_traces/*.xz; do
    foo=${foo#$suffix}
    ./run_champsim.sh bimodal-no-spp_dev-no-lru-1core 1 100 $foo
    echo $foo  
    
     
done
