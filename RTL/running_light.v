`timescale 1ns/1ps
`default_nettype none
module running_light #(
    parameter [24:0] HALF_CYCLES = 25'd25000000
) (
    input wire sys_clk,
    input wire sys_rst_n,
    output reg [3:0] led_out
);
    // Legal HALF_CYCLES range: 1 .. 33554431. Board setting: 25000000.
    localparam [24:0] LAST_COUNT = HALF_CYCLES - 25'd1;
    reg [24:0] cnt;
    // The button and LEDs are active-low. Assert reset before operation.
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            cnt <= 25'd0;
            led_out <= 4'b1110;
        end else if (cnt == LAST_COUNT) begin
            cnt <= 25'd0;
            led_out <= {led_out[2:0], led_out[3]};
        end else begin
            cnt <= cnt + 25'd1;
        end
    end
endmodule
`default_nettype wire
