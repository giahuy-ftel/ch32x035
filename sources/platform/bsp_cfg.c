#include "bsp_cfg.h"
#include "ch32x035_usart.h"

static void bsp_console_send_char(uint8_t c)
{
      /* wait last transmission completed */
      while (USART_GetFlagStatus(USART2, USART_FLAG_TXE) == RESET);

      /* put transnission data */
      USART_SendData(USART2, (uint8_t)c);

      /* wait transmission completed */
      while (USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET);
}

void bsp_console_init(void)
{
      GPIO_InitTypeDef GPIO_InitStructure;
      USART_InitTypeDef USART_InitStructure;

      RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
      RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

      GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
      GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
      GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
      GPIO_Init(GPIOA, &GPIO_InitStructure);

      USART_InitStructure.USART_BaudRate = 115200;
      USART_InitStructure.USART_WordLength = USART_WordLength_8b;
      USART_InitStructure.USART_StopBits = USART_StopBits_1;
      USART_InitStructure.USART_Parity = USART_Parity_No;
      USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
      USART_InitStructure.USART_Mode = USART_Mode_Tx;

      USART_Init(USART2, &USART_InitStructure);
      USART_Cmd(USART2, ENABLE);

      xfunc_output = (void (*)(int))bsp_console_send_char;
}
