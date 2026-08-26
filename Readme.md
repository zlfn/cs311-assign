# CSED311 Computer Architecture

Assignment code for **CSED311 (Computer Architecture)** at POSTECH.

A step-by-step implementation of a RISC-V processor.

| Lab | Topic |
|-----|-------|
| lab1 | ALU, Vending Machine (combinational & sequential logic) |
| lab2 | Single-cycle CPU |
| lab3 | Multi-cycle CPU |
| lab4-1 | Pipelined CPU |
| lab4-2 | Pipelined CPU (branch prediction) |
| lab5 | Cache |

## Chisel

lab1 and lab2 are written in Verilog. Starting from **lab3, Chisel** is used to describe the hardware and generate SystemVerilog. See each lab's `chisel/` directory.

## Structure

Each lab (except lab1) lives in its own repository and is included here as a git submodule. `lab4-1` and `lab4-2` are two branches of the same [`cs311-lab4`](https://github.com/zlfn/cs311-lab4) repository. Clone with submodules:

```sh
git clone --recursive https://github.com/zlfn/cs311-assign.git
# or, after a plain clone:
git submodule update --init
```
