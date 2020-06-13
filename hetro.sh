# echo $foo1_1-$foo2_2-$foo3_3-$foo4_4
     if [ $x -eq 5 ]
     then
       ./run_4core.sh bimodal-no-spp_dev-no-lru-4core 50 200 0 $foo1_1 $foo2_2 $foo3_3 $foo4_4 
         x=0
         echo $foo1_1-$foo2_2-$foo3_3-$foo4_4
     else
          ./run_4core.sh bimodal-no-spp_dev-no-lru-4core 50 200 0 $foo1_1 $foo2_2 $foo3_3 $foo4_4 &   
           x=$((x+1))
           echo $foo1_1-$foo2_2-$foo3_3-$foo4_4  
    fi
  rm $foo1
  rm $foo2
  rm $foo3
  rm $foo4
  c=$((c+1))  

done

