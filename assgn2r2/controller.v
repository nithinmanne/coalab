`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:43 08/11/2017 
// Design Name: 
// Module Name:    controller 
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
module controller(go, s, remld, divld, resld, nbuf, rembuf, zc, sc, clk, stp, rst);
input go, clk;
input [1:0] s;
output zc, sc, stp, rst, remld, divld, resld, nbuf, rembuf;
reg stp;
wire rst, remld, divld, resld, nbuf, rembuf;
wire [1:0] zc, sc;
reg [2:0] q;
wire d2, d1, d0, dstp;
assign d0 = (~q[2]&~q[1]&~q[0])|(~s[0]&~q[2]&q[1])|(q[1]&~q[0]);
assign d1 = (~s[1]&((~q[2]&q[1])|(q[1]&~q[0])))|(~q[2]&q[0])|(~q[2]&q[1]&~q[0])|(q[2]&~q[1]&~q[0]);
assign d2 = (q[2]&q[1])|(s[0]&~s[1]&q[1]&q[0])|(~q[2]&~q[1]&~q[0]&s[0]&~s[1]);
assign dstp = (~q[2]&~q[1]&~q[0]&s[1])|(q[2]&~q[1]&q[0])|(s[1]&q[2]&q[0])|(s[0]&q[2]&q[0]);
assign rst = go;
assign remld = ~q[2]&q[1];
assign divld = (~q[2]&~q[1]&q[0])|(q[2]&~q[1]&~q[0]);
assign resld = q[2]&~q[1]&q[0];
assign nbuf = (~q[2]&~q[0])|(q[2]&q[1]&q[0]);
assign rembuf = (~q[2]&q[1]&q[0])|(q[2]&q[1]&~q[0]);
assign zc[1] = ~q[2]&q[0];
assign zc[0] = (~q[2]&~q[1]&q[0])|(q[2]&~q[1]&~q[0]);
assign sc[1] = q[1]&q[0];
assign sc[0] = q[2]&q[1]&~q[0];

always @(negedge clk)
begin
	if(go==1)
	begin
		stp <= 0;
		q <= 0;
	end
	else if(stp==0)
	begin
		q[2] <= d2|dstp;
		q[1] <= d1|dstp;
		q[0] <= d0|dstp;
		stp <= dstp;
	end
end
endmodule
