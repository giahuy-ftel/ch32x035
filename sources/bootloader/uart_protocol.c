#include "uart_protocol.h"
#include "ch32x035.h"
#include "crc.h"

void UART_Init(void)
{
    GPIO_InitTypeDef gpio_init = {0};
    USART_InitTypeDef usart_init = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

    gpio_init.GPIO_Pin = GPIO_Pin_2;
    gpio_init.GPIO_Mode = GPIO_Mode_AF_PP;
    gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &gpio_init);

    gpio_init.GPIO_Pin = GPIO_Pin_3;
    gpio_init.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &gpio_init);

    usart_init.USART_BaudRate = 19200;
    usart_init.USART_WordLength = USART_WordLength_8b;
    usart_init.USART_StopBits = USART_StopBits_1;
    usart_init.USART_Parity = USART_Parity_No;
    usart_init.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    usart_init.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_Init(USART2, &usart_init);

    USART_Cmd(USART2, ENABLE);
}

void UART_SendByte(uint8_t byte)
{
    while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET)
    {
    }
    USART_SendData(USART2, byte);
}

uint8_t UART_ReceiveByte(void)
{
    while (USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == RESET)
    {
    }
    return (uint8_t)USART_ReceiveData(USART2);
}

uint32_t UART_RequestWord(uint32_t offset)
{
    UART_SendByte((uint8_t)(offset & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 8) & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 16) & 0xFFu));
    UART_SendByte((uint8_t)((offset >> 24) & 0xFFu));

    uint32_t b0 = UART_ReceiveByte();
    uint32_t b1 = UART_ReceiveByte();
    uint32_t b2 = UART_ReceiveByte();
    uint32_t b3 = UART_ReceiveByte();

    return b0 | (b1 << 8) | (b2 << 16) | (b3 << 24);
}

uint8_t ImageHeader_Validate(const uint8_t *header_bytes, ImageHeader *header_out)
{
    if (header_bytes == 0 || header_out == 0)
    {
        return 0;
    }

    header_out->magic        = header_bytes[0]  | (header_bytes[1]  << 8) | (header_bytes[2]  << 16) | (header_bytes[3]  << 24);
    header_out->version      = header_bytes[4]  | (header_bytes[5]  << 8);
    header_out->header_size  = header_bytes[6]  | (header_bytes[7]  << 8);
    header_out->payload_size = header_bytes[8]  | (header_bytes[9]  << 8) | (header_bytes[10] << 16) | (header_bytes[11] << 24);
    header_out->flash_addr   = header_bytes[12] | (header_bytes[13] << 8) | (header_bytes[14] << 16) | (header_bytes[15] << 24);
    header_out->entry_point  = header_bytes[16] | (header_bytes[17] << 8) | (header_bytes[18] << 16) | (header_bytes[19] << 24);
    header_out->app_version  = header_bytes[20] | (header_bytes[21] << 8);
    header_out->crc_bypass   = header_bytes[22] | (header_bytes[23] << 8);
    header_out->header_crc   = header_bytes[24] | (header_bytes[25] << 8) | (header_bytes[26] << 16) | (header_bytes[27] << 24);
    header_out->payload_crc  = header_bytes[28] | (header_bytes[29] << 8) | (header_bytes[30] << 16) | (header_bytes[31] << 24);


    if (header_out->magic != IMAGE_HEADER_MAGIC)
    {
        return 0;
    }

    if (header_out->version != IMAGE_VERSION_SUPPORTED)
    {
        return 0;
    }

    if (header_out->header_size != IMAGE_HEADER_SIZE)
    {
        return 0;
    }


    uint32_t computed_crc = CRC32_Calculate(header_bytes, 24);
    if (computed_crc != header_out->header_crc)
    {
        return 0;
    }


    if (header_out->payload_size == 0u)
    {
        return 0;
    }

    if ((header_out->payload_size % 4u) != 0u)
    {
        return 0;
    }

    if (header_out->flash_addr != APP_FLASH_ORIGIN)
    {
        return 0;
    }

    if ((header_out->flash_addr % 4u) != 0u)
    {
        return 0;
    }

    if (header_out->payload_size > (APP_FLASH_END - header_out->flash_addr))
    {
        return 0;
    }

    if (header_out->entry_point < header_out->flash_addr ||
        header_out->entry_point >= (header_out->flash_addr + header_out->payload_size))
    {
        return 0;
    }

    if ((header_out->entry_point % 2u) != 0u)
    {
        return 0;
    }

    return 1;
}

uint8_t UART_ReceiveAndValidateHeader(ImageHeader *header_out)
{
    uint8_t header_bytes[IMAGE_HEADER_SIZE];

    for (uint32_t i = 0; i < IMAGE_HEADER_SIZE / 4; i++)
    {
        uint32_t word = UART_RequestWord(i * 4);
        header_bytes[i * 4 + 0] = (uint8_t)(word & 0xFFu);
        header_bytes[i * 4 + 1] = (uint8_t)((word >> 8) & 0xFFu);
        header_bytes[i * 4 + 2] = (uint8_t)((word >> 16) & 0xFFu);
        header_bytes[i * 4 + 3] = (uint8_t)((word >> 24) & 0xFFu);
    }

    return ImageHeader_Validate(header_bytes, header_out);
}