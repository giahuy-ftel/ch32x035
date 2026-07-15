#ifndef CRC32_H
#define CRC32_H

#include <stdint.h>
#include <stddef.h>

// poly 0x04C11DB7
uint32_t calculate_crc32(const uint8_t *data, size_t length);

#endif // CRC32_H
