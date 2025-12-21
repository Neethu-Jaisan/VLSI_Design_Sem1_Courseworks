`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:43:25
// Design Name: 
// Module Name: sram1bit
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


module sram1bit (
    input  [1:0] addr,
    output reg   dout
);
    reg mem[3:0];

    initial begin
        mem[0] = 0;
        mem[1] = 1;
        mem[2] = 0;
        mem[3] = 1;
    end

    always @(*) begin
        dout = mem[addr];
    end
endmodule
