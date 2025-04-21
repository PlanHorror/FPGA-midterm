`timescale 1ns / 1ps

module tb_mearly;

    reg clk;
    reg reset;
    reg [5:0] in;
    wire out;

    integer case_number;

    mearly uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Display on output change
    always @(in, out) begin
        if (out) begin
            $display(" Output is HIGH at time %0t, test case  %0d with input %b", $time, case_number, in);
        end else begin
            $display(" Output is LOW at time %0t, test case  %0d with input %b", $time, case_number, in);
        end
    end

    initial begin
        clk = 0;
        reset = 1;
        in = 6'b0;
        case_number = 0;
        #10;
        reset = 0;

        // ---------- Test Case 1 (Valid path) ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 2 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 
        in = 6'b000100; #10; 

        // ---------- Test Case 3 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000110; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 4 ----------
        in = 6'b000010; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 5 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 
        in = 6'b001111; #10; 

        // ---------- Test Case 6 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000110; #10; 
        in = 6'b000010; #10; 

        // ---------- Test Case 7 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000010; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 8 ----------
        in = 6'b000111; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000000; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 9 ----------
        in = 6'b000001; #10; case_number = case_number + 1;
        in = 6'b000000; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 10 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000000; #10; 
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 

        // ---------- Test Case 11 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000010; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 12 ----------
        in = 6'b000111; #10; case_number = case_number + 1;
        in = 6'b000111; #10; 
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 13 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000111; #10; 
        in = 6'b000001; #10; 

        // ---------- Test Case 14 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000001; #10; 
        in = 6'b000110; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 15 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000000; #10; 
        in = 6'b000000; #10; 
        in = 6'b000000; #10; 

        // ---------- Test Case 16 ----------
        in = 6'b000001; #10; case_number = case_number + 1;
        in = 6'b000010; #10; 
        in = 6'b000011; #10; 
        in = 6'b000100; #10; 

        // ---------- Test Case 17 ----------
        in = 6'b000111; #10; case_number = case_number + 1;
        in = 6'b000000; #10; 
        in = 6'b000001; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 18 ----------
        in = 6'b000000; #10; case_number = case_number + 1;
        in = 6'b000011; #10; 
        in = 6'b000011; #10; 
        in = 6'b000011; #10; 

        // ---------- Test Case 19 ----------
        in = 6'b000001; #10; case_number = case_number + 1;
        in = 6'b000111; #10; 
        in = 6'b000011; #10; 
        in = 6'b000000; #10; 

        // ---------- Test Case 20 ----------
        in = 6'b000001; #10; case_number = case_number + 1; 
        in = 6'b000001; #10; 
        in = 6'b000001; #10; 
        in = 6'b000001; #10; 

        $display("? Testbench completed at time %0t", $time);
        #20;
        $finish;
    end

endmodule
