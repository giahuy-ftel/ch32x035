#ifndef BOOTLOADER_UART_PROTOCOL_H
#define BOOTLOADER_UART_PROTOCOL_H

#include <stdint.h>

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

#define IMAGE_HEADER_MAGIC   0x46505455u
#define IMAGE_HEADER_SIZE    32u

#define IMAGE_VERSION_SUPPORTED   1u

#define APP_FLASH_ORIGIN   0x00002000u
#define APP_FLASH_END      0x00010000u

void UART_Init(void);
void UART_SendByte(uint8_t byte);
uint8_t UART_ReceiveByte(void);
uint32_t UART_RequestWord(uint32_t offset);

uint8_t ImageHeader_Validate(const uint8_t *header_bytes, ImageHeader *header_out);


uint8_t UART_ReceiveAndValidateHeader(ImageHeader *header_out);

#endif