 `timescale 1ns/1ns
module my3nand (input a, b, c, output w);
	supply1 Vdd;
	supply0 Gnd;
	wire x;
	wire y;
	pmos #(5,6,7) T1(w, Vdd, a);
	pmos #(5,6,7) T2(w, Vdd, b);
	pmos #(5,6,7) T3(w, Vdd, c);
	nmos #(3,4,5) T4(w, x, a);
	nmos #(3,4,5) T5(x, y, b);
	nmos #(3,4,5) T6(y, Gnd, c);
endmodule
