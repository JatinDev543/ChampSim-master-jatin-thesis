#!/bin/bash
suffix="dpc3_traces/"
x=0
for foo in dpc3_traces/*.xz; do 
    foo=${foo#$suffix}
     if [ $x -eq 5 ]
     then
      ./run_champsim.sh bimodal-no-spp_dev1_High_BW-no-lru-1core 50 200  $foo 
         x=0
         echo $foo  
     else
          ./run_champsim.sh bimodal-no-spp_dev1_High_BW-no-lru-1core 50 200  $foo &   
           x=$((x+1))
           echo $foo  
    fi
     
done

