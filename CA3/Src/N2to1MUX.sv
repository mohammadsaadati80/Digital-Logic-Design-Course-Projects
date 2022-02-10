 `timescale 1ns/1ns
module N2to1MUX #(parameter S=8) ( input [S - 1:0] A, B, input s0, output [S - 1:0] w);
	assign #(25,23) w = s0 ? B : A;
	
endmodule
