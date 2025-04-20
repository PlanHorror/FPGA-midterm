`timescale 1ns / 1ps
`include "common.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 08:57:40 PM
// Design Name: 
// Module Name: round
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


module round_cal(
    output wire [4:0] round
);
reg [4:0] day = `BIRTHDAY;
reg [4:0] month = `BIRTHMONTH;
or(round[4], day[4], month[4]);
or(round[3], day[3], month[3]);
or(round[2], day[2], month[2]);
or(round[1], day[1], month[1]);
or(round[0], day[0], month[0]);
endmodule
