  .section .boot, "ax"
  .global _start
  .type   _start, @function
_start:
  # Initialize global pointer
.option push
.option norelax
1:
  auipc gp, %pcrel_hi(__global_pointer$)
  addi  gp, gp, %pcrel_lo(1b)
.option pop

  # Set the stack pointer
  la  sp, __stack_top    # Initialise le pointeur de pile  (sp)
  add fp, sp, zero      # Initialise le pointeur de frame (fp)

  # Clear the bss segment
  la      a0, _edata
  la      a2, _end
  sub     a2, a2, a0
  li      a1, 0
  call    memset
    
  li      a0, 0 #lw    a0, 0(sp)                  # a0 = argc
  li      a1, 0 #addi  a1, sp, __SIZEOF_POINTER__ # a1 = argv
  li      a2, 0 #li    a2, 0                      # a2 = envp = NULL
  call    main
  
endless_loop:
  j endless_loop
  