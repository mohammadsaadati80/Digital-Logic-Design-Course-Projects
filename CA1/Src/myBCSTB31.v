 `timescale 1ns/1ns
module myBCSTB31();
	wire g1, e1;
	reg a1 = 0, b1 = 0, e0 = 0, g0 = 0;
	myBCSgate BCSG(.a1(a1), .b1(b1), .e0(e0), .g0(g0), .e1(e1), .g1(g1));
	initial begin
		# 60 a1 = 1'b1;
		# 60 b1 = 1'b1;
		# 60 a1 = 1'b0;
		# 60 e0 = 1'b1;
		# 60 a1 = 1'b1;
		# 60 b1 = 1'b0;
		# 60 a1 = 1'b0;
		# 60 g0 = 1'b1;
		# 60 a1 = 1'b1;
		# 60 b1 = 1'b1;
		# 60 a1 = 1'b0;
		# 60 e0 = 1'b0;
		# 60 a1 = 1'b1;
		# 60 b1 = 1'b0;
		# 60 a1 = 1'b0;
		# 60 g0 = 1'b0;
		# 60 $stop;
	end
endmodule
