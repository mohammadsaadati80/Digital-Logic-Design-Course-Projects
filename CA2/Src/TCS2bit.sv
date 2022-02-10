 `timescale 1ns/1ns
module TCS2bit ( input [1:0] A, B, input eq, gt, output EQ, GT);
	assign #65 GT = (gt | ~(~eq | A[1] | ~B[1]) | ~(~eq | A[0] | ~B[0] | (A[1]^B[1]))); 
	assign #33 EQ = ~((A[0]^B[0]) | (A[1]^B[1]) | (~eq));
	
endmodule
