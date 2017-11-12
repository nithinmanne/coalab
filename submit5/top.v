`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:47 11/10/2017 
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

wire [15:0] isr, pcout, amar, maxmem;
reg [15:0] benchmdr, benchmar;
reg benchmrw, membench;
wire regw, memw, pci, sflag, pcin;
wire [1:0] spi, memin;

controller controller0(isr, regw, memw, memin, sflag, spi, pcin, pci);
datapath datapath0(clk, reset, isr, pcout, regw, memw, memin, sflag, spi, pcin, pci);

isrmemory mem(clk, amar, benchmdr, isr, benchmrw, maxmem);

assign amar = (membench==0)?pcout:benchmar;

always
#5 clk = ~clk;

initial
begin

clk = 0;
reset = 1;
benchmrw = 0;
benchmar = 0;
benchmdr = 0;
membench = 1;
#100;

benchmrw = 1;
//Code Start

benchmdr = 16'b1011000000010000;
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

module isrmemory(clk, marval, mdrval, memout, mrw, maxmem);
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
