`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:02 10/26/2017
// Design Name:   regbank
// Module Name:   C:/Users/student/Desktop/1/assgn4/regbanktst.v
// Project Name:  assgn4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regbank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module regbanktst;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] in;
	reg [2:0] rsel;
	reg wrr;
	reg tr;

	// Outputs
	wire [15:0] bus;

	// Instantiate the Unit Under Test (UUT)
	regbank uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.bus(bus), 
		.rsel(rsel), 
		.wrr(wrr), 
		.tr(tr)
	);
	
	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		in = 0;
		rsel = 0;
		wrr = 0;
		tr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		in = -32768;
		wrr = 1;
		rsel = 0;
		
		#10
		
		in = 0;
		wrr = 1;
		rsel = 1;
		
		#10
		
		in = 1;
		wrr = 1;
		rsel = 2;
		
		#10
		
		in = -1;
		wrr = 1;
		rsel = 3;
		
		#10
		
		wrr = 0;
		tr = 1;
		
		#1 rsel = 0;
		#1 rsel = 1;
		#1 rsel = 2;
		#1 rsel = 3;
		#1 rsel = 4;
		#1 rsel = 5;
		#1 rsel = 6;
		#1 rsel = 7;
		#1 tr = 0;

	end
      
endmodule

