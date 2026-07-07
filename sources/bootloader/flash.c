#include "flash.h"
#include "ch32x035.h"
#include "ch32x035_flash.h"


static uint32_t s_page_buffer[FLASH_WORDS_PER_PAGE];
static uint32_t s_page_base_addr = 0;
static uint8_t  s_page_open = 0;
static uint32_t s_words_in_page = 0;

static uint32_t PageBaseOf(uint32_t address)
{
    return address & ~((uint32_t)FLASH_PAGE_SIZE - 1u);
}

void Flash_Unlock(void)
{
    FLASH_Unlock();
    FLASH_Unlock_Fast();
}

void Flash_Lock(void)
{
    FLASH_Lock_Fast();
    FLASH_Lock();
}

FlashOpStatus Flash_EraseRange(uint32_t start_addr, uint32_t end_addr)
{
    if ((start_addr % FLASH_PAGE_SIZE) != 0u || (end_addr % FLASH_PAGE_SIZE) != 0u)
    {
        return FLASH_OP_MISALIGNED;
    }

    for (uint32_t page = start_addr; page < end_addr; page += FLASH_PAGE_SIZE)
    {
        FLASH_Status status = FLASH_ErasePage(page);
        if (status != FLASH_COMPLETE)
        {
            return FLASH_OP_ERROR;
        }
    }

    return FLASH_OP_OK;
}

FlashOpStatus Flash_WriteWord(uint32_t address, uint32_t data)
{
    if ((address % 4u) != 0u)
    {
        return FLASH_OP_MISALIGNED;
    }

    uint32_t page_base = PageBaseOf(address);
    uint32_t word_index = (address - page_base) / 4u;

    if (s_page_open && page_base != s_page_base_addr)
    {
        FlashOpStatus flush_status = Flash_FlushPage();
        if (flush_status != FLASH_OP_OK)
        {
            return flush_status;
        }
    }

    if (!s_page_open)
    {
        s_page_base_addr = page_base;
        s_words_in_page = 0;
        s_page_open = 1;

        for (uint32_t i = 0; i < FLASH_WORDS_PER_PAGE; i++)
        {
            s_page_buffer[i] = 0xFFFFFFFFu;
        }
    }


    if (word_index != s_words_in_page)
    {
        return FLASH_OP_OUT_OF_SEQUENCE;
    }

    s_page_buffer[word_index] = data;
    s_words_in_page++;

    if (s_words_in_page == FLASH_WORDS_PER_PAGE)
    {
        return Flash_FlushPage();
    }

    return FLASH_OP_OK;
}

FlashOpStatus Flash_FlushPage(void)
{
    if (!s_page_open)
    {
        return FLASH_OP_OK;
    }

    FLASH_BufReset();
    for (uint32_t i = 0; i < FLASH_WORDS_PER_PAGE; i++)
    {
        FLASH_BufLoad(s_page_base_addr + (i * 4u), s_page_buffer[i]);
    }
    FLASH_ProgramPage_Fast(s_page_base_addr);

    uint32_t committed_base = s_page_base_addr;
    uint32_t words_committed = s_words_in_page;

    s_page_open = 0;
    s_words_in_page = 0;


    for (uint32_t i = 0; i < words_committed; i++)
    {
        uint32_t expected = s_page_buffer[i];
        FlashOpStatus verify_status = Flash_VerifyWord(committed_base + (i * 4u), expected);
        if (verify_status != FLASH_OP_OK)
        {
            return verify_status;
        }
    }

    return FLASH_OP_OK;
}

uint32_t Flash_ReadWord(uint32_t address)
{
    return *(volatile uint32_t *)address;
}

FlashOpStatus Flash_VerifyWord(uint32_t address, uint32_t expected)
{
    if ((address % 4u) != 0u)
    {
        return FLASH_OP_MISALIGNED;
    }

    return (Flash_ReadWord(address) == expected) ? FLASH_OP_OK : FLASH_OP_VERIFY_FAILED;
}