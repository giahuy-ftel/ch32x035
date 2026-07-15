
#include "crc32.h"

uint32_t calculate_crc32(const uint8_t *data, size_t length) {
   uint32_t crc = 0xFFFFFFFF;
   for (size_t i = 0; i < length; i++) {
      crc ^= ((uint32_t)data[i]) << 24;
      for (int j = 0; j < 8; j++) {
         if (crc & 0x80000000) {
            crc = (crc << 1) ^ 0x04C11DB7;
         } else {
            crc = (crc << 1);
         }
      }
   }
   return crc ^ 0xFFFFFFFF;
}
