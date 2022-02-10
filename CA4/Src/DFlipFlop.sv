 `timescale 1ns/1ns
module DFlipFlop (input D, clk, rst, output Q, Qb);
	wire rstD, QL1, QQL1;
	nor #10 n(rstD, rst, ~D);
	clkDLatchWithDelay L1(.D(rstD), .clk(~clk), .Q(QL1), .Qb(QQL1));
	clkDLatchWithDelay L2(.D(QL1), .clk(clk), .Q(Q), .Qb(Qb));

endmodule
