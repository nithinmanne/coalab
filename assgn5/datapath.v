`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:29 11/09/2017 
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
module datapath(clk, reset, isr, regw, memw, sflag, stl);
input clk, reset, regw, memw, sflag, stl;
output isr;
wire [15:0] isr, isr1, isr2, isr3, isr4, regout, regout1, memout, x, y, z, maxmem;
wire c, c2, cc;
wire [3:0] status;

regbank regbank0(clk, reset, z, regout, isr1[10:8], isr4[10:8], regw);
memory memory0(clk, reset, regout1, memout, spval, memw, maxmem);
alu alu0(x, y, isr3[13:11], z, c, c2);
ccgen ccgen0(cc, isr3[15:12], status);
flagff flagff0(clk, reset, c, c2, z, status, sflag);

pipreg pipisr(clk&stl, reset, isr, isr1, stl);
pipreg pipisr1(clk, reset, isr1, isr2, 0);
pipreg pipisr2(clk, reset, isr2, isr3, 0);
pipreg pipisr3(clk, reset, isr3, isr4, 0);
pipreg pipregout(clk, reset, regout, regout1, 0);
pipreg pipregout1(clk, reset, regout1, x, 0);
pipreg pipmemout(clk, reset, memout, y, 0);

endmodule

module pipreg(clk, reset, in, out, stl);
input clk, reset, stl;
input [15:0] in;
output out;
wire [15:0] out;
reg [15:0] outr;

assign out = outr&(~stl);

always @(posedge clk)
if(reset==1)
outr <= 0;
else if(stl==0)
outr <= in;
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
