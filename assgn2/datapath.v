`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:36 08/03/2017 
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
module datapath(ni, clk, rst, nc, tmp1c, tmp2c, divc, divmxc, tmp2mxc, cbmxc, camxc, g, l, e, stop, out);
input ni, clk, rst, nc, tmp1c, tmp2c, divc, divmxc, tmp2mxc, stop;
input [1:0] cbmxc, camxc;
output g, l, e, out;
wire g, l, e, out;

endmodule
