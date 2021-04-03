`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:25:34 04/02/2021
// Design Name:   dec_to_4_digit
// Module Name:   C:/Users/Ali/Xilinx/seg7/src/dec_to_4_tb.v
// Project Name:  seg7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dec_to_4_digit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dec_to_4_tb;

	// Inputs
	reg clk, start;
	reg [15:0] i_num;

	// Outputs
	wire [3:0] o_Digit1;
	wire [3:0] o_Digit2;
	wire [3:0] o_Digit3;
	wire [3:0] o_Digit4;

	// Instantiate the Unit Under Test (UUT)
	dec_to_4_digit uut (
		.clk(clk),
		.start(start),
		.i_num(i_num), 
		.o_Digit1(o_Digit1), 
		.o_Digit2(o_Digit2), 
		.o_Digit3(o_Digit3), 
		.o_Digit4(o_Digit4)
	);

	initial begin
		// Initialize Inputs
		i_num = 0;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		start = 1;
		
		i_num = 5432;
		#50
		start = 0;
		#1000
		$stop;
		// Add stimulus here

	end
      
	always #20.8 clk = ~clk;	
endmodule

