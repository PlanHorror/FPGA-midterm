`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 08:01:07 AM
// Design Name: 
// Module Name: FA
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


module FA(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);
    wire s1, c1, c2;
    
    HA ha1(.a(a), .b(b), .sum(s1), .carry(c1));
    HA ha2(.a(s1), .b(cin), .sum(sum), .carry(c2));
    
    or(carry, c1, c2);
endmodule
