CFLAGS += -I./sources/device/core
CPPFLAGS += -I./sources/device/core

VPATH += sources/device/core

SOURCES_ASM += sources/device/core/startup_ch32x035.S

ifeq ($(TARGET),bootloader)
LDFILE = sources/device/core/bootloader.ld
else
LDFILE = sources/device/core/ch32x035.ld
endif

SOURCES += $(wildcard sources/device/core/*.c)
