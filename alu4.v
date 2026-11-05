`timescale 1ns/1ps

module alu4 (
    input  wire [3:0] a, b,
    input  wire [1:0] op,
    output reg  [3:0] result,
    output reg        carry
);
    always @* begin
        result = 4'b0000;
        carry  = 1'b0;
        case (op)
            2'b00: result = a & b;
            2'b01: result = a | b;
            2'b10: result = a ^ b;
            2'b11: {carry, result} = {1'b0, a} + {1'b0, b};
            default: begin
                result = 4'b0000;
                carry  = 1'b0;
            end
        endcase
    end
endmodule
