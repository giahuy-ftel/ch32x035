#include "boot.h"
#include "jump.h"
#include "uart_protocol.h"
#include "update.h"

int main(void)
{
    if (!BootPinHigh())
    {
        JumpToApplication(APP_FLASH_ORIGIN);
    }

    UART_Init();

    while (1)
    {
        Bootloader_Update();
    }
}