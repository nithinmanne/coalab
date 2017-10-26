`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:52 10/26/2017
// Design Name:   specreg
// Module Name:   C:/Users/student/Desktop/1/assgn4/specregtst.v
// Project Name:  assgn4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: specreg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module specregtst;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] in;
	reg l;
	reg t;

	// Outputs
	wire [15:0] bus;

	// Instantiate the Unit Under Test (UUT)
	specreg uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.bus(bus), 
		.l(l), 
		.t(t)
	);
	
	always
	#5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		in = 0;
		l = 0;
		t = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		in = 100;
		l = 1;
		#10;
		
		t=1;
		l=0;
		#1;

	end
      
endmodule

