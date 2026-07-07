#include <stdint.h>

// #define

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

void uart_boot() {
}

void spi_boot() {
}

int main(void) {

   // init gpioA
   // configure pin A1, input, check A1 == HIGH. if no, jump to app
   //
   // configure USART2 (19200, 8N1, no flow control, little endian)
   // configure SPI0 (spi 1-1-1)
   //
   // poll:
   // usart send offset 0x0, if receive data back -> disable everything but usart2 -> uart_boot()
   // spi send offset 0x0 (cmd 0x3), if receive data back -> disable everything but spi0 -> spi_boot()
   // if nothing, j poll

   while (1)
      ;
}
