`timescale 1ns / 1ps
`include "common.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 10:14:43 PM
// Design Name: 
// Module Name: normal_round
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


module normal_round(
    input wire [31:0] state0_in,
    input wire [31:0] state1_in,
    input wire [31:0] state2_in,
    input wire [31:0] state3_in,
    input wire [4:0] round,
    output wire [31:0] state0_out,
    output wire [31:0] state1_out,
    output wire [31:0] state2_out,
    output wire [31:0] state3_out
);
reg [31:0] temp0, temp1, temp2, temp3;
always @(state0_in, state1_in, state2_in, state3_in, round) begin
    temp0 = (state0_in ^ state1_in) ^ (state2_in - state3_in);
    temp1 = (~temp0 & `STUDENT_ID) | (state3_in ^ round);
    temp2 = (state2_in | `STUDENT_ID) & (temp1 >> round);
    temp3 = (state3_in << round) ^ (`BIRTHDATE & temp2);
end
assign state0_out = temp0;
assign state1_out = temp1;
assign state2_out = temp2;
assign state3_out = temp3;
endmodule
