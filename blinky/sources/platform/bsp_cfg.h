#ifndef BSP_CONFIG_H
#define BSP_CONFIG_H

#ifdef __cplusplus
extern "C"
{
#endif






/******************************************************************************
 *USART Communication boards Interface
*******************************************************************************/
#include "xprintf.h"

#define BSP_PRINT(fmt, ...)  	      xprintf((const char*)fmt, ##__VA_ARGS__)

extern void bsp_console_init(void);

#ifdef __cplusplus
}
#endif

#endif //BSP_CONFIG_H