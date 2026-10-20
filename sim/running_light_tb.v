`timescale 1ns/1ps

module running_light_tb;

reg sys_clk;
reg sys_rst_n;
wire [3:0] led_out;

running_light #(
    .HALF_CYCLES(5)
) uut (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .led_out(led_out)
);

initial begin
    sys_clk = 0;
    forever #5 sys_clk = ~sys_clk;
end

initial begin
    $dumpfile("running_light.vcd");
    $dumpvars(0, running_light_tb);

    sys_rst_n = 0;
    #20;
    sys_rst_n = 1;

    #400;
    $finish;
end

endmodule
