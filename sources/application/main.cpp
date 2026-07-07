#include "main.h"

namespace
{
constexpr uint32_t kLedPin = GPIO_Pin_12;
constexpr uint32_t kDelayTicks = 600000u;
}

void delay_loop(volatile uint32_t count)
{
    while (count-- != 0u)
    {
        __asm volatile("nop");
    }
}

int main()
{
    GPIO_InitTypeDef gpio_init = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    gpio_init.GPIO_Pin = kLedPin;
    gpio_init.GPIO_Mode = GPIO_Mode_Out_PP;
    gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &gpio_init);

    bsp_console_init();
    BSP_PRINT("CH32x035 bare-metal firmware ready\r\n");

    while (1)
    {
        GPIOB->OUTDR ^= kLedPin;
        BSP_PRINT("LED toggle\r\n");
        delay_loop(kDelayTicks);
    }
}
