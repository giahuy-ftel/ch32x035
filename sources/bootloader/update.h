#ifndef BOOTLOADER_UPDATE_H
#define BOOTLOADER_UPDATE_H

#include <stdint.h>

typedef enum
{
    UPDATE_OK = 0,              
    UPDATE_ERR_HEADER,        
    UPDATE_ERR_ERASE,
    UPDATE_ERR_PROGRAM,
    UPDATE_ERR_CRC_MISMATCH
} UpdateStatus;

uint8_t Bootloader_Update(void);

#endif