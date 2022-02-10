 `timescale 1ns/1ns
module myBCSTB42();
	wire g1, e1, gg1, ee1;
	reg a1 = 1, b1 = 1, e0 = 1, g0 = 0;
	myBCS BCST(.a1(a1), .b1(b1), .e0(e0), .g0(g0), .e1(e1), .g1(g1));
	myBCSgate BCSG(.a1(a1), .b1(b1), .e0(e0), .g0(g0), .e1(ee1), .g1(gg1));
	initial begin
		# 60 a1 = 1'b0;
		# 60 a1 = 1'b1;
		# 60 $stop;
	end
endmodule
