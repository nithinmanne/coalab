`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:38:21 08/24/2017
// Design Name:   top
// Module Name:   C:/Users/student/Desktop/1/assgn3/test.v
// Project Name:  assgn3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg go;
	reg clk;
	reg [7:0] ain;
	reg [7:0] pin;

	// Outputs
	wire done;
	wire [15:0] p;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.go(go), 
		.clk(clk), 
		.done(done), 
		.ain(ain), 
		.pin(pin), 
		.p(p)
	);

	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		go = 0;
		clk = 0;
		ain = 2;
		pin = 2;

		// Wait 100 ns for global reset to finish
		#105;
        
		// Add stimulus here
		go = 1;

	end
      
endmodule

