`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:10 11/10/2017 
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
module controller(isr, regw, memw, memin, sflag, spi, pcin, pci);
input [15:0] isr;
output regw, memw, memin, sflag, spi, pcin, pci;
reg regw, memw, pci, sflag, pcin;
reg [1:0] spi, memin;

always@(isr)
if(isr[15:14]!=3)
if(isr[15:12]==11)
begin
regw <= 0;
memw <= 1;
memin <= 2;
sflag <= 0;
spi <= 2;
pcin <= 1;
pci <= 0;
end
else if(isr[15:12]==10)
begin
regw <= 0;
memw <= 0;
memin <= 0;
sflag <= 0;
spi <= 1;
pcin <= 0;
pci <= 0;
end
else if(isr[15:12]==9)
begin
regw <= 0;
memw <= 1;
memin <= 1;
sflag <= 0;
spi <= 2;
pcin <= 1;
pci <= 1;
end
else
begin
regw <= 0;
memw <= 0;
memin <= 0;
sflag <= 0;
spi <= 0;
pcin <= 1;
pci <= 1;
end
else
case(isr[13:11])
0: begin
regw <= 0;
memw <= 1;
memin <= 0;
sflag <= 0;
spi <= 2;
pcin <= 1;
pci <= 0;
end
1: begin
regw <= 1;
memw <= 0;
memin <= 0;
sflag <= 0;
spi <= 1;
pcin <= 1;
pci <= 0;
end
2: begin
regw <= 1;
memw <= 0;
memin <= 0;
sflag <= 1;
spi <= 1;
pcin <= 1;
pci <= 0;
end
3: begin
regw <= 1;
memw <= 0;
memin <= 0;
sflag <= 1;
spi <= 1;
pcin <= 1;
pci <= 0;
end
4: begin
regw <= 1;
memw <= 0;
memin <= 0;
sflag <= 1;
spi <= 1;
pcin <= 1;
pci <= 0;
end
5: begin
regw <= 1;
memw <= 0;
memin <= 0;
sflag <= 1;
spi <= 1;
pcin <= 1;
pci <= 0;
end

endcase

endmodule
