`timescale 1ns/1ps

module counter_led_tb;

    reg sys_clk;
    reg sys_rst_n;
    wire led_out;

    counter_led #(
        .HALF_CYCLES(5)
    ) dut (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .led_out(led_out)
    );

    initial begin
        sys_clk = 0;
        forever #10 sys_clk = ~sys_clk;
    end

    initial begin
        sys_rst_n = 0;

        $dumpfile("counter_led.vcd");
        $dumpvars(0, counter_led_tb);

        #40;
        sys_rst_n = 1;

        #500;

        $finish;
    end

endmodule
