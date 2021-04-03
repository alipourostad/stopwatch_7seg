`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:05 04/02/2021 
// Design Name: 
// Module Name:    counter 
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
module counter
	 #(parameter WIDTH = 4, MAX = 9)
	 (
    input i_sub_clk,
	 input rst,
    output [WIDTH-1:0] o_count    
    );

reg [WIDTH-1:0] r_count = 0;

always @ (posedge i_sub_clk or posedge rst)
	begin
		if(rst)
			r_count <= 0;
		else begin
			if(r_count < MAX)
				r_count <= r_count + 1;
			else
				r_count <= 0;
		end // if
	end // always 
	
assign o_count = r_count;
endmodule
