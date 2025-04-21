`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 07:53:40 AM
// Design Name: 
// Module Name: continuous
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


module continuous(
    input [7:0] a,
    input [7:0] b,
    output [15:0] c
);
assign c = a * b;
endmodule
