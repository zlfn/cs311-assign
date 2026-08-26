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

## License

The lab skeletons and testbench harnesses were written by CSED311 course staff and carry no explicit license. This repository does **not** copy that code directly; each lab is pulled in as a submodule pointing to a **fork** of the course repository. Under [GitHub's Terms of Service, Section 5 "License Grant to Other Users"](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service#5-license-grant-to-other-users), every public repository on GitHub automatically grants every GitHub user the right to fork it (to create public copies within GitHub) regardless of the repository's own license terms. Because the staff-authored code lives only in those forks and is referenced here by submodule, this repository does not violate the course staff's rights.

`lab1` has no upstream repository to fork, so it cannot be included in that manner. Its staff-authored testbench harnesses have therefore been removed, and only my own implementation is kept.

