`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:47 08/11/2017 
// Design Name: 
// Module Name:    prime 
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
module prime(sw, clk, go, res, stp);
input [15:0] sw;
input clk, go;
output res, stp;
wire res, stp, resi;
wire remld, divld, resld, nbuf, rembuf, rst;
wire [1:0] zc, sc, s;
datapath datapath0(sw, remld, divld, resld, nbuf, rembuf, zc, sc, s, clk, rst, resi);
assign res = ~s[1];
controller controller0(go, s, remld, divld, resld, nbuf, rembuf, zc, sc, clk, stp, rst);
endmodule
