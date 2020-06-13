#!/bin/bash
suffix="dpc3_traces/"
for foo in dpc3_traces/*.xz; do
    foo=${foo#$suffix}
    ./run_4core.sh bimodal-no-spp_dev-no-lru-4core 1 1 0 $foo $foo $foo $foo
    echo $foo  
    
     
done
