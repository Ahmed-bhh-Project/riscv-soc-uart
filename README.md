<div align="center">

# ⚡ RISC-V RV32I SoC with UART

### Single-Cycle Processor · AXI-Lite Interconnect · FPGA Deployment on Zybo Zynq-7000

[![VHDL](https://img.shields.io/badge/HDL-VHDL-red?style=for-the-badge)](https://en.wikipedia.org/wiki/VHDL)
[![RISC-V](https://img.shields.io/badge/ISA-RV32I-green?style=for-the-badge&logo=riscv)](https://riscv.org/)
[![Vivado](https://img.shields.io/badge/Tool-Vivado_2022.x-blue?style=for-the-badge&logo=xilinx)](https://www.xilinx.com/products/design-tools/vivado.html)
[![QuestaSim](https://img.shields.io/badge/Simulation-QuestaSim-orange?style=for-the-badge)](https://eda.sw.siemens.com/en-US/ic/questa/)
[![Target](https://img.shields.io/badge/Target-Zybo_Zynq--7000-purple?style=for-the-badge)](https://digilent.com/shop/zybo-zynq-7000/)

*A complete, synthesizable RISC-V RV32I System-on-Chip implemented in VHDL — featuring a single-cycle CPU, UART, GPIO, RAM/ROM, coprocessor, and a full AXI-Lite bus fabric. Validated in QuestaSim simulation and deployed on the Zybo Zynq-7000 FPGA board.*

---

**Institution:** ENIT — École Nationale d'Ingénieurs de Tunis &nbsp;|&nbsp; **Year:** 2025  
**Author:** Ahmed Ben Hadj Hassine &nbsp;|&nbsp; **Supervisor:** Ing. Riadh Bourguiba

---

</div>

## 📋 Table of Contents

- [Overview](#-overview)
- [System Architecture](#-system-architecture)
- [SoC Components](#-soc-components)
- [AXI-Lite Bus Interface](#-axi-lite-bus-interface)
- [Repository Structure](#-repository-structure)
- [Test Programs](#-test-programs)
- [Toolchain Installation](#-toolchain-installation)
- [Simulation — QuestaSim / ModelSim](#-simulation--questasim--modelsim)
- [Synthesis & FPGA Deployment](#-synthesis--fpga-deployment)
- [Performance & Resource Usage](#-performance--resource-usage)
- [Troubleshooting](#-troubleshooting)
- [References](#-references)

---

## 🧭 Overview

This project implements a **fully functional, synthesizable SoC** based on the open **RISC-V RV32I** 32-bit instruction set architecture, written entirely in VHDL. The design targets the **Xilinx Zybo Zynq-7000** FPGA development board and has been validated through both simulation and on-chip deployment.

### What makes this SoC complete?

| Capability | Details |
|---|---|
| **CPU** | RV32I single-cycle processor — CPI = 1 |
| **Communication** | UART with full-duplex TX/RX and AXI-Lite slave |
| **I/O** | GPIO controller with programmable direction per pin |
| **Memory** | Dual-port RAM + boot ROM, both AXI-Lite compliant |
| **Coprocessor** | Auxiliary compute unit for specialized operations |
| **Interconnect** | AXI-4 Lite bus fabric connecting all peripherals |
| **Simulation** | Full QuestaSim/ModelSim testbench suite |
| **FPGA** | Vivado 2022.x project, bitstream-ready for Zybo XC7Z010 |
| **Software** | Assembly and C test programs with xPack RISC-V GCC toolchain |

---

## 🏗️ System Architecture

### Full SoC Block Diagram

![System Architecture](https://github.com/Ahmed-bhh-Project/riscv-soc-uart/raw/main/archi_system.png)

```
                    ┌──────────────────────────────────────────────┐
                    │              AXI-Lite Interconnect            │
                    └───┬──────────┬──────────┬──────────┬─────────┘
                        │          │          │          │
              ┌─────────▼──┐  ┌────▼────┐ ┌──▼───┐ ┌───▼────┐
              │  RISCV32I  │  │  UART   │ │ GPIO │ │ COPRO  │
              │  CPU Core  │  │ (TX/RX) │ │ Ctrl │ │  Unit  │
              └─────┬──────┘  └─────────┘ └──────┘ └────────┘
                    │
          ┌─────────┴─────────┐
     ┌────▼────┐         ┌────▼────┐
     │  I-MEM  │         │  D-MEM  │
     │  (ROM)  │         │  (RAM)  │
     │ Instr.  │         │  Data   │
     └─────────┘         └─────────┘
```

### RISC-V Single-Cycle Processor Architecture

![RISC-V Single-Cycle Processor](https://github.com/Ahmed-bhh-Project/riscv-soc-uart/raw/main/archi_riscv_monocycle.png)

### Single-Cycle Execution Flow

Every RV32I instruction completes in **exactly one clock cycle**:

```
Clock Edge N                                      Clock Edge N+1
    │                                                   │
    ▼                                                   ▼
  FETCH ──► DECODE ──► EXECUTE ──► MEM ACCESS ──► WRITE-BACK
    │           │          │             │              │
  ROM read   Decoder     ALU op      Load/Store    Reg file
  PC = N     Signals    Compute      (optional)    update
                                                  PC = N+4
```

All paths are **combinational** — no pipeline registers — yielding a peak throughput of **1 instruction/cycle (IPC = 1)**.

---

## 🧩 SoC Components

### 🔲 RISC-V CPU Core (`vhdl/riscv/`)

A **full RV32I implementation** supporting all 6 instruction formats: R, I, S, B, U, J.

| Unit | File | Role |
|---|---|---|
| Top wrapper | `RISCV32I_core_axi.vhd` | AXI-Lite master interface |
| ALU | `ALU.vhd` | Arithmetic, logic, shift, comparison |
| Decoder | `decoder.vhd` | Instruction field extraction |
| Controller | `controller.vhd` | Control signal generation |
| Input manager | `input_data_manager.vhd` | Bus read data steering |
| Output manager | `output_data_manager.vhd` | Bus write data steering |
| BE generator | `BE_generator.vhd` | Byte-enable logic for partial writes |
| Register file | (integrated) | x0–x31, 32×32-bit |

**CPU Generic Parameters:**

```vhdl
generic (
    PC_START_ADDRESS : std_logic_vector(31 downto 0) := x"00000000";
    TRACE            : boolean := false   -- Enable debug trace output
);
```

---

### 📡 UART (`vhdl/uart/`)

Full-duplex serial interface with an AXI-Lite slave port.

- Configurable baud rate
- TX and RX FIFO buffers
- Programmable data width
- Interrupt-capable (status registers)

---

### 🔌 GPIO (`vhdl/gpio/`)

General-purpose I/O controller connected to the AXI-Lite bus.

- Per-pin direction control (input / output)
- Input and output control registers
- Byte-enable support for partial register access

---

### 🧠 Memory Subsystem (`vhdl/memory/`)

| Memory | Type | Interface | Purpose |
|---|---|---|---|
| **ROM** | Read-only | AXI-Lite slave | Instruction memory (boot code) |
| **RAM** | Dual-port (2PN×4) | AXI-Lite slave | Data memory (stack, heap, I/O buffers) |

Both are initialized from `.mem` files generated at compile time.

---

### ⚙️ Coprocessor (`vhdl/copro/`)

An auxiliary compute unit extending the base CPU with specialized operations, interfaced via AXI-Lite.

---

## 🔗 AXI-Lite Bus Interface

All SoC masters and slaves communicate over the **AXI-4 Lite** protocol, ensuring clean, standardized handshaking.

### Channel Summary

| Channel | Direction | Purpose |
|---|---|---|
| **AR** | Master → Slave | Address Read request |
| **R** | Slave → Master | Read data response |
| **AW** | Master → Slave | Address Write request |
| **W** | Master → Slave | Write data + byte enables |
| **B** | Slave → Master | Write response (OKAY / SLVERR) |

### Handshake Model

```
Master               Slave
  │                    │
  │── ARVALID ────────►│
  │◄─ ARREADY ─────────│   Address phase complete when VALID & READY
  │                    │
  │◄─ RVALID ──────────│
  │── RREADY ─────────►│   Data phase complete when VALID & READY
  │                    │
```

---

## 📁 Repository Structure

```
riscv-soc-uart/
│
├── modelsim/                    # QuestaSim / ModelSim simulation
│   ├── sim_system.do           # Main simulation script
│   ├── wave_system.do          # Waveform viewer configuration
│   └── transcript              # Simulation log output
│
├── prog/                        # Software test programs
│   ├── prog_asm_0/             # Assembly: basic instruction test
│   ├── prog_asm_1/             # Assembly: memory & loops
│   ├── prog_asm_2/             # Assembly: branches & jumps
│   ├── prog_asm_3/             # Assembly: complex sequences
│   ├── prog_c_0/               # C: basic functionality
│   └── prog_c_1/               # C: advanced features
│       ├── main.c
│       ├── system.h            # Hardware register map
│       ├── crt0.S              # C runtime startup
│       ├── link3.ld            # Linker script
│       └── compile.bat         # Build script
│
├── vivado2/                     # Xilinx Vivado project
│   ├── vivado.xpr             # Project file
│   ├── vivado.srcs/           # VHDL sources (managed by Vivado)
│   ├── vivado.sim/            # Simulation configuration
│   └── vivado.runs/           # Build artifacts & bitstreams
│
├── archi_system.png            # Full SoC block diagram
├── archi_riscv_monocycle.png   # CPU datapath diagram
├── system.png                  # System-level overview
├── pins.xdc                    # FPGA I/O constraints (Zybo Zynq-7000)
├── commandes_vivado.txt        # Vivado TCL automation commands
├── outils_compilation_xpack.txt # xPack toolchain install guide
└── README.md                   # This file
```

---

## 💻 Test Programs

### Assembly Programs

Each `prog_asm_N/` folder targets a specific RV32I verification scenario:

| Program | Purpose |
|---|---|
| `prog_asm_0` | Basic ALU instruction validation (ADD, SUB, AND, OR…) |
| `prog_asm_1` | Memory operations (LW, SW) and loop constructs |
| `prog_asm_2` | Control flow — branches (BEQ, BNE…) and jumps (JAL, JALR) |
| `prog_asm_3` | Complex mixed instruction sequences |

**Build:**

```bash
cd prog/prog_asm_0
compile.bat
```

**Output files:**

```
prog.s    ← Assembly source
prog.dis  ← Disassembly listing (useful for debug)
I0.mem    ← Instruction memory image → loaded into ROM
D1.mem    ← Data memory image       → loaded into RAM
```

### C Programs

| Program | Purpose |
|---|---|
| `prog_c_0` | Basic C: arithmetic, control flow, memory |
| `prog_c_1` | Advanced C: functions, pointers, UART I/O |

**Build:**

```bash
cd prog/prog_c_0
compile.bat
```

The **linker script** (`link3.ld`) maps code and data to the correct SoC memory regions. The **startup file** (`crt0.S`) initializes the stack pointer and jumps to `main`.

---

## 🔧 Toolchain Installation

This project uses the **xPack RISC-V None-Embedded GCC** — a pre-built bare-metal toolchain (no OS, no libc).

### Windows

**1. Download & extract the RISC-V GCC toolchain:**

Visit: https://xpack-dev-tools.github.io/riscv-none-elf-gcc-xpack/  
Extract to e.g.: `D:\xpacks\riscv-none-elf-gcc\xpack-riscv-none-elf-gcc-14.2.0-3\`

**2. Download & extract Windows Build Tools (provides `make`, `rm`, etc.):**

Visit: https://xpack-dev-tools.github.io/windows-build-tools-xpack/  
Extract to e.g.: `D:\xpacks\windows-build-tools\xpack-windows-build-tools-4.4.1-3\`

**3. Add both `bin/` folders to your `PATH`:**

```
D:\xpacks\riscv-none-elf-gcc\xpack-riscv-none-elf-gcc-14.2.0-3\bin
D:\xpacks\windows-build-tools\xpack-windows-build-tools-4.4.1-3\bin
```

### Linux / macOS

```bash
# Via npm (requires Node.js)
npm install --global @xpack-dev-tools/riscv-none-elf-gcc

# Or download directly from:
# https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases
```

### Verify installation

```bash
riscv-none-elf-gcc --version
riscv-none-elf-ld --version
make --version
```

> 📄 Detailed French-language installation instructions are in [`outils_compilation_xpack.txt`](outils_compilation_xpack.txt).

---

## 🧪 Simulation — QuestaSim / ModelSim

The `modelsim/` directory contains a complete, ready-to-run simulation environment.

### Key files

| File | Purpose |
|---|---|
| `sim_system.do` | Compiles all VHDL libraries in dependency order, instantiates the top-level testbench, and runs the simulation |
| `wave_system.do` | Pre-configured waveform layout — clocks, control signals, AXI buses, CPU internals |
| `transcript` | Last simulation execution log (errors, warnings, timing info) |

### Running the simulation

**QuestaSim:**

```bash
cd modelsim
qsim -do sim_system.do
```

**ModelSim:**

```bash
cd modelsim
vsim -do sim_system.do
```

The simulation loads `I0.mem` and `D1.mem` automatically. Use the waveform viewer to inspect the AXI transactions, CPU register file, UART transfers, and GPIO states.

---

## 🚀 Synthesis & FPGA Deployment

### Prerequisites

- **Xilinx Vivado 2022.x** or later
- **Zybo Zynq-7000 board** (XC7Z010-1CLG400C)
- JTAG programmer (Xilinx Platform Cable USB or Digilent HS2)

### Step-by-step

**1. Open the Vivado project**

```
vivado2/vivado.xpr
```

**2. Add/verify source files**

Ensure all VHDL files from the `vhdl/` hierarchy are present under Sources.

**3. Apply pin constraints**

The file `pins.xdc` contains all I/O assignments for the Zybo board:

```tcl
# Example entries
set_property PACKAGE_PIN L16  [get_ports clk]
set_property IOSTANDARD  LVCMOS33 [get_ports clk]
create_clock -period 8.000 -name clk [get_ports clk]
```

**4. Configure memory initialization**

Point ROM and RAM to the generated `.mem` files:

```tcl
set_property INIT_FILE "../prog/prog_c_0/I0.mem" [get_cells IMEM]
set_property INIT_FILE "../prog/prog_c_0/D1.mem"  [get_cells DMEM]
```

**5. Run Synthesis → Implementation → Generate Bitstream**

Monitor the Timing Summary: the design closes timing at **100+ MHz** on XC7Z010.

**6. Program the device**

```
Hardware Manager → Open Target → Auto Connect → Program Device
```

### Vivado TCL automation

Batch commands are provided in `commandes_vivado.txt` for scripted flows:

```tcl
open_project vivado2/vivado.xpr
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
```

---

## 📊 Performance & Resource Usage

### Execution Characteristics

| Metric | Value |
|---|---|
| Architecture | Single-cycle (no pipeline) |
| CPI | 1 (all RV32I instructions) |
| Peak IPC | 1.0 |
| Max Frequency | 100+ MHz on XC7Z010 |
| Supported ISA | RV32I (all 6 instruction formats) |

### FPGA Resource Estimates (Zybo XC7Z010)

| Resource | Used (est.) | Available | Utilization |
|---|---|---|---|
| LUTs | ~1,500–2,000 | 17,600 | ~10% |
| Flip-Flops | ~800–1,000 | 35,200 | ~3% |
| BRAMs (18K) | 2–4 | 60 | ~5% |
| DSP48 | 0 | 80 | 0% |

> ✅ Successfully simulated in QuestaSim and deployed on Zybo Zynq-7000.

---

## 🛠️ Troubleshooting

### Simulation

**Simulation won't launch**
```
→ Verify library paths in sim_system.do
→ Confirm all VHDL files compile error-free
→ Ensure the work/ library exists inside modelsim/
```

**Memory images not loaded**
```
→ Run compile.bat first to regenerate I0.mem and D1.mem
→ Check that .mem file paths in the testbench match the actual locations
```

**Unexpected CPU behavior**
```
→ Enable TRACE generic on the CPU core for register-level debug output
→ Cross-check against the disassembly file (prog.dis)
```

### Synthesis / Implementation

**Timing violations**
```
→ Lower the clock frequency in pins.xdc (e.g., 8 ns → 10 ns)
→ Review the critical path in the Timing Summary report
→ Add pipeline registers on the longest combinational path
```

**ROM/RAM initialization failure**
```
→ Verify the .mem file format (hexadecimal, one word per line)
→ Confirm INIT_FILE paths are correct relative to the Vivado project
→ Check that program size fits within the allocated memory depth
```

### Compilation

**RISC-V toolchain not found**
```
→ Reinstall xPack RISC-V GCC and add its bin/ to PATH
→ Test with: riscv-none-elf-gcc --version
```

**Linker errors / address overflow**
```
→ Review link3.ld for correct MEMORY region sizes
→ Check that .text and .data sections fit within ROM/RAM bounds
→ Inspect symbol map output for overlapping regions
```

---

## 📚 References

- [RISC-V ISA Specification (Volume I)](https://riscv.org/technical/specifications/)
- [ARM AXI4-Lite Protocol Specification](https://developer.arm.com/documentation/ihi0022/latest/)
- [IEEE Std 1076 — VHDL Language Reference](https://en.wikipedia.org/wiki/VHDL)
- [Xilinx Vivado Design Suite User Guide](https://www.xilinx.com/support/documentation.html)
- [xPack RISC-V Embedded GCC](https://xpack-dev-tools.github.io/riscv-none-elf-gcc-xpack/)
- [Digilent Zybo Reference Manual](https://digilent.com/reference/programmable-logic/zybo/reference-manual)

---

<div align="center">

Designed in VHDL · Simulated in QuestaSim · Deployed on Zybo Zynq-7000

**ENIT — École Nationale d'Ingénieurs de Tunis · 2025**  
*Ahmed Ben Hadj Hassine — Supervised by Ing. Riadh Bourguiba*

</div>
