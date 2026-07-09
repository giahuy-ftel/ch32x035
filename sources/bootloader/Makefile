NAME    = bootloader
BUILD   = build
APP_DIR     = /mnt/c/Users/pvh26/documents/ch32x035
APP_BIN     = $(APP_DIR)/build_CH32x035_Sample/CH32x035_Sample.bin
COMBINED_BIN = $(BUILD)/combined.bin
UPDATE_TOOL = update
UPDATE_BIN  = $(BUILD)/update.bin

TOOLS_DIR    ?= $(CURDIR)/../../tools
MRS_DIR      ?= $(wildcard $(TOOLS_DIR)/MRS_Toolchain_Linux_x64_V1.92)
GCC_PATH     ?= $(MRS_DIR)/RISC-V_Embedded_GCC
OPENOCD_PATH ?= $(MRS_DIR)/OpenOCD/bin/openocd
TARGET_CFG   ?= $(MRS_DIR)/OpenOCD/bin/wch-riscv.cfg

CC      = $(GCC_PATH)/bin/riscv-none-embed-gcc
OBJCOPY = $(GCC_PATH)/bin/riscv-none-embed-objcopy
OBJDUMP = $(GCC_PATH)/bin/riscv-none-embed-objdump
SIZE    = $(GCC_PATH)/bin/riscv-none-embed-size

MARCH = -march=rv32imac
MABI  = -mabi=ilp32

LDFILE  = bootloader.ld
TARGET  = $(BUILD)/$(NAME).elf

SOURCES     = bootloader.c
SOURCES_ASM = startup.S

OBJECTS  = $(addprefix $(BUILD)/, $(SOURCES:.c=.o))
OBJECTS += $(addprefix $(BUILD)/, $(SOURCES_ASM:.S=.o))

CFLAGS  = $(MARCH) $(MABI) -O0 -g -Wall -MD -ffunction-sections -fdata-sections
LDFLAGS = -nostartfiles -nodefaultlibs \
          -Wl,-T,$(LDFILE),-Map,$(BUILD)/$(NAME).map,--print-memory-usage,--gc-sections \
          $(MARCH) $(MABI)

all: create $(TARGET)

create:
	@mkdir -p $(BUILD)

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
	$(OBJCOPY) -O binary $@ $(@:.elf=.bin)
	$(OBJCOPY) -O ihex $@ $(@:.elf=.hex)
	$(OBJDUMP) -S -d $@ > $(@:.elf=.asm)
	$(SIZE) $@

$(BUILD)/%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

$(BUILD)/%.o: %.S
	$(CC) -c $(CFLAGS) -o $@ $<

.PHONY: all clean flash erase reset
clean:
	rm -rf $(BUILD)

flash:
	$(OPENOCD_PATH) -f $(TARGET_CFG) -c "chip_id CH32X035" -c init -c halt \
		-c "program $(BUILD)/$(NAME).hex" -c reset -c exit

erase:
	$(OPENOCD_PATH) -f $(TARGET_CFG) -c "chip_id CH32X035" -c init -c halt \
		-c "flash erase_sector wch_riscv 0 last" -c reset -c exit

reset:
	$(OPENOCD_PATH) -f $(TARGET_CFG) -c "chip_id CH32X035" -c init -c reset -c exit

flash_combined:
	$(MAKE) -C $(APP_DIR) clean
	$(MAKE) -C $(CURDIR) clean

	$(MAKE) -C $(APP_DIR) all
	$(MAKE) -C $(CURDIR) all
	$(MAKE) $(UPDATE_TOOL)

	./$(UPDATE_TOOL) $(APP_BIN) $(UPDATE_BIN)

	python3 -c "open('$(COMBINED_BIN)','wb').write(b'\xff'*63488)"
	dd if=$(BUILD)/$(NAME).bin of=$(COMBINED_BIN) bs=1 seek=0 conv=notrunc
	dd if=$(APP_BIN) of=$(COMBINED_BIN) bs=1 seek=4096 conv=notrunc

	$(OPENOCD_PATH) -f $(TARGET_CFG) \
		-c "chip_id CH32X035" \
		-c init -c halt \
		-c "program $(COMBINED_BIN) 0x00000000" \
		-c reset -c exit

HOST_TOOL = host_tool.c
HOST_BIN  = pctool

tool:
	gcc -O2 -Wall -o $(HOST_BIN) $(HOST_TOOL)
	sudo install -m 755 $(HOST_BIN) /usr/local/bin/$(HOST_BIN)
	rm -f $(HOST_BIN)

$(UPDATE_TOOL): update.c
	gcc -O2 -Wall -o $@ $<