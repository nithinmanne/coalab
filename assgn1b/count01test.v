`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:17:46 07/21/2017
// Design Name:   count01
// Module Name:   C:/Users/student/Desktop/1/assgn1b/count01test.v
// Project Name:  assgn1b
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
	reg rst;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	count01 uut (
		.x(x), 
		.z(z), 
		.clk(clk), 
		.rst(rst)
	);
	
	always
		#5 clk=~clk;

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
      rst=0;  
		// Add stimulus here
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		$finish;
	end
      
endmodule

