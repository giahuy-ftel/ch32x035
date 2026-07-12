#ifndef BOOTTOOL_IMAGE_H
#define BOOTTOOL_IMAGE_H

#include <stdint.h>
#include <stddef.h>

#define IMAGE_HEADER_MAGIC       0x46505455u  /* 'FPTU' */
#define IMAGE_VERSION_SUPPORTED  0x0001u
#define IMAGE_HEADER_SIZE        32u

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

/* Standard CRC-32 (same algorithm/poly the bootloader uses: 0x04C11DB7,
   MSB-first, byte + final result reflected, init/final XOR 0xFFFFFFFF).
   Must match the bootloader's implementation bit-for-bit. */
uint32_t crc32_calculate(const uint8_t *data, size_t length);

/* Serialize an ImageHeader into a 32-byte little-endian buffer.
   header_crc/payload_crc must already be computed by the caller. */
void image_header_serialize(const ImageHeader *hdr, uint8_t out[IMAGE_HEADER_SIZE]);

#endif