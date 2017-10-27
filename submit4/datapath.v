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
module datapath(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc, marval, mdrval, memout, maxmem);
input clk, reset, lsp, lpc, lmdr, lmar, lisr, ly, wrr, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;
input [2:0] funsel, rsel;
input [15:0] memout, maxmem;
output isr, marval, mdrval;
wire [15:0] isr;
wire ccg, c, c2;
wire [3:0] status;
wire [15:0] x, y, z, mdrin, marin, marval, pcval, spval, mdrval, memout;

ccgen ccgen0(ccg, isr[15:12], status);
alu alu0(x, y, funsel, z, c, c2);
flagff flagff0(clk, reset, c, c2, z, status, sflag);

specreg sp(clk, reset, z, x, lsp, tsp, spval, maxmem);
specreg pc(clk, reset, z, x, lpc&(~cc|ccg), tpc, pcval, 16'b0);
specreg mdr(clk, reset, mdrin, x, lmdr, tmdr, mdrval, 16'b0);
specreg mar(clk, reset, marin, x, lmar, 1'b0, marval, 16'b0);
specreg isrr(clk, reset, mdrval, x, lisr, 1'b0, isr, 16'b0);
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
reg c = 0, c2 = 0;
reg [15:0] z = 0;
wire [15:0] addo, inco;
wire [14:0] x14, y14, addo14, inco14;
wire addc, incc, addc14, incc14;

assign x14 = x;
assign y14 = y;
assign {addc, addo} = x + y;
assign {addc14, addo14} = x + y;
assign {incc, inco} = x + 1;
assign {incc14, inco14} = x + 1;

always @(x or y or funsel)
begin

if(funsel == 1)
begin
z <= x;
c <= 0;
c2 <= 0;
end
else if(funsel == 2)
begin
z <= addo;
c <= addc;
c2 <= addc14;
end
else if(funsel == 3)
begin
z <= -x;
c <= 0;
c2 <= 0;
end
else if(funsel == 4)
begin
z <= x|y;
c <= 0;
c2 <= 0;
end
else if(funsel == 5)
begin
z <= ~x;
c <= 0;
c2 <= 0;
end
else if(funsel == 6)
begin
z <= inco;
c <= incc;
c2 <= incc14;
end
else if(funsel == 7)
begin
z <= x-1;
c <= 0;
c2 <= 0;
end
else
begin
z <= 0;
c <= 0;
c2 <= 0;
end

end

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
