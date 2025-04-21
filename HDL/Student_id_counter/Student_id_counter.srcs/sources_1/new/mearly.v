`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 09:02:35 AM
// Design Name: 
// Module Name: mearly
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


module mearly(
    input clk,
    input reset,
    input [5:0] in,
    output reg out
);
    reg [2:0] state;
    reg [2:0] next_state;

    parameter S0 = 3'b000; // Initial state 
    parameter S1 = 3'b001; // State after receiving 0 --> 6'b000000
    parameter S2 = 3'b010; // State after receiving 1 --> 6'b000001
    parameter S3 = 3'b011; // State after receiving 7 --> 6'b000111


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always @(state, in) begin
        case (state)
            S0: begin
                if (in == 6'b000000) begin
                    next_state = S1; 
                end else
                begin
                    next_state = S0; // Stay in state S0 if input is not 0.
                end
            end
            S1: begin
                if (in == 6'b000001) begin
                    next_state = S2; 
                end else if (in == 6'b000000) begin
                    next_state = S1; // Stay in state S1 if input is still 0.
                end else begin
                    next_state = S0; // Go back to initial state if input is not 1.
                end
            end
            S2: begin
                if (in == 6'b000111) begin
                    next_state = S3; 
                end else if (in == 6'b000000) begin
                    next_state = S1; // Go back to state S1 if input is 0.
                end else
                begin
                    next_state = S0; // Go back to initial state if input is not 7.
                end
            end
            S3: begin
                if (in == 6'b000011) begin
                    out = 1; // Output is high when in state S3.
                    next_state = S0; // Go back to initial state after output.
                end else if (in == 6'b000000) begin
                    next_state = S1; // Go back to state S1 if input is 0.
                end else begin
                    next_state = S0; // Go back to initial state if input is not 3.
                end
            end
        endcase
    end
    always @(posedge clk) begin
        state <= next_state;
    end
endmodule
