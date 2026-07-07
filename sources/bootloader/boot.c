#include "boot.h"
#include "ch32x035.h"

#define BOOT_PIN_PORT   GPIOA
#define BOOT_PIN        GPIO_Pin_1

uint8_t BootPinHigh(void)
{
    GPIO_InitTypeDef gpio_init = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    gpio_init.GPIO_Pin = BOOT_PIN;
    gpio_init.GPIO_Mode = GPIO_Mode_IPD;   
    gpio_init.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(BOOT_PIN_PORT, &gpio_init);

    for (volatile uint32_t i = 0; i < 1000; i++)
    {
    }

    return (GPIO_ReadInputDataBit(BOOT_PIN_PORT, BOOT_PIN) == Bit_SET);
}