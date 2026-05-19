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
   . = ORIGIN(I0);
   .program : {
      *(.text* )
   } > I0

   . = ORIGIN(D1);
   .constants : {
      *(.data* )
      *(.rodata* )
   } > D1

   . = ORIGIN(D2);
   .variables : {
      *(.bss* )
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
