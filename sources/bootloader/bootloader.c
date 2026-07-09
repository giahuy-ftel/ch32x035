#include <stdint.h>

#define APP_START_ADDRESS 0x00001000
#define __IO volatile

/* Typedefs */
typedef void (*jump_func_t)(void);

/* Bootloader Header */
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
} Header;

/* Bootloader constants */
#define HEADER_MAGIC       0x46505455
#define HEADER_VERSION     1
#define HEADER_SIZE        0x20

/* FLASH bits */
#define FLASH_CR_LOCK      (1 << 7)
#define FLASH_CR_FLOCK     (1 << 15)
#define FLASH_CR_STRT      (1 << 6)
#define FLASH_CR_FTER      (1 << 17)
#define FLASH_CR_FTPG      (1 << 16)
#define FLASH_CR_BUF_RST   (1 << 19)
#define FLASH_CR_BUF_LOAD  (1 << 18)
#define FLASH_SR_BSY       (1 << 0)
#define FLASH_SR_EOP       (1 << 5)

typedef struct
{
    __IO uint32_t CFGLR;
    __IO uint32_t CFGHR;
    __IO uint32_t INDR;
    __IO uint32_t OUTDR;
    __IO uint32_t BSHR;
    __IO uint32_t BCR;
    __IO uint32_t LCKR;
    __IO uint32_t CFGXR;
    __IO uint32_t BSXR;
} GPIO_TypeDef;

typedef struct
{
    __IO uint32_t CTLR;
    __IO uint32_t CFGR0;
    __IO uint32_t RESERVED0;
    __IO uint32_t APB2PRSTR;
    __IO uint32_t APB1PRSTR;
    __IO uint32_t AHBPCENR;
    __IO uint32_t APB2PCENR;
    __IO uint32_t APB1PCENR;
    __IO uint32_t RESERVED1;
    __IO uint32_t RSTSCKR;
    __IO uint32_t AHBRSTR;
} RCC_TypeDef;

typedef struct
{
    __IO uint32_t STATR;
    __IO uint32_t DATAR;
    __IO uint32_t BRR;
    __IO uint32_t CTLR1;
    __IO uint32_t CTLR2;
    __IO uint32_t CTLR3;
    __IO uint32_t GPR;
} USART_TypeDef;

/* FLASH Registers */
typedef struct
{
    __IO uint32_t ACTLR;
    __IO uint32_t KEYR;
    __IO uint32_t OBKEYR;
    __IO uint32_t STATR;
    __IO uint32_t CTLR;
    __IO uint32_t ADDR;
    uint32_t      RESERVED;
    __IO uint32_t OBR;
    __IO uint32_t WPR;
    __IO uint32_t MODEKEYR;
    __IO uint32_t BOOT_MODEKEYR;
} FLASH_TypeDef;

/* BASE ADDRESSES */
#define PERIPH_BASE                             ((uint32_t)0x40000000)
#define APB1PERIPH_BASE                         (PERIPH_BASE)
#define APB2PERIPH_BASE                         (PERIPH_BASE + 0x10000)
#define AHBPERIPH_BASE                          (PERIPH_BASE + 0x20000)
#define FLASH_R_BASE                            (AHBPERIPH_BASE + 0x2000)
#define RCC_BASE                                (AHBPERIPH_BASE + 0x1000)
#define GPIOA_BASE                              (APB2PERIPH_BASE + 0x0800)
#define GPIOB_BASE                              (APB2PERIPH_BASE + 0x0C00)
#define USART2_BASE                             (APB1PERIPH_BASE + 0x4400)

/* Device Structs */
#define RCC                                     ((RCC_TypeDef *)RCC_BASE)
#define GPIOA                                   ((GPIO_TypeDef *)GPIOA_BASE)
#define GPIOB                                   ((GPIO_TypeDef *)GPIOB_BASE)
#define USART2                                  ((USART_TypeDef *)USART2_BASE)
#define FLASH                                   ((FLASH_TypeDef *)FLASH_R_BASE)

/* CLOCKS */
#define RCC_APB1Periph_USART2          ((uint32_t)0x00020000)
#define RCC_APB2Periph_GPIOA           ((uint32_t)0x00000004)
#define RCC_APB2Periph_GPIOB           ((uint32_t)0x00000008)

/* GPIO CONFIGS */
#define GPIO_Pin_1                      ((uint32_t)0x000002)
#define GPIO_Pin_2                      ((uint32_t)0x000004)
#define GPIO_Pin_3                      ((uint32_t)0x000008)
#define GPIO_Pin_12                     ((uint32_t)0x001000)
#define GPIO_Mode_IN_FLOATING           0x04
#define GPIO_Mode_Out_PP                0x10
#define GPIO_Mode_AF_PP                 0x18
#define GPIO_Speed_50MHz                1
#define Bit_RESET                       0

/* LED */
#define kLedPin     GPIO_Pin_12

/* USART FLAGS */
#define USART_FLAG_TXE                       ((uint16_t)0x0080)
#define USART_FLAG_RXNE                      ((uint16_t)0x0020)

/* FLASH CONFIGS */
#define RCC_HPRE_DIV1                           ((uint32_t)0x00000000)
#define FLASH_ACTLR_LATENCY                     ((uint8_t)0x03)
#define FLASH_ACTLR_LATENCY_2                   ((uint8_t)0x02)

uint32_t crc32(const uint8_t *data, uint32_t length);

void sw_reset(void);

void send_word(uint32_t word)
{
    uint8_t *bytes = (uint8_t *)&word;
    for(int i = 0; i < 4; i++) {
        while(!(USART2->STATR & USART_FLAG_TXE));
        USART2->DATAR = bytes[i];
    }
}


void pull_bytes(uint8_t *buf, uint32_t len) {
    for(uint32_t i = 0; i < len; i++) {
        while(!(USART2->STATR & USART_FLAG_RXNE));
        buf[i] = (uint8_t)USART2->DATAR;
    }
}

void uart_boot(void) {
    
    Header header;
    for(uint32_t offset = 0; offset < 32; offset += 4) {
        send_word(offset);
        pull_bytes(((uint8_t *)&header) + offset, 4);
    }
    /* Validate header */
    if(header.magic != HEADER_MAGIC) {
        send_word(0x11111111);
        while(1);
    }
    if(header.version != HEADER_VERSION) {
        send_word(0x22222222);
        while(1);
    }
    if(header.header_size != HEADER_SIZE) {
        send_word(0x33333333);
        while(1);
    }
    if(header.payload_size & 0x3) {
        send_word(0x44444444);
        while(1);
    }
    /* Validate header CRC */
    if(header.crc_bypass == 0) {
        uint32_t crc = crc32((uint8_t *)&header, 24);
        if(crc != header.header_crc) {
            send_word(0x55555555);
            while(1);
        }
    }
    uint8_t buffer[256];
    uint32_t pages = (header.payload_size + 255) / 256;
    for(uint32_t page = 0; page < pages; page++) {
        /* Receive one flash page */
        for(uint32_t offset = 0; offset < 256; offset += 4) {
            send_word(32 + offset + page * 256);
            pull_bytes(buffer + offset, 4);
        }
        uint32_t addr = header.flash_addr + page * 256;
        page++;
    }
    /* Verify written firmware */
    uint32_t actual_crc = crc32((uint8_t *)header.flash_addr, header.payload_size);
    if(actual_crc != header.payload_crc) {
        send_word(0xDEADBEEF);
        sw_reset();
    }
    /* Tell host success */
    send_word(0xFFFFFFFF);
    /* Jump to application */
    jump_func_t jump_to_app = (jump_func_t)header.entry_point;
    jump_to_app();
}

void sw_reset(void) {
    while(!(USART2->STATR & (1 << 6)));
    /* software reset */
    *((volatile uint32_t *)0xE000ED0C) =
        0x05FA0004;
}

static void flash_unlock(void) {
    if (FLASH->CTLR & FLASH_CR_LOCK) {
        FLASH->KEYR = 0x45670123;
        FLASH->KEYR = 0xCDEF89AB;
    }
    if (FLASH->CTLR & FLASH_CR_FLOCK) {
        FLASH->MODEKEYR = 0x45670123;
        FLASH->MODEKEYR = 0xCDEF89AB;
    }
}

static void flash_lock(void) {
    /* lock fast programming mode */
    FLASH->CTLR |= FLASH_CR_FLOCK;
    /* lock flash */
    FLASH->CTLR |= FLASH_CR_LOCK;
}

static void flash_wait(void) {
    while (FLASH->STATR & FLASH_SR_BSY);
}

static void flash_clear_eop(void) {
    FLASH->STATR |= FLASH_SR_EOP;
}

void flash_erase_page_fast(uint32_t page_addr) {
    flash_unlock();
    flash_wait();
    /* enable fast erase */
    FLASH->CTLR |= FLASH_CR_FTER;
    FLASH->ADDR = page_addr;
    /* start operation */
    FLASH->CTLR |= FLASH_CR_STRT;
    while ((FLASH->STATR & FLASH_SR_BSY) ||
           !(FLASH->STATR & FLASH_SR_EOP));
    flash_clear_eop();
    FLASH->CTLR &= ~FLASH_CR_FTER;
    flash_lock();
}

void flash_write_page_fast(uint32_t page_addr, const uint8_t *data_buffer) {
    flash_unlock();
    flash_wait();
    /* enable fast programming */
    FLASH->CTLR |= FLASH_CR_FTPG;
    /* reset programming buffer */
    FLASH->CTLR |= FLASH_CR_BUF_RST;
    while ((FLASH->STATR & FLASH_SR_BSY) || !(FLASH->STATR & FLASH_SR_EOP));
    flash_clear_eop();
    /* Load 256 bytes into programming buffer */
    for(uint32_t i = 0; i < 64; i++) {
        *((uint32_t *)(page_addr + i * 4)) = ((uint32_t *)data_buffer)[i];
        /* buffer load */
        FLASH->CTLR |= FLASH_CR_BUF_LOAD;
        while (FLASH->STATR & FLASH_SR_BSY);
    }
    FLASH->ADDR = page_addr;
    /* start fast programming */
    FLASH->CTLR |= FLASH_CR_STRT;
    while ((FLASH->STATR & FLASH_SR_BSY) || !(FLASH->STATR & FLASH_SR_EOP));
    flash_clear_eop();
    FLASH->CTLR &= ~FLASH_CR_FTPG;
    flash_lock();
}

void SystemInit (void) {
    RCC->CTLR |= (uint32_t)0x00000001;
    RCC->CFGR0 |= (uint32_t)0x00000050;
    RCC->CFGR0 &= (uint32_t)0xF8FFFF5F;
    /* Flash 2 wait state */
    FLASH->ACTLR &= (uint32_t)((uint32_t)~FLASH_ACTLR_LATENCY);
    FLASH->ACTLR |= (uint32_t)FLASH_ACTLR_LATENCY_2;
    /* HCLK = SYSCLK = APB1 */
    RCC->CFGR0 &= (uint32_t)0xFFFFFF0F;
    RCC->CFGR0 |= (uint32_t)RCC_HPRE_DIV1;
}

#define CRC32_POLYNOMIAL 0x04C11DB7

uint32_t crc32(const uint8_t *data, uint32_t length) {
    uint32_t crc = 0xFFFFFFFF;
    while (length--)
    {
        crc ^= ((uint32_t)(*data++)) << 24;
        for (int i = 0; i < 8; i++)
        {
            if (crc & 0x80000000)
                crc = (crc << 1) ^ CRC32_POLYNOMIAL;
            else
                crc <<= 1;
        }
    }
    return crc ^ 0xFFFFFFFF;
}

void main(void) {
    /* Init GPIOA */
    RCC->APB2PCENR |= RCC_APB2Periph_GPIOA;

    uint32_t modeA1 = (GPIO_Mode_IN_FLOATING & 0x0F);
    GPIOA->CFGLR &= ~(0xF << 4);
    GPIOA->CFGLR |= (modeA1 << 4);

    if((GPIOA->INDR & GPIO_Pin_1)==(uint32_t)Bit_RESET) {
        jump_func_t jump_to_app = (jump_func_t)APP_START_ADDRESS;
        jump_to_app();
    }

    GPIOA->CFGLR |= (0x3 << 8); 
    GPIOA->CFGLR |= (0x1 << 11);
    GPIOA->CFGLR &= ~(0x1 << 10);

    uint32_t modeA3 = (GPIO_Mode_IN_FLOATING & 0x0F);
    GPIOA->CFGLR &= ~(0xF << 12);
    GPIOA->CFGLR |= (modeA3 << 12);

    /* Init USART2 */
    RCC->APB1PCENR |= RCC_APB1Periph_USART2;

    /* 19200 baud rate at 48 MHz APB1 clock */
    USART2->BRR = 0x9C4;

    /* 8 data bits, no parity, 1 stop bit */
    USART2->CTLR1 &= (uint16_t)~(0x1000 | 0x0400 | 0x0200); /* clear M, PCE, PS */
    USART2->CTLR2 &= (uint16_t)~0x3000;                     /* clear STOP[1:0] -> 1 stop bit */

    /* Enable TX, RX, and the USART peripheral itself */
    USART2->CTLR1 |= (uint16_t)(0x0008 | 0x0004 | 0x2000); /* TE | RE | UE */

    /* Init GPIOB & LED */
    RCC->APB2PCENR |= RCC_APB2Periph_GPIOB;
    uint32_t modeB12 = (GPIO_Mode_Out_PP & 0x0F) | GPIO_Speed_50MHz;
    GPIOB->CFGHR &= ~(0xF << 16);
    GPIOB->CFGHR |= (modeB12 << 16);

    GPIOB->OUTDR ^= kLedPin;
    while (USART2->STATR & USART_FLAG_RXNE) {
        (void)USART2->DATAR;
    }
    uart_boot();
    while(1);
}