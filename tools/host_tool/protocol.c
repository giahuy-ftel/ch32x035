#include "protocol.h"
#include "serial.h"
#include <stdio.h>

static uint32_t read_le32(const uint8_t *buf) {
   return ((uint32_t)buf[0]) | (((uint32_t)buf[1]) << 8) | (((uint32_t)buf[2]) << 16) |
          (((uint32_t)buf[3]) << 24);
}

int protocol_run(int serial_fd, const uint8_t *image, size_t image_size) {
   printf("Stateless Host Tool running. Waiting for MCU requests...\n");

   while (true) {
      uint8_t request[4];
      if (serial_read(serial_fd, request, sizeof(request)) != 4) {
         continue;
      }

      uint32_t offset = read_le32(request);
      if (offset == 0xFFFFFFFF) {
         printf("\nFirmware update successful! MCU is booting application...\n");
         return 0;
      }
      if (offset == 0xDEADBEEF) {
         printf("\nCRC FAILED!\n");
         return 1;
      }

      uint8_t response[4] = {0xFF, 0xFF, 0xFF, 0xFF};
      if (image_size >= sizeof(response) && offset <= image_size - sizeof(response)) {
         response[0] = image[offset];
         response[1] = image[offset + 1];
         response[2] = image[offset + 2];
         response[3] = image[offset + 3];
         printf("MCU requested offset: %u/%zu (0x%08X)\n", offset, image_size, offset);
      }

      if (serial_write(serial_fd, response, sizeof(response)) != 4) {
         printf("\nError: Failed to write chunk to serial port.\n");
         return -1;
      }
   }
}
