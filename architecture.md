# RTL architecture

## Signal flow

The project is a set of independent combinational blocks. `logic_gates` evaluates seven Boolean functions in parallel. `mux2` and `mux4` select one input bit using an indexed vector lookup. `ripple_adder4` chains four full-adder cells, while `adder` provides a concise width-parameterized arithmetic implementation. `alu4` selects one of four operations from a two-bit opcode.

## Carry behavior

Adder carry is an unsigned overflow bit. For two 4-bit operands, the mathematical sum ranges from 0 through 30, so five bits are sufficient to represent it. Both adder implementations return the low four bits on `sum` and the fifth bit on `carry_out`.

## Opcode table

| Opcode | Function | Carry output |
| --- | --- | --- |
| `00` | bitwise AND | zero |
| `01` | bitwise OR | zero |
| `10` | bitwise XOR | zero |
| `11` | unsigned addition | overflow bit |

All outputs are assigned on every path in the ALU combinational process. No clock, reset, or state is used.
