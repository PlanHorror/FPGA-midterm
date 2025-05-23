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

    reg  [`DATA_WIDTH-1:0]          a_r, b_r;
    wire [`DATA_WIDTH-1:0]          a_w, b_w;
    wire [15:0]          douta_w;
    structure structure_inst(
        .a(a_r),
        .b(b_r),
        .c(douta_w)
    );
    assign a_w = a_r;
    assign b_w = b_r;


    always @(posedge CLK or negedge RST)
    begin
        if(~RST) begin
            a_r <= `DATA_WIDTH'h0;
            b_r <= `DATA_WIDTH'h0;
        end
        else begin
            if (wea_i & ena_i) begin
                case(addra_i)
                    `ADDR_WIDTH'h0: begin
                        a_r <= dina_i;
                        b_r <= b_w;
                    end
                    `ADDR_WIDTH'h1: begin
                        a_r <= a_w;
                        b_r <= dina_i;
                    end
                    default: begin
                        a_r <= a_w;
                        b_r <= b_w;
                    end
                endcase
            end
            else begin
                a_r <= a_w;
                b_r <= b_w;
            end
        end
    end
    assign douta_o = (ena_i & ~wea_i) ? douta_w : `DATA_WIDTH'h0;


endmodule