////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: display_translate.v
// /___/   /\     Timestamp: Fri Jul 28 16:04:51 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -filter C:/Users/student/Desktop/1/assgn1/iseconfig/filter.filter -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim display.ngd display_translate.v 
// Device	: 3s400pq208-4
// Input file	: display.ngd
// Output file	: C:\Users\student\Desktop\1\assgn1\netgen\translate\display_translate.v
// # of Modules	: 1
// Design Name	: display
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module display (
  rst, x, z, clki, disp
);
  input rst;
  input x;
  output z;
  input clki;
  output [8 : 0] disp;
  wire clki_BUFGP;
  wire \cou/chng ;
  wire \cou/cnt_6 ;
  wire \cou/cnt1 ;
  wire \cou/nold ;
  wire \cou/old_9 ;
  wire \cou/z_10 ;
  wire \cou/z_not0001 ;
  wire disp_1_OBUF_21;
  wire disp_6_OBUF_22;
  wire rst_IBUF_24;
  wire x_IBUF_26;
  wire \clki_BUFGP/IBUFG_2 ;
  wire GND;
  wire VCC;
  X_ZERO   XST_GND (
    .O(disp_6_OBUF_22)
  );
  X_ONE   XST_VCC (
    .O(disp_1_OBUF_21)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  \cou/z  (
    .CLK(clki_BUFGP),
    .CE(\cou/z_not0001 ),
    .I(\cou/chng ),
    .O(\cou/z_10 ),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \cou/cnt  (
    .CLK(clki_BUFGP),
    .I(\cou/cnt1 ),
    .SRST(rst_IBUF_24),
    .SSET(\cou/chng ),
    .O(\cou/cnt_6 ),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_SFF #(
    .INIT ( 1'b0 ))
  \cou/old  (
    .CLK(clki_BUFGP),
    .CE(\cou/chng ),
    .I(\cou/nold ),
    .SRST(rst_IBUF_24),
    .O(\cou/old_9 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h6 ))
  \cou/Mxor_chng_Result1  (
    .ADR0(x_IBUF_26),
    .ADR1(\cou/old_9 ),
    .O(\cou/chng )
  );
  X_BUF   rst_IBUF (
    .I(rst),
    .O(rst_IBUF_24)
  );
  X_BUF   x_IBUF (
    .I(x),
    .O(x_IBUF_26)
  );
  X_LUT4 #(
    .INIT ( 16'h2331 ))
  \cou/z_not00011  (
    .ADR0(x_IBUF_26),
    .ADR1(rst_IBUF_24),
    .ADR2(\cou/cnt_6 ),
    .ADR3(\cou/old_9 ),
    .O(\cou/z_not0001 )
  );
  X_INV   \cou/nold1_INV_0  (
    .I(\cou/old_9 ),
    .O(\cou/nold )
  );
  X_INV   \cou/cnt11_INV_0  (
    .I(\cou/cnt_6 ),
    .O(\cou/cnt1 )
  );
  X_IPAD #(
    .LOC ( "P189" ))
  clki_25 (
    .PAD(clki)
  );
  X_OPAD #(
    .LOC ( "P120" ))
  \disp<0>  (
    .PAD(disp[0])
  );
  X_OPAD #(
    .LOC ( "P124" ))
  \disp<1>  (
    .PAD(disp[1])
  );
  X_OPAD #(
    .LOC ( "P123" ))
  \disp<2>  (
    .PAD(disp[2])
  );
  X_OPAD #(
    .LOC ( "P126" ))
  \disp<3>  (
    .PAD(disp[3])
  );
  X_OPAD #(
    .LOC ( "P125" ))
  \disp<4>  (
    .PAD(disp[4])
  );
  X_OPAD #(
    .LOC ( "P130" ))
  \disp<5>  (
    .PAD(disp[5])
  );
  X_OPAD #(
    .LOC ( "P128" ))
  \disp<6>  (
    .PAD(disp[6])
  );
  X_OPAD #(
    .LOC ( "P117" ))
  \disp<7>  (
    .PAD(disp[7])
  );
  X_OPAD #(
    .LOC ( "P178" ))
  \disp<8>  (
    .PAD(disp[8])
  );
  X_IPAD #(
    .LOC ( "P190" ))
  rst_35 (
    .PAD(rst)
  );
  X_IPAD #(
    .LOC ( "P191" ))
  x_36 (
    .PAD(x)
  );
  X_OPAD #(
    .LOC ( "P139" ))
  z_37 (
    .PAD(z)
  );
  X_CKBUF   \clki_BUFGP/BUFG  (
    .I(\clki_BUFGP/IBUFG_2 ),
    .O(clki_BUFGP)
  );
  X_CKBUF   \clki_BUFGP/IBUFG  (
    .I(clki),
    .O(\clki_BUFGP/IBUFG_2 )
  );
  X_OBUF   disp_0_OBUF (
    .I(\cou/cnt1 ),
    .O(disp[0])
  );
  X_OBUF   disp_1_OBUF (
    .I(disp_1_OBUF_21),
    .O(disp[1])
  );
  X_OBUF   disp_2_OBUF (
    .I(disp_1_OBUF_21),
    .O(disp[2])
  );
  X_OBUF   disp_3_OBUF (
    .I(\cou/cnt1 ),
    .O(disp[3])
  );
  X_OBUF   disp_4_OBUF (
    .I(\cou/cnt1 ),
    .O(disp[4])
  );
  X_OBUF   disp_5_OBUF (
    .I(\cou/cnt1 ),
    .O(disp[5])
  );
  X_OBUF   disp_6_OBUF (
    .I(disp_6_OBUF_22),
    .O(disp[6])
  );
  X_OBUF   disp_7_OBUF (
    .I(disp_1_OBUF_21),
    .O(disp[7])
  );
  X_OBUF   disp_8_OBUF (
    .I(disp_1_OBUF_21),
    .O(disp[8])
  );
  X_OBUF   z_OBUF (
    .I(\cou/z_10 ),
    .O(z)
  );
  X_ZERO   NlwBlock_display_GND (
    .O(GND)
  );
  X_ONE   NlwBlock_display_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

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
    reg JTAG_RUNTEST_GLBL;

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

`endif

