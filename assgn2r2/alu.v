`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:33 08/04/2017 
// Design Name: 
// Module Name:    alu 
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
module alu(x, y, z, zc, sc, s, res);
input [15:0] x, y;
input [1:0] zc, sc;
input res;
output z, s;
wire [15:0] z;
wire [1:0] s;
wire [15:0] transw, twow, incw, subw, cmpa, cmpb;

assign transw = x;
assign twow = 2;
inc inc0(incw, y);
sub sub0(subw, x, y, s[0]);
equal equal0(cmpa, cmpb, s[1]);
fourmux fourmuxz(transw, incw, subw, twow, zc, z);
assign cmpa = x;
fourmux fourmuxs(16'd2, 16'd0, y, y, sc, cmpb);

endmodule

module inc(z, y);
input [15:0] y;
output z;
wire [15:0] z;
assign z = y+1;
endmodule

module sub(z, x, y, b);
input [15:0] x, y;
output z, b;
wire b;
wire [15:0] z;
assign z = x - y;
assign b = z[15];
endmodule

module equal(a, b, e);
input [15:0] a, b;
output e;
wire e;
nor eql(e, a[0]^b[0], a[1]^b[1], a[2]^b[2], a[3]^b[3], a[4]^b[4], a[5]^b[5], a[6]^b[6], a[7]^b[7], a[8]^b[8], a[9]^b[9], a[10]^b[10], a[11]^b[11], a[12]^b[12], a[13]^b[13], a[14]^b[14], a[15]^b[15]);
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
