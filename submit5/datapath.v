`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:04 11/10/2017 
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
module datapath(clk, reset, isr, pcout, regw, memw, memin, sflag, spi, pcin, pci);
input clk, reset, regw, memw, pcin, sflag, pci;
input [1:0] spi, memin;
input [15:0] isr;
output pcout;
wire [15:0] isr, xisr, x, y, z, maxmem, meminp, spout, spval, pcout, pcval, pcinp, spincout, pcincout;
wire c, c2;
wire [3:0] status;

regbank regbank0(clk, reset, z, x, isr[10:8], regw, 1);
alu alu0(x, y, isr[13:11], z, c, c2);
memory memory0(clk, spout, meminp, y, memw, maxmem);
flagff flagff0(clk, reset, c, c2, z, status, sflag);
ccgen ccgen0(cc, isr[15:12], status);

mux2 pcmux(pcinp, y, pcincout, pcin);

specreg sp(clk, reset, spincout, spout, 1, 1, spval, maxmem);
specreg pc(clk, reset, pcinp, pcout, 1, 1, pcval, 0);
signxtenbuf isrbuf(isr, xisr, 1);

assign spincout = (spi==0)?spout:(spi==1?spout+1:spout-1);
assign pcincout = (pci==0)?pcout+1:(cc==1?pcout+1+xisr:pcout+1);
assign meminp = (memin==0)?x:(memin==1?pcout:xisr);


endmodule

module memory(clk, marval, mdrval, memout, mrw, maxmem);
parameter MAXMEMORY = 4095;
input clk, mrw;
input [15:0] marval, mdrval;
output memout, maxmem;
wire [15:0] memout, maxmem;

reg [15:0] mem[0:MAXMEMORY];

assign memout = mem[marval];
assign maxmem = MAXMEMORY;

always @(posedge clk)
begin
if(mrw == 1)
mem[marval] = mdrval;
end

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


module ccgen(cc, isr, sreg);
input [3:0] isr;
input [3:0] sreg;
output cc;
wire cc;

assign cc = (isr==0)?(1):((isr==1)?(sreg[0]):((isr==2)?(~sreg[0]):((isr==3)?(sreg[1]):((isr==4)?(~sreg[1]):((isr==5)?(sreg[2]):((isr==6)?(~sreg[2]):((isr==7)?(sreg[3]):((isr==8)?(~sreg[3]):(1)))))))));

endmodule


module mux2(out, in0, in1, sel);
input [15:0] in0, in1;
input sel;
output out;
wire [15:0] out;
assign out = (sel==0)?in0:in1;
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
