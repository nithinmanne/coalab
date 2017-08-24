`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:55 08/04/2017 
// Design Name: 
// Module Name:    datareg 
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
module datareg(n, ni, rem, remld, remi, div, divld, divi, res, resld, resi, clk, rst);
input [15:0] ni, remi, divi;
input remld, divld, resi, resld, clk, rst;
output [15:0] n, rem, div;
output res;
reg [15:0] n, rem, div;
reg res;
always @(posedge clk)
begin
	if(rst == 1)
	begin
		n <= ni;
		rem <= 0;
		div <= 0;
		res <= 1'b1;
	end
	else
	begin
		if(remld==1) rem <= remi;
		if(divld==1) div <= divi;
		if(resld==1) res <= resi;
	end
end
endmodule
