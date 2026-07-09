ENTRY(_start)

__stack_size = 2048;
PROVIDE(_stack_size = __stack_size);

MEMORY {
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 62K
    RAM (rxw) : ORIGIN = 0x20000000, LENGTH = 16K
}

SECTIONS {
    .init : 
    {
        PROVIDE(_sinit = .);
        . = ALIGN(4);
        KEEP(*(SORT_NONE(.init)));
        . = ALIGN(4);
        PROVIDE(_einit = .);
    } >FLASH AT>FLASH

    .vector : 
    {
        KEEP(*(.vector));
        . = ALIGN(64);
    } >FLASH AT>FLASH

    .text :
    {
        . = ALIGN(4);
        PROVIDE(_stext = .);
        *(.text);
        *(.text.*);
        *(.rodata);
        *(.rodata.*);
        . = ALIGN(4);
        PROVIDE(_etext = .);
    } >FLASH AT>FLASH

    .data :
    {
        . = ALIGN(4);
        PROVIDE(_data_vma = .);
        PROVIDE(__global_pointer$ = . + 0x800);
        *(.data);
        *(.data.*);
        . = ALIGN(4);
        PROVIDE(_edata = .);
    } >RAM AT>FLASH
    
    PROVIDE(_data_lma = LOADADDR(.data));

    .bss :
    {
        . = ALIGN(4);
        PROVIDE(_sbss = .);
        *(.bss)
        *(.bss.*);
        . = ALIGN(4);
        PROVIDE(_ebss = .);
    } >RAM AT>RAM

    PROVIDE(_end = .);

    .stack ORIGIN(RAM) + LENGTH(RAM) - __stack_size :
    {
        PROVIDE( _heap_end = . );   
        . = ALIGN(4);
        PROVIDE(_susrstack = . );
        . = . + __stack_size;
        PROVIDE( _eusrstack = .);
    } >RAM AT>RAM
}