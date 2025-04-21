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
    step step0(.a(a), .b({b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1]}), .p({0, p0[7], p0[6], p0[5], p0[4], p0[3], p0[2], p0[1]}), .temp({temp0[7], temp0[6], temp0[5], temp0[4], temp0[3], temp0[2], temp0[1], c[1]}), .c_out(cout0));
    step step1(.a(a), .b({b[2], b[2], b[2], b[2], b[2], b[2], b[2], b[2]}), .p({cout0, temp0[7], temp0[6], temp0[5], temp0[4], temp0[3], temp0[2], temp0[1]}), .temp({temp1[7], temp1[6], temp1[5], temp1[4], temp1[3], temp1[2], temp1[1], c[2]}), .c_out(cout1));
    step step2(.a(a), .b({b[3], b[3], b[3], b[3], b[3], b[3], b[3], b[3]}), .p({cout1, temp1[7], temp1[6], temp1[5], temp1[4], temp1[3], temp1[2], temp1[1]}), .temp({temp2[7], temp2[6], temp2[5], temp2[4], temp2[3], temp2[2], temp2[1], c[3]}), .c_out(cout2));
    step step3(.a(a), .b({b[4], b[4], b[4], b[4], b[4], b[4], b[4], b[4]}), .p({cout2, temp2[7], temp2[6], temp2[5], temp2[4], temp2[3], temp2[2], temp2[1]}), .temp({temp3[7], temp3[6], temp3[5], temp3[4], temp3[3], temp3[2], temp3[1], c[4]}), .c_out(cout3));
    step step4(.a(a), .b({b[5], b[5], b[5], b[5], b[5], b[5], b[5], b[5]}), .p({cout3, temp3[7], temp3[6], temp3[5], temp3[4], temp3[3], temp3[2], temp3[1]}), .temp({temp4[7], temp4[6], temp4[5], temp4[4], temp4[3], temp4[2], temp4[1], c[5]}), .c_out(cout4));
    step step5(.a(a), .b({b[6], b[6], b[6], b[6], b[6], b[6], b[6], b[6]}), .p({cout4, temp4[7], temp4[6], temp4[5], temp4[4], temp4[3], temp4[2], temp4[1]}), .temp({temp5[7], temp5[6], temp5[5], temp5[4], temp5[3], temp5[2], temp5[1], c[6]}), .c_out(cout5));
    step step6(.a(a), .b({b[7], b[7], b[7], b[7], b[7], b[7], b[7], b[7]}), .p({cout5, temp5[7], temp5[6], temp5[5], temp5[4], temp5[3], temp5[2], temp5[1]}), .temp({c[14], c[13], c[12], c[11], c[10], c[9], c[8], c[7]}), .c_out(c[15]));

endmodule
