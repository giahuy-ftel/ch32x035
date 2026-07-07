#include <stdint.h>

#define

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

int main(void) {
   // TODO: Implement Raw UART polling
   // TODO: Implement Raw Flash programming

   while (1) {
   }
}
