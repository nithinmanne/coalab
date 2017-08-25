`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:02 08/25/2017 
// Design Name: 
// Module Name:    seg 
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
module seg(go, clk, done, ain, pin, osegm, segen, p);
input go, clk;
input [7:0] ain, pin;
output done, osegm, segen, p;
reg [6:0] osegm;
wire [21:0] segm;
reg [3:0] segen = 4'b0001;
wire done;
wire [15:0] p;

reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] ones;
reg [19:0] shift;
integer i;

top top0(go, clk, done, ain, pin, p);

always @(p)
   begin
      // Clear previous number and store new number in shift register
      shift[19:8] = 0;
      shift[7:0] = p;
      
      // Loop eight times
      for (i=0; i<8; i=i+1) begin
         if (shift[11:8] >= 5)
            shift[11:8] = shift[11:8] + 3;
            
         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 3;
            
         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      hundreds = shift[19:16];
      tens     = shift[15:12];
      ones     = shift[11:8];
   end

wire [3:0] nsg;

assign nsg = (segen<<1) + (segen[3]);

always @(posedge clk)
begin
if(segen==4'b0001)
osegm=segm[6:0];
if(segen==4'b0010)
osegm=segm[13:7];
if(segen==4'b0100)
osegm=segm[20:14];
if(segen==4'b1000)
osegm=segm[21]<<6;

//segen = nsegen;
//segen=segen+1;
segen=nsg;
end

//always @(negedge clk)


seven hun(hundreds, segm[20:14]);
seven ten(tens, segm[13:7]);
seven one(ones, segm[6:0]);
assign segm[21] = p[15];

endmodule



module seven(in, out1);
input [3:0] in;
output [6:0] out1;
wire [6:0] out, out1, out2;

assign out[0] = in[3]|in[1]|(in[3]&in[0])|(~in[3]&~in[0]);
assign out[1] = ~in[2]|(~in[1]&~in[0])|(in[1]&in[0]);
assign out[2] = in[2]|~in[1]|in[0];
assign out[3] = (~in[2]&~in[0])|(in[1]&~in[0])|(in[2]&~in[1]|in[0])|(~in[2]&in[1])|in[3];
assign out[4] = (~in[2]&~in[0])|(in[1]&~in[0]);
assign out[5] = in[3]|(~in[1]&~in[0])|(in[2]&~in[1])|(in[2]&~in[0]);
assign out[6] = in[3]|(in[2]&~in[1])|(~in[2]&in[1])|(~in[1]&in[0]);

assign out2 = 7'b1000000;

assign out1 = (in>=9)?out2:out;

endmodule
