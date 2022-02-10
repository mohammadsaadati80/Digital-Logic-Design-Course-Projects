 `timescale 1ns/1ns
module clkDLatchWithDelay(input D, clk, output Q, Qb);
	wire o1, o2;
	nand #8 n1(o1, D, clk);
	nand #8 n2(o2, o1, clk);
	nand #8 n3(Q, o1, Qb);
	nand #8 n4(Qb, o2, Q);

endmodule
