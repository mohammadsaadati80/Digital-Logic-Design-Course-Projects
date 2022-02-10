 `timescale 1ns/1ns
module NMA #(parameter N=8) (input [N - 1:0] A, B, input ci, output [N - 1:0] S, output co);
	wire [N/2:0] C;
	assign C[0] = ci;
	assign co = C[N/2];
	genvar i;
	generate 
		for (i = 0;i<N/2 ;i=i+1) begin: ripple
			TMA tma(.A(A[(2*i + 1): 2*i]), .B(B[(2*i + 1): 2*i]), .ci(C[i]), .S(S[(2*i + 1): 2*i]), .co(C[i+1]));
		end
	endgenerate 
	
endmodule
