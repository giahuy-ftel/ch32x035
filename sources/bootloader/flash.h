#ifndef BOOTLOADER_FLASH_H
#define BOOTLOADER_FLASH_H

#include <stdint.h>

#define FLASH_PAGE_SIZE         256u
#define FLASH_WORDS_PER_PAGE    (FLASH_PAGE_SIZE / 4u)

typedef enum
{
    FLASH_OP_OK = 0,
    FLASH_OP_ERROR,          
    FLASH_OP_MISALIGNED,     
    FLASH_OP_OUT_OF_SEQUENCE,
    FLASH_OP_VERIFY_FAILED   
} FlashOpStatus;

void Flash_Unlock(void);

void Flash_Lock(void);


FlashOpStatus Flash_EraseRange(uint32_t start_addr, uint32_t end_addr);

FlashOpStatus Flash_WriteWord(uint32_t address, uint32_t data);

FlashOpStatus Flash_FlushPage(void);

uint32_t Flash_ReadWord(uint32_t address);

FlashOpStatus Flash_VerifyWord(uint32_t address, uint32_t expected);

#endif