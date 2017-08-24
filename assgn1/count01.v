`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:23 07/20/2017 
// Design Name: 
// Module Name:    count01 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module count01(x, z, clk, cnt, rst);
input x, clk, rst;
output z, cnt;
reg z;

reg cnt = 0;
reg old = 0;

wire chng, cnt1, chq, nold;

xor(chng, x, old);
not(cnt1, cnt);
xor(chq, cnt, old);
not(nold, old);

always @(posedge clk)
	if (rst==1)
	begin
		cnt <= 0;
		old <= 0;
	end
	else if (chng==0)
	begin
		z <= 0;
		cnt <= cnt1;
	end
	else
	begin
		if (chq==1)
			z <= 1;
		old <= nold;
		cnt <= 1;
	end
endmodule
