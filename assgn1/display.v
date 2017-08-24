`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:24 07/28/2017 
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
module display(x, z, clki, clks, clko, rst, disp);
input x, clki, rst, clks;
output z, disp, clko;
wire z;
wire [7:0]disp;
wire cnt;
reg clko=0;
reg [63:0] ccnt;

assign disp[7] = 1;
assign disp[1] = 1;
assign disp[2] = 1;
assign disp[0] = ~cnt;
assign disp[3] = ~cnt;
assign disp[4] = ~cnt;
assign disp[5] = ~cnt;
assign disp[6] = 0;

always @(posedge clki)
begin
if(clks==1)
begin
ccnt=ccnt+1;
if (ccnt==8000000) 
begin
clko=~clko;
ccnt=0;
end
end
//clko<=clki;
end

count01 cou(x, z, clko, cnt, rst);

endmodule
