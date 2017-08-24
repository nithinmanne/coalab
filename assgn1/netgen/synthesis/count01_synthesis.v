////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: K.39
//  \   \         Application: netgen
//  /   /         Filename: count01_synthesis.v
// /___/   /\     Timestamp: Fri Jul 21 13:49:56 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim count01.ngc count01_synthesis.v 
// Device	: xc3s400-4-pq208
// Input file	: count01.ngc
// Output file	: C:\assgn1\netgen\synthesis\count01_synthesis.v
// # of Modules	: 1
// Design Name	: count01
// Xilinx        : C:\Xilinx\10.1\ISE
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module count01 (
  clk, x, z
);
  input clk;
  input x;
  output z;
  wire N1;
  wire chng;
  wire chng_inv;
  wire chq;
  wire clk_BUFGP_5;
  wire cnt_6;
  wire cnt1;
  wire nold;
  wire old_9;
  wire x_IBUF_11;
  wire z_OBUF_13;
  VCC   XST_VCC (
    .P(N1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  old (
    .C(clk_BUFGP_5),
    .CE(chng),
    .D(nold),
    .Q(old_9)
  );
  FDS #(
    .INIT ( 1'b0 ))
  cnt (
    .C(clk_BUFGP_5),
    .D(cnt1),
    .S(chng),
    .Q(cnt_6)
  );
  FDRE   z_4 (
    .C(clk_BUFGP_5),
    .CE(chq),
    .D(N1),
    .R(chng_inv),
    .Q(z_OBUF_13)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  Mxor_chq_Result1 (
    .I0(cnt_6),
    .I1(old_9),
    .O(chq)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  Mxor_chng_Result1 (
    .I0(x_IBUF_11),
    .I1(old_9),
    .O(chng)
  );
  IBUF   x_IBUF (
    .I(x),
    .O(x_IBUF_11)
  );
  OBUF   z_OBUF (
    .I(z_OBUF_13),
    .O(z)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  chng_inv1 (
    .I0(x_IBUF_11),
    .I1(old_9),
    .O(chng_inv)
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_5)
  );
  INV   nold1_INV_0 (
    .I(old_9),
    .O(nold)
  );
  INV   cnt11_INV_0 (
    .I(cnt_6),
    .O(cnt1)
  );
endmodule


`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire PRLD;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

