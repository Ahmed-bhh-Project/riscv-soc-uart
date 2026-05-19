cls

riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles prog.s -T link2.ld -o prog.elf

riscv-none-elf-objdump -D prog.elf > prog.dis

riscv-none-elf-objcopy -O verilog --only-section=.program --verilog-data-width=4 prog.elf I0_tmp.mem
(echo @00000000 & more +1 I0_tmp.mem) > I0.mem
del I0_tmp.mem

riscv-none-elf-objcopy -O verilog --only-section=.constants --verilog-data-width=4 prog.elf D1_tmp.mem
(echo @00000000 & more +1 D1_tmp.mem) > D1.mem
del D1_tmp.mem