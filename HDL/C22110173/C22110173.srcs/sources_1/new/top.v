`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 07:54:17 PM
// Design Name: 
// Module Name: top
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

`include "common.vh"
module top(
input wire clk,
input wire rst,
input wire start_in,
input wire [31:0] state0_in,
input wire [31:0] state1_in,
input wire [31:0] state2_in,
input wire [31:0] state3_in,
output reg [31:0] state0_out,
output reg [31:0] state1_out,
output reg [31:0] state2_out,
output reg [31:0] state3_out,
output reg valid_out
);
wire [4:0] round;
reg [4:0] counter;
reg [31:0] s0_in, s1_in, s2_in, s3_in;
wire [31:0] s0_out, s1_out, s2_out, s3_out, temp0, temp1, temp2, temp3;
round_cal round_cal_ins(
    .round(round)
);
first_round first_round_ins(
    .state0_in(state0_in),
    .state1_in(state1_in),
    .state2_in(state2_in),
    .state3_in(state3_in),
    .state0_out(temp0),
    .state1_out(temp1),
    .state2_out(temp2),
    .state3_out(temp3)
);
normal_round normal_round_ins(
    .state0_in(s0_in),
    .state1_in(s1_in),
    .state2_in(s2_in),
    .state3_in(s3_in),
    .round(counter),
    .state0_out(s0_out),
    .state1_out(s1_out),
    .state2_out(s2_out),
    .state3_out(s3_out)
);
always @(posedge clk ) begin
    if (!rst) begin
        counter <= 0;
        s0_in <= 0;
        s1_in <= 0;
        s2_in <= 0;
        s3_in <= 0;
    end else if (start_in) begin
        if (counter == 0) begin
            s0_in <= temp0;
            s1_in <= temp1;
            s2_in <= temp2;
            s3_in <= temp3;
            counter <= counter + 1;
        end else if (counter == round) begin
            state0_out <= s0_out;
            state1_out <= s1_out;
            state2_out <= s2_out;
            state3_out <= s3_out;
            counter <= counter;
            valid_out <= 1;
        end else begin
            s0_in <= s0_out;
            s1_in <= s1_out;
            s2_in <= s2_out;
            s3_in <= s3_out;
            counter <= counter + 1;
        end
    end
end

endmodule
