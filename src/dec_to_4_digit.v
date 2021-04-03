`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:00 04/02/2021 
// Design Name: 
// Module Name:    dec_to_4_digit 
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
module dec_to_4_digit(
	 input clk, start,
    input [15:0] i_num,
    output [3:0] o_Digit1,
    output [3:0] o_Digit2,
    output [3:0] o_Digit3,
    output [3:0] o_Digit4
    );
//	wire [15:0] num_div10, num_div100;
//	assign o_Digit1 = i_num % 10;
//	assign num_div10 = i_num / 10;
//	assign o_Digit2 = num_div10 % 10;
//	assign num_div100 = i_num / 100;
//	assign o_Digit3 = num_div100 % 10;
//	assign o_Digit4 = i_num / 1000;
reg done;
reg [13:0] count, r_num;
reg [3:0] r_Digit1, r_Digit2, r_Digit3, r_Digit4;
integer i;
always @ (posedge clk) begin
	if(start) begin
		r_num <= i_num;
		done <= 1'b0;
		r_Digit1 <= 0;
		r_Digit2 <= 0;
		r_Digit3 <= 0;
		r_Digit4 <= 0;
	end // if
	else if(~done) begin
		if (r_num >= 1000) begin
			r_num <= r_num - 1000;
			r_Digit4 <= r_Digit4 + 1;
		end // if r_num
		else if (r_num >= 100) begin
			r_num <= r_num - 100;
			r_Digit3 <= r_Digit3 + 1;
		end // if r_num
		else if (r_num >= 10) begin
			r_num <= r_num - 10;
			r_Digit2 <= r_Digit2 + 1;
		end // if r_num
		else if (r_num >= 1) begin
			r_num <= r_num - 1;
			r_Digit1 <= r_Digit1 + 1;
		end // if r_num
		else if( r_num < 1) // Finish Converting
			done <= 1'b1;
	end // if ~done
end //always

assign o_Digit1 = r_Digit1;
assign o_Digit2 = r_Digit2;
assign o_Digit3 = r_Digit3;
assign o_Digit4 = r_Digit4;

endmodule
