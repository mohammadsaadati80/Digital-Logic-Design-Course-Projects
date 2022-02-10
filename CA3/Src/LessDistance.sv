 `timescale 1ns/1ns
module LessDistance (input [7:0] dataA, dataB, refI, output [7:0] result);
	wire [7:0] SA;
	wire [7:0] SB;
	wire EQ;
	wire GT;
	AbsDiff absdiffA(.data(dataA), .Ref(refI), .result(SA));
	AbsDiff absdiffB(.data(dataB), .Ref(refI), .result(SB));
	NCS #(.S(8)) N8CS (.A(SA), .B(SB), .eq(1), .gt(0), .EQ(EQ), .GT(GT));
	//assign result = GT ? dataA : dataB;
	N2to1MUX #(.S(8)) N82to1MUX(.A(dataB), .B(dataA), .s0(GT), .w(result));
	
endmodule