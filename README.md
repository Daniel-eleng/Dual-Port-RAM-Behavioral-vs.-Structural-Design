# Digital Circuits Design & Verification Portfolio

## Project Overview

This repository presents the design of a Simple Dual-Port RAM(including classic design implementation and design using a decoder), which serves as the core storage element for creating a fully functional Synchronous FIFO.

## Features

### 1. RAM 
* **Behavioral vs. Structural:** Explores and compares two different Verilog design paradigms for an 8x8 bits Dual-Port RAM.
* **Simultaneous Access:** Features independent read and write ports, establishing the essential storage core for sequential buffering systems.
* **Equivalence Checking:** Utilizes a unified "Back-to-Back" testbench to prove functional equivalence between the two memory architectures.

### 2. Synchronous FIFO Circular Buffer
* **Circular Architecture:** Implements a First-In, First-Out (FIFO) buffer using dual pointers (read and write) that wrap around seamlessly.
* **Status Flag Logic:** Accurately generates `full` and `empty` status signals by intentionally reserving one memory slot to prevent pointer overlap ambiguity.
* **Event-Driven Verification:** Features an automated testbench that reacts dynamically to hardware flags (using `wait` statements) rather than fixed time delays.

## Project Structure

| Folder | Description |
| :----- | :---------- |
| `RAM/` | Contains the RTL design (`RAM_design`), testbench (`RAM_tb`), and simulation results.
| `FIFO/` | Contains the RTL design (`FIFO_design`), testbench (`FIFO_tb`), and simulation results.
| `README.md` | This main index file. |

## How to Run:

1. **Navigation:** Choose the desired project folder (`RAM` or `FIFO`).
2. **Setup:** Open Xilinx Vivado, create a new project, and import the `.v` files from the respective `_design` and `_tb` subfolders.
3. **Simulation:** Run a Functional Simulation (`Run Simulation`).
4. **Verification:** Consult the specific `README.md` inside each project folder for detailed explanations of the architecture, expected Waveforms, and Tcl Console outputs.
