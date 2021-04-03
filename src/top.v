`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:04 04/02/2021 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input clk,
    input rst_n,
    output [6:0] sseg,
	 output float,
	 output [7:0] leds,
	 output [3:0] seg_an
    );
	 
wire rst, sub_clk_100ms;
wire [15:0] seg_count;
assign rst = ~rst_n;


sub_clock #(.INTERVAL_ms(10)) clk_100ms (
    .i_clk(clk), 
    .o_sub_clk(sub_clk_100ms)
    );

counter #(.WIDTH(16), .MAX(9999)) seg_counter (
    .i_sub_clk(sub_clk_100ms), 
    .rst(rst), 
    .o_count(seg_count)
    );
	 
digit4_to_7seg num_to_4_digit_7segment (
    .clk(clk), 
    .rst(rst), 
    .i_num(seg_count), 
    .o_sseg(sseg), 
    .o_seg_an(seg_an), 
    .o_float(float)
    );

assign leds = 8'd0;

endmodule
