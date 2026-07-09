#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define MAGIC           0x46505455
#define VERSION         1
#define HEADER_SIZE     32

#define FLASH_ADDRESS   0x1000

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

} Header;

static uint32_t crc32(const uint8_t *data, uint32_t len)
{
    uint32_t crc = 0xFFFFFFFF;

    while(len--)
    {
        crc ^= ((uint32_t)*data++) << 24;

        for(int i = 0; i < 8; i++)
        {
            if(crc & 0x80000000)
                crc = (crc << 1) ^ 0x04C11DB7;
            else
                crc <<= 1;
        }
    }

    return crc ^ 0xFFFFFFFF;
}

int main(int argc, char **argv)
{
    if(argc != 3)
    {
        printf("usage: %s app.bin update.bin\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "rb");
    if(!f)
    {
        perror(argv[1]);
        return 1;
    }

    fseek(f, 0, SEEK_END);
    uint32_t size = ftell(f);
    rewind(f);

    uint32_t padded = (size + 255) & ~255u;

    uint8_t *payload = malloc(padded);
    memset(payload, 0xFF, padded);

    fread(payload, 1, size, f);
    fclose(f);

    Header h;
    memset(&h, 0, sizeof(h));

    h.magic        = MAGIC;
    h.version      = VERSION;
    h.header_size  = HEADER_SIZE;
    h.payload_size = padded;
    h.flash_addr   = FLASH_ADDRESS;
    h.entry_point  = FLASH_ADDRESS + 4;
    h.app_version  = 0;
    h.crc_bypass   = 0;

    h.payload_crc = crc32(payload, padded);
    h.header_crc  = crc32((uint8_t *)&h, 24);

    FILE *out = fopen(argv[2], "wb");
    if(!out)
    {
        perror(argv[2]);
        return 1;
    }

    fwrite(&h, 1, sizeof(h), out);
    fwrite(payload, 1, padded, out);

    fclose(out);
    free(payload);

    printf("Created %s\n", argv[2]);
    printf("Payload: %u bytes\n", padded);

    return 0;
}