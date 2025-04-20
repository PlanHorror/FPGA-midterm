`timescale 1ns / 1ps
`include "common.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 10:14:43 PM
// Design Name: 
// Module Name: first_round
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


module first_round(
    input wire [31:0] state0_in,
    input wire [31:0] state1_in,
    input wire [31:0] state2_in,
    input wire [31:0] state3_in,
    output wire [31:0] state0_out,
    output wire [31:0] state1_out,
    output wire [31:0] state2_out,
    output wire [31:0] state3_out
);
assign state0_out = state1_in ^ `STUDENT_ID;
assign state1_out = state2_in | state3_in;
assign state2_out = state3_in & `BIRTHDATE;
assign state3_out = (state1_in ^ `STUDENT_ID) + (state2_in | state3_in);
endmodule
