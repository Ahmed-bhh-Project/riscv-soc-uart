riscv-none-elf-gcc -o0 -march=rv32i -mabi=ilp32 -nostartfiles crt0.s main.c -T link3.ld -o prog.elf

riscv-none-elf-objdump -D prog.elf > prog.dis

riscv-none-elf-objcopy -O verilog --only-section=.program --verilog-data-width=4 prog.elf I0.mem

riscv-none-elf-objcopy -O verilog --only-section=.constants --verilog-data-width=4 prog.elf D1.mem
