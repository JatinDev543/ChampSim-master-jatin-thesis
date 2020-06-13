#!/bin/bash
for filename in /dpc3_traces/*.xz; do
     ./run_champsim.sh bimodal-no-spp_dev-no-lru-1core 1 1  filename
     
done