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
wire [31:0] s0_out, s1_out, s2_out, s3_out;
round_cal round_cal_ins(
    .round(round)
);
round_top round_top_ins(
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
always @(counter) begin
    case (counter)
        round: begin
            state0_out = s0_out;
            state1_out = s1_out;
            state2_out = s2_out;
            state3_out = s3_out;
            valid_out = 1;
        end
        default: begin
            s0_in <= s0_out;
            s1_in <= s1_out;
            s2_in <= s2_out;
            s3_in <= s3_out;
        end
    endcase
end
always @(posedge clk ) begin
    if (~rst) begin
        counter <= 0;
        s0_in <= state0_in;
        s1_in <= state1_in;
        s2_in <= state2_in;
        s3_in <= state3_in;
        valid_out <= 0;
    end else if (start_in) begin
        if (counter < round -1) begin
            counter <= counter + 1;
        end
    end
end
always @(s0_out, s1_out, s2_out, s3_out) begin
    $display("s0_in: %h", s0_in);
    $display("s1_in: %h", s1_in);
    $display("s2_in: %h", s2_in);
    $display("s3_in: %h", s3_in);
    $display("s0_out: %h", s0_out);
    $display("s1_out: %h", s1_out);
    $display("s2_out: %h", s2_out);
    $display("s3_out: %h", s3_out);
    $display("round: %d", counter);
end


endmodule
