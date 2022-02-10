 `timescale 1ns/1ns
module my2xnorMUX (input a, b, output w);
	wire aa;
	wire bb;
	myinverter invertA (.a(a), .w(aa));
	myinverter invertB (.a(b), .w(bb));
	nmos #(3,4,5) T1(w, bb, aa);
	nmos #(3,4,5) T2(w, b, a);
endmodule