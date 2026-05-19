OUTPUT_FORMAT("elf32-littleriscv", "elf32-littleriscv", "elf32-littleriscv")
OUTPUT_ARCH(riscv)

MEMORY
{
   I0 (r  ) : ORIGIN = 0x00000000, LENGTH = 32k
   D1 (r  ) : ORIGIN = 0x10000000, LENGTH = 4k
   D2 (rw ) : ORIGIN = 0x20000000, LENGTH = 4k
   D3 (rw ) : ORIGIN = 0x30000000, LENGTH = 2
   D4 (rw ) : ORIGIN = 0x40000000, LENGTH = 2
   D5 (rw ) : ORIGIN = 0x50000000, LENGTH = 2
}

ENTRY(_start)

SECTIONS
{
   PROVIDE(__global_pointer$ = ORIGIN(D2) + 0x800     );
   PROVIDE(__stack_top       = ORIGIN(D2) + LENGTH(D2));
   
   . = ORIGIN(I0);
   .program : {
      *(.boot  )
      *(.text* )
   } > I0

   . = ORIGIN(D1);
   .constants : {
      *(.rodata*         )
      . = ALIGN(32 / 8);
      *(.srodata*        )
      . = ALIGN(32 / 8);
      *(.eh_frame*       )
      . = ALIGN(32 / 8);
      *(.init_array*     )
      . = ALIGN(32 / 8);
      *(.fini_array*     )
   } > D1

   . = ORIGIN(D2);
   .variables_initialized : {
      *(.data* )
      . = ALIGN(32 / 8);
      *(.sdata*)
      . = ALIGN(32 / 8);
   } > D2

   .variables_cleared : {
      _edata = .; PROVIDE (edata = .);
      . = ALIGN(32 / 8);
      *(.sbss* )
      . = ALIGN(32 / 8);
      *(.bss*  )
      . = ALIGN(32 / 8);
      _end   = .; PROVIDE (end = .  );
   } > D2

   . = ORIGIN(D3);
   .uart : {
      *(.uart* )
   } > D3

   . = ORIGIN(D4);
   .gpio : {
      *(.gpio* )
   } > D4

   . = ORIGIN(D5);
   .copro : {
      *(.copro* )
   } > D5

}
