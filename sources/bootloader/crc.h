#ifndef BOOTLOADER_CRC_H
#define BOOTLOADER_CRC_H

#include <stdint.h>

uint32_t CRC32_Calculate(const uint8_t *data, uint32_t length);

#endif