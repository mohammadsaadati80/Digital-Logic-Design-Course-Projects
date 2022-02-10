 `timescale 1ns/1ns
module TBQ6();
	wire [7:0] S;
	wire co;
	logic ci = 0;
	logic [7:0] A = 8'b11111111;
	logic [7:0] B = 8'b00000000;
	NMA #(.N(8)) N8MA (.A(A), .B(B), .ci(ci), .S(S), .co(co));
	initial begin 
		#1000 B[0] = 1;
		#1000 B[0] = 0;
		#1000 B[0] = 1;
		#1000 B[7] = 1;
		#1000 B[4] = 1;
		#1000 A[4] = 0;
		#1000 B[6] = 1;
		#1000 A[6] = 0;
		#1000 A[7] = 0;
		#1000 B[7] = 0;
		#1000 $stop;
	end
endmodule