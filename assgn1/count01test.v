`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:11 07/20/2017
// Design Name:   count01
// Module Name:   C:/assgn1/count01test.v
// Project Name:  assgn1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count01
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count01test;

	// Inputs
	reg x;
	reg clk;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	count01 uut (
		.x(x), 
		.z(z), 
		.clk(clk)
	);
	always
		#5 clk=~clk;
	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 1;
		#10 x = 1;
		#10 x = 0;
		#10 x = 0;
	end
      
endmodule

