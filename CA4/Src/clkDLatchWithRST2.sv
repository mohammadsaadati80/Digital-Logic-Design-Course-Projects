 `timescale 1ns/1ns
module clkDLatchWithRST2(input D, clk, rst, output Q, Qb);
	wire o1, o2;
	nand #8 (o1, D, clk, ~rst);
	nand #8 (o2, o1, clk);
	nand #8 (Q, o1, Qb);
	nand #8 (Qb, o2, Q, ~rst);
endmodule

