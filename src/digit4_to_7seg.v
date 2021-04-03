`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:54 04/02/2021 
// Design Name: 
// Module Name:    digit4_to_7seg 
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
module digit4_to_7seg(
    input clk, rst,
	 input [15:0] i_num,
    output [6:0] o_sseg,
    output [3:0] o_seg_an,
    output o_float
    );

wire [3:0] b_Digit1, b_Digit2, b_Digit3, b_Digit4;	 
wire b_clk_10ms;
wire [1:0] b_seg_sel;
wire [3:0] seg_num;
wire [3:0] seg_an;
dec_to_4_digit dec_to_4_digit (
	 .clk(clk),
	 .start(b_clk_10ms),
    .i_num(i_num), 
    .o_Digit1(b_Digit1), 
    .o_Digit2(b_Digit2), 
    .o_Digit3(b_Digit3), 
    .o_Digit4(b_Digit4)
    );
	 
sub_clock #(.INTERVAL_ms(1)) clk_10ms (
    .i_clk(clk), 
    .o_sub_clk(b_clk_10ms)
    );

counter #(.WIDTH(2), .MAX(4)) seg_shift_counter (
    .i_sub_clk(b_clk_10ms), 
    .rst(rst), 
    .o_count(b_seg_sel)
    );


decoder_2_4 dec_2_4 (
    .i_sel(b_seg_sel), 
    .o_out1(seg_an[0]), 
    .o_out2(seg_an[1]), 
    .o_out3(seg_an[2]), 
    .o_out4(seg_an[3])
    );
	 
seg7_rom seg7_ROM1 (
    .i_num(seg_num), 
    .o_segment(o_sseg)
    );
	 
assign seg_num = (b_seg_sel == 2'b00) ? b_Digit1 :
					  (b_seg_sel == 2'b01) ? b_Digit2 :
					  (b_seg_sel == 2'b10) ? b_Digit3 :
													 b_Digit4;
													 

	 
assign o_float = (b_seg_sel == 2'b10) ? 1'b0: 1'b1;
assign o_seg_an = ~seg_an;
	 

endmodule
