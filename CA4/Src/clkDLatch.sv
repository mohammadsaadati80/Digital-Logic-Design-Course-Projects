 `timescale 1ns/1ns
module clkDLatch(input D, clk, output Q, QQ);
	wire o1, o2;
	nand (o1, D, clk);
	nand (o2, o1, clk);
	nand (Q, o1, QQ);
	nand (QQ, o2, Q);
endmodule
