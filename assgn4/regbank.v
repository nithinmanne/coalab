`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:27 10/26/2017 
// Design Name: 
// Module Name:    regbank 
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
module regbank(clk, reset, in, bus, rsel, wrr, tr);
input clk, reset, wrr, tr;
input [2:0] rsel;
input [15:0] in;
output bus;
wire [15:0] bus;
wire[7:0] a8;

dec decode(rsel,a8);
regfile rf(wrr,tr,in,bus,clk,reset,a8);

endmodule

module regfile(wen,ren,din,dout,clk,reset,a8);
input wen,ren,clk,reset;
input[7:0] a8;
input[15:0] din;
output dout;
wire[15:0] dout;
wire[15:0] outw;
rgtr8 r0(din,outw,clk,wen,reset,a8[0]);
rgtr8 r1(din,outw,clk,wen,reset,a8[1]);
rgtr8 r2(din,outw,clk,wen,reset,a8[2]);
rgtr8 r3(din,outw,clk,wen,reset,a8[3]);
rgtr8 r4(din,outw,clk,wen,reset,a8[4]);
rgtr8 r5(din,outw,clk,wen,reset,a8[5]);
rgtr8 r6(din,outw,clk,wen,reset,a8[6]);
rgtr8 r7(din,outw,clk,wen,reset,a8[7]);
buffer16 b0(outw, dout, ren);
endmodule

module specreg(clk, reset, in, bus, l, t, value);
input clk, reset, l, t;
input [15:0] in;
output bus, value;
wire [15:0] bus;

reg [15:0] value = 0;

always @(posedge clk)
begin
if(reset == 1)
value <= 0;
else if(l == 1)
value <= in;
end

buffer16 b0(value, bus, t);

endmodule

module flagff(clk, reset, c, c2, data, status, sflag);
input clk, reset, c, c2, sflag;
input [15:0] data;
output status;
wire [3:0] status;
wire cz;

reg rc = 0;
reg rz = 0;
reg rv = 0;
reg rs = 0;

assign status[0] = rc;
assign status[1] = rz;
assign status[2] = rv;
assign status[3] = rs;

zerodet zd0(cz, data);

always @(posedge clk)
begin
if(reset == 1)
begin
rc <= 0;
rz <= 0;
rv <= 0;
rs <= 0;
end
else if(sflag == 1)
begin
rc <= c;
rz <= cz;
rv <= c^c2;
rs <= data[15];
end
end

endmodule

module zerodet(cz, data);
input [15:0] data;
output cz;
wire cz;

assign cz = (data==0)?1:0;

endmodule

module rgtr8(din,dout,clk,wren,reset,en);
input[15:0] din;
input clk,wren,reset,en;
output wire[15:0] dout;
wire[15:0] tdout;
dff d0(wren&en,reset,din[0],clk,tdout[0]);
dff d1(wren&en,reset,din[1],clk,tdout[1]);
dff d2(wren&en,reset,din[2],clk,tdout[2]);
dff d3(wren&en,reset,din[3],clk,tdout[3]);
dff d4(wren&en,reset,din[4],clk,tdout[4]);
dff d5(wren&en,reset,din[5],clk,tdout[5]);
dff d6(wren&en,reset,din[6],clk,tdout[6]);
dff d7(wren&en,reset,din[7],clk,tdout[7]);
dff d8(wren&en,reset,din[8],clk,tdout[8]);
dff d9(wren&en,reset,din[9],clk,tdout[9]);
dff d10(wren&en,reset,din[10],clk,tdout[10]);
dff d11(wren&en,reset,din[11],clk,tdout[11]);
dff d12(wren&en,reset,din[12],clk,tdout[12]);
dff d13(wren&en,reset,din[13],clk,tdout[13]);
dff d14(wren&en,reset,din[14],clk,tdout[14]);
dff d15(wren&en,reset,din[15],clk,tdout[15]);
buffer16 b1(tdout,dout,en);
endmodule

module dff(en,reset,d,clk,qo);
input en,reset,d,clk;
output wire qo;
reg q = 0;
assign qo=q;
always @(posedge clk)
begin
if(reset==1)
q<=0;
else if(en==1)
q<=d;
end
endmodule

module buffer16(din,dout,con);
input wire[15:0] din;
input con;
output dout;
wire[15:0] dout;
bufif1(dout[0],din[0],con);
bufif1(dout[1],din[1],con);
bufif1(dout[2],din[2],con);
bufif1(dout[3],din[3],con);
bufif1(dout[4],din[4],con);
bufif1(dout[5],din[5],con);
bufif1(dout[6],din[6],con);
bufif1(dout[7],din[7],con);
bufif1(dout[8],din[8],con);
bufif1(dout[9],din[9],con);
bufif1(dout[10],din[10],con);
bufif1(dout[11],din[11],con);
bufif1(dout[12],din[12],con);
bufif1(dout[13],din[13],con);
bufif1(dout[14],din[14],con);
bufif1(dout[15],din[15],con);
endmodule

module dec(a3,a8);
input[2:0] a3;
output a8;
wire [7:0] a8;

assign a8[0] = (~a3[2])&(~a3[1])&(~a3[0]);
assign a8[1] = (~a3[2])&(~a3[1])&(a3[0]);
assign a8[2] = (~a3[2])&(a3[1])&(~a3[0]);
assign a8[3] = (~a3[2])&(a3[1])&(a3[0]);
assign a8[4] = (a3[2])&(~a3[1])&(~a3[0]);
assign a8[5] = (a3[2])&(~a3[1])&(a3[0]);
assign a8[6] = (a3[2])&(a3[1])&(~a3[0]);
assign a8[7] = (a3[2])&(a3[1])&(a3[0]);

endmodule
