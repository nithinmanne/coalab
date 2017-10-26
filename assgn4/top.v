`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:30 10/26/2017 
// Design Name: 
// Module Name:    top 
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
module top(clk, reset);
input clk, reset;

wire lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;
wire [2:0] rsel, funsel;
wire [15:0] isr, marval, mdrval, memout;

controller con(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc);
datapath dat(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc, marval, mdrval, memout);
memory mem(clk, marval, mdrval, memout, mrw);

endmodule

module memory(clk, marval, mdrval, memout, mrw);
input clk, mrw;
input [15:0] marval, mdrval;
output memout;
wire [15:0] memout;

reg [15:0] mem[0:4095];

assign memout = mem[marval];

always @(posedge clk)
begin
if(mrw == 1)
mem[marval] = mdrval;
end

endmodule
