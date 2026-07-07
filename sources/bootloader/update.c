#include "update.h"
#include "uart_protocol.h"
#include "flash.h"
#include "crc.h"
#include "jump.h"

uint8_t Bootloader_Update(void)
{
    ImageHeader header;

    if (!UART_ReceiveAndValidateHeader(&header))
    {
        return (uint8_t)UPDATE_ERR_HEADER;
    }

    Flash_Unlock();

    uint32_t erase_start = header.flash_addr;
    uint32_t erase_end_exclusive = header.flash_addr + header.payload_size;
    uint32_t erase_end_aligned =
        (erase_end_exclusive + (FLASH_PAGE_SIZE - 1u)) & ~((uint32_t)FLASH_PAGE_SIZE - 1u);

    if (Flash_EraseRange(erase_start, erase_end_aligned) != FLASH_OP_OK)
    {
        Flash_Lock();
        return (uint8_t)UPDATE_ERR_ERASE;
    }

    uint32_t word_count = header.payload_size / 4u;

    for (uint32_t i = 0; i < word_count; i++)
    {
        uint32_t transfer_offset = IMAGE_HEADER_SIZE + (i * 4u);
        uint32_t flash_address = header.flash_addr + (i * 4u);

        uint32_t word = UART_RequestWord(transfer_offset);

        if (Flash_WriteWord(flash_address, word) != FLASH_OP_OK)
        {
            Flash_Lock();
            return (uint8_t)UPDATE_ERR_PROGRAM;
        }
    }

    if (Flash_FlushPage() != FLASH_OP_OK)
    {
        Flash_Lock();
        return (uint8_t)UPDATE_ERR_PROGRAM;
    }

    Flash_Lock();

    if (header.crc_bypass == 0u)
    {
        uint32_t computed_payload_crc =
            CRC32_Calculate((const uint8_t *)header.flash_addr, header.payload_size);

        if (computed_payload_crc != header.payload_crc)
        {
            return (uint8_t)UPDATE_ERR_CRC_MISMATCH;
        }
    }

    JumpToApplication(header.entry_point);

    return (uint8_t)UPDATE_OK;
}