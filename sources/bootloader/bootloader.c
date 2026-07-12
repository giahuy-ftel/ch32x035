#include <stdint.h>

/*=============================================================================
 * 1. Minimal register access
 *===========================================================================*/

/* ---- Peripheral base addresses: look these up in ch32x035.h ---- */
#define PERIPH_BASE         0x40000000UL  
#define APB1PERIPH_BASE     (PERIPH_BASE)
#define APB2PERIPH_BASE     (PERIPH_BASE + 0x10000UL)
#define AHBPERIPH_BASE      (PERIPH_BASE + 0x20000UL)

#define RCC_BASE            (AHBPERIPH_BASE + 0x1000UL)
#define FLASH_BASE_REG      (AHBPERIPH_BASE + 0x2000UL)
#define GPIOA_BASE          (APB2PERIPH_BASE + 0X0800UL)
#define USART2_BASE         (APB1PERIPH_BASE + 0X4400UL)

#define REG32(addr)         (*(volatile uint32_t *)(addr))
#define REG16(addr)         (*(volatile uint16_t *)(addr))

/* ---- RCC: find offsets from RCC_TypeDef struct field order (×4 bytes each) ---- */
#define RCC_APB2PCENR       REG32(RCC_BASE + 0x18UL)
#define RCC_APB1PCENR       REG32(RCC_BASE + 0x1CUL)
#define RCC_IOPAEN          ((uint32_t)0x00000004)
#define RCC_USART2EN        ((uint32_t)0x00020000)

/* ---- GPIOA: find offsets from GPIO_TypeDef struct field order ---- */
#define GPIOA_CFGLR         REG32(GPIOA_BASE + 0x00UL)
#define GPIOA_INDR          REG32(GPIOA_BASE + 0x08UL)
#define GPIOA_OUTDR         REG32(GPIOA_BASE + 0x0CUL)
#define GPIOA_PIN1_IDR      ((uint32_t)0x00000002)

/* ---- USART2: find offsets from USART_TypeDef struct field order ---- */
#define USART2_STATR        REG16(USART2_BASE + 0x00UL)
#define USART2_DATAR        REG16(USART2_BASE + 0x04UL)
#define USART2_BRR          REG16(USART2_BASE + 0x08UL)
#define USART2_CTLR1        REG16(USART2_BASE + 0x0CUL)

#define USART_STATR_RXNE    ((uint16_t)0x0020) /* Read Data Register Not Empty */
#define USART_STATR_TXE     ((uint16_t)0x0080) /* Transmit Data Register Empty */
#define USART_CTLR1_RE      ((uint16_t)0x0004) /* Receiver Enable */
#define USART_CTLR1_TE      ((uint16_t)0x0008) /* Transmitter Enable */
#define USART_CTLR1_UE      ((uint16_t)0x2000) /* USART Enable */

/* ---- FLASH controller: find offsets from FLASH_TypeDef struct field order ---- */
#define FLASH_KEYR          REG32(FLASH_BASE_REG + 0x04UL)
#define FLASH_STATR         REG32(FLASH_BASE_REG + 0x0CUL)
#define FLASH_CTLR          REG32(FLASH_BASE_REG + 0x10UL)
#define FLASH_ADDR          REG32(FLASH_BASE_REG + 0x14UL)
#define FLASH_MODEKEYR      REG32(FLASH_BASE_REG + 0x24UL)

#define FLASH_KEY1          ((uint32_t)0x45670123UL)
#define FLASH_KEY2          ((uint32_t)0xCDEF89ABUL)

#define FLASH_CTLR_PER      ((uint32_t)0x00000002) /* Sector Erase 4K */
#define FLASH_CTLR_STRT     ((uint32_t)0x00000040) /* Start */
#define FLASH_CTLR_LOCK     ((uint32_t)0x00000080) /* Lock */
#define FLASH_CTLR_FLOCK    ((uint32_t)0x00008000) /* Fast Lock */
#define FLASH_CTLR_FTPG     ((uint32_t)0x00010000) /* Fast Program */
#define FLASH_CTLR_FTER     ((uint32_t)0x00020000) /* Fast Erase */
#define FLASH_CTLR_BUFLOAD  ((uint32_t)0x00040000) /* BUF Load */
#define FLASH_CTLR_BUFRST   ((uint32_t)0x00080000) /* BUF Reset */

#define FLASH_STATR_BSY     ((uint8_t)0x01) /* Busy */

/*=============================================================================
 * 2. Configuration constants
 *===========================================================================*/

#define USART2_BRR_VALUE         0x09C4

#define FLASH_ERASE_SECTOR_SIZE  4096u
#define FLASH_FAST_PAGE_SIZE     256u
#define FLASH_FAST_PAGE_WORDS    (FLASH_FAST_PAGE_SIZE / 4u)

#define APP_FLASH_ORIGIN         0x00002000UL
#define APP_FLASH_END            0x0000F800UL

#define IMAGE_HEADER_MAGIC       0x46505455UL
#define IMAGE_VERSION_SUPPORTED  0x0001u
#define IMAGE_HEADER_SIZE        32u

#define BOOT_PIN_SETTLE_LOOPS    2000u
#define FLASH_BUSY_TIMEOUT_LOOPS 2000000u

/*=============================================================================
 * 3. Image header
 *===========================================================================*/

typedef struct
{
    uint32_t magic;
    uint16_t version;
    uint16_t header_size;
    uint32_t payload_size;
    uint32_t flash_addr;
    uint32_t entry_point;
    uint16_t app_version;
    uint16_t crc_bypass;
    uint32_t header_crc;
    uint32_t payload_crc;
} ImageHeader;

/*=============================================================================
 * 4. CRC32
 *===========================================================================*/

static uint8_t ReverseBits8(uint8_t b) {
    b = (uint8_t)((b & 0xF0u) >> 4 | (b & 0x0Fu) << 4);
    b = (uint8_t)((b & 0xCCu) >> 2 | (b & 0x33u) << 2);
    b = (uint8_t)((b & 0xAAu) >> 1 | (b & 0x55u) << 1);
    return b;
}

static uint32_t ReverseBits32(uint32_t v) {
    v = ((v & 0xFFFF0000u) >> 16) | ((v & 0x0000FFFFu) << 16);
    v = ((v & 0xFF00FF00u) >> 8)  | ((v & 0x00FF00FFu) << 8);
    v = ((v & 0xF0F0F0F0u) >> 4)  | ((v & 0x0F0F0F0Fu) << 4);
    v = ((v & 0xCCCCCCCCu) >> 2)  | ((v & 0x33333333u) << 2);
    v = ((v & 0xAAAAAAAAu) >> 1)  | ((v & 0x55555555u) << 1);
    return v;
}

static uint32_t CRC32_Calculate(const uint8_t *data, uint32_t length) {
    uint32_t crc = 0xFFFFFFFFu;
    for (uint32_t i = 0; i < length; i++) {
        uint8_t reflected_byte = ReverseBits8(data[i]);
        crc ^= ((uint32_t)reflected_byte) << 24;
        for (uint8_t bit = 0; bit < 8; bit++) {
            if (crc & 0x80000000u) {
                crc = (crc << 1) ^ 0x04C11DB7u;
            } else {
                crc = crc << 1;
            }
        }
    }
    crc = ReverseBits32(crc);
    return crc ^ 0xFFFFFFFFu;
}

/*=============================================================================
 * 5. UART low level - PA2 = TX, PA3 = RX
 *===========================================================================*/

static void UART_Init(void)
{
    RCC_APB2PCENR |= RCC_IOPAEN;
    RCC_APB1PCENR |= RCC_USART2EN;
    GPIOA_CFGLR = (GPIOA_CFGLR & ~(0xFUL << 8))  | (0xBUL << 8);
    GPIOA_CFGLR = (GPIOA_CFGLR & ~(0xFUL << 12)) | (0x4UL << 12);
    USART2_BRR = USART2_BRR_VALUE;
    USART2_CTLR1 = USART_CTLR1_UE | USART_CTLR1_TE | USART_CTLR1_RE;
}

static void UART_SendByte(uint8_t byte)
{
    while ((USART2_STATR & USART_STATR_TXE) == 0)
    {
    }
    USART2_DATAR = byte;
}

static uint8_t UART_ReceiveByte(void)
{
    while ((USART2_STATR & USART_STATR_RXNE) == 0)
    {
    }
    return USART2_DATAR;
}

static uint32_t UART_RequestWord(uint32_t offset)
{
    UART_SendByte((uint8_t)(offset & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 8) & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 16) & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 24) & 0xFFu));

    uint32_t b0 = UART_ReceiveByte();
    uint32_t b1 = UART_ReceiveByte();
    uint32_t b2 = UART_ReceiveByte();
    uint32_t b3 = UART_ReceiveByte();
    return b0 | (b1 << 8) | (b2 << 16) | (b3 << 24);
}

static void UART_SendDoneSentinel(void)
{
    UART_SendByte(0xFFu);
    UART_SendByte(0xFFu);
    UART_SendByte(0xFFu);
    UART_SendByte(0xFFu);
}

/*=============================================================================
 * 6. Flash low level
 *===========================================================================*/

typedef enum
{
    FLASH_OP_OK = 0,
    FLASH_OP_MISALIGNED,
    FLASH_OP_TIMEOUT,
    FLASH_OP_VERIFY_FAILED
} FlashOpStatus;

static FlashOpStatus Flash_WaitBusy(void)
{
    uint32_t guard = FLASH_BUSY_TIMEOUT_LOOPS;
    while (FLASH_STATR & FLASH_STATR_BSY)
    {
        if (--guard == 0u)
        {
            return FLASH_OP_TIMEOUT;
        }
    }
    return FLASH_OP_OK;
}

static void Flash_Unlock(void)
{
    FLASH_KEYR = FLASH_KEY1;
    FLASH_KEYR = FLASH_KEY2;
    FLASH_MODEKEYR = FLASH_KEY1;
    FLASH_MODEKEYR = FLASH_KEY2;
}

static void Flash_Lock(void)
{
    FLASH_CTLR |= FLASH_CTLR_LOCK;
    FLASH_CTLR |= FLASH_CTLR_FLOCK;
}

static FlashOpStatus Flash_EraseSector(uint32_t sector_address)
{
    if ((sector_address % FLASH_ERASE_SECTOR_SIZE) != 0u)
    {
        return FLASH_OP_MISALIGNED;
    }
    FLASH_CTLR |= FLASH_CTLR_PER;
    FLASH_ADDR = sector_address;
    FLASH_CTLR |= FLASH_CTLR_STRT;
    FlashOpStatus status = Flash_WaitBusy();
    FLASH_CTLR &= ~FLASH_CTLR_PER;
    return status;
}

static FlashOpStatus Flash_EraseRange(uint32_t start_addr, uint32_t end_addr_exclusive)
{
    uint32_t aligned_end = (end_addr_exclusive + (FLASH_ERASE_SECTOR_SIZE - 1u)) & ~(FLASH_ERASE_SECTOR_SIZE - 1u);
    for (uint32_t page = start_addr; page < aligned_end; page += FLASH_ERASE_SECTOR_SIZE)
    {
        FlashOpStatus status = Flash_EraseSector(page);
        if (status != FLASH_OP_OK)
        {
            return status;
        }
    }
    return FLASH_OP_OK;
}

static FlashOpStatus Flash_ProgramPage(uint32_t page_base_addr, const uint32_t *words)
{
    FlashOpStatus status;
    if ((page_base_addr % FLASH_FAST_PAGE_SIZE) != 0u)
    {
        return FLASH_OP_MISALIGNED;
    }

    FLASH_CTLR |= FLASH_CTLR_FTPG;

    /* Reset the write buffer */
    FLASH_CTLR |= FLASH_CTLR_BUFRST;
    status = Flash_WaitBusy();
    if (status != FLASH_OP_OK)
    {
        FLASH_CTLR &= ~FLASH_CTLR_FTPG;
        return status;
    }

    /* Write all 64 words into the flash buffer addresses */
    for (uint32_t i = 0; i < FLASH_FAST_PAGE_WORDS; i++)
    {
        uint32_t word_addr = page_base_addr + (i * 4u);
        *(volatile uint32_t *)word_addr = words[i];
    }

    /* Load the buffer in one shot */
    FLASH_CTLR |= FLASH_CTLR_BUFLOAD;
    status = Flash_WaitBusy();
    if (status != FLASH_OP_OK)
    {
        FLASH_CTLR &= ~FLASH_CTLR_FTPG;
        return status;
    }

    /* Program the page */
    FLASH_ADDR = page_base_addr;
    FLASH_CTLR |= FLASH_CTLR_STRT;
    status = Flash_WaitBusy();
    FLASH_CTLR &= ~FLASH_CTLR_FTPG;
    if (status != FLASH_OP_OK)
    {
        return status;
    }

    /* Verify */
    for (uint32_t i = 0; i < FLASH_FAST_PAGE_WORDS; i++)
    {
        uint32_t word_addr = page_base_addr + (i * 4u);
        if (*(volatile uint32_t *)word_addr != words[i])
        {
            return FLASH_OP_VERIFY_FAILED;
        }
    }

    return FLASH_OP_OK;
}

/*=============================================================================
 * 7. Header validation
 *===========================================================================*/

static uint8_t ImageHeader_Validate(const uint8_t *header_bytes, ImageHeader *header_out)
{
    header_out->magic        = header_bytes[0]  | (header_bytes[1]  << 8) | (header_bytes[2]  << 16) | (header_bytes[3]  << 24);
    header_out->version      = (uint16_t)(header_bytes[4]  | (header_bytes[5]  << 8));
    header_out->header_size  = (uint16_t)(header_bytes[6]  | (header_bytes[7]  << 8));
    header_out->payload_size = header_bytes[8]  | (header_bytes[9]  << 8) | (header_bytes[10] << 16) | (header_bytes[11] << 24);
    header_out->flash_addr   = header_bytes[12] | (header_bytes[13] << 8) | (header_bytes[14] << 16) | (header_bytes[15] << 24);
    header_out->entry_point  = header_bytes[16] | (header_bytes[17] << 8) | (header_bytes[18] << 16) | (header_bytes[19] << 24);
    header_out->app_version  = (uint16_t)(header_bytes[20] | (header_bytes[21] << 8));
    header_out->crc_bypass   = (uint16_t)(header_bytes[22] | (header_bytes[23] << 8));
    header_out->header_crc   = header_bytes[24] | (header_bytes[25] << 8) | (header_bytes[26] << 16) | (header_bytes[27] << 24);
    header_out->payload_crc  = header_bytes[28] | (header_bytes[29] << 8) | (header_bytes[30] << 16) | (header_bytes[31] << 24);

    if (header_out->magic != IMAGE_HEADER_MAGIC)                    return 0;
    if (header_out->version != IMAGE_VERSION_SUPPORTED)              return 0;
    if (header_out->header_size != IMAGE_HEADER_SIZE)                return 0;
    if (CRC32_Calculate(header_bytes, 24) != header_out->header_crc) return 0;
    if (header_out->payload_size == 0u)                              return 0;
    if ((header_out->payload_size % 4u) != 0u)                       return 0;
    if (header_out->flash_addr != APP_FLASH_ORIGIN)                  return 0;
    if ((header_out->flash_addr % FLASH_FAST_PAGE_SIZE) != 0u)       return 0;
    if (header_out->payload_size > (APP_FLASH_END - header_out->flash_addr)) return 0;
    if (header_out->entry_point < header_out->flash_addr ||
        header_out->entry_point >= (header_out->flash_addr + header_out->payload_size)) return 0;
    if ((header_out->entry_point % 2u) != 0u)                        return 0;

    return 1;
}

static uint8_t UART_ReceiveAndValidateHeader(ImageHeader *header_out)
{
    uint8_t header_bytes[IMAGE_HEADER_SIZE];
    for (uint32_t i = 0; i < IMAGE_HEADER_SIZE / 4u; i++)
    {
        uint32_t word = UART_RequestWord(i * 4u);
        header_bytes[i * 4u + 0u] = (uint8_t)(word & 0xFFu);
        header_bytes[i * 4u + 1u] = (uint8_t)((word >> 8) & 0xFFu);
        header_bytes[i * 4u + 2u] = (uint8_t)((word >> 16) & 0xFFu);
        header_bytes[i * 4u + 3u] = (uint8_t)((word >> 24) & 0xFFu);
    }
    return ImageHeader_Validate(header_bytes, header_out);
}

/*=============================================================================
 * 8. Jump to application - plain function pointer call (QingKe V4C stays in
 *    machine mode; mret-based jump causes privilege transition faults)
 *===========================================================================*/

typedef void (*AppEntry)(void);

__attribute__((naked)) static void JumpToApplication(uint32_t entry_point)
{
    /* Disable interrupts before handing off */
    __asm volatile ("csrci mstatus, 8" ::: "memory");

    AppEntry app = (AppEntry)entry_point;
    app();

    /* Should never return */
    for (;;) {}
}

/*=============================================================================
 * 9. Boot-select pin - PA1, pull-down input, active HIGH = enter bootloader
 *===========================================================================*/

static uint8_t BootPinHigh(void)
{
    RCC_APB2PCENR |= RCC_IOPAEN;
    GPIOA_CFGLR = (GPIOA_CFGLR & ~(0xFUL << 4)) | (0x8UL << 4);
    GPIOA_OUTDR &= ~(1UL << 1);
    for (volatile uint32_t i = 0; i < BOOT_PIN_SETTLE_LOOPS; i++)
    {
    }
    return (GPIOA_INDR & GPIOA_PIN1_IDR) != 0u;
}

/*=============================================================================
 * 10. Update state machine
 *===========================================================================*/

typedef enum
{
    UPDATE_OK = 0,
    UPDATE_ERR_HEADER,
    UPDATE_ERR_ERASE,
    UPDATE_ERR_PROGRAM,
    UPDATE_ERR_CRC_MISMATCH
} UpdateStatus;

static UpdateStatus Bootloader_Update(void)
{
    ImageHeader header;
    uint32_t page_buffer[FLASH_FAST_PAGE_WORDS];

    if (!UART_ReceiveAndValidateHeader(&header))
    {
        return UPDATE_ERR_HEADER;
    }

    Flash_Unlock();

    if (Flash_EraseRange(header.flash_addr, header.flash_addr + header.payload_size) != FLASH_OP_OK)
    {
        Flash_Lock();
        return UPDATE_ERR_ERASE;
    }

    uint32_t total_words = header.payload_size / 4u;
    uint32_t words_written = 0u;

    while (words_written < total_words)
    {
        uint32_t words_this_page = total_words - words_written;
        if (words_this_page > FLASH_FAST_PAGE_WORDS)
        {
            words_this_page = FLASH_FAST_PAGE_WORDS;
        }

        for (uint32_t i = 0; i < FLASH_FAST_PAGE_WORDS; i++)
        {
            page_buffer[i] = 0xFFFFFFFFu;
        }

        for (uint32_t i = 0; i < words_this_page; i++)
        {
            uint32_t transfer_offset = IMAGE_HEADER_SIZE + ((words_written + i) * 4u);
            page_buffer[i] = UART_RequestWord(transfer_offset);
        }

        uint32_t page_addr = header.flash_addr + (words_written * 4u);
        if (Flash_ProgramPage(page_addr, page_buffer) != FLASH_OP_OK)
        {
            Flash_Lock();
            return UPDATE_ERR_PROGRAM;
        }

        words_written += words_this_page;
    }

    /* Notify host that flash write is complete */
    UART_SendByte(0xAAu);
    UART_SendByte(0xBBu);
    UART_SendByte(0xCCu);
    UART_SendByte(0xDDu);

    Flash_Lock();

    /* Optional CRC verification of written payload */
    if (header.crc_bypass == 0u)
    {
        uint32_t computed_crc = CRC32_Calculate((const uint8_t *)header.flash_addr, header.payload_size);
        if (computed_crc != header.payload_crc)
        {
            return UPDATE_ERR_CRC_MISMATCH;
        }
    }

    /* Send DONE sentinel then jump */
    UART_SendDoneSentinel();
    JumpToApplication(header.entry_point);
    return UPDATE_OK;
}

/*=============================================================================
 * 11. Entry point
 *===========================================================================*/

int main(void)
{
    if (!BootPinHigh())
    {
        JumpToApplication(APP_FLASH_ORIGIN);
    }
    UART_Init();
    while (1)
    {
        Bootloader_Update();
    }
}