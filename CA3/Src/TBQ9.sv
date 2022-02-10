 `timescale 1ns/1ns
module TBQ9();
	wire [7:0] S;
	wire co;
	logic ci = 1;
	logic [7:0] A = 8'b11111110;
	NMI #(.N(8)) N8MI (.A(A), .ci(ci), .S(S), .co(co));
	initial begin 
		#500 A[0] = 1;
		#500 A[7] = 0;
		#500 A[7] = 1;
		#500 A[0] = 0;
		#500 A[2] = 0;
		#500 A[5] = 0;
		#500 $stop;
	end
endmodule
