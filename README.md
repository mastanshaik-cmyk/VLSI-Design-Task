# Combinational Logic and Arithmetic in Verilog

An original learning project for practicing combinational RTL design, module composition, and simulation. It implements common logic gates, multiplexers, adders, and a small 4-bit ALU in synthesizable Verilog-2001.

## Project layout

- `.vscode/` — Verilog HDL extension recommendation
- `rtl/logic_gates.v` — seven common Boolean functions
- `rtl/muxes.v` — 2:1 and 4:1 multiplexers
- `rtl/adders.v` — half adder, full adder, ripple adder, and width-parameterized adder
- `rtl/alu4.v` — 4-bit arithmetic and logic unit
- `testbench/` — self-checking testbench for each RTL source file
- `scripts/` — simulation runner and usage notes
- `simulation/` — generated build products, logs, and VCD traces
- `waveforms/` — waveform screenshots supplied with this project
- `docs/` — architecture notes and submission checklist
- `linux_report/` and `progress_log/` — spaces for your own verified environment details and dated work notes

## ALU operations

| `op` | Result | `carry` |
| --- | --- | --- |
| `00` | `a AND b` | 0 |
| `01` | `a OR b` | 0 |
| `10` | `a XOR b` | 0 |
| `11` | unsigned `a + b` | carry out |

The ALU is purely combinational. Inputs are unsigned 4-bit values, and the result is the low four bits of the selected operation.

## Run simulations

Install Icarus Verilog (`iverilog` and `vvp`), then run from the repository root:

```sh
chmod +x scripts/run_all.sh
./scripts/run_all.sh
```

The self-checking testbenches cover every gate input pair, mux data/select combinations, half-adder and full-adder inputs, every 4-bit adder input/carry combination, selected 8-bit adder boundary cases, and all 4-bit ALU operand/opcode combinations. The script writes logs and VCD traces under `simulation/`. Open a generated trace with `gtkwave simulation/vcd/adders.vcd`.

## Design notes

Each module has explicit ports and uses continuous assignments or complete combinational `case` statements. The ALU assigns every output on every path, avoiding inferred latches. The ripple adder chains full-adder stages; the parameterized adder uses an extended sum to retain the final carry bit.

The waveform PNGs were provided with this project. Run the included suite to create fresh traces for the RTL here. Record tool versions and environment details only after checking them on your system.
