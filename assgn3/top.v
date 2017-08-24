`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:49 08/24/2017 
// Design Name: 
// Module Name:    top 
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
module top(go, clk, done, ain, pin, p);
input go, clk;
input [7:0] ain, pin;
output done, p;
wire done;
wire [15:0] p;

wire [5:0] status;
wire xld, cntld, pld, ald, reset, control;
wire [2:0] funsel;

datapath datapath0(ain, pin, clk, status, control, xld, cntld, pld, ald, funsel, reset, p);
controller controller0(go, done, clk, status, control, xld, cntld, pld, ald, funsel, reset);

endmodule
