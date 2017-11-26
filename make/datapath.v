`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:28 08/24/2017 
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
module datapath(ain, pin, clk, status, control, xld, cntld, pld, ald, funsel, reset, po);
input clk, xld, cntld, pld, ald, control, reset;
input [7:0] ain, pin;
input [2:0] funsel;
output status, po;
wire [15:0] po;
wire [5:0] status;

reg [2:0] cnt;
reg [2:0] x;
reg [15:0] p;
reg [7:0] a;

wire [15:0] ap, sp, qp;
wire [2:0] qx, qcnt;
wire psign;

assign status[5] = cnt[2];
assign status[4] = cnt[1];
assign status[3] = cnt[0];
assign status[2] = x[2];
assign status[1] = x[1];
assign status[0] = x[0];
assign psign = p[15];
assign po = p + pin[7];

alu alu0(a, p, funsel, ap);
assign sp = (p>>2) + ((psign<<15) + (psign<<14));
assign qp = (control==1)?(sp):(ap);
assign qcnt = cnt + 1;
assign qx[0] = p[1];
assign qx[1] = p[2];
assign qx[2] = p[3];

always @(posedge clk)
begin
if(reset == 1)
begin
p <= (pin) + ((pin[7]<<15)+(pin[7]<<14)+(pin[7]<<13)+(pin[7]<<12)+(pin[7]<<11)+(pin[7]<<10)+(pin[7]<<9)+(pin[7]<<8));
a <= ain;
cnt <= 0;
x[0] <= 0;
x[1] <= pin[0];
x[2] <= pin[1];
end
else
begin
if (xld==1) x <= qx;
if (cntld==1) cnt <= qcnt;
if (pld==1) p <= qp;
if (ald==1) a <= ain;
end
end
endmodule

module alu(a, p, funsel, out);
input [7:0] a;
input [15:0] p;
input [2:0] funsel;
output out;
wire [15:0] o, out;

partproduct p0(funsel, o[15], a[7], a[6]);
partproduct p1(funsel, o[14], a[6], a[5]);
partproduct p2(funsel, o[13], a[5], a[4]);
partproduct p3(funsel, o[12], a[4], a[3]);
partproduct p4(funsel, o[11], a[3], a[2]);
partproduct p5(funsel, o[10], a[2], a[1]);
partproduct p6(funsel, o[9], a[1], a[0]);
partproduct p7(funsel, o[8], a[0], 0);
assign o[7] = 0;
assign o[6] = 0;
assign o[5] = 0;
assign o[4] = 0;
assign o[3] = 0;
assign o[2] = 0;
assign o[1] = 0;
assign o[0] = 0;

assign out = p + o + (funsel[0]<<8);

endmodule

module partproduct(funsel, out, yi, yim);
input yi, yim;
input [2:0] funsel;
output out;
wire out, o1, o2, o3;

assign o1 = ~(yi&funsel[2]);
assign o2 = ~(yim&funsel[1]);
assign o3 = ~(o1&o2);
assign out = o3^funsel[0];

endmodule
