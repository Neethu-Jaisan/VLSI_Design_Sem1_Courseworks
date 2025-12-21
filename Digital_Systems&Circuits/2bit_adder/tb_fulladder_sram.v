`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:45:11
// Design Name: 
// Module Name: tb_fulladder_sram
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
`timescale 1ns/1ps

module tb_fulladder_sram;

    reg  [1:0] Ar, Br, Cr;
    wire [1:0]S;
    wire Cout;

    // Instance name MUST match what you use for A,B,C monitoring
    fulladder_sram dut (
        .a (Ar),
        .b (Br),
        .c (Cr),
        .S (S),
        .Cout (Cout)
    );

    integer i;

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, tb_fulladder_sram);

        for (i = 0; i < 20; i = i + 1) begin
            Ar = $random % 4;
            Br = $random % 4;
            Cr = $random % 4;
            #10;

            $display("A=%0d B=%0d C=%0d | S=%0d Cout=%0d",
                     dut.A, dut.B, dut.C,
                     S, Cout);
        end
        $finish;
    end
endmodule
