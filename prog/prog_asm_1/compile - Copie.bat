cls

riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles prog.s -T link2.ld -o prog.elf

riscv-none-elf-objdump -D prog.elf > prog.dis

riscv-none-elf-objcopy -O verilog --only-section=.program --verilog-data-width=4 prog.elf tmp.mem

REM findstr /v "^@" tmp.mem > I0.mem

riscv-none-elf-objcopy -O verilog --only-section=.constants --verilog-data-width=4 prog.elf tmp.mem

REM findstr /v "^@" tmp.mem > D1.mem

del tmp.mem