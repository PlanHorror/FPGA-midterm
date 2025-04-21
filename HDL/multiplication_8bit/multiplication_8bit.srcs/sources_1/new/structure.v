`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 07:53:40 AM
// Design Name: 
// Module Name: structure
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


module structure(
    input [7:0] a,
    input [7:0] b,
    output [15:0] c
);
    wire [7:0] p0, p1, p2, p3, p4, p5, p6, p7;
    wire [7:0] temp0, temp1, temp2, temp3, temp4, temp5;
    wire cout0, cout1, cout2, cout3, cout4;
    and (c[0], a[0], b[0]);
    and (p0[1], a[1], b[0]);
    and (p0[2], a[2], b[0]);
    and (p0[3], a[3], b[0]);
    and (p0[4], a[4], b[0]);
    and (p0[5], a[5], b[0]);
    and (p0[6], a[6], b[0]);
    and (p0[7], a[7], b[0]);
    and (p1[0], a[0], b[1]);
    and (p1[1], a[1], b[1]);
    and (p1[2], a[2], b[1]);
    and (p1[3], a[3], b[1]);
    and (p1[4], a[4], b[1]);
    and (p1[5], a[5], b[1]);
    and (p1[6], a[6], b[1]);
    and (p1[7], a[7], b[1]);
    adder_8bit adder1(.a({0, p0[7], p0[6], p0[5], p0[4], p0[3], p0[2], p0[1]}), .b(p1), .carry_in(0), .sum({temp0[7], temp0[6], temp0[5], temp0[4], temp0[3], temp0[2], temp0[1], c[1]}), .carry(cout0));
    and (p2[0], a[0], b[2]);
    and (p2[1], a[1], b[2]);
    and (p2[2], a[2], b[2]);
    and (p2[3], a[3], b[2]);
    and (p2[4], a[4], b[2]);
    and (p2[5], a[5], b[2]);
    and (p2[6], a[6], b[2]);
    and (p2[7], a[7], b[2]);
    adder_8bit adder2(.a({cout0, temp0[7], temp0[6], temp0[5], temp0[4], temp0[3], temp0[2], temp0[1]}), .b(p2), .carry_in(0), .sum({temp1[7], temp1[6], temp1[5], temp1[4], temp1[3], temp1[2], temp1[1], c[2]}), .carry(cout1));
    and (p3[0], a[0], b[3]);
    and (p3[1], a[1], b[3]);
    and (p3[2], a[2], b[3]);
    and (p3[3], a[3], b[3]);
    and (p3[4], a[4], b[3]);
    and (p3[5], a[5], b[3]);
    and (p3[6], a[6], b[3]);
    and (p3[7], a[7], b[3]);
    adder_8bit adder3(.a({cout1, temp1[7], temp1[6], temp1[5], temp1[4], temp1[3], temp1[2], temp1[1]}), .b(p3), .carry_in(0), .sum({temp2[7], temp2[6], temp2[5], temp2[4], temp2[3], temp2[2], temp2[1], c[3]}), .carry(cout2));
    and (p4[0], a[0], b[4]);
    and (p4[1], a[1], b[4]);
    and (p4[2], a[2], b[4]);
    and (p4[3], a[3], b[4]);
    and (p4[4], a[4], b[4]);
    and (p4[5], a[5], b[4]);
    and (p4[6], a[6], b[4]);
    and (p4[7], a[7], b[4]);
    adder_8bit adder4(.a({cout2, temp2[7], temp2[6], temp2[5], temp2[4], temp2[3], temp2[2], temp2[1]}), .b(p4), .carry_in(0), .sum({temp3[7], temp3[6], temp3[5], temp3[4], temp3[3], temp3[2], temp3[1], c[4]}), .carry(cout3));
    and (p5[0], a[0], b[5]);
    and (p5[1], a[1], b[5]);
    and (p5[2], a[2], b[5]);
    and (p5[3], a[3], b[5]);
    and (p5[4], a[4], b[5]);
    and (p5[5], a[5], b[5]);
    and (p5[6], a[6], b[5]);
    and (p5[7], a[7], b[5]);
    adder_8bit adder5(.a({cout3, temp3[7], temp3[6], temp3[5], temp3[4], temp3[3], temp3[2], temp3[1]}), .b(p5), .carry_in(0), .sum({temp4[7], temp4[6], temp4[5], temp4[4], temp4[3], temp4[2], temp4[1], c[5]}), .carry(cout4));
    and (p6[0], a[0], b[6]);
    and (p6[1], a[1], b[6]);
    and (p6[2], a[2], b[6]);
    and (p6[3], a[3], b[6]);
    and (p6[4], a[4], b[6]);
    and (p6[5], a[5], b[6]);
    and (p6[6], a[6], b[6]);
    and (p6[7], a[7], b[6]);
    adder_8bit adder6(.a({cout4, temp4[7], temp4[6], temp4[5], temp4[4], temp4[3], temp4[2], temp4[1]}), .b(p6), .carry_in(0), .sum({temp5[7], temp5[6], temp5[5], temp5[4], temp5[3], temp5[2], temp5[1], c[6]}), .carry(cout5));
    and (p7[0], a[0], b[7]);
    and (p7[1], a[1], b[7]);
    and (p7[2], a[2], b[7]);
    and (p7[3], a[3], b[7]);
    and (p7[4], a[4], b[7]);
    and (p7[5], a[5], b[7]);
    and (p7[6], a[6], b[7]);
    and (p7[7], a[7], b[7]);
    adder_8bit adder7(.a({cout5, temp5[7], temp5[6], temp5[5], temp5[4], temp5[3], temp5[2], temp5[1]}), .b(p7), .carry_in(0), .sum({c[14], c[13], c[12], c[11], c[10], c[9], c[8], c[7]}), .carry(c[15]));
endmodule
