////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: display_timesim.v
// /___/   /\     Timestamp: Fri Jul 28 16:02:26 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -filter C:/Users/student/Desktop/1/assgn1/iseconfig/filter.filter -intstyle ise -s 4 -pcf display.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers false -w -dir netgen/par -ofmt verilog -sim display.ncd display_timesim.v 
// Device	: 3s400pq208-4 (PRODUCTION 1.39 2013-10-13)
// Input file	: display.ncd
// Output file	: C:\Users\student\Desktop\1\assgn1\netgen\par\display_timesim.v
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
  wire x_IBUF_64;
  wire \cou/z_65 ;
  wire \cou/cnt_67 ;
  wire rst_IBUF_70;
  wire clki_BUFGP;
  wire \cou/old_73 ;
  wire \cou/chng_0 ;
  wire \x/INBUF ;
  wire \z/O ;
  wire \clki/INBUF ;
  wire \disp<0>/O ;
  wire \disp<1>/O ;
  wire \disp<2>/O ;
  wire \disp<3>/O ;
  wire \disp<4>/O ;
  wire \disp<5>/O ;
  wire \disp<6>/O ;
  wire \disp<7>/O ;
  wire \disp<8>/O ;
  wire \rst/INBUF ;
  wire \clki_BUFGP/BUFG/S_INVNOT ;
  wire \clki_BUFGP/BUFG/I0_INV ;
  wire \cou/z_not0001_pack_3 ;
  wire \cou/z/DYMUX_200 ;
  wire \cou/z/GYMUX_199 ;
  wire \cou/chng ;
  wire \cou/z/CLKINV_190 ;
  wire \cou/z/CEINV_189 ;
  wire \cou/cnt/DXMUX_222 ;
  wire \cou/cnt/REVUSED_220 ;
  wire \cou/cnt/SRINV_218 ;
  wire \cou/cnt/CLKINV_217 ;
  wire \cou/old/DYMUX_237 ;
  wire \cou/old/SRINV_235 ;
  wire \cou/old/CLKINV_234 ;
  wire \cou/old/CEINV_233 ;
  wire \disp<1>/OUTPUT/OFF/O1INV_110 ;
  wire \disp<2>/OUTPUT/OFF/O1INV_118 ;
  wire \disp<6>/OUTPUT/OFF/O1INV_150 ;
  wire \disp<7>/OUTPUT/OFF/O1INV_158 ;
  wire \disp<8>/OUTPUT/OFF/O1INV_166 ;
  wire GND;
  wire VCC;
  initial $sdf_annotate("netgen/par/display_timesim.sdf");
  X_IPAD #(
    .LOC ( "PAD29" ))
  \x/PAD  (
    .PAD(x)
  );
  X_BUF #(
    .LOC ( "PAD29" ))
  x_IBUF (
    .I(x),
    .O(\x/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD89" ))
  \z/PAD  (
    .PAD(z)
  );
  X_OBUF #(
    .LOC ( "PAD89" ))
  z_OBUF (
    .I(\z/O ),
    .O(z)
  );
  X_IPAD #(
    .LOC ( "PAD31" ))
  \clki/PAD  (
    .PAD(clki)
  );
  X_BUF #(
    .LOC ( "PAD31" ))
  \clki_BUFGP/IBUFG  (
    .I(clki),
    .O(\clki/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD119" ))
  \disp<0>/PAD  (
    .PAD(disp[0])
  );
  X_OBUF #(
    .LOC ( "PAD119" ))
  disp_0_OBUF (
    .I(\disp<0>/O ),
    .O(disp[0])
  );
  X_OPAD #(
    .LOC ( "PAD116" ))
  \disp<1>/PAD  (
    .PAD(disp[1])
  );
  X_OBUF #(
    .LOC ( "PAD116" ))
  disp_1_OBUF (
    .I(\disp<1>/O ),
    .O(disp[1])
  );
  X_OPAD #(
    .LOC ( "PAD117" ))
  \disp<2>/PAD  (
    .PAD(disp[2])
  );
  X_OBUF #(
    .LOC ( "PAD117" ))
  disp_2_OBUF (
    .I(\disp<2>/O ),
    .O(disp[2])
  );
  X_OPAD #(
    .LOC ( "PAD106" ))
  \disp<3>/PAD  (
    .PAD(disp[3])
  );
  X_OBUF #(
    .LOC ( "PAD106" ))
  disp_3_OBUF (
    .I(\disp<3>/O ),
    .O(disp[3])
  );
  X_OPAD #(
    .LOC ( "PAD115" ))
  \disp<4>/PAD  (
    .PAD(disp[4])
  );
  X_OBUF #(
    .LOC ( "PAD115" ))
  disp_4_OBUF (
    .I(\disp<4>/O ),
    .O(disp[4])
  );
  X_OPAD #(
    .LOC ( "PAD104" ))
  \disp<5>/PAD  (
    .PAD(disp[5])
  );
  X_OBUF #(
    .LOC ( "PAD104" ))
  disp_5_OBUF (
    .I(\disp<5>/O ),
    .O(disp[5])
  );
  X_OPAD #(
    .LOC ( "PAD105" ))
  \disp<6>/PAD  (
    .PAD(disp[6])
  );
  X_OBUF #(
    .LOC ( "PAD105" ))
  disp_6_OBUF (
    .I(\disp<6>/O ),
    .O(disp[6])
  );
  X_OPAD #(
    .LOC ( "PAD121" ))
  \disp<7>/PAD  (
    .PAD(disp[7])
  );
  X_OBUF #(
    .LOC ( "PAD121" ))
  disp_7_OBUF (
    .I(\disp<7>/O ),
    .O(disp[7])
  );
  X_OPAD #(
    .LOC ( "PAD39" ))
  \disp<8>/PAD  (
    .PAD(disp[8])
  );
  X_OBUF #(
    .LOC ( "PAD39" ))
  disp_8_OBUF (
    .I(\disp<8>/O ),
    .O(disp[8])
  );
  X_IPAD #(
    .LOC ( "PAD30" ))
  \rst/PAD  (
    .PAD(rst)
  );
  X_BUF #(
    .LOC ( "PAD30" ))
  rst_IBUF (
    .I(rst),
    .O(\rst/INBUF )
  );
  X_BUFGMUX #(
    .LOC ( "BUFGMUX6" ))
  \clki_BUFGP/BUFG  (
    .I0(\clki_BUFGP/BUFG/I0_INV ),
    .I1(GND),
    .S(\clki_BUFGP/BUFG/S_INVNOT ),
    .O(clki_BUFGP)
  );
  X_INV #(
    .LOC ( "BUFGMUX6" ))
  \clki_BUFGP/BUFG/SINV  (
    .I(1'b1),
    .O(\clki_BUFGP/BUFG/S_INVNOT )
  );
  X_BUF #(
    .LOC ( "BUFGMUX6" ))
  \clki_BUFGP/BUFG/I0_USED  (
    .I(\clki/INBUF ),
    .O(\clki_BUFGP/BUFG/I0_INV )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y57" ))
  \cou/z/DYMUX  (
    .I(\cou/z/GYMUX_199 ),
    .O(\cou/z/DYMUX_200 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y57" ))
  \cou/z/YUSED  (
    .I(\cou/z/GYMUX_199 ),
    .O(\cou/chng_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y57" ))
  \cou/z/GYMUX  (
    .I(\cou/chng ),
    .O(\cou/z/GYMUX_199 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y57" ))
  \cou/z/CLKINV  (
    .I(clki_BUFGP),
    .O(\cou/z/CLKINV_190 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y57" ))
  \cou/z/CEINV  (
    .I(\cou/z_not0001_pack_3 ),
    .O(\cou/z/CEINV_189 )
  );
  X_INV #(
    .LOC ( "SLICE_X33Y56" ))
  \cou/cnt/DXMUX  (
    .I(\cou/cnt_67 ),
    .O(\cou/cnt/DXMUX_222 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y56" ))
  \cou/cnt/REVUSED  (
    .I(\cou/chng_0 ),
    .O(\cou/cnt/REVUSED_220 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y56" ))
  \cou/cnt/SRINV  (
    .I(rst_IBUF_70),
    .O(\cou/cnt/SRINV_218 )
  );
  X_BUF #(
    .LOC ( "SLICE_X33Y56" ))
  \cou/cnt/CLKINV  (
    .I(clki_BUFGP),
    .O(\cou/cnt/CLKINV_217 )
  );
  X_INV #(
    .LOC ( "SLICE_X32Y56" ))
  \cou/old/DYMUX  (
    .I(\cou/old_73 ),
    .O(\cou/old/DYMUX_237 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y56" ))
  \cou/old/SRINV  (
    .I(rst_IBUF_70),
    .O(\cou/old/SRINV_235 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y56" ))
  \cou/old/CLKINV  (
    .I(clki_BUFGP),
    .O(\cou/old/CLKINV_234 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y56" ))
  \cou/old/CEINV  (
    .I(\cou/chng_0 ),
    .O(\cou/old/CEINV_233 )
  );
  X_BUF #(
    .LOC ( "PAD29" ))
  \x/IFF/IMUX  (
    .I(\x/INBUF ),
    .O(x_IBUF_64)
  );
  X_BUF #(
    .LOC ( "PAD30" ))
  \rst/IFF/IMUX  (
    .I(\rst/INBUF ),
    .O(rst_IBUF_70)
  );
  X_LUT4 #(
    .INIT ( 16'h5A5A ),
    .LOC ( "SLICE_X32Y57" ))
  \cou/Mxor_chng_Result1  (
    .ADR0(x_IBUF_64),
    .ADR1(VCC),
    .ADR2(\cou/old_73 ),
    .ADR3(VCC),
    .O(\cou/chng )
  );
  X_FF #(
    .LOC ( "SLICE_X32Y57" ),
    .INIT ( 1'b0 ))
  \cou/z  (
    .I(\cou/z/DYMUX_200 ),
    .CE(\cou/z/CEINV_189 ),
    .CLK(\cou/z/CLKINV_190 ),
    .SET(GND),
    .RST(GND),
    .O(\cou/z_65 )
  );
  X_LUT4 #(
    .INIT ( 16'h2331 ),
    .LOC ( "SLICE_X32Y57" ))
  \cou/z_not00011  (
    .ADR0(x_IBUF_64),
    .ADR1(rst_IBUF_70),
    .ADR2(\cou/old_73 ),
    .ADR3(\cou/cnt_67 ),
    .O(\cou/z_not0001_pack_3 )
  );
  X_SFF #(
    .LOC ( "SLICE_X33Y56" ),
    .INIT ( 1'b0 ))
  \cou/cnt  (
    .I(\cou/cnt/DXMUX_222 ),
    .CE(VCC),
    .CLK(\cou/cnt/CLKINV_217 ),
    .SET(GND),
    .RST(GND),
    .SSET(\cou/cnt/REVUSED_220 ),
    .SRST(\cou/cnt/SRINV_218 ),
    .O(\cou/cnt_67 )
  );
  X_SFF #(
    .LOC ( "SLICE_X32Y56" ),
    .INIT ( 1'b0 ))
  \cou/old  (
    .I(\cou/old/DYMUX_237 ),
    .CE(\cou/old/CEINV_233 ),
    .CLK(\cou/old/CLKINV_234 ),
    .SET(GND),
    .RST(GND),
    .SSET(GND),
    .SRST(\cou/old/SRINV_235 ),
    .O(\cou/old_73 )
  );
  X_BUF #(
    .LOC ( "PAD89" ))
  \z/OUTPUT/OFF/OMUX  (
    .I(\cou/z_65 ),
    .O(\z/O )
  );
  X_INV #(
    .LOC ( "PAD119" ))
  \disp<0>/OUTPUT/OFF/OMUX  (
    .I(\cou/cnt_67 ),
    .O(\disp<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD116" ))
  \disp<1>/OUTPUT/OFF/OMUX  (
    .I(\disp<1>/OUTPUT/OFF/O1INV_110 ),
    .O(\disp<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD116" ))
  \disp<1>/OUTPUT/OFF/O1INV  (
    .I(1'b1),
    .O(\disp<1>/OUTPUT/OFF/O1INV_110 )
  );
  X_BUF #(
    .LOC ( "PAD117" ))
  \disp<2>/OUTPUT/OFF/OMUX  (
    .I(\disp<2>/OUTPUT/OFF/O1INV_118 ),
    .O(\disp<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD117" ))
  \disp<2>/OUTPUT/OFF/O1INV  (
    .I(1'b1),
    .O(\disp<2>/OUTPUT/OFF/O1INV_118 )
  );
  X_INV #(
    .LOC ( "PAD106" ))
  \disp<3>/OUTPUT/OFF/OMUX  (
    .I(\cou/cnt_67 ),
    .O(\disp<3>/O )
  );
  X_INV #(
    .LOC ( "PAD115" ))
  \disp<4>/OUTPUT/OFF/OMUX  (
    .I(\cou/cnt_67 ),
    .O(\disp<4>/O )
  );
  X_INV #(
    .LOC ( "PAD104" ))
  \disp<5>/OUTPUT/OFF/OMUX  (
    .I(\cou/cnt_67 ),
    .O(\disp<5>/O )
  );
  X_BUF #(
    .LOC ( "PAD105" ))
  \disp<6>/OUTPUT/OFF/OMUX  (
    .I(\disp<6>/OUTPUT/OFF/O1INV_150 ),
    .O(\disp<6>/O )
  );
  X_BUF #(
    .LOC ( "PAD105" ))
  \disp<6>/OUTPUT/OFF/O1INV  (
    .I(1'b0),
    .O(\disp<6>/OUTPUT/OFF/O1INV_150 )
  );
  X_BUF #(
    .LOC ( "PAD121" ))
  \disp<7>/OUTPUT/OFF/OMUX  (
    .I(\disp<7>/OUTPUT/OFF/O1INV_158 ),
    .O(\disp<7>/O )
  );
  X_BUF #(
    .LOC ( "PAD121" ))
  \disp<7>/OUTPUT/OFF/O1INV  (
    .I(1'b1),
    .O(\disp<7>/OUTPUT/OFF/O1INV_158 )
  );
  X_BUF #(
    .LOC ( "PAD39" ))
  \disp<8>/OUTPUT/OFF/OMUX  (
    .I(\disp<8>/OUTPUT/OFF/O1INV_166 ),
    .O(\disp<8>/O )
  );
  X_BUF #(
    .LOC ( "PAD39" ))
  \disp<8>/OUTPUT/OFF/O1INV  (
    .I(1'b1),
    .O(\disp<8>/OUTPUT/OFF/O1INV_166 )
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

