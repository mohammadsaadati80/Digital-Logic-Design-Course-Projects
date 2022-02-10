 `timescale 1ns/1ns
module myBCSgate (input a1, b1, e0, g0, output e1, g1);
	wire j1;
	wire k1;
	assign #(12,9) j1 = a1~^b1;
	assign #(24,21) e1 = j1&e0;
	assign #(17,19) k1 = ~a1&b1&e0;
	assign #(36,36) g1 = k1|g0;
endmodule
