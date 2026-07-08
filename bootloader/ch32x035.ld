ENTRY( _start )

__stack_size = 2048;
PROVIDE( _stack_size = __stack_size );

MEMORY
{  
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 8K
	RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 16K
}

SECTIONS
{
	.init :
	{
		. = ALIGN(4);
		KEEP(*(SORT_NONE(.init)))
		. = ALIGN(4);
	} >FLASH AT>FLASH

	.text :
	{
		. = ALIGN(4);
		*(.text)
		*(.text.*)
		*(.rodata)
		*(.rodata*)
		. = ALIGN(4);
	} >FLASH AT>FLASH 

	.data :
	{
		. = ALIGN(4);
		*(.data .data.*)
		*(.sdata .sdata.*)
		. = ALIGN(4);
	} >RAM AT>FLASH

	.bss :
	{
		. = ALIGN(4);
		*(.bss*)
		*(COMMON*)
		. = ALIGN(4);
	} >RAM AT>FLASH

    .stack ORIGIN(RAM) + LENGTH(RAM) - __stack_size :
    {
        . = ALIGN(4);
        . = . + __stack_size;
        PROVIDE( _eusrstack = .);
    } >RAM 
}



