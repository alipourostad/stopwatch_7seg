`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:53 04/02/2021 
// Design Name: 
// Module Name:    decoder_2_4 
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
module decoder_2_4(
    input [1:0] i_sel,
    output o_out1,
    output o_out2,
	 output o_out3,
    output o_out4
    );
	 
assign {o_out1, o_out2, o_out3, o_out4} = (i_sel == 2'b00) ? 4'b0001 :
											  (i_sel == 2'b01) ? 4'b0010 :
											  (i_sel == 2'b10) ? 4'b0100 :
											  4'b1000;


endmodule
