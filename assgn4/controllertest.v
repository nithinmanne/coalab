`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:55 10/20/2017
// Design Name:   controller
// Module Name:   C:/Users/student/Desktop/1/assgn4/controllertest.v
// Project Name:  assgn4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controllertest;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] isr;
	reg [3:0] sreg;

	// Outputs
	wire [2:0] funsel;
	wire lsp;
	wire lpc;
	wire lmdr;
	wire lmar;
	wire lisr;
	wire ly;
	wire wrr;
	wire mrw;
	wire [2:0] rsel;
	wire spmar;
	wire pcmar;
	wire mdrz;
	wire mdrm;
	wire tr;
	wire tsp;
	wire tpc;
	wire tmdr;
	wire tisr;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.clk(clk), 
		.reset(reset), 
		.isr(isr), 
		.sreg(sreg), 
		.funsel(funsel), 
		.lsp(lsp), 
		.lpc(lpc), 
		.lmdr(lmdr), 
		.lmar(lmar), 
		.lisr(lisr), 
		.ly(ly), 
		.wrr(wrr), 
		.mrw(mrw), 
		.rsel(rsel), 
		.spmar(spmar), 
		.pcmar(pcmar), 
		.mdrz(mdrz), 
		.mdrm(mdrm), 
		.tr(tr), 
		.tsp(tsp), 
		.tpc(tpc), 
		.tmdr(tmdr), 
		.tisr(tisr)
	);
	
	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		isr = 0;
		sreg = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		isr = 16'b1100001000000000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b1101001000000000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b1101101000000000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b0000000011110000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b0111000011110000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b0110000011110000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b1001000011110000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b1010000000000000;
		reset = 0;
		#200;
		reset = 1;
		#100;
		
		isr = 16'b1011000011110000;
		reset = 0;
		#200;
		reset = 1;
		#100;
	
	end
      
endmodule

