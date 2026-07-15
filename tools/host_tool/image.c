#include "image.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include "crc32.h"

// Helper to write a uint16_t in little endian
static void write_le16(uint8_t *buf, uint16_t val) {
   buf[0] = (uint8_t)(val & 0xFF);
   buf[1] = (uint8_t)((val >> 8) & 0xFF);
}

// Helper to write a uint32_t in little endian
static void write_le32(uint8_t *buf, uint32_t val) {
   buf[0] = (uint8_t)(val & 0xFF);
   buf[1] = (uint8_t)((val >> 8) & 0xFF);
   buf[2] = (uint8_t)((val >> 16) & 0xFF);
   buf[3] = (uint8_t)((val >> 24) & 0xFF);
}

static uint8_t *read_file(const char *path, size_t *out_size) {
   FILE *f = fopen(path, "rb");
   if (!f)
      return NULL;
   fseek(f, 0, SEEK_END);
   long size = ftell(f);
   fseek(f, 0, SEEK_SET);
   if (size < 0) {
      fclose(f);
      return NULL;
   }
   uint8_t *buf = malloc(size);
   if (!buf) {
      fclose(f);
      return NULL;
   }
   size_t read_bytes = fread(buf, 1, size, f);
   fclose(f);
   if (read_bytes != (size_t)size) {
      free(buf);
      return NULL;
   }
   *out_size = (size_t)size;
   return buf;
}

static bool check_cmd(const char *cmd) {
   char buf[256];
   snprintf(buf, sizeof(buf), "which %s > /dev/null 2>&1", cmd);
   return system(buf) == 0;
}

uint8_t *build_image(const char *input_path, size_t *out_size) {
   *out_size = 0;
   size_t in_len = strlen(input_path);
   if (in_len == 0)
      return NULL;

   uint8_t *payload = NULL;
   size_t payload_len = 0;

   if (in_len >= 4 && strcmp(input_path + in_len - 4, ".bin") == 0) {
      payload = read_file(input_path, &payload_len);
      if (!payload) {
         fprintf(stderr, "Error: Could not read %s\n", input_path);
         return NULL;
      }
   } else if (in_len >= 4 && strcmp(input_path + in_len - 4, ".elf") == 0) {
      const char *cmds[] = {"riscv64-unknown-elf-objcopy", "riscv64-elf-objcopy", "riscv-none-elf-objcopy"};
      const char *objcopy = NULL;
      for (size_t i = 0; i < sizeof(cmds) / sizeof(cmds[0]); i++) {
         if (check_cmd(cmds[i])) {
            objcopy = cmds[i];
            break;
         }
      }
      if (!objcopy) {
         fprintf(stderr, "Error: No riscv objcopy tool found in PATH.\n");
         return NULL;
      }

      char bin_path[1024];
      snprintf(bin_path, sizeof(bin_path), "%s", input_path);
      // Replace .elf with .bin
      strcpy(bin_path + in_len - 4, ".bin");

      char sys_cmd[2048];
      snprintf(sys_cmd, sizeof(sys_cmd), "%s -O binary %s %s", objcopy, input_path, bin_path);
      if (system(sys_cmd) != 0) {
         fprintf(stderr, "Error: Failed to execute objcopy.\n");
         return NULL;
      }
      payload = read_file(bin_path, &payload_len);
      if (!payload) {
         fprintf(stderr, "Error: Could not read generated %s\n", bin_path);
         return NULL;
      }
   } else {
      fprintf(stderr, "Error: Unsupported file extension.\n");
      return NULL;
   }

   // Pad payload
   size_t rem = payload_len % 256;
   size_t padded_len = payload_len;
   if (rem != 0) {
      padded_len += (256 - rem);
   }

   uint8_t *final_payload = malloc(padded_len);
   if (!final_payload) {
      free(payload);
      return NULL;
   }
   memcpy(final_payload, payload, payload_len);
   if (rem != 0) {
      memset(final_payload + payload_len, 0xFF, 256 - rem);
   }
   free(payload);

   printf("Payload size (padded): %zu bytes\n", padded_len);

   uint32_t payload_crc = calculate_crc32(final_payload, padded_len);

   uint32_t flash_addr = 0x2000;
   uint32_t entry_point = flash_addr + 0x4;

   // Header is 32 bytes
   size_t total_size = 32 + padded_len;
   uint8_t *image = malloc(total_size);
   if (!image) {
      free(final_payload);
      return NULL;
   }

   memset(image, 0, 32); // Prefix with 0s
   // 0..3: Magic 0x46505455
   write_le32(image + 0, 0x46505455);
   // 4..5: Version 1
   write_le16(image + 4, 1);
   // 6..7: Header size 32
   write_le16(image + 6, 32);
   // 8..11: Payload size
   write_le32(image + 8, (uint32_t)padded_len);
   // 12..15: Flash addr
   write_le32(image + 12, flash_addr);
   // 16..19: Entry point
   write_le32(image + 16, entry_point);
   // 20..21: Reserved 0
   write_le16(image + 20, 0);
   // 22..23: Padding 0
   // (already zeroed by memset)

   uint32_t header_crc = calculate_crc32(image, 24);

   write_le32(image + 24, header_crc);
   write_le32(image + 28, payload_crc);

   memcpy(image + 32, final_payload, padded_len);
   free(final_payload);

   *out_size = total_size;
   return image;
}
