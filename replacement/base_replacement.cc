#include "cache.h"
#include <bitset>
// extern bitset <4096> p_filter;
// extern double pollution;
// extern double total_demandmiss;

uint32_t CACHE::find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set, const BLOCK *current_set, uint64_t ip, uint64_t full_addr, uint32_t type)
{
    // baseline LRU replacement policy for other caches 
    return lru_victim(cpu, instr_id, set, current_set, ip, full_addr, type); 
}

void CACHE::update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way, uint64_t full_addr, uint64_t ip, uint64_t victim_addr, uint32_t type, uint8_t hit)
{
    if (type == WRITEBACK) {
        if (hit) // wrietback hit does not update LRU state
            return;
    }
    // double poll= (pollution/total_demandmiss);
    // if(type==PREFETCH && cache_type==IS_L2C && poll > 0.7 ) return lru_update1(set, way);
    // else
      return lru_update(set, way);
}

uint32_t CACHE::lru_victim(uint32_t cpu, uint64_t instr_id, uint32_t set, const BLOCK *current_set, uint64_t ip, uint64_t full_addr, uint32_t type)
{
    uint32_t way = 0;

    // fill invalid line first
    for (way=0; way<NUM_WAY; way++) {
        if (block[set][way].valid == false) {

            DP ( if (warmup_complete[cpu]) {
            cout << "[" << NAME << "] " << __func__ << " instr_id: " << instr_id << " invalid set: " << set << " way: " << way;
            cout << hex << " address: " << (full_addr>>LOG2_BLOCK_SIZE) << " victim address: " << block[set][way].address << " data: " << block[set][way].data;
            cout << dec << " lru: " << block[set][way].lru << endl; });

            break;
        }
    }

    // LRU victim
    if (way == NUM_WAY) {
        for (way=0; way<NUM_WAY; way++) {
            if (block[set][way].lru == NUM_WAY-1) {

                DP ( if (warmup_complete[cpu]) {
                cout << "[" << NAME << "] " << __func__ << " instr_id: " << instr_id << " replace set: " << set << " way: " << way;
                cout << hex << " address: " << (full_addr>>LOG2_BLOCK_SIZE) << " victim address: " << block[set][way].address << " data: " << block[set][way].data;
                cout << dec << " lru: " << block[set][way].lru << endl; });

                break;
            }
        }
    }
     uint64_t index;
    
    // if(type == PREFETCH && block[set][way].prefetch==0 && block[set][way].valid == true && cache_type==IS_L2C)  
    // {
    //     index=( ( block[set][way].address & (4095) ) ^ ( (block[set][way].address >>4084 ) & ( 4095) ) );     
    //     p_filter[index] =1;      
    //     index=( ( full_addr & (4095) ) ^ ( (full_addr >>4084 ) & ( 4095) ) );
    //     p_filter[index] =0;


    // }
    
    // if(type == LOAD && cache_type==IS_L2C )
    // {
    //       index=( ( full_addr & (4095) ) ^ ( (full_addr >>4084 ) & ( 4095) ) );
    //       if(p_filter[index]==1) pollution++;
    //       total_demandmiss++;

    // }
        

    if (way == NUM_WAY) {
        cerr << "[" << NAME << "] " << __func__ << " no victim! set: " << set << endl;
        assert(0);
    }

    return way;
}

void CACHE::lru_update(uint32_t set, uint32_t way)
{
    // update lru replacement state
    for (uint32_t i=0; i<NUM_WAY; i++) {
        if (block[set][i].lru < block[set][way].lru) {
            block[set][i].lru++;
        }
    }
   
    block[set][way].lru = 0; // promote to the MRU position
   
}

void CACHE::lru_update1(uint32_t set, uint32_t way)
{
    // update lru replacement state
    for (uint32_t i=0; i<NUM_WAY; i++) {
        if (block[set][i].lru >= 4 && block[set][i].lru < 7 ) {
            block[set][i].lru++;
        }
    }
    block[set][way].lru=4;
    
   // block[set][way].lru = 0; // promote to the MRU position
}

void CACHE::replacement_final_stats()
{

}

#ifdef NO_CRC2_COMPILE
void InitReplacementState()
{
    
}

uint32_t GetVictimInSet (uint32_t cpu, uint32_t set, const BLOCK *current_set, uint64_t PC, uint64_t paddr, uint32_t type)
{
    return 0;
}

void UpdateReplacementState (uint32_t cpu, uint32_t set, uint32_t way, uint64_t paddr, uint64_t PC, uint64_t victim_addr, uint32_t type, uint8_t hit)
{
    
}

void PrintStats_Heartbeat()
{
    
}

void PrintStats()
{

}
#endif
