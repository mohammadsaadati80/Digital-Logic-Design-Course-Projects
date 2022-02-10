 `timescale 1ns/1ns
module LessDistanceBehavioral (input [7:0] dataA, dataB, refI, output [7:0] result);
	wire [7:0] SA;
	wire [7:0] SB;

	assign #(600,598) SA = (dataA < refI) ? refI - dataA : dataA - refI;
	assign #(600,598) SB = (dataB < refI) ? refI - dataB : dataB - refI;
	assign #(189,187) result = (SA < SB) ? dataA : dataB;
	
endmodule
