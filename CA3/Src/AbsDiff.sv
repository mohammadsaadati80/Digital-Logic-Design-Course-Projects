 `timescale 1ns/1ns
module AbsDiff (input [7:0] data, Ref, output [7:0] result);
	wire [7:0] S;
	wire [7:0] SI;
	wire co;
	wire co1;
	NMA #(.N(8)) N8MA (.A(data), .B(~Ref), .ci(1), .S(S), .co(co));
	NMI #(.N(8)) N8MI (.A(~S), .ci(1), .S(SI), .co(co1));
	//assign result = (co == 1) ? S : SI;
	N2to1MUX #(.S(8)) N82to1MUX(.A(SI), .B(S), .s0(co), .w(result));
	
endmodule