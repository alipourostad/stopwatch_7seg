`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:14:33 04/02/2021
// Design Name:   decoder_2_4
// Module Name:   C:/Users/Ali/Xilinx/seg7/src/decoder_tb.v
// Project Name:  seg7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder_2_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_tb;

	// Inputs
	reg [1:0] i_sel;

	// Outputs
	wire o_out1;
	wire o_out2;
	wire o_out3;
	wire o_out4;

	// Instantiate the Unit Under Test (UUT)
	decoder_2_4 uut (
		.i_sel(i_sel), 
		.o_out1(o_out1), 
		.o_out2(o_out2), 
		.o_out3(o_out3), 
		.o_out4(o_out4)
	);

	initial begin
		// Initialize Inputs
		i_sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_sel = 2'b00;
		#5
		i_sel = 2'b01;
      #5
		i_sel = 2'b10;
		#5
		i_sel = 2'b11;		
		// Add stimulus here

	end
      
endmodule

