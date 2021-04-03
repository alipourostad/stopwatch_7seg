`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:01 04/02/2021 
// Design Name: 
// Module Name:    seg7_rom 
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
module seg7_rom(
    input [3:0] i_num,
    output [6:0] o_segment
    );

assign o_segment = (i_num == 4'd0) ? 7'b1000000 :
						 (i_num == 4'd1) ? 7'b1111001 :
						 (i_num == 4'd2) ? 7'b0100100 :
						 (i_num == 4'd3) ? 7'b0110000 :
						 (i_num == 4'd4) ? 7'b0011001 :
						 (i_num == 4'd5) ? 7'b0010010 :
						 (i_num == 4'd6) ? 7'b0000010 :
						 (i_num == 4'd7) ? 7'b1111000 :
						 (i_num == 4'd8) ? 7'b0000000 :
						 (i_num == 4'd9) ? 7'b0010000 :
						 7'b1000000;

endmodule
