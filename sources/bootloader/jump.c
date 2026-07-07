#include "jump.h"

void JumpToApplication(uint32_t entry_point)
{
    __asm volatile (
        "csrci mstatus, 8   \n"   
        "csrw mepc, %0      \n"
        "mret               \n"
        :: "r"(entry_point)
    );
    for (;;)
    {
    }
}