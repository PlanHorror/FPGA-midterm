// Author: Le Vu Trung Duong
// Nara Institute of Science and Technology
// Description: This is the example of the top module

`include "common.vh"

module compute(
    input wire                      CLK,
    input wire                      RST,
    input wire [`DATA_WIDTH-1:0]    dina_i,
    input wire [`ADDR_WIDTH-1:0]    addra_i,
    input wire                      ena_i,
    input wire                      wea_i,
    output wire [`DATA_WIDTH-1:0]   douta_o
);

    reg  [`DATA_WIDTH-1:0]          a_r, b_r, c_r, d_r, e_r;
    wire [`DATA_WIDTH-1:0]          a_w, b_w, c_w, d_w, e_w;
    wire [7:0]          douta_w;

    assign a_w = a_r;
    assign b_w = b_r;
    assign c_w = c_r;
    assign d_w = d_r;
    assign e_w = e_r;

    average u_average (
        .in0(a_w),
        .in1(b_w),
        .in2(c_w),
        .in3(d_w),
        .in4(e_w),
        .out(douta_w)
    );
    always @(posedge CLK or negedge RST)
    begin
        if(~RST) begin
            a_r <= `DATA_WIDTH'h0;
            b_r <= `DATA_WIDTH'h0;
            c_r <= `DATA_WIDTH'h0;
            d_r <= `DATA_WIDTH'h0;
            e_r <= `DATA_WIDTH'h0;
        end
        else begin
            if (wea_i & ena_i) begin
                case(addra_i)
                    `ADDR_WIDTH'h0: begin
                        a_r <= dina_i;
                        b_r <= b_w;
                        c_r <= c_w;
                        d_r <= d_w;
                        e_r <= e_w;
                    end
                    `ADDR_WIDTH'h1: begin
                        a_r <= a_w;
                        b_r <= dina_i;
                        c_r <= c_w;
                        d_r <= d_w;
                        e_r <= e_w;
                    end
                    `ADDR_WIDTH'h2: begin
                        a_r <= a_w;
                        b_r <= b_w;
                       c_r <= dina_i;
                        d_r <= d_w;
                        e_r <= e_w;
                    end
                    `ADDR_WIDTH'h3: begin
                        a_r <= a_w;
                        b_r <= b_w;
                        c_r <= c_w;
                        d_r <= dina_i;
                        e_r <= e_w;
                    end
                    `ADDR_WIDTH'h4: begin
                        a_r <= a_w;
                        b_r <= b_w;
                        c_r <= c_w;
                        d_r <= d_w;
                        e_r <= dina_i;
                    end
                    default: begin
                        a_r <= a_w;
                        b_r <= b_w;
                        c_r <= c_w;
                        d_r <= d_w;
                        e_r <= e_w;
                    end
                endcase
            end
            else begin
                a_r <= a_w;
                b_r <= b_w;
                c_r <= c_w;
                d_r <= d_w;
                e_r <= e_w;
            end
        end
    end

    assign douta_o = (ena_i & ~wea_i) ? douta_w : `DATA_WIDTH'h0;

endmodule