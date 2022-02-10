 `timescale 1ns/1ns
module TCS( input [1:0] A, B, input eq, gt, output logic EQ, GT);
	always @(A,B,eq,gt) begin
		#65 GT = (gt | ~(~eq | A[1] | ~B[1]) | ~(~eq | A[0] | ~B[0] | (A[1]^B[1]))); 
	end
	always @(A,B,eq,gt) begin
		#33 EQ = ~((A[0]^B[0]) | (A[1]^B[1]) | (~eq));
	end
	
endmodule
