#include <stdint.h>

// #define

__attribute__((naked, section(".init"))) void _start(void) {
   __asm__ volatile(".option norvc\n\t"
                    "la sp, _eusrstack\n\t"
                    "j main\n\t");
}

int main(void) {
   // TODO: Implement Raw UART polling
   // TODO: Implement Raw Flash programming

   while (1) {
   }
}

uint32_t crc32() {
}
