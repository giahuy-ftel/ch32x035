#include <stdint.h>

#define RCC_APB2PCENR (*(volatile uint32_t *)0x40021018)
#define RCC_APB1PCENR (*(volatile uint32_t *)0x4002101C)

#define GPIOA_CFGLR (*(volatile uint32_t *)0x40010800)
#define GPIOA_INDR (*(volatile uint32_t *)0x40010808)
#define GPIOA_OUTDR (*(volatile uint32_t *)0x4001080C)

#define USART2_STATR (*(volatile uint32_t *)0x40004400)
#define USART2_DATAR (*(volatile uint32_t *)0x40004404)
#define USART2_BRR (*(volatile uint32_t *)0x40004408)
#define USART2_CTLR1 (*(volatile uint32_t *)0x4000440C)
#define USART2_CTLR2 (*(volatile uint32_t *)0x40004410)
#define USART2_CTLR3 (*(volatile uint32_t *)0x40004414)

#define FLASH_KEYR (*(volatile uint32_t *)0x40022004)
#define FLASH_STATR (*(volatile uint32_t *)0x4002200C)
#define FLASH_CTLR (*(volatile uint32_t *)0x40022010)
#define FLASH_ADDR (*(volatile uint32_t *)0x40022014)
// used to unlock/lock fast programming/erase mode
#define FLASH_MODEKEYR (*(volatile uint32_t *)0x40022024)

#define PFIC_CFGR (*(volatile uint32_t *)0xE000E048)

__attribute__((naked, section(".init"))) void _start(void) {
   __asm__ volatile(".option norvc\n\t"
                    "la sp, _eusrstack\n\t"
                    "j main\n\t");
}

typedef struct {
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

typedef void (*jump_func)(void);

uint32_t crc32(const uint8_t *data, uint32_t length);
void pull_bytes(uint8_t *buf, uint32_t len);
void send_word(uint32_t word);
// void turn_on_led(){}
void init_gpioA();
void init_usart2();
void init_spi0();
void disable_usart2();
void disable_spi0();
void config_pin_A1();
void config_usart2();
void config_spi0();
void uart_boot();
void spi_boot();
void sw_reset();
void flash_erase_page_fast(uint32_t page_addr);
void flash_write_page_fast(uint32_t page_addr, const uint8_t *data_buffer);

int main(void) {

   init_gpioA();

   // configure pin A1, input
   config_pin_A1();

   // check A1 == HIGH. if no, jump to app
   if ((GPIOA_INDR & 0x2) != 2) {
      jump_func jump_to_app = (jump_func)0x2000;
      jump_to_app();
   }

   // (consider turning on led for visual ease)
   // turn_on_led();
   //
   // init usart2
   init_usart2();
   //
   // configure USART2 (19200, 8N1, no flow control, little endian)
   config_usart2();

   // init spi0
   init_spi0();
   // configure SPI0 (spi 1-1-1)
   config_spi0();

   // poll:
   // usart send offset 0x0, if receive data back -> disable everything but usart2
   uart_boot();
   // spi send offset 0x0 (cmd 0x3), if receive data back -> disable everything but spi0 ->
   // spi_boot();
   //
   // if nothing, j poll

   jump_func jump_to_app = (jump_func)0x2000;
   jump_to_app();

   while (1)
      ;
}

uint32_t crc32(const uint8_t *data, uint32_t length) {
   uint32_t crc = 0xFFFFFFFF;
   for (uint32_t i = 0; i < length; i++) {
      crc ^= ((uint32_t)data[i] << 24);
      for (int j = 0; j < 8; j++) {
         if (crc & 0x80000000) {
            crc = (crc << 1) ^ 0x04C11DB7;
         } else {
            crc <<= 1;
         }
      }
   }
   return crc ^ 0xFFFFFFFF;
}

void send_word(uint32_t word) {
   uint8_t *bytes = (uint8_t *)&word;
   for (int i = 0; i < 4; i++) {
      // TXE bit
      while (((USART2_STATR >> 7) & 0x1) == 0)
         ;
      USART2_DATAR = bytes[i];
   }
}

void pull_bytes(uint8_t *buf, uint32_t len) {
   for (uint32_t i = 0; i < len; i++) {
      // RXNE bit
      while (((USART2_STATR >> 5) & 0x1) == 0)
         ;
      buf[i] = (uint8_t)(USART2_DATAR & 0xff);
   }
}

void init_gpioA() {
   RCC_APB2PCENR |= 0b100;
}

// void turn_on_led(){}
void init_usart2() {
   RCC_APB1PCENR |= (0x1 << 17);
   USART2_CTLR1 |= (0x1 << 13);
}

void init_spi0() {
}

void config_pin_A1() {
   GPIOA_CFGLR &= ~0x30; // set bit [5:4] to 0 for input mode

   // set pull-up & pull-down mode
   GPIOA_CFGLR |= 0x80;
   GPIOA_CFGLR &= ~0x40;

   // set pull-down
   GPIOA_OUTDR &= ~0x2;
}

void config_usart2() {
   init_gpioA();

   // config pin A2 (TX)
   GPIOA_CFGLR |= (0x3 << 8);
   GPIOA_CFGLR |= (0x1 << 11);
   GPIOA_CFGLR &= ~(0x1 << 10);

   // config pin  A3 (RX)
   GPIOA_CFGLR &= ~(0x3 << 12);
   GPIOA_CFGLR |= (0x1 << 14);
   GPIOA_CFGLR &= ~(0x1 << 15);

   // 8 bit data
   USART2_CTLR1 |= (0x1 << 12);

   // no parity
   USART2_CTLR1 &= ~(0x1 << 10);

   // receiv && transmit enable
   USART2_CTLR1 |= (0x3 << 2);

   // 1 stop bit
   USART2_CTLR2 &= ~(0x3 << 12);

   // configure baud rate 19200
   USART2_BRR = 0x1A1;

   // no flow control
   USART2_CTLR3 &= ~(0x3 << 8);
}

void config_spi0() {
}

void uart_boot() {
   Header header;

   // ask for header
   for (uint32_t offset = 0x0; offset < 32; offset += 4) {
      send_word(offset);
      pull_bytes(((uint8_t *)&header) + offset, 4);
   }

   // check header
   if (header.magic != 0x46505455 || header.version != 1 || header.header_size != 0x20 ||
       (header.payload_size & 0x3) != 0) {
      // signaling host_tool that ts failed
      send_word(0xDEADBEEF);

      // bit TC
      while (((USART2_STATR >> 6) & 0x1) == 0)
         ;

      sw_reset();
   }

   // check crc of first 24 bytes
   if (header.crc_bypass == 0) {
      uint32_t real_crc = crc32((uint8_t *)&header, 24); // crc of first 24 bytes
      if (real_crc != header.header_crc) {
         send_word(0xDEADBEEF);

         while (((USART2_STATR >> 6) & 0x1) == 0)
            ;

         sw_reset();
      }
   }

   uint8_t sram_buffer[256];
   int pages = header.payload_size / 256;

   for (uint32_t no_page = 0; no_page < pages; ++no_page) {

      // fetch page from host
      for (uint32_t offset = 0; offset < 256; offset += 4) {
         send_word(header.flash_addr + offset + no_page * 256);
         pull_bytes(sram_buffer + offset, 4);
      }

      flash_write_page_fast(256 * no_page + (header.flash_addr | 0x08000000), sram_buffer);
   }

   uint32_t actual_crc = crc32((uint8_t *)(header.flash_addr | 0x08000000), header.payload_size);

   if (actual_crc != header.payload_crc) {
      send_word(0xDEADBEEF);
      while (((USART2_STATR >> 6) & 0x1) == 0)
         ;
      sw_reset();
   }

   send_word(0xFFFFFFFF);

   while (((USART2_STATR >> 6) & 0x1) == 0)
      ;
   disable_usart2();
}

void spi_boot() {
}

void sw_reset() {
   PFIC_CFGR = 0xBEEF0080;
}

void disable_usart2() {
   USART2_CTLR1 &= ~(1 << 13);
   RCC_APB1PCENR &= ~(1 << 17);
}

void disable_spi0() {
}

void flash_erase_page_fast(uint32_t page_addr) {
   // unlock flash
   if ((FLASH_KEYR >> 7) & 0x1) {
      FLASH_KEYR = 0x45670123;
      FLASH_KEYR = 0xCDEF89AB;
   }
   // if LOCK bit == 1, reset
   // if ((FLASH_KEYR >> 7) & 0x1)
   //    sw_reset();

   // unlock fast programmint mode
   if ((FLASH_KEYR >> 15) & 0x1) {
      FLASH_MODEKEYR = 0x45670123;
      FLASH_MODEKEYR = 0xCDEF89AB;
   }
   // if FLOCK bit == 1, reset
   // if ((FLASH_KEYR >> 15) & 0x1)
   //    sw_reset();

   // wait till BSY bit == 0
   while (FLASH_STATR & 0x1)
      ;

   // enable fast erase
   FLASH_CTLR |= (0x1 << 17);

   FLASH_ADDR = page_addr;

   // STRT bit
   FLASH_CTLR |= (0x1 << 6);

   // wait till BSY == 0 or EOP == 1
   while (FLASH_STATR & 0x1 || ((FLASH_STATR >> 5) & 0x1) == 0)
      ;
   // set EOP to 0
   FLASH_STATR &= ~(0x1 << 5);

   // disable fast erase
   FLASH_CTLR &= ~(0x1 << 17);

   // lock fast programming mode
   FLASH_KEYR |= (0x1 << 15);
   // lock flash
   FLASH_KEYR |= (0x1 << 7);
}

void flash_write_page_fast(uint32_t page_addr, const uint8_t *data_buffer) {
   flash_erase_page_fast(page_addr);

   // unlock flash
   if ((FLASH_KEYR >> 7) & 0x1) {
      FLASH_KEYR = 0x45670123;
      FLASH_KEYR = 0xCDEF89AB;
   }
   // if LOCK bit == 1, reset
   // if ((FLASH_KEYR >> 7) & 0x1)
   //    sw_reset();

   // unlock fast programmint mode
   if ((FLASH_KEYR >> 15) & 0x1) {
      FLASH_MODEKEYR = 0x45670123;
      FLASH_MODEKEYR = 0xCDEF89AB;
   }
   // if FLOCK bit == 1, reset
   // if ((FLASH_KEYR >> 15) & 0x1)
   //    sw_reset();

   // wait till BSY bit == 0
   while (FLASH_STATR & 0x1)
      ;

   // enable fast programming
   FLASH_CTLR |= (0x1 << 16);
   // buf_reset
   FLASH_CTLR |= (0x1 << 19);

   while (FLASH_STATR & 0x1 || ((FLASH_STATR >> 5) & 0x1) == 0)
      ;
   // set EOP to 0
   FLASH_STATR &= ~(0x1 << 5);

   // write to buffer
   for (uint32_t i = 0; i < 64; i += 1) {
      *((uint32_t *)page_addr + i) = *((uint32_t *)data_buffer + i);

      // cache data into buffer
      FLASH_CTLR |= (0x1 << 18);

      // wait for buf loading done
      while (FLASH_STATR & 0x1)
         ;
   }

   FLASH_ADDR = page_addr;
   // STRT bit
   FLASH_CTLR |= (0x1 << 6);

   // wait till BSY == 0 or EOP == 1
   while (FLASH_STATR & 0x1 || ((FLASH_STATR >> 5) & 0x1) == 0)
      ;
   // set EOP to 0
   FLASH_STATR &= ~(0x1 << 5);

   // disable fast programming
   FLASH_CTLR &= ~(0x1 << 16);

   // lock fast programming mode
   FLASH_KEYR |= (0x1 << 15);
   // lock flash
   FLASH_KEYR |= (0x1 << 7);
}
