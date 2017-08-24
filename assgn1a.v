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
assign d2 = x;
assign d1 = (~x&~q1)|(~x&q2)|(q2&~q1);
endmodule

module outputFn_beh (zw, x, q2, q1);
input x, q2, q1;
output zw;
wire zw;
assign zw = (q1&q2&~x)|(x&~q2&q1);
endmodule

module delayElem_beh (z, q2, q1, zw, d2, d1, clk, rst);
input zw, d2, d1, clk, rst;
output z, q2, q1;
reg z, q2, q1;
always @(posedge clk)
	if(rst==1)
	begin
		z <= 0;
		q2 <= 0;
		q1 <= 0;
	end
	else
	begin
		z <= zw;
		q2 <= d2;
		q1 <= d1;
	end
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

