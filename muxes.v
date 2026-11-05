`timescale 1ns/1ps

module mux2 (
    input  wire [1:0] data,
    input  wire       select,
    output wire       y
);
    assign y = data[select];
endmodule

module mux4 (
    input  wire [3:0] data,
    input  wire [1:0] select,
    output wire       y
);
    assign y = data[select];
endmodule
