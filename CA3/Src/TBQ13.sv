 `timescale 1ns/1ns
module TBQ13();
	logic [7:0] A = 8'b00101110;
	logic [7:0] B = 8'b00001110;
	logic [7:0] Ref = 8'b00001111;
	wire [7:0] R;
	LessDistance lessdistance (.dataA(A), .dataB(B), .refI(Ref), .result(R));
	initial begin 
		#1000 B[0] = 1;
		#1000 A[0] = 1;
		#1000 B[7] = 1;
		#1000 B[5] = 1;
		#1000 A[7] = 1;
		#1000 B[4] = 1;
		#1000 A[4] = 1;
		#1000 B[6] = 1;
		#1000 B[6] = 0;
		#1000 A[5] = 0;
		#1000 A[3] = 0;
		#1000 A[2] = 0;
		#1000 B[7] = 0;
		#1000 B[1] = 0;
		#1000 B[0] = 0;
		#1000 B[4] = 0;
		#1000 B[7] = 1;
		repeat(10) #1000 {A,B} = $random;
		repeat(10) #2000 {A,B,Ref} = $random;
		#2000 $stop;
	end
endmodule
