#include "ch32x035.h"
#include <stdint.h>

namespace {
constexpr uint32_t kLedPin = GPIO_Pin_12;
// constexpr uint32_t kDelayTicks = 600000u;
} // namespace

struct Header {
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
};

typedef void (*jump_func)(void);

uint32_t calculate_crc32(const uint8_t *data, uint32_t length) {
   uint32_t crc = 0xFFFFFFFF;
   for (uint32_t i = 0; i < length; i++) {
      crc ^= ((uint32_t)data[i] << 24);
      for (int j = 0; j < 8; j++) {
         if (crc & 0x80000000) {
            crc = (crc << 1) ^ 0x04C11DB7;
         } else {
            crc <<= 1;
         }
      }
   }
   return crc ^ 0xFFFFFFFF;
}

void pull_bytes(uint8_t *buf, uint32_t len) {
   for (uint32_t i = 0; i < len; i++) {
      while (USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == RESET)
         ;
      buf[i] = USART_ReceiveData(USART2);
   }
}

void send_word(uint32_t word) {
   uint8_t *bytes = (uint8_t *)&word;
   for (int i = 0; i < 4; i++) {
      while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET)
         ;
      USART_SendData(USART2, bytes[i]);
   }
}

int main() {
   // SystemInit();
   GPIO_InitTypeDef gpio_init = {0};

   // init pa1 and check it
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
   gpio_init.GPIO_Pin = GPIO_Pin_1;
   gpio_init.GPIO_Mode = GPIO_Mode_IPD;
   GPIO_Init(GPIOA, &gpio_init);

   if (GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_1) == RESET) {
      jump_func jump_to_main = (jump_func)0x00002000;
      __disable_irq();
      jump_to_main();
   }

   // turn on led to notify that bootloader boot mode
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
   gpio_init.GPIO_Pin = kLedPin;
   gpio_init.GPIO_Mode = GPIO_Mode_Out_PP;
   gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
   GPIO_Init(GPIOB, &gpio_init);
   GPIOB->OUTDR ^= kLedPin;

   // init usart2
   RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);

   gpio_init.GPIO_Pin = GPIO_Pin_2;
   gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
   gpio_init.GPIO_Mode = GPIO_Mode_AF_PP;
   GPIO_Init(GPIOA, &gpio_init);

   gpio_init.GPIO_Pin = GPIO_Pin_3;
   gpio_init.GPIO_Mode = GPIO_Mode_IN_FLOATING;
   GPIO_Init(GPIOA, &gpio_init);

   USART_InitTypeDef USART_InitStructure = {0};
   USART_InitStructure.USART_BaudRate = 19200;
   USART_InitStructure.USART_WordLength = USART_WordLength_8b;
   USART_InitStructure.USART_StopBits = USART_StopBits_1;
   USART_InitStructure.USART_Parity = USART_Parity_No;
   USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
   USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;

   USART_Init(USART2, &USART_InitStructure);
   USART_Cmd(USART2, ENABLE);

   Header header;

   // ask for header
   for (uint32_t offset = 0x0; offset < 32; offset += 4) {
      send_word(offset);
      pull_bytes(((uint8_t *)&header) + offset, 4);
   }

   // check header
   if (header.magic != 0x46505455 || header.version != 1 || header.header_size != 0x20 ||
       (header.payload_size & 0x3) != 0) {
      // signaling host_tool that ts failed
      send_word(0xDEADBEEF);

      while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET)
         ;

      NVIC_SystemReset();
   }

   // check crc of first 24 bytes
   if (header.crc_bypass == 0) {
      uint32_t real_crc = calculate_crc32((uint8_t *)&header, 24); // crc of first 24 bytes
      if (real_crc != header.header_crc) {
         send_word(0xDEADBEEF);

         while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET)
            ;

         NVIC_SystemReset();
      }
   }

   uint8_t sram_buffer[256];
   uint32_t bytes_received = 0;

   // erase app flash region
   FLASH_Unlock_Fast();
   for (uint32_t addr = header.flash_addr; addr < header.flash_addr + header.payload_size; addr += 256) {
      __disable_irq();
      FLASH_ErasePage_Fast(addr | 0x08000000);
      __enable_irq();
   }
   FLASH_Lock_Fast();

   // receive and burn the payload, a page (256B) at a time
   uint32_t payload_offset = 0;
   while (payload_offset < header.payload_size) {
      for (uint32_t i = 0; i < 256; i += 4) {
         send_word(32 + payload_offset + i);
         pull_bytes(sram_buffer + i, 4);
      }

      FLASH_Unlock_Fast();
      __disable_irq();
      FLASH_BufReset();
      for (uint32_t i = 0; i < 256; i += 4) {
         uint32_t word = *(uint32_t *)(sram_buffer + i);

         // padding for last page
         if (payload_offset + i > header.payload_size)
            word = 0xff;

         FLASH_BufLoad((header.flash_addr | 0x08000000) + payload_offset + i, word);
      }
      FLASH_ProgramPage_Fast((header.flash_addr | 0x08000000) + payload_offset);
      __enable_irq();
      FLASH_Lock_Fast();

      payload_offset += 256;
   }

   uint32_t actual_crc = calculate_crc32((uint8_t *)(header.flash_addr | 0x08000000), header.payload_size);

   if (actual_crc != header.payload_crc) {
      send_word(0xDEADBEEF);
      while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET)
         ;

      NVIC_SystemReset();
   }

   send_word(0xFFFFFFFF);

   while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET)
      ;

   USART_Cmd(USART2, DISABLE);
   RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, DISABLE);

   jump_func jump_to_main = (jump_func)header.flash_addr;
   jump_to_main();
}
