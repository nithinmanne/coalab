`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:12 10/26/2017 
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
module datapath(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc, marval, mdrval, memout);
input clk, reset, lsp, lpc, lmdr, lmar, lisr, ly, wrr, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;
input [2:0] funsel, rsel;
input [15:0] memout;
output isr, marval, mdrval;
wire [15:0] isr;
wire ccg, c, c2;
wire [3:0] status;
wire [15:0] x, y, z, mdrin, marin, marval, pcval, spval, mdrval, memout;

ccgen ccgen0(ccg, isr[15:12], status);
alu alu0(x, y, funsel, z, c, c2);
flagff flagff0(clk, reset, c, c2, z, status, sflag);

specreg sp(clk, reset, z, x, lsp, tsp, spval);
specreg pc(clk, reset, z, x, lpc&(~cc|ccg), tpc, pcval);
specreg mdr(clk, reset, mdrin, x, lmdr, tmdr, mdrval);
specreg mar(clk, reset, marin, x, lmar, 0, marval);
specreg isrr(clk, reset, mdrval, x, lisr, 0, isr);
regbank regbank0(clk, reset, z, x, rsel, wrr, tr);
ygenmod ygenmod0(clk, reset, x, y, ly);

buffer16 mdr0(z, mdrin, mdrz);
buffer16 mdr1(memout, mdrin, mdrm);
buffer16 mar0(spval, marin, spmar);
buffer16 mar1(pcval, marin, pcmar);
signxtenbuf isrbuf(isr, x, tisr);

endmodule

module alu(x, y, funsel, z, c, c2);
input [15:0] x, y;
input [2:0] funsel;
output z, c, c2;
wire c, c2;
wire [15:0] z;



assign z = x+y;


assign c = x[15];
assign c2 = x[14];




endmodule

module ygenmod(clk, reset, x, y, ly);
input clk, reset, ly;
input [15:0] x;
output y;
reg [15:0] y = 0;

always @(posedge clk)
begin
if(reset==1)
y <= 0;
else if(ly==1)
y <= x;
end

endmodule

module ccgen(cc, isr, sreg);
input [3:0] isr;
input [3:0] sreg;
output cc;
wire cc;

assign cc = (isr==0)?(1):((isr==1)?(sreg[0]):((isr==2)?(~sreg[0]):((isr==3)?(sreg[1]):((isr==4)?(~sreg[1]):((isr==5)?(sreg[2]):((isr==6)?(~sreg[2]):((isr==7)?(sreg[3]):((isr==8)?(~sreg[3]):(1)))))))));

endmodule

module signxtenbuf(isr, x, tisr);
input [15:0] isr;
input tisr;
output x;
wire [15:0] x;
wire [15:0] sisr;

assign sisr[0] = isr[0];
assign sisr[1] = isr[1];
assign sisr[2] = isr[2];
assign sisr[3] = isr[3];
assign sisr[4] = isr[4];
assign sisr[5] = isr[5];
assign sisr[6] = isr[6];
assign sisr[7] = isr[7];
assign sisr[8] = isr[8];
assign sisr[9] = isr[9];
assign sisr[10] = isr[10];
assign sisr[11] = isr[11];
assign sisr[12] = isr[11];
assign sisr[13] = isr[11];
assign sisr[14] = isr[11];
assign sisr[15] = isr[11];


buffer16 bisr(sisr, x, tisr);
endmodule
