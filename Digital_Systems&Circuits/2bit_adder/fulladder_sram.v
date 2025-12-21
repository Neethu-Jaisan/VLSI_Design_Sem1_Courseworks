`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:44:24
// Design Name: 
// Module Name: fulladder_sram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fulladder_sram (
    input  [1:0] a,
    input  [1:0] b,
    input  [1:0] c,
    output  [1:0] S,
    output       Cout
);

    wire A, B, C;

    sram1bit SA (.addr(a), .dout(A));
    sram1bit SB (.addr(b), .dout(B));
    sram1bit SC (.addr(c), .dout(C));

    assign S    = A ^ B ^ C;
    assign Cout = (A & B) | (B & C) | (C & A);

endmodule
