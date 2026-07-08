#include <stdint.h>

#define RCC_APB2PCENR (*(volatile uint32_t *)0x40021018)

#define GPIOB_CFGHR (*(volatile uint32_t *)0x40010C04)
#define GPIOB_OUTDR (*(volatile uint32_t *)0x40010C0C)

__attribute__((naked, section(".init"))) void _start(void) {
   __asm__ volatile(".option norvc\n\t"
                    "la sp, _eusrstack\n\t"
                    "j main\n\t");
}

#define kLedPin 12
#define kDelayTicks 300000u

void delay_loop(volatile uint32_t count) {
   while (count-- != 0u) {
      __asm volatile("nop");
   }
}

void config_led_pin() {
   // set output mode 50mhz
   GPIOB_CFGHR |= (0x3 << 16);

   // set pull-up & pull-down mode
   // GPIOB_CFGHR |= (0x1 << 19);
   GPIOB_CFGHR &= ~(0x3 << 18);
}

int main(void) {
   // init gpioB
   RCC_APB2PCENR |= (0x1 << 3);

   config_led_pin();

   while (1) {
      GPIOB_OUTDR ^= (0x1 << 12);
      delay_loop(kDelayTicks);
   }
}
