 `timescale 1ns/1ns
module clkDLatchWithRST(input D, clk, rst, output Q, Qb);
	wire o1, o2 ,rstD;
	nor #10 (rstD, rst, ~D);
	nand #8 (o1, rstD, clk);
	nand #8 (o2, o1, clk);
	nand #8 (Q, o1, Qb);
	nand #8 (Qb, o2, Q);
endmodule
