 `timescale 1ns/1ns
module TBQ3();
	wire EQ, GT;
	logic eq = 1, gt = 0;
	logic [1:0] A = 2'b01;
	logic [1:0] B = 2'b01;
	TCS2bit TCS(.A(A), .B(B), .eq(eq), .gt(gt), .EQ(EQ), .GT(GT));
	initial begin 
		#500 B[1] = 1;
		#500 A[1] = 1;
		#500 A[0] = 0;
		#500 B[0] = 0;
		#500 $stop;
	end
endmodule