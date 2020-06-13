#!/bin/bash
suffix="dpc3_traces/"
x=0
for foo in dpc3_traces/*.xz; do 
    foo=${foo#$suffix}
     if [ $x -eq 5 ]
     then
       ./run_4core.sh bimodal-no-spp_dev13-no-lru-4core 50 200 0 $foo $foo $foo $foo 
         x=0
         echo $foo  
     else
          ./run_4core.sh bimodal-no-spp_dev13-no-lru-4core 50 200 0 $foo $foo $foo $foo &   
           x=$((x+1))
           echo $foo  
    fi
     
done
