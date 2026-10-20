`timescale 1ns/1ps
`default_nettype none
module counter_led #(
    parameter [24:0] HALF_CYCLES = 25'd25000000
) (
    input wire sys_clk,
    input wire sys_rst_n,
    output reg led_out
);
    // Legal HALF_CYCLES range: 1 .. 33554431. Board setting: 25000000.
    localparam [24:0] LAST_COUNT = HALF_CYCLES - 25'd1;
    reg [24:0] cnt;
    // The button and LEDs are active-low. Assert reset before operation.
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            cnt <= 25'd0;
            led_out <= 1'b0;
        end else if (cnt == LAST_COUNT) begin
            cnt <= 25'd0;
            led_out <= ~led_out;
        end else begin
            cnt <= cnt + 25'd1;
        end
    end
endmodule
`default_nettype wire
