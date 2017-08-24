`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:06 07/21/2017 
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
module count01(x, z, clk, rst);
input x, clk, rst;
output z;
wire z;

wire q2, q1;
wire d2, d1, zw;

stateTransFn_beh stfb(d2, d1, x, q2, q1);
outputFn_beh ofb(zw, x, q2, q1);
delayElem_beh deb(z, q2, q1, zw, d2, d1, clk, rst);

endmodule

module stateTransFn_beh (d2, d1, x, q2, q1);
input x, q2, q1;
output d2, d1;
wire d2, d1;
assign d2 = x;
assign d1 = (~x&~q1)|(~x&q2)|(q2&~q1);
endmodule

module outputFn_beh (zw, x, q2, q1);
input x, q2, q1;
output zw;
wire zw;
assign zw = (q1&q2&~x)|(x&~q2&q1);
endmodule

module delayElem_beh (z, q2, q1, zw, d2, d1, clk, rst);
input zw, d2, d1, clk, rst;
output z, q2, q1;
reg z, q2, q1;
always @(posedge clk)
	if(rst==1)
	begin
		z <= 0;
		q2 <= 0;
		q1 <= 0;
	end
	else
	begin
		z <= zw;
		q2 <= d2;
		q1 <= d1;
	end
endmodule
