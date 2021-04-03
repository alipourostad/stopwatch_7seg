`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:19 04/02/2021
// Design Name:   digit4_to_7seg
// Module Name:   C:/Users/Ali/Xilinx/seg7/src/digit4_to_7seg_tb.v
// Project Name:  seg7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: digit4_to_7seg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module digit4_to_7seg_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] i_num;

	// Outputs
	wire [6:0] o_sseg;
	wire [3:0] seg_an;
	wire o_float;

	// Instantiate the Unit Under Test (UUT)
	digit4_to_7seg uut (
		.clk(clk), 
		.rst(rst), 
		.i_num(i_num), 
		.o_sseg(o_sseg), 
		.seg_an(seg_an), 
		.o_float(o_float)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		i_num = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 1;
		#100;
		rst = 0;
       
		// Add stimulus here
		i_num = 1234;
		#10000;
		i_num = 5432;
		#10000;
		$stop;
	end
	
	always #20.8 clk = ~clk;
      
endmodule

