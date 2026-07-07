#ifndef BOOTLOADER_JUMP_H
#define BOOTLOADER_JUMP_H

#include <stdint.h>

void JumpToApplication(uint32_t entry_point);

#endif 