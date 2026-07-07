#include "crc.h"

static uint8_t ReverseBits8(uint8_t b)
{
    b = (uint8_t)((b & 0xF0u) >> 4 | (b & 0x0Fu) << 4);
    b = (uint8_t)((b & 0xCCu) >> 2 | (b & 0x33u) << 2);
    b = (uint8_t)((b & 0xAAu) >> 1 | (b & 0x55u) << 1);
    return b;
}

static uint32_t ReverseBits32(uint32_t v)
{
    v = ((v & 0xFFFF0000u) >> 16) | ((v & 0x0000FFFFu) << 16);
    v = ((v & 0xFF00FF00u) >> 8)  | ((v & 0x00FF00FFu) << 8);
    v = ((v & 0xF0F0F0F0u) >> 4)  | ((v & 0x0F0F0F0Fu) << 4);
    v = ((v & 0xCCCCCCCCu) >> 2)  | ((v & 0x33333333u) << 2);
    v = ((v & 0xAAAAAAAAu) >> 1)  | ((v & 0x55555555u) << 1);
    return v;
}

uint32_t CRC32_Calculate(const uint8_t *data, uint32_t length)
{
    uint32_t crc = 0xFFFFFFFFu;

    for (uint32_t i = 0; i < length; i++)
    {
        uint8_t reflected_byte = ReverseBits8(data[i]);
        crc ^= ((uint32_t)reflected_byte) << 24;

        for (uint8_t bit = 0; bit < 8; bit++)
        {
            if (crc & 0x80000000u)
            {
                crc = (crc << 1) ^ 0x04C11DB7u; 
            }
            else
            {
                crc = crc << 1;
            }
        }
    }

    crc = ReverseBits32(crc); 
    return crc ^ 0xFFFFFFFFu; 
}