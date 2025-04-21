`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 12:31:11 AM
// Design Name: 
// Module Name: round_top
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


module round_top(
    input wire [31:0] state0_in,
    input wire [31:0] state1_in,
    input wire [31:0] state2_in,
    input wire [31:0] state3_in,
    input wire [4:0] round, 
    output reg [31:0] state0_out,
    output reg [31:0] state1_out,
    output reg [31:0] state2_out,
    output reg [31:0] state3_out
);
wire [31:0] fs_1, fs_2, fs_3, fs_4;
wire [31:0] s_1, s_2, s_3, s_4;
first_round first_round_ins(
    .state0_in(state0_in),
    .state1_in(state1_in),
    .state2_in(state2_in),
    .state3_in(state3_in),
    .state0_out(fs_1),
    .state1_out(fs_2),
    .state2_out(fs_3),
    .state3_out(fs_4)
);
normal_round normal_round_ins(
    .state0_in(state0_in),
    .state1_in(state1_in),
    .state2_in(state2_in),
    .state3_in(state3_in),
    .round(round),
    .state0_out(s_1),
    .state1_out(s_2),
    .state2_out(s_3),
    .state3_out(s_4)
);
always @(*) begin
    case (round)
        5'b00000: begin
            state0_out = fs_1;
            state1_out = fs_2;
            state2_out = fs_3;
            state3_out = fs_4;
        end
        default: begin
            state0_out = s_1;
            state1_out = s_2;
            state2_out = s_3;
            state3_out = s_4;
        end
    endcase
end

endmodule
