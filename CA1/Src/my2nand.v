 `timescale 1ns/1ns
module my2nand (input a, b, output w);
	supply1 Vdd;
	supply0 Gnd;
	wire x;
	pmos #(5,6,7) T1(w, Vdd, a);
	pmos #(5,6,7) T2(w, Vdd, b);
	nmos #(3,4,5) T3(w, x, a);
	nmos #(3,4,5) T4(x, Gnd, b);
endmodule