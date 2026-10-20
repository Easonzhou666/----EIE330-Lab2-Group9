# EIE330 Lab 2 - Group 9

This repository contains the Verilog designs and simulation files for EIE330 Lab 2.

## Task 2-1: Counter LED

The counter LED is driven by a 50 MHz system clock.

The output LED changes state every 25,000,000 clock cycles, corresponding to approximately 0.5 seconds.

Main RTL file:

- `RTL/counter_led.v`

Testbench:

- `sim/counter_led_tb.v`

Inputs:

- `sys_clk`
- `sys_rst_n`

Output:

- `led_out`

The reset input and LED output are active-low.

## Task 2-2: Running Light

The running light drives four LEDs in sequence.

The normal output sequence is:

`1110 -> 1101 -> 1011 -> 0111 -> 1110`

Each LED state is maintained for approximately 0.5 seconds.

Main RTL file:

- `RTL/running_light.v`

Testbench:

- `sim/running_light_tb.v`

Inputs:

- `sys_clk`
- `sys_rst_n`

Output:

- `led_out[3:0]`

## Simple VGA Simulator

The board-level functions were checked using Simple VGA Simulator.

Counter LED mapping:

- `sys_clk -> clk`
- `sys_rst_n -> B3`
- `led_out -> led1`

Running Light mapping:

- `sys_clk -> clk`
- `sys_rst_n -> B3`
- `led_out[0] -> led1`
- `led_out[1] -> led2`
- `led_out[2] -> led3`
- `led_out[3] -> led4`

Buttons and LEDs are active-low.

## VGA Compatibility Files

The legacy Simple VGA Simulator did not correctly expose individual bits of the `led_out[3:0]` vector.

For this reason, compatibility versions are included in the `vga_compat` folder for board-window testing.

- `vga_compat/counter_led_vga.v`
- `vga_compat/running_light_vga.v`

The original design files remain in the `RTL` folder.

## Tools

The following tools were used:

- Icarus Verilog
- GTKWave
- Yosys
- Simple VGA Simulator
