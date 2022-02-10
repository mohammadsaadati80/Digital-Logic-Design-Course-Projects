 `timescale 1ns/1ns
module TBQ5();
	wire EQb, GTb;
	wire EQt, GTt;
	logic eq = 1, gt = 0;
	logic [7:0] A = 8'b00101110;
	logic [7:0] B = 8'b00101110;
	BCS8bit BCS(.A(A), .B(B), .eq(eq), .gt(gt), .EQ(EQb), .GT(GTb));
	TCS8bit TCS(.A(A), .B(B), .eq(eq), .gt(gt), .EQ(EQt), .GT(GTt));
	initial begin 
		#500 B[0] = 1;
		#500 A[0] = 1;
		#500 B[7] = 1;
		#500 A[7] = 1;
		#500 B[4] = 1;
		#500 A[4] = 1;
		#500 B[6] = 1;
		#500 A[6] = 1;
		#500 A[5] = 0;
		#500 B[5] = 0;
		#500 A[3] = 0;
		#500 B[3] = 0;
		#500 A[2] = 0;
		#500 B[2] = 0;
		#500 A[1] = 0;
		#500 B[1] = 0;
		#500 $stop;
	end
endmodule