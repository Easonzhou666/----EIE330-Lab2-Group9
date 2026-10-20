`timescale 1ns/1ps

module running_light (
    input wire sys_clk,
    input wire sys_rst_n,
    output wire led0_n,
    output wire led1_n,
    output wire led2_n,
    output wire led3_n
);

reg [24:0] cnt;
reg [1:0] position;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt <= 25'd0;
        position <= 2'd0;
    end
    else if (cnt == 25'd24999999) begin
        cnt <= 25'd0;
        position <= position + 2'd1;
    end
    else begin
        cnt <= cnt + 25'd1;
    end
end

assign led0_n = (position == 2'd0) ? 1'b0 : 1'b1;
assign led1_n = (position == 2'd1) ? 1'b0 : 1'b1;
assign led2_n = (position == 2'd2) ? 1'b0 : 1'b1;
assign led3_n = (position == 2'd3) ? 1'b0 : 1'b1;

endmodule
