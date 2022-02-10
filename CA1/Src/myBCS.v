 `timescale 1ns/1ns
module myBCS (input a1, b1, e0, g0, output e1, g1);
	wire j1;
	wire ee;
	wire aa;
	wire kk;
	wire k1;
	wire gg;
	my2xnorMUX xnorj1 (.a(a1), .b(b1), .w(j1));
	my2nand nande1 (.a(j1), .b(e0), .w(ee));
	myinverter inverte1(.a(ee), .w(e1));
	myinverter inverta1(.a(a1), .w(aa));
	my3nand nandkk (.a(aa), .b(b1), .c(e0), .w(kk));
	myinverter invertk1(.a(kk), .w(k1));
	my2nor norg1 (.a(k1), .b(g0), .w(gg));
	myinverter invertg1(.a(gg), .w(g1));
endmodule