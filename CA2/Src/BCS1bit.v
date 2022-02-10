 `timescale 1ns/1ns
module BCS1bit (input a,b, eq, gt , output EQ, GT);
	wire j1;
	wire k1;
	assign #(12,12) j1 = a~^b;
	assign #(24,21) EQ = j1&eq;
	assign #(17,19) k1 = ~a&b&eq;
	assign #(36,36) GT = k1|gt;
endmodule