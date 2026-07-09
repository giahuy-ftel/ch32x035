Print = @echo

NAME_MODULE = bootloader
PROJECT = $(NAME_MODULE)

OBJECTS_DIR = build_$(NAME_MODULE)
TARGET = $(OBJECTS_DIR)/$(NAME_MODULE).elf

##############################################################################
# Project files    #
##############################################################################

SOURCES_C = main.c
LDFILE = ch32x035.ld

SOURCES_C_ = $(notdir $(SOURCES_C))
OBJECTS    = $(addprefix $(OBJECTS_DIR)/, $(SOURCES_C_:.c=.o))

##############################################################################


#|---------------------------------------------------------------------------------------------------|
#| OPTIMIZE LEVELS                                                                                   |
#|------------|----------------------------------|--------------|---------|------------|-------------|
#|   option   | optimization levels              |execution time|code size|memory usage|complile time|
#|------------|----------------------------------|--------------|---------|------------|-------------|
#|   -O0      | compilation time                 |     (+)      |   (+)   |     (-)    |    (-)      |
#| -O1 || -O  | code size && execution time      |     (-)      |   (-)   |     (+)    |    (+)      |
#|   -O2      | more code size && execution time |     (--)     |         |     (+)    |    (++)     |
#|   -O3      | more code size && execution time |     (---)    |         |     (+)    |    (+++)    |
#|   -Os      | code size                        |              |   (--)  |            |    (++)     |
#|  -Ofast    | O3 with none math cals           |     (---)    |         |     (+)    |    (+++)    |
#|------------|----------------------------------|--------------|---------|------------|-------------|
# NOTE: For debugging, -g option is mandatory
OPTIMIZE_OPTION = -Os -g

TOOLS_DIR		?= $(CURDIR)/tools
MRS_DIR			?= $(wildcard $(TOOLS_DIR)/MRS_Toolchain_MAC_V192)
OPENOCD_PATH	?= $(MRS_DIR)/openocd_arm64/openocd_arm64/bin/openocd
TARGET_CFG_PATH ?= $(MRS_DIR)/openocd_arm64/openocd_arm64/bin/wch-riscv.cfg
OPENOCD_CMD		?= $(OPENOCD_PATH)

# Use system RISC-V prefix
PREFIX          ?= riscv64-unknown-elf-

# The command for calling the compiler.
CC 			= $(PREFIX)gcc
CPP 		= $(PREFIX)g++   
LD 			= $(PREFIX)ld
AS 			= $(PREFIX)as
STRIP 		= $(PREFIX)strip
OBJCOPY 	= $(PREFIX)objcopy
OBJDUMP 	= $(PREFIX)objdump
OBJSIZE 	= $(PREFIX)size
GDB			= $(PREFIX)gdb

# Query the compiler dynamically for the standard libraries
LIBC		= $(shell $(CC) $(COMPILER_FLAGS) -print-file-name=libc.a)
LIBM		= $(shell $(CC) $(COMPILER_FLAGS) -print-file-name=libm.a)


# Set the compiler CPU/FPU options.
MARCH = -march=rv32imac_zicsr 
MABI = -mabi=ilp32

GENERAL_FLAGS += $(OPTIMIZE_OPTION)

COMPILER_FLAGS += $(MARCH) $(MABI) -MD -fno-tree-loop-distribute-patterns -fno-builtin -flto #-fstrict-volatile-bitfields -fno-strict-aliasing -fno-common -fno-builtin-printf		

# C compiler flags
CFLAGS += $(GENERAL_FLAGS) $(COMPILER_FLAGS) -ffunction-sections -fdata-sections

# C++ compiler flags
CPPFLAGS +=					\
		$(GENERAL_FLAGS)	\
		$(COMPILER_FLAGS)	\
		-ffunction-sections \
		-fdata-sections     \
		-fno-rtti			\
		-fno-exceptions		\
		-fno-use-cxa-atexit	\
		-std=gnu++14		\

# linker flags
LDFLAGS += 	-lgcc \
		-nodefaultlibs \
		-nostartfiles \
		-flto \
		-Wl,-u,main,-T,$(LDFILE),-Map,$(OBJECTS_DIR)/$(PROJECT).map,--print-memory-usage,--gc-sections,--relax \
		$(MARCH) $(MABI) \
	
all: create $(TARGET)

create:
	$(Print) "           )\     *****************************"
	$(Print) "  c=======<||)    " CREATE $(OBJECTS_DIR) folder
	$(Print) "           )(     *****************************"			
	@mkdir -p $(OBJECTS_DIR)

$(TARGET): $(OBJECTS)
	$(Print) LD $@
	@$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(CFLAGS)
	$(Print) OBJCOPY $(@)
	@$(OBJCOPY) -O binary $(@) $(@:.elf=.bin)
	@$(OBJCOPY) -O ihex $(@) $(@:.elf=.hex)
	@$(OBJDUMP) -S -d $(@) > $(@:.elf=.asm)
	@$(OBJSIZE) $(TARGET)

$(OBJECTS_DIR)/%.o: %.c
	$(Print) CC $(notdir $@)
	@$(CC) -c $(CFLAGS) -o $@ $<

$(OBJECTS_DIR)/%.o: %.cpp
	$(Print) CXX $(notdir $@)
	@$(CPP) -c $(CPPFLAGS) -o $@ $<

$(OBJECTS_DIR)/%.o: %.S
	$(Print) AS $(notdir $@)
	@$(CC) -c $(CFLAGS) -o $@ $<


.PHONY: clean debug com flash erase verify sdi_printf_on sdi_printf_off reset
clean:
	$(Print) "        __         *****************************"
	$(Print) "      __\ \___     " CLEAN $(OBJECTS_DIR) folder
	$(Print) "      \ _ _ _ \    "	
	$(Print) "       \_\_\_\_\   *****************************"	
	@rm -rf $(OBJECTS_DIR)

debug:
	$(GDB) $(TARGET) target remote localhost:3333

com:
	minicom -D /dev/ttyACM0 -b 115200 -c on 

#chip_id  STRING : CH32V1x/CH32V2x/CH32V3x/CH56x/CH57x/CH58x/CH32V003/CH59x/CH643/CH32X035/CH32X034/CH32X033/CH32L10x/CH641/CH645/CH32V002/4/5/6/7/CH32M007/CH32V317/CH32M030/CH584/5
flash:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c halt -c "program $(OBJECTS_DIR)/$(NAME_MODULE).hex" -c reset -c exit
erase:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c halt -c "flash erase_sector wch_riscv 0 last " -c reset -c exit
verify:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c halt -c "verify_image $(OBJECTS_DIR)/$(NAME_MODULE).hex" -c exit
reset:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c init -c reset -c exit
sdi_printf_on:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c "sdi_printf on"  
sdi_printf_off:
	$(OPENOCD_CMD) -f $(TARGET_CFG_PATH) -c "chip_id CH32X035" -c "sdi_printf off"  
