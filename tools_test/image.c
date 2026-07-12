#include "image.h"

static uint8_t reverse_bits8(uint8_t b)
{
    b = (uint8_t)((b & 0xF0u) >> 4 | (b & 0x0Fu) << 4);
    b = (uint8_t)((b & 0xCCu) >> 2 | (b & 0x33u) << 2);
    b = (uint8_t)((b & 0xAAu) >> 1 | (b & 0x55u) << 1);
    return b;
}

static uint32_t reverse_bits32(uint32_t v)
{
    v = ((v & 0xFFFF0000u) >> 16) | ((v & 0x0000FFFFu) << 16);
    v = ((v & 0xFF00FF00u) >> 8)  | ((v & 0x00FF00FFu) << 8);
    v = ((v & 0xF0F0F0F0u) >> 4)  | ((v & 0x0F0F0F0Fu) << 4);
    v = ((v & 0xCCCCCCCCu) >> 2)  | ((v & 0x33333333u) << 2);
    v = ((v & 0xAAAAAAAAu) >> 1)  | ((v & 0x55555555u) << 1);
    return v;
}

uint32_t crc32_calculate(const uint8_t *data, size_t length)
{
    uint32_t crc = 0xFFFFFFFFu;

    for (size_t i = 0; i < length; i++)
    {
        uint8_t reflected = reverse_bits8(data[i]);
        crc ^= ((uint32_t)reflected) << 24;

        for (int bit = 0; bit < 8; bit++)
        {
            crc = (crc & 0x80000000u) ? (crc << 1) ^ 0x04C11DB7u : (crc << 1);
        }
    }

    return reverse_bits32(crc) ^ 0xFFFFFFFFu;
}

static void put_le16(uint8_t *dst, uint16_t v)
{
    dst[0] = (uint8_t)(v & 0xFFu);
    dst[1] = (uint8_t)((v >> 8) & 0xFFu);
}

static void put_le32(uint8_t *dst, uint32_t v)
{
    dst[0] = (uint8_t)(v & 0xFFu);
    dst[1] = (uint8_t)((v >> 8) & 0xFFu);
    dst[2] = (uint8_t)((v >> 16) & 0xFFu);
    dst[3] = (uint8_t)((v >> 24) & 0xFFu);
}

void image_header_serialize(const ImageHeader *hdr, uint8_t out[IMAGE_HEADER_SIZE])
{
    put_le32(&out[0],  hdr->magic);
    put_le16(&out[4],  hdr->version);
    put_le16(&out[6],  hdr->header_size);
    put_le32(&out[8],  hdr->payload_size);
    put_le32(&out[12], hdr->flash_addr);
    put_le32(&out[16], hdr->entry_point);
    put_le16(&out[20], hdr->app_version);
    put_le16(&out[22], hdr->crc_bypass);
    put_le32(&out[24], hdr->header_crc);
    put_le32(&out[28], hdr->payload_crc);
}