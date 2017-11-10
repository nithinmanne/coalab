module top_module(clk, reset);
   input reset;
   input clk;
   wire[1:0] selectX;
   wire[1:0] selectY;
   wire[1:0] selectReg;
   wire selectJ;
   wire rD1;
   wire rD2;
   wire wR;
   wire wE;
   wire c, z, s, v;
   wire tst, enb;
   wire[2:0] fSelect;
	wire [15:0]IR;

	controller cont(IR,reset,clk,c,z,s,v,selectX,selectY,fSelect,wE,selectReg,tst,enb,selectJ,rD1,rD2,wR);
	datapath   data(IR,reset,clk,c,z,s,v,selectX,selectY,fSelect,wE,selectReg,tst,enb,selectJ,rD1,rD2,wR);
	
endmodule

module controller(IR,reset,clk,c,z,s,v,selectX,selectY,fSel,wE,selectReg,tst,enb,selectJ,rD1,rD2,wR);

input reset;
input [15:0] IR;
input clk;
input c,z,s,v;

output selectJ;
output wR;
output [1:0]selectReg;
output tst;
output [2:0]fSel;
output wE;
output enb;
output[1:0] selectY;
output rD1;
output rD2;
output [1:0] selectX;

reg selectJ;
reg wR;
reg tst;
reg rD2;
reg wE;
reg enb;
reg rD1;
reg [1:0]selectX;
reg [2:0]fSel;
reg [1:0]selectReg;
reg [2:0]opCodeType;
reg[1:0] selectY;
reg [1:0]mD;
reg [1:0]opCode;


always@(*)
	begin 
			opCodeType[2:0] = IR[13:11];
			mD[1:0] = IR[7:6];
			opCode[1:0] = IR[15:14];
	end 


always@(*)
	begin
	
	enb=1;rD2=0;
	selectJ=0;
	wR=0;
	selectX=2'b00;
	wE=0;tst=0;
	selectY=2'b00;
	rD1=0;selectReg=2'b0;
	fSel=3'b0;
	
	case(opCode)
	 2'b00 : begin
					 case(opCodeType)
								3'b0 : case(mD)
												
												2'b0 : begin
															selectX=2'b11;fSel=3'b0;
															wR=1;selectReg=2'b11;
														end
											  2'b01 : begin
															selectX=2'b10;
															wR=1;rD1=1;
															fSel = 3'b0;selectReg=2'b11;
														end
											 2'b10 : begin
															fSel = 3'b010;
															rD1=1;selectReg=2'b10;
															enb=0;selectY=2'b10;
															selectX = 2'b10;wR=1;	
														end
										 endcase
								3'b001 : case(mD)
											2'b0: begin
														fSel=3'b010;
														enb=1;tst=1;
														rD2=1;
														rD1=1;selectY = 2'b10;														
														selectX = 2'b10;wE=1;
													end
											endcase
								
							
					endcase
			end
	  2'b01: begin
					case(opCodeType)
					3'b0: begin
							case(mD)
										2'b00:begin
													fSel=3'b010;
													selectX=2'b11;selectReg=2'b11;
													rD2=1;
													wR=1;selectY=2'b0;
													enb=0;
												end
										2'b01:begin
													selectY=2'b0;
													rD2=1;wR=1;
													enb=0;selectReg=2'b11;
													rD1=1;selectX=2'b10;
													fSel=3'b010;
												end
							endcase
							end
					3'b001: begin
							case(mD)
										2'b00:begin
													selectY=2'b0;
													rD2=1;selectReg=2'b11;
													wR=1;selectX=2'b11;
													fSel=3'b001;
													enb=0;
												end
										2'b01:begin
													rD2=1;
													rD1=1;
													wR=1;
													enb=0;
													selectY=2'b0;
													selectX=2'b10;
													fSel=3'b001;
													selectReg=2'b11;
													
												end
							endcase
					
							end
					3'b010: begin
							case(mD)
										2'b00:begin
													rD2=1;
													enb=0;
													selectY=2'b0;
													selectX=2'b11;
													fSel=3'b001;
													selectReg=2'b11;
													
												end
										2'b01:begin
													rD2=1;selectX=2'b10;
													enb=0;
													selectY=2'b0;
													rD1=1;selectReg=2'b11;
													fSel=3'b001;													
												end
							endcase
					
							end
					3'b011: begin
							end
					3'b100: begin
							case(mD)
										2'b00:begin
													selectX=2'b11;rD2=1;
													selectReg=2'b11;fSel=3'b110;
													selectY=2'b0;
													enb=0;	
												end
										2'b01:begin
													rD2=1;selectX=2'b10;
													selectY=2'b0;
													rD1=1;selectReg=2'b11;
													enb=0;fSel=3'b110;													
												end
							endcase
					
							end
						3'b101: begin
							case(mD)
										2'b00:begin
													fSel=3'b101;
													rD2=1;selectReg=2'b11;
													selectY=2'b0;
													enb=0;
													selectX=2'b11;
												end
										2'b01:begin
													selectX=2'b10;rD1=1;	
													fSel=3'b101;
													selectReg=2'b11;
													enb=0;rD2=1;
													selectY=2'b0;
												end
							endcase
					
							end
					endcase
				end
	    
	endcase
end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:30 11/04/2016 
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

module datapath(IR,reset,clk,c,z,s,v,selectX,selectY,fSelect,we,selectReg,tst,enb,selectJ,rD1,rd2,wr);

output [15:0] IR;
output c;
output z;
output s;
output v;

input selectJ;
input reset;
input clk;
input rD1,rd2;
input wr,we;
input tst;
input enb;
input [1:0] selectX;
input [1:0] selectY;
input [1:0] selectReg;
input [2:0] fSelect;

wire t1,t2;
wire [15:0] muxD,outPC,adderPC;
wire [15:0] out1,out2,val,X,Y;
wire [15:0] t3,Z,K;

alu  alu1(X,Y,Z,fSelect,c,v,s,z);
memory dMemo(clk,Z,K,1'b1,we,1'b1,reset,1'b0);
regN pc11(1'b1,reset,muxD,outPC,clk);
regBank RBank(IR[5:3],IR[10:8],IR[10:8],rD1,rd2,wr,val,out1,out2,reset,clk);
sign_extend sedgfth1(IR[5:0],t3,enb);
add_16 PCadder1(adderPC,16'b01,outPC,t1,t2);
_16_mux4to1 Xa1(adderPC,16'b0,out1,t3,selectX,X);
_16_mux4to1 Ya1(out2,16'b0,t3,16'b0,selectY,Y);
memory iMem1(clk,outPC,IR,1'b1,1'b0,1'b1,reset,1'b1);

tristate Kt(out2,K,tst);
_16_mux4to1 kand(adderPC,16'bz,K,Z,selectReg,val);
_16_mux2to1 msc(adderPC,Z,selectJ,muxD);

endmodule



module _16_mux2to1(in1,in2,sel,out);
output [15:0] out;
input [15:0] in1;
input [15:0] in2;

input sel;
assign out = (sel==1'b0)? in1:in2;
endmodule

 //mux 4to1

 
 module _16_mux4to1(in1,in2,in3,in4,sel,out);
 input [1:0] sel;
 output [15:0] out;
 input [15:0]in1;
 input [15:0] in2,in3,in4;
 reg [15:0] out;
always @(*)
begin
if(sel == 2'b01) out = in2;
else if(sel == 2'b10) out = in3;
else if(sel == 2'b00) out = in1;
else out = in4;
end
 endmodule
// mux 8to1
module mux8to1(a,sel,out);
   input [2:0] sel;
  output out;
  input [7:0] a;
 
  wire muxT[2:0];
 
  mux4to1 m1 (a[7:4],sel[1:0],muxT[1]),
  m2 (a[3:0],sel[1:0],muxT[0]);
  mux2to1 m3 (muxT[1],muxT[0],sel[2],out);
endmodule

module regN (load,reset, D, Q,clk);    
parameter N = 16; 
input reset;
input load;
input clk;
input [N-1:0] D;
output [N-1:0] Q;


reg [N-1:0] Q;
always @(negedge clk)
if (reset)
Q = 0;
else if(load) 
Q = D;
endmodule 


module tristate (a,b,enable);
  output [15:0] b;
   input enable;
 input [15:0] a;
assign b = (enable) ? a : 16'bz;
endmodule

module regBank(inA,inB,wpa,rdA,rdB,wR,valu,out1,out2,reset,clk);
input [2:0]inA,inB, wpa;
input rdA, rdB, wR, reset, clk;
input [15:0] valu;
output [15:0]out1, out2;

wire [15:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7;

 
regN rr0(wR&(!wpa[2])&(!wpa[1])&(!wpa[0]),reset, valu, temp0,clk);
regN rr1(wR&(!wpa[2])&(!wpa[1])&wpa[0],reset, valu, temp1,clk);
regN rr2(wR&(!wpa[2])&(wpa[1])&(!wpa[0]),reset, valu, temp2,clk);
regN rr3(wR&(!wpa[2])&wpa[1]&wpa[0],reset, valu, temp3,clk);
regN rr4(wR&(wpa[2])&(!wpa[1])&(!wpa[0]),reset, valu, temp4,clk);
regN rr5(wR&(wpa[2])&(!wpa[1])&wpa[0],reset, valu, temp5,clk);
regN rr6(wR&(wpa[2])&wpa[1]&(!wpa[0]),reset, valu, temp6,clk);
regN rr7(wR&(wpa[2])&wpa[1]&wpa[0],reset, valu, temp7,clk);

tristate tr0(temp0,out1,rdA&(!inA[2])&(!inA[1])&(!inA[0]));
tristate tr1(temp1,out1,rdA&(!inA[2])&(!inA[1])&(inA[0]));
tristate tr2(temp2,out1,rdA&(!inA[2])&(inA[1])&(!inA[0]));
tristate tr3(temp3,out1,rdA&(!inA[2])&(inA[1])&(inA[0]));
tristate tr4(temp4,out1,rdA&(inA[2])&(!inA[1])&(!inA[0]));
tristate tr5(temp5,out1,rdA&(inA[2])&(!inA[1])&(inA[0]));
tristate tr6(temp6,out1,rdA&(inA[2])&(inA[1])&(!inA[0]));
tristate tr7(temp7,out1,rdA&(inA[2])&(inA[1])&(inA[0]));

tristate tr00(temp0,out2,rdB&(!inB[2])&(!inB[1])&(!inB[0]));
tristate tr10(temp1,out2,rdB&(!inB[2])&(!inB[1])&(inB[0]));
tristate tr20(temp2,out2,rdB&(!inB[2])&(inB[1])&(!inB[0]));
tristate tr30(temp3,out2,rdB&(!inB[2])&(inB[1])&(inB[0]));
tristate tr40(temp4,out2,rdB&(inB[2])&(!inB[1])&(!inB[0]));
tristate tr50(temp5,out2,rdB&(inB[2])&(!inB[1])&(inB[0]));
tristate tr60(temp6,out2,rdB&(inB[2])&(inB[1])&(!inB[0]));
tristate tr70(temp7,out2,rdB&(inB[2])&(inB[1])&(inB[0]));
 

endmodule

module memory (clk , addr , dataB , cS  , wE ,oE  ,reset,flag1); 

parameter D_WIDTH = 16 ;
parameter A_WIDTH = 16;
parameter R_DEPTH = 1 << A_WIDTH;

input                  clk         ;
input [A_WIDTH-1:0] addr     ;
input                  cS          ;
input                  wE          ;
input                  oE          ; 
input reset;
input flag1;

inout [D_WIDTH-1:0]  dataB       ;


reg [D_WIDTH-1:0] data_out ;
reg [D_WIDTH-1:0] mem [0:R_DEPTH-1];
reg                  oe_r;

assign dataB = (cS && oE && !wE) ? data_out : 8'bz; 
 always @ (reset)
  begin
    if (reset==1&&flag1==1)
      begin
        mem[0] = 16'b0000000000000001;// li r0,1
        mem[1] = 16'b0000001101000000;// mov r3,r0
        mem[2] = 16'b0100000000000001;//addi r0,1
        mem[3] = 16'b0000000101000000;//lr r1,r0
        mem[4] = 16'b0000001100000101;//li r3,5
        mem[5] = 16'b0100101100000001;//subi r3,1
        mem[6] = 16'b0000001001011000;//lr r2,r3
        mem[7] = 16'b0100101000000001;//subi r2,1
        mem[8] = 16'b0101001001001000;//mnsr r2,r1
        mem[9] = 16'b1000100000000000;//jnz ... (-4){as PC will be 14 while reading -4}
        mem[10] = 16'b1111111111111100;//
        mem[11] = 16'b1111111111111111;//exit
      end
  end

always @ (posedge clk)
begin : MEM_WRITE
   if ( cS && wE ) begin
       mem[addr] = dataB;
   end
end
always @ (posedge clk)
begin : MEM_READ
  if (cS && !wE && oE ) begin
    data_out = mem[addr];
    oe_r = 1;
  end else begin
    oe_r = 0;
  end
end

endmodule 

module mux4to1(a,sel,out);
  output out;
  input [3:0] a;
  input [1:0] sel;
  
  wire mux[2:0];
 
  mux2to1 mu1 (a[3],a[2],sel[0],mux[1];
  mux2to1 mu2 (a[1],a[0],sel[0],mux[0]);
  mux2to1 mu3 (mux[1],mux[0],sel[1],out);
endmodule

module sign_extend(x1,x2,enb);
output [15:0]x2;
input [5:0]x1;

input enb;
reg [15:0]x2;
always@(*)
begin
x2=16'b0;
if(enb==1'b1) begin
							x2[4:0] = x1[4:0];
							x2[15] = (x1[5]==1)?1:0;
					  end
else begin
			x2[1:0] = x1[1:0];
			x2[15] = (x1[2]==1)?1:0;
	  end
end
endmodule

 
//  000=Z=X f_sel
  //010=Z=X+Y
 // 001=Z=Y-X
  // 011=Z=X
  //100 = complement
  // 101 = or 
  // 110 = and 
  // 111 = zero;
 
 
module alu(xBus,yBus,zBus,select,c,v,s,z);
  output [15:0] zBus;
  output c,v,s,z;
    input[15:0] xBus;
  input [2:0] select;
  wire v_sum,c_sum,v_sub,c_sub,nz,tempa,tempb;
  input[15:0] yBus;

 
  wire [15:0] yOut,sumOut,out_sub,o5,o4,o6,cmp1;
  add_16 ad(sumOut, xBus, yBus,c_sum,v_sum);
  sub_16 sb(out_sub, xBus, yBus,c_sub,v_sub);
 
  generate 
    genvar k;
    for(k=0;k<16;k=k+1)
    begin:some
      not n(cmp1[k],xBus[k]);        
      and a(o6[k],xBus[k],yBus[k]);  
      or org(o5[k],xBus[k],yBus[k]);  
    end
  endgenerate
 
  add_16 cpm2(o4,cmp1,1,tempa,tempb);
 
      mux8to1 m0 ({1'b0,o6[0],o5[0],o4[0],xBus[0],sumOut[0],out_sub[0],xBus[0]},select[2:0],zBus[0]);
  mux8to1 m1 ({1'b0,o6[1],o5[1],o4[1],xBus[1],sumOut[1],out_sub[1],xBus[1]},select[2:0],zBus[1]);
  mux8to1 m2 ({1'b0,o6[2],o5[2],o4[2],xBus[2],sumOut[2],out_sub[2],xBus[2]},select[2:0],zBus[2]);
  mux8to1 m3 ({1'b0,o6[3],o5[3],o4[3],xBus[3],sumOut[3],out_sub[3],xBus[3]},select[2:0],zBus[3]);
  mux8to1 m4 ({1'b0,o6[4],o5[4],o4[4],xBus[4],sumOut[4],out_sub[4],xBus[4]},select[2:0],zBus[4]);
  mux8to1 m5 ({1'b0,o6[5],o5[5],o4[5],xBus[5],sumOut[5],out_sub[5],xBus[5]},select[2:0],zBus[5]);
  mux8to1 m6 ({1'b0,o6[6],o5[6],o4[6],xBus[6],sumOut[6],out_sub[6],xBus[6]},select[2:0],zBus[6]);
  mux8to1 m7 ({1'b0,o6[7],o5[7],o4[7],xBus[7],sumOut[7],out_sub[7],xBus[7]},select[2:0],zBus[7]);
  mux8to1 m8 ({1'b0,o6[8],o5[8],o4[8],xBus[8],sumOut[8],out_sub[8],xBus[8]},select[2:0],zBus[8]);
  mux8to1 m9 ({1'b0,o6[9],o5[9],o4[9],xBus[9],sumOut[9],out_sub[9],xBus[9]},select[2:0],zBus[9]);
  mux8to1 m10 ({1'b0,o6[10],o5[10],o4[10],xBus[10],sumOut[10],out_sub[10],xBus[10]},select[2:0],zBus[10]);
  mux8to1 m11 ({1'b0,o6[11],o5[11],o4[11],xBus[11],sumOut[11],out_sub[11],xBus[11]},select[2:0],zBus[11]);
  mux8to1 m12 ({1'b0,o6[12],o5[12],o4[12],xBus[12],sumOut[12],out_sub[12],xBus[12]},select[2:0],zBus[12]);
  mux8to1 m13 ({1'b0,o6[13],o5[13],o4[13],xBus[13],sumOut[13],out_sub[13],xBus[13]},select[2:0],zBus[13]);
  mux8to1 m14 ({1'b0,o6[14],o5[14],o4[14],xBus[14],sumOut[14],out_sub[14],xBus[14]},select[2:0],zBus[14]);
  mux8to1 m15 ({1'b0,o6[15],o5[15],o4[15],xBus[15],sumOut[15],out_sub[15],xBus[15]},select[2:0],zBus[15]);
  mux8to1 m16 ({1'b0,1'b0,1'b0,1'b0,1'b0,c_sum,c_sub,1'b0},select[2:0],c);
  mux8to1 m17 ({1'b0,1'b0,1'b0,1'b0,1'b0,v_sum,v_sub,1'b0},select[2:0],v);
 
 
  and a1(s,1,zBus[15]);
  or o1(nz,zBus[0],zBus[1],zBus[2],zBus[3],zBus[4],zBus[5],zBus[6],zBus[7],zBus[8],zBus[9],zBus[10],zBus[11],zBus[12],zBus[13],zBus[14],zBus[15]);
  not n1(z,nz);
endmodule
 
//a-b
module sub_16(sub, b,a,c,v);
  input [15:0] a,b;
  output [15:0] sub;
  output c,v;
  wire [15:0] nb;         //stores not of x
  wire [15:0] notb_inc;
  wire tempa,tempb;
 
  //loop to get 1s complement of x
 
      not n0(nb[0],b[0]);
      not n1(nb[1],b[1]);
      not n2(nb[2],b[2]);
      not n3(nb[3],b[3]);
      not n4(nb[4],b[4]);
      not n5(nb[5],b[5]);
      not n6(nb[6],b[6]);
      not n7(nb[7],b[7]);
      not n8(nb[8],b[8]);
  not n9(nb[9],b[9]);
  not n10(nb[10],b[10]);
  not n11(nb[11],b[11]);
  not n12(nb[12],b[12]);
  not n13(nb[13],b[13]);
  not n14(nb[14],b[14]);
  not n15(nb[15],b[15]);
 
 
//adding 1 to 1s complement of x to get 2s complement
  add_16 a1(notb_inc,nb,1,tempa,tempb);
  add_16 a2(sub,notb_inc,a,c,v);
endmodule
 
 
module add_16(SUM,aa,bb,c,v);
  input [15:0] aa,bb;
  output [15:0] SUM;
  output c,v;
  wire [16:0]carry;
  wire sg,nsg;
 
  assign carry[0] = 0;
 
 
      fa f0(SUM[0],carry[1],aa[0],bb[0],carry[0]);
      fa f1(SUM[1],carry[2],aa[1],bb[1],carry[1]);
      fa f2(SUM[2],carry[3],aa[2],bb[2],carry[2]);
      fa f3(SUM[3],carry[4],aa[3],bb[3],carry[3]);
      fa f4(SUM[4],carry[5],aa[4],bb[4],carry[4]);
      fa f5(SUM[5],carry[6],aa[5],bb[5],carry[5]);
      fa f6(SUM[6],carry[7],aa[6],bb[6],carry[6]);
      fa f7(SUM[7],carry[8],aa[7],bb[7],carry[7]);
      fa f8(SUM[8],carry[9],aa[8],bb[8],carry[8]);
      fa f9(SUM[9],carry[10],aa[9],bb[9],carry[9]);
  fa f10(SUM[10],carry[11],aa[10],bb[10],carry[10]);
  fa f11(SUM[11],carry[12],aa[11],bb[11],carry[11]);
  fa f12(SUM[12],carry[13],aa[12],bb[12],carry[12]);
  fa f13(SUM[13],carry[14],aa[13],bb[13],carry[13]);
  fa f14(SUM[14],carry[15],aa[14],bb[14],carry[14]);
  fa f15(SUM[15],carry[16],aa[15],bb[15],carry[15]);
  xor a1(v,carry[15],carry[16]);
  or o1(c,0,carry[16]);
 
 
endmodule
 
module fa(s,co,a,b,ci);
    output s,co;
    input a,b,ci;
    wire n1,n2,n3;
 
    xor u1(s,a,b,ci);
    and u2(n1,a,b);
    and u3(n2,b,ci);
    and u4(n3,a,ci);
    or u5(co,n1,n2,n3);
 
endmodule



module mux2to1(a,b,sel,out);
  output out;
  input a;
  input b;
  input sel;
  
  tri out;
  bufif1 (out,a,sel);
  bufif0 (out,b,sel);
endmodule



//TestBench

module test;

	reg rst;
	reg clk;

	top_module uut (
		.rst(rst), 
		.clk(clk)
	);

	initial begin
		// Input Initiaization
		clk = 0;
		rst = 1;

		// Wait 100 ns to finish global reset
		#10
		rst = 0;
	end
	
	always
	#1 clk = ~clk;
      
endmodule