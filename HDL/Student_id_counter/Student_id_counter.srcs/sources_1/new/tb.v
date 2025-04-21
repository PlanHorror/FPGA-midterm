`timescale 1ns / 1ps

module tb_mearly;

    reg clk;
    reg reset;
    reg [5:0] in;
    wire out;

    mearly uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task to apply a single input for one cycle
    task apply_input;
        input [5:0] value;
        begin
            in = value;
            #10;
        end
    endtask

    // Task to run one full test case (4-step input)
    task run_testcase;
        input integer idx;
        input [5:0] i0, i1, i2, i3;
        begin
            $display("Test case %0d: %b %b %b %b", idx, i0, i1, i2, i3);
            apply_input(i0);
            apply_input(i1);
            apply_input(i2);
            apply_input(i3);
            if (out == 1)
                $display("? Output HIGH at test case %0d\n", idx);
            else
                $display("? Output LOW at test case %0d\n", idx);
        end
    endtask

    initial begin
        clk = 0;
        reset = 1;
        in = 6'b0;
        #10;
        reset = 0;

        // All 20 test cases
        run_testcase(1, 6'b000000, 6'b000001, 6'b000111, 6'b000011); // ? CORRECT SEQUENCE
        run_testcase(2, 6'b000000, 6'b000001, 6'b000111, 6'b000000);
        run_testcase(3, 6'b000000, 6'b000001, 6'b000000, 6'b000011);
        run_testcase(4, 6'b000000, 6'b000001, 6'b000110, 6'b000011);
        run_testcase(5, 6'b000001, 6'b000001, 6'b000111, 6'b000011);
        run_testcase(6, 6'b000000, 6'b000010, 6'b000111, 6'b000011);
        run_testcase(7, 6'b000000, 6'b000001, 6'b000111, 6'b111111);
        run_testcase(8, 6'b111111, 6'b000001, 6'b000111, 6'b000011);
        run_testcase(9, 6'b000000, 6'b000001, 6'b000011, 6'b000111);
        run_testcase(10, 6'b000000, 6'b000001, 6'b000111, 6'b000010);
        run_testcase(11, 6'b000000, 6'b000001, 6'b111111, 6'b000011);
        run_testcase(12, 6'b000000, 6'b000001, 6'b000111, 6'b111000);
        run_testcase(13, 6'b000000, 6'b111111, 6'b000111, 6'b000011);
        run_testcase(14, 6'b000001, 6'b000111, 6'b000011, 6'b000000);
        run_testcase(15, 6'b000000, 6'b000001, 6'b000111, 6'b000100);
        run_testcase(16, 6'b000000, 6'b000001, 6'b000110, 6'b000011);
        run_testcase(17, 6'b000000, 6'b000010, 6'b000011, 6'b000111);
        run_testcase(18, 6'b000000, 6'b000000, 6'b000000, 6'b000011);
        run_testcase(19, 6'b000000, 6'b000001, 6'b000111, 6'b001000);
        run_testcase(20, 6'b111000, 6'b000001, 6'b000111, 6'b000011);

        $display("? Testbench finished.");
        #20;
        $finish;
    end
endmodule
