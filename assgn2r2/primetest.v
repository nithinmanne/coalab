`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:47 08/11/2017
// Design Name:   prime
// Module Name:   C:/Users/student/Desktop/1/assgn2r2/primetest.v
// Project Name:  assgn2r2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prime
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module primetest;

	// Inputs
	reg [15:0] sw;
	reg clk;
	reg go;

	// Outputs
	wire res;
	wire stp;

	// Instantiate the Unit Under Test (UUT)
	prime uut (
		.sw(sw), 
		.clk(clk), 
		.go(go), 
		.res(res), 
		.stp(stp)
	);
	
	always
	#5 clk=~clk;
	reg [15:0]i;
	initial begin
		// Initialize Inputs
		sw = 29;
		clk = 0;
		go = 1;

		// Wait 100 ns for global reset to finish
		#105;
        
		// Add stimulus here
		go = 0;
		i=3;
		while(i<200)
		begin
		sw=i;
		go=1;
		#10;
		go=0;
		while(stp==0)
		begin
		#10;
		end
		if(res==0) 
		$display("%d",i);
		i=i+1;
		end
	end
      
endmodule

