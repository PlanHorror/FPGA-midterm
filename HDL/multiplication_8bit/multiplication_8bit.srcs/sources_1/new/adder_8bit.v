`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 08:45:46 AM
// Design Name: 
// Module Name: adder_8bit
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


module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input carry_in,
    output [7:0] sum,
    output carry
);
    wire [7:0] c; // carry wires

    FA fa0(.a(a[0]), .b(b[0]), .cin(carry_in), .sum(sum[0]), .carry(c[0]));
    FA fa1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .carry(c[1]));
    FA fa2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .carry(c[2]));
    FA fa3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .carry(c[3]));
    FA fa4(.a(a[4]), .b(b[4]), .cin(c[3]), .sum(sum[4]), .carry(c[4]));
    FA fa5(.a(a[5]), .b(b[5]), .cin(c[4]), .sum(sum[5]), .carry(c[5]));
    FA fa6(.a(a[6]), .b(b[6]), .cin(c[5]), .sum(sum[6]), .carry(c[6]));
    FA fa7(.a(a[7]), .b(b[7]), .cin(c[6]), .sum(sum[7]), .carry(carry));

endmodule
