`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:47 08/03/2017 
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
module datareg(n, ni, nc, div, divi, divc, tmp1, tmp1i, tmp1c, tmp2, tmp2i, tmp2c, res, resc, clk, rst);
input [15:0] ni, divi, tmp1i, tmp2i;
input nc, divc, tmp1c, tmp2c, resc, clk, rst;
output n, div, tmp1, tmp2, res;
reg [15:0] n, div, tmp1, tmp2;
reg res;
always @(posedge clk)
begin
if (rst==1)
begin
n <= 0;
div <= 0;
tmp1 <= 0;
tmp2 <= 0;
res <= 1;
end
else
begin
if(nc==1) n <= ni;
if(divc==1) div <= divi;
if(tmp1c==1) tmp1 <= tmp1i;
if(tmp2c==1) tmp2 <= tmp2i;
if(resc==1) res <= 0;
end
end
endmodule

module inc(x, y);
input [15:0] x;
output y;
wire [15:0] y;
assign y = x+1;
endmodule

module sub(z, x, y);
input [15:0] x, y;
output z;
wire [15:0] z;
assign z = y - x;
endmodule

module shft(x, y);
input [15:0] x;
output y;
wire [15:0] y;
assign y[15]=0;
assign y[14]=x[15];
assign y[13]=x[14];
assign y[12]=x[13];
assign y[11]=x[12];
assign y[10]=x[11];
assign y[9]=x[10];
assign y[8]=x[9];
assign y[7]=x[8];
assign y[6]=x[7];
assign y[5]=x[6];
assign y[4]=x[5];
assign y[3]=x[4];
assign y[2]=x[3];
assign y[1]=x[2];
assign y[0]=x[1];
endmodule

module cmp(a, b, g, l, e);
input [15:0] a, b;
output g, l, e;
wire g, l, e;
assign g = a>b?1:0;
assign l = a<b?1:0;
assign e = a==b?1:0;
endmodule

module twomux(a0, a1, c, y);
input [15:0] a0, a1;
input c;
output y;
wire [15:0] y;
assign y = c==0?a0:a1;
endmodule

module fourmux(a0, a1, a2, a3, c, y);
input [15:0] a0, a1, a2, a3;
input [1:0] c;
output y;
wire [15:0] y;
wire [15:0] y0, y1;
//assign y = c<=1?(c==0?a0:a1):(c==2:a2:a3);
twomux mux0(a0, a1, c[0], y0);
twomux mux1(a2, a3, c[0], y1);
assign y = c[1]==0?y0:y1;
endmodule
