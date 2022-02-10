 `timescale 1ns/1ns
module my2nor (input a, b, output w);
	supply1 Vdd;
	supply0 Gnd;
	wire x;
	pmos #(5,6,7) T1(x, Vdd, a);
	pmos #(5,6,7) T2(w, x, b);
	nmos #(3,4,5) T3(w, Gnd, a);
	nmos #(3,4,5) T4(w, Gnd, b);
endmodule
