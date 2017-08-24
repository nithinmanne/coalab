`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:18 07/28/2017 
// Design Name: 
// Module Name:    display 
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
module display(x, z, clk, rst, disp);
input x, clk, rst;
output z, disp;
wire z;
wire [7:0]disp;

assign disp[7] = 1;
assign disp[1] = 1;
assign disp[2] = 1;
assign disp[0] = ~z;
assign disp[3] = ~z;
assign disp[4] = ~z;
assign disp[5] = ~z;
assign disp[6] = 0;

count01 cou(x, z, clk, rst);

endmodule
