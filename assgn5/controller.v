`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:13 11/17/2017 
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
module controller(isr1, isr2, isr3, isr4, regw, memw, memin, sflag, spi, pcin, pci);
input [15:0] isr1, isr2, isr3, isr4;
output regw, memw, memin, sflag, spi, pcin, pci;
reg regw, memw, pci, sflag, pcin;
reg [1:0] spi, memin;



always@(isr2)
if(isr2[15:14]!=3)
if(isr2[15:12]==11)
begin
memw <= 1;
memin <= 2;
spi <= 2;
end
else if(isr2[15:12]==10)
begin
memw <= 0;
memin <= 0;
spi <= 1;
end
else if(isr2[15:12]==9)
begin
memw <= 1;
memin <= 1;
spi <= 2;
end
else
begin
memw <= 0;
memin <= 0;
spi <= 0;
end
else
case(isr2[13:11])
0: begin
memw <= 1;
memin <= 0;
spi <= 2;
end
1: begin
memw <= 0;
memin <= 0;
spi <= 1;
end
2: begin
memw <= 0;
memin <= 0;
spi <= 1;
end
3: begin
memw <= 0;
memin <= 0;
spi <= 1;
end
4: begin
memw <= 0;
memin <= 0;
spi <= 1;
end
5: begin
memw <= 0;
memin <= 0;
spi <= 1;
end

endcase

always@(isr3)
if(isr3[15:14]!=3)
if(isr3[15:12]==11)
begin
sflag <= 0;
pcin <= 1;
pci <= 0;
end
else if(isr3[15:12]==10)
begin
sflag <= 0;
pcin <= 0;
pci <= 0;
end
else if(isr3[15:12]==9)
begin
sflag <= 0;
pcin <= 1;
pci <= 1;
end
else
begin
sflag <= 0;
pcin <= 1;
pci <= 1;
end
else
case(isr3[13:11])
0: begin
sflag <= 0;
pcin <= 1;
pci <= 0;
end
1: begin
sflag <= 0;
pcin <= 1;
pci <= 0;
end
2: begin
sflag <= 1;
pcin <= 1;
pci <= 0;
end
3: begin
sflag <= 1;
pcin <= 1;
pci <= 0;
end
4: begin
sflag <= 1;
pcin <= 1;
pci <= 0;
end
5: begin
sflag <= 1;
pcin <= 1;
pci <= 0;
end

endcase

always@(isr4)
if(isr4[15:14]!=3)
if(isr4[15:12]==11)
begin
regw <= 0;
end
else if(isr4[15:12]==10)
begin
regw <= 0;
end
else if(isr4[15:12]==9)
begin
regw <= 0;
end
else
begin
regw <= 0;
end
else
case(isr4[13:11])
0: begin
regw <= 0;
end
1: begin
regw <= 1;
end
2: begin
regw <= 1;
end
3: begin
regw <= 1;
end
4: begin
regw <= 1;
end
5: begin
regw <= 1;
end

endcase

endmodule
