# ChampSim-master-jatin-thesis
Champsim Modifications for M.tech final year thesis
Paas only critical address
      change at line 526,736,794 and 875 line.
change SPP thresholds at line 34 from spp_dev.h
change read_pattern function signature for different configurations at line 107 from  spp_dev.h      


To build champsim for single core
./build_champsim.sh bimodal no spp_dev no lru 1                     -------for spp with all addresses

./build_champsim.sh bimodal no spp_Highband no lru 1                -------for high bandwidth modification with critical addresses

./build_champsim.sh bimodal no spp_lessband no lru 1                -------for less bandwidth modification with critical addresses


To build champsim for multi  core
./build_champsim.sh bimodal no spp_dev no lru 4                      -------for spp with all addresses

./build_champsim.sh bimodal no spp_Highband no lru 4                -------for high bandwidth modification with critical addresses

./build_champsim.sh bimodal no spp_lessband no lru 4                -------for less bandwidth modification with critical addresses

Result is stored in csv file name given in main.cc 987 line.
For parallel workloads change at line number 1006 for IPC of all cores
trace1.txt ,trace2.txt,trace3.txt and trace4.txt in mixings contain random permutations of workloads for parallel workloads.
