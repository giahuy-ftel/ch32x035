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
#define FLASH_CTLR (*(volatile uint32_t *)0x40022010)
#define FLASH_ADDR (*(volatile uint32_t *)0x40022014)
// used to unlock/lock fast programming/erase mode
#define FLASH_MODEKEYR (*(volatile uint32_t *)0x40022024)

#define USART2_BAUD_RATE 19200

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
void init_gpioA();

// void turn_on_led(){}
void init_usart2();
void config_usart2();
void init_spi0();
void config_spi0();
void uart_boot();
void spi_boot();
void config_pin_A1();

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
   // uart_boot();
   // spi send offset 0x0 (cmd 0x3), if receive data back -> disable everything but spi0 ->
   // spi_boot();
   //
   // if nothing, j poll

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

void pull_bytes(uint8_t *buf, uint32_t len) {
   for (uint32_t i = 0; i < len; i++) {
      // while (USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == RESET)
      //    ;
      // buf[i] = USART_ReceiveData(USART2);
   }
}

void send_word(uint32_t word) {
   uint8_t *bytes = (uint8_t *)&word;
   for (int i = 0; i < 4; i++) {
      // while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET)
      //    ;
      // USART_SendData(USART2, bytes[i]);
   }
}

void init_gpioA() {
   RCC_APB2PCENR |= 0b100;
}

// void turn_on_led(){}
void init_usart2() {
   USART2_CTLR1 |= (0x1 << 13);
}

void config_usart2() {
   init_gpioA();

   // config pin A2 (TX)
   GPIOA_CFGLR |= (0x1 << 8);
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

void init_spi0() {
}

void config_spi0() {
}

void uart_boot() {
}

void spi_boot() {
}

void config_pin_A1() {
   GPIOA_CFGLR &= ~0x30; // set bit [5:4] to 0 for input mode

   // set pull-up & pull-down mode
   GPIOA_CFGLR |= 0x80;
   GPIOA_CFGLR &= ~0x40;

   // set pull-down
   GPIOA_OUTDR &= ~0x2;
}
