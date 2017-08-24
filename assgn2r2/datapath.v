`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:52 08/04/2017 
// Design Name: 
// Module Name:    datapath 
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
module datapath(sw, remld, divld, resld, nbuf, rembuf, zc, sc, s, clk, rst, res);
input [15:0] sw;
input remld, divld, resld, nbuf, rembuf, clk, rst;
input [1:0] zc, sc;
output s, res;
wire [1:0] s;
wire [15:0] x, y, z, n, rem, div;
wire res;

alu alu0(x, y, z, zc, sc, s, res);
datareg datareg0(n, sw, rem, remld, z, div, divld, z, res, resld, 1'b0, clk, rst);
assign x = res==1?(nbuf==1?n:(rembuf==1?rem:0)):n;
assign y = div;

endmodule
