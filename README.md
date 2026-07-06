# SiliconLite RISC Core

## Overview
SiliconLite is a 5‑stage pipelined RISC CPU implemented in Verilog HDL.  
It includes hazard detection, forwarding, and a complete verification environment.  
The design is targeted for FPGA synthesis using Xilinx Vivado.

## Features
- 32‑bit datapath
- 5 pipeline stages: IF, ID, EX, MEM, WB
- Hazard detection unit for load‑use hazards
- Forwarding unit for data hazards
- Instruction and data memory models
- Directed testbenches for each module
- Top‑level integration testbench

## Repository Structure
- `src/` → RTL source files
- `src/pipeline_stages/` → IF, ID, EX, MEM, WB stages
- `sim/` → Testbenches and directed tests
- `docs/` → Documentation
- `results/` → Simulation and synthesis reports

## How to Run
1. Open Xilinx Vivado.
2. Create a new RTL project.
3. Add all files from `src/` and `sim/`.
4. Set `tb_risc_core.v` as the simulation top.
5. Run behavioral simulation to view waveforms.
6. For synthesis, set `SiliconLiteCore` as the top and run synthesis/implementation.

## Deliverables
- RTL source code
- Verification testbenches
- Simulation waveforms
- Synthesis QoR reports
- Documentation
