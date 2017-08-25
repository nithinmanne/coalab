`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:56 08/24/2017 
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
module controller(go, done, clk, status, control, xld, cntld, pld, ald, funsel, reset);
input go, clk;
input [5:0] status;
output done, control, xld, cntld, pld, ald, funsel, reset;
wire xld, cntld, pld, ald, reset;
wire [2:0] funsel;
wire control;

reg [1:0] state;
reg done;
wire [1:0] qstate;
wire qdone;

assign control = state[1]&~state[0];
assign reset = ~go;
assign pld = ~go|(~state[0]);
assign ald = ~go;
assign xld = state[1]&state[0];
assign cntld = ~state[1]&state[0];
assign funsel[2] = status[1]^status[0];
assign funsel[1] = status[2]==0?(status[1]&status[0]):(~status[1]&~status[0]);
assign funsel[0] = status[2];
assign qdone = status[5]&status[3];
assign qstate[1] = qdone|(state[0]);
assign qstate[0] = qdone|(~state[1]);

always @(negedge clk)
if(go == 0)
begin
state <= 0;
done <= 0;
end
else
begin
state <= qstate;
done <= qdone;
end
endmodule
