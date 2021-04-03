`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:12:26 04/02/2021 
// Design Name: 
// Module Name:    sub_clock 
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
module sub_clock
	#(parameter INTERVAL_ms = 10, CLOCK = 24000)
	(
	input i_clk,
	output o_sub_clk
   );

reg [31:0] counter = 32'b0;
reg r_sub_clk = 1'b0;

always @ (posedge i_clk)
	begin
		if(counter > INTERVAL_ms * CLOCK) begin
			counter <= 32'b0;
			r_sub_clk <= 1'b1;
		end
		else begin
			r_sub_clk <= 1'b0;
			counter <= counter + 1;
		end
	end

assign o_sub_clk = r_sub_clk;

endmodule
