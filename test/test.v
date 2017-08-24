module top;
wire x, z, clk, rst;
count01 c1(x, z, clk, rst);
count01test c1t(x, z, clk, rst);
endmodule

module count01(x, z, clk, rst);
input x, clk, rst;
output z;
wire z;

wire q2, q1;
wire d2, d1, zw;

stateTransFn_beh stfb(d2, d1, x, q2, q1);
outputFn_beh ofb(zw, x, q2, q1);
delayElem_beh deb(z, q2, q1, zw, d2, d1, clk, rst);

endmodule

module stateTransFn_beh (d2, d1, x, q2, q1);
input x, q2, q1;
output d2, d1;
wire d2, d1;

buf d2x(d2, x);

wire nx, nq1, xq2, xq1, q2q1;
not notx(nx, x);
not notq1(nq1, q1);
and andxq2(xq2, nx, q2);
and andxq1(xq1, nx, nq1);
and andq2q1(q2q1, q2, nq1);
or ord1(d1, xq1, xq2, q2q1);
endmodule

module outputFn_beh (zw, x, q2, q1);
input x, q2, q1;
output zw;
wire zw;
wire xq2;
xor xorxq2(xq2, x, q2);
and andzw(zw, xq2, q1);
endmodule

module delayElem_beh (z, q2, q1, zw, d2, d1, clk, rst);
input zw, d2, d1, clk, rst;
output z, q2, q1;
wire z, q2, q1;
DFF dffz(zw, clk, rst, z);
DFF dff2(d2, clk, rst, q2);
DFF dff1(d1, clk, rst, q1);
endmodule

module DFF(D, clk, rst, Q);
input D, clk, rst;
output Q;
reg Q;
wire nrst, rin;
//not notq(Qcmp, Q);
not notr(nrst, rst);
and irst(rin, D, nrst);
always @(posedge clk)
	Q <= rin;
endmodule

module count01test(x, z, clk, rst);
	output x, clk, rst;
	input z;

	// Inputs
	reg x;
	reg clk;
	reg rst;
	
	always
		#5 clk=~clk;

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
      rst=0;  
		// Add stimulus here
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 1;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		x = 0;
		#10 $display("x = %d, z = %d",x,z);
		$finish;
	end
      
endmodule

