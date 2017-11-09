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
module top;
reg clk, reset;

wire lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc;
wire [2:0] rsel, funsel;
wire [15:0] isr, marval, mdrval, memout, maxmem, amarval, amdrval;
wire amrw;
reg membench, benchmrw;
reg [15:0] benchmar, benchmdr;

controller con(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, mrw, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc);
datapath dat(clk, reset, isr, funsel, lsp, lpc, lmdr, lmar, lisr, ly, wrr, rsel, spmar, pcmar, mdrz, mdrm, tr, tsp, tpc, tmdr, tisr, sflag, cc, marval, mdrval, memout, maxmem);
memory mem(clk, amarval, amdrval, memout, amrw, maxmem);

buffer16 bmar0(benchmar, amarval, membench);
buffer16 bmar1(marval, amarval, ~membench);
buffer16 bmdr0(benchmdr, amdrval, membench);
buffer16 bmdr1(mdrval, amdrval, ~membench);
bufif1(amrw, benchmrw, membench);
bufif1(amrw, mrw, ~membench);

always
#5 clk = ~clk;

initial
begin
clk = 0;
reset = 1;
membench = 1;
benchmrw = 0;
benchmar = 0;
benchmdr = 0;
#100;

benchmrw = 1;
//Code Start

benchmdr = 16'b1011000000001100;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1110101000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100100000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100100100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000000001;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101000100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100000100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100100000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100001000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100101100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100000100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1110001100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100001100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1110101100000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b0100111111110011;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1001000000000010;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b0000111111111111;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000001010;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000010100;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1011000000001111;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101100000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1100000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101100000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1101000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b1010000000000000;
#10;
benchmar = benchmar + 1;
benchmdr = 16'b0000111111111111;
#10;
benchmar = benchmar + 1;



//Code End

benchmrw = 0;
membench = 0;
reset = 0;
#1000;

end

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
