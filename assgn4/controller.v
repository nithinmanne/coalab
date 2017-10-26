`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:50 10/13/2017 
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
module controller(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc);
input [15:0] isr;
input clk, reset;
output funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;
wire [2:0] funsel, rsel;
wire lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;

reg [24:0] control;
reg [4:0] state;

assign funsel[0] = control[0];
assign funsel[1] = control[1];
assign funsel[2] = control[2];
assign lsp = control[3];
assign lpc = control[4];
assign lmdr = control[5];
assign lmar = control[6];
assign lisr = control[7];
assign ly = control[8];
assign wrr = control[9];
assign rsel[0] = control[10];
assign rsel[1] = control[11];
assign rsel[2] = control[12];
assign mrw = control[13];
assign spmar = control[14];
assign pcmar = control[15];
assign mdrz = control[16];
assign mdrm = control[17];
assign tr = control[18];
assign tsp = control[19];
assign tpc = control[20];
assign tmdr = control[21];
assign tisr = control[22];
assign sflag = control[23];
assign cc = control[24];

always @(negedge clk)
begin
if(reset==1)
begin
state <= 0;
control <= 0;
end
else
begin


if(state==0)
begin
control <= 0;
control[6] <= 1;
control[15] <= 1;
state <= 1;
end

else if(state==1)
begin
control <= 0;
control[7] <= 1;
control[20] <= 1;
control[4] <= 1;
control[0] <= 0;
control[1] <= 1;
control[2] <= 1;
control[17] <= 1;
state <= 2;
end

else if(state==2)
begin
control <= 0;
if(isr[15]==1 & isr[14]==1)
begin
control[14] <= 1;
control[6] <= 1;
if(isr[13]==0 & isr[12]==0 & isr[11]==0)
begin
state <= 3;
end
else
begin
state <= 6;
end
end
else
begin
if(isr[15]==1 & isr[14]==0 & isr[13]==0 & isr[12]==1)
begin
control[3] <= 1;
control[19] <= 1;
control[0] <= 1;
control[1] <= 1;
control[2] <= 1;
state <= 7;
end
else if(isr[15]==1 & isr[14]==0 & isr[13]==1 & isr[12]==0)
begin
control[14] <= 1;
control[6] <= 1;
state <= 9;
end
else if(isr[15]==1 & isr[14]==0 & isr[13]==1 & isr[12]==1)
begin
control[3] <= 1;
control[19] <= 1;
control[0] <= 1;
control[1] <= 1;
control[2] <= 1;
state <= 16;
end
else
begin
control[22] <= 1;
control[8] <= 1;
state <= 13;
end
end
end

else if(state==3)
begin
control <= 0;
control[14] <= 1;
control[6] <= 1;
state <= 4;
end

else if(state==4)
begin
control <= 0;
control[18] <= 1;
control[10] <= isr[8];
control[11] <= isr[9];
control[12] <= isr[10];
control[5] <= 1;
control[16] <= 1;
control[0] <= 1;
control[1] <= 0;
control[2] <= 0;
state <= 5;
end

else if(state==5)
begin
control <= 0;
control[13] <= 1;
state <= 0;
end

else if(state==6)
begin
control <= 0;
control[5] <= 1;
control[17] <= 1;
state <= 14;
end

else if(state==7)
begin
control <= 0;
control[14] <= 1;
control[5] <= 1;
control[20] <= 1;
control[0] <= 1;
control[1] <= 0;
control[2] <= 0;
control[16] <= 1;
control[6] <= 1;
state <= 8;
end

else if(state==8)
begin
control <= 0;
control[13] <= 1;
state <= 12;
end

else if(state==9)
begin
control <= 0;
control[5] <= 1;
control[17] <= 1;
state <= 10;
end

else if(state==10)
begin
control <= 0;
control[4] <= 1;
control[21] <= 1;
control[0] <= 1;
control[1] <= 0;
control[2] <= 0;
state <= 11;
end

else if(state==11)
begin
control <= 0;
control[19] <= 1;
control[3] <= 1;
control[0] <= 0;
control[1] <= 1;
control[2] <= 1;
state <= 0;
end

else if(state==12)
begin
control <= 0;
control[22] <= 1;
control[8] <= 1;
state <= 13;
end

else if(state==13)
begin
control <= 0;
control[20] <= 1;
control[4] <= 1;
control[0] <= 0;
control[1] <= 1;
control[2] <= 0;
control[24] <= 1;
state <= 0;
end

else if(state==14)
begin
control <= 0;
if(isr[11]==0)
begin
control[21] <= 1;
control[8] <= 1;
state <= 15;
end
else
begin
control[9] <= 1;
control[21] <= 1;
control[10] <= isr[8];
control[11] <= isr[9];
control[12] <= isr[10];
control[0] <= isr[11];
control[1] <= isr[12];
control[2] <= isr[13];
control[23] <= 1;
state <= 11;
end
end

else if(state==15)
begin
control <= 0;
control[9] <= 1;
control[18] <= 1;
control[10] <= isr[8];
control[11] <= isr[9];
control[12] <= isr[10];
control[0] <= isr[11];
control[1] <= isr[12];
control[2] <= isr[13];
control[23] <= 1;
state <= 11;
end

else if(state==16)
begin
control <= 0;
control[14] <= 1;
control[6] <= 1;
state <= 17;
end

else if(state==17)
begin
control <= 0;
control[16] <= 1;
control[5] <= 1;
control[22] <= 1;
control[0] <= 1;
control[1] <= 0;
control[2] <= 0;
state <= 5;
end


end
end

endmodule
