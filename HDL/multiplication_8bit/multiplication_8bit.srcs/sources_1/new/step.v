`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 10:55:13 AM
// Design Name: 
// Module Name: step
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


module step(
    input [7:0] a,
    input [7:0] b,
    input [7:0] p,
    output [7:0] temp,
    output [7:0] c_out
);
    wire [7:0] p1;
    and (p1[0], a[0], b[1]);
    and (p1[1], a[1], b[1]);
    and (p1[2], a[2], b[1]);
    and (p1[3], a[3], b[1]);
    and (p1[4], a[4], b[1]);
    and (p1[5], a[5], b[1]);
    and (p1[6], a[6], b[1]);
    and (p1[7], a[7], b[1]);
    adder_8bit adder1(.a(p), .b(p1), .carry_in(0), .sum(temp), .carry(c_out));
endmodule
