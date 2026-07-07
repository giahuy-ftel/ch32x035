.PHONY: all bootloader application clean flash-bootloader flash-application flash-both verify-both

all: bootloader application

bootloader:
	$(MAKE) -f Makefile.build TARGET=bootloader

application:
	$(MAKE) -f Makefile.build TARGET=application

flash-bootloader:
	$(MAKE) -f Makefile.build TARGET=bootloader flash

flash-application:
	$(MAKE) -f Makefile.build TARGET=application flash

clean:
	$(MAKE) -f Makefile.build TARGET=bootloader clean
	$(MAKE) -f Makefile.build TARGET=application clean

##############################################################################
# Combined flash: the WCH OpenOCD flash driver mass-erases the chip on every
# `program` invocation, regardless of the target image's address range. That
# means flashing bootloader and application separately always wipes whichever
# one was written first. Concatenating both .hex files and flashing in one
# pass avoids the problem entirely.
##############################################################################
TOOLS_DIR       ?= $(CURDIR)/tools
MRS_DIR         ?= $(wildcard $(TOOLS_DIR)/MRS_Toolchain_Linux_x64_V1.92)
OPENOCD_PATH    ?= $(MRS_DIR)/OpenOCD/bin/openocd
TARGET_CFG_PATH ?= $(MRS_DIR)/OpenOCD/bin/wch-riscv.cfg
OPENOCD_CMD     ?= $(OPENOCD_PATH)

COMBINED_DIR = build_combined
COMBINED_HEX = $(COMBINED_DIR)/combined.hex

$(COMBINED_HEX): bootloader application
	@mkdir -p $(COMBINED_DIR)
	@grep -v '^:00000001FF' build_bootloader/bootloader.hex > $(COMBINED_HEX)
	@cat build_application/application.hex >> $(COMBINED_HEX)

flash-both: $(COMBINED_HEX)
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c halt -c "program $(COMBINED_HEX)" -c reset -c exit

verify-both: $(COMBINED_HEX)
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c halt -c "verify_image $(COMBINED_HEX)" -c exit