Print = @echo

NAME_MODULE = CH32x035_Sample
PROJECT = $(NAME_MODULE)

OBJECTS_DIR = build_$(NAME_MODULE)
TARGET = $(OBJECTS_DIR)/$(NAME_MODULE).elf

##############################################################################
# Project files    #
##############################################################################
include sources/device/Makefile
include sources/platform/Makefile
include sources/application/Makefile

SOURCES_ 		= $(notdir $(SOURCES))
OBJECTS 		+= $(addprefix $(OBJECTS_DIR)/, $(SOURCES_:.c=.o))

SOURCES_CPP_ 	= $(notdir $(SOURCES_CPP))
OBJECTS 		+= $(addprefix $(OBJECTS_DIR)/, $(SOURCES_CPP_:.cpp=.o))

SOURCES_ASM_ 	= $(notdir $(SOURCES_ASM))
OBJECTS			+= $(addprefix $(OBJECTS_DIR)/, $(SOURCES_ASM_:.S=.o))

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
OPTIMIZE_OPTION = -O0 -g

TOOLS_DIR		?= $(CURDIR)/tools
MRS_DIR			?= $(wildcard $(TOOLS_DIR)/MRS_Toolchain_Linux_x64_V1.92)
GCC_PATH		?= $(MRS_DIR)/RISC-V_Embedded_GCC
OPENOCD_PATH	?= $(MRS_DIR)/OpenOCD/bin/openocd
TARGET_CFG_PATH ?= $(MRS_DIR)/OpenOCD/bin/wch-riscv.cfg
OPENOCD_CMD		?= $(OPENOCD_PATH)

# The command for calling the compiler.
CC 			= $(GCC_PATH)/bin/riscv-none-embed-gcc
CPP 		= $(GCC_PATH)/bin/riscv-none-embed-g++   
LD 			= $(GCC_PATH)/bin/riscv-none-embed-ld
AS 			= $(GCC_PATH)/bin/riscv-none-embed-as
STRIP 		= $(GCC_PATH)/bin/riscv-none-embed-strip
OBJCOPY 	= $(GCC_PATH)/bin/riscv-none-embed-objcopy
OBJDUMP 	= $(GCC_PATH)/bin/riscv-none-embed-objdump
OBJSIZE 	= $(GCC_PATH)/bin/riscv-none-embed-size
GDB			= $(GCC_PATH)/bin/riscv-none-embed-gdb

LIBC		= $(GCC_PATH)/riscv-none-embed/lib/rv32imac/ilp32/libc.a
LIBM		= $(GCC_PATH)/riscv-none-embed/lib/rv32imac/ilp32/libm.a


# Set the compiler CPU/FPU options.
MARCH = -march=rv32imac 
MABI = -mabi=ilp32

GENERAL_FLAGS += $(OPTIMIZE_OPTION)

COMPILER_FLAGS += $(MARCH) $(MABI) -MD #-fstrict-volatile-bitfields -fno-strict-aliasing -fno-common -fno-builtin-printf		

# C compiler flags
CFLAGS += $(GENERAL_FLAGS) $(COMPILER_FLAGS)

# C++ compiler flags
CPPFLAGS +=					\
		$(GENERAL_FLAGS)	\
		$(COMPILER_FLAGS)	\
		-fno-rtti			\
		-fno-exceptions		\
		-fno-use-cxa-atexit	\
		-std=gnu++14		\

# linker flags
LDFLAGS += 	-lgcc \
		-nodefaultlibs \
		-nostartfiles \
		-Wl,-T,$(LDFILE),-Map,$(OBJECTS_DIR)/$(PROJECT).map,--print-memory-usage \
		$(MARCH) $(MABI) \
	
all: create $(TARGET)

create:
	$(Print) "           )\     *****************************"
	$(Print) "  c=======<||)    " CREATE $(OBJECTS_DIR) folder
	$(Print) "           )(     *****************************"			
	@mkdir -p $(OBJECTS_DIR)

$(TARGET): $(OBJECTS)
	$(Print) LD $@
	@$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(CFLAGS) $(LIBC) $(LIBM)
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
