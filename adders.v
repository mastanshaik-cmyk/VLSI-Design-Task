`timescale 1ns/1ps

module half_adder (
    input  wire a, b,
    output wire sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

module full_adder (
    input  wire a, b, carry_in,
    output wire sum, carry_out
);
    wire propagate;
    wire generate_carry;

    assign propagate     = a ^ b;
    assign sum            = propagate ^ carry_in;
    assign generate_carry = a & b;
    assign carry_out      = generate_carry | (propagate & carry_in);
endmodule

module ripple_adder4 (
    input  wire [3:0] a, b,
    input  wire       carry_in,
    output wire [3:0] sum,
    output wire       carry_out
);
    wire [4:0] carry;
    assign carry[0] = carry_in;

    genvar bit_index;
    generate
        for (bit_index = 0; bit_index < 4; bit_index = bit_index + 1) begin: stages
            full_adder stage (
                .a(a[bit_index]), .b(b[bit_index]),
                .carry_in(carry[bit_index]), .sum(sum[bit_index]),
                .carry_out(carry[bit_index + 1])
            );
        end
    endgenerate
    assign carry_out = carry[4];
endmodule

module adder #(parameter WIDTH = 4) (
    input  wire [WIDTH-1:0] a, b,
    input  wire             carry_in,
    output wire [WIDTH-1:0] sum,
    output wire             carry_out
);
    wire [WIDTH:0] full_sum;
    assign full_sum = {1'b0, a} + {1'b0, b} + carry_in;
    assign sum = full_sum[WIDTH-1:0];
    assign carry_out = full_sum[WIDTH];
endmodule
