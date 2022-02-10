 `timescale 1ns/1ns
module NCS #(parameter S=8) ( input [S - 1:0] A, B, input eq, gt, output EQ, GT);
	wire [S/2:0] EQJ;
	wire [S/2:0] GTJ;
	assign EQJ[S/2] = eq;
	assign GTJ[S/2] = gt;
	assign EQ = EQJ[0];
	assign GT = GTJ[0];
	genvar i;
	generate 
		for (i = S/2 - 1;i>=0;i=i-1) begin: ripple
			TCS tcs(.A(A[(2*i + 1): 2*i]), .B(B[(2*i + 1): 2*i]), .eq(EQJ[i+1]), .gt(GTJ[i+1]), .EQ(EQJ[i]), .GT(GTJ[i]));
		end
	endgenerate 
	
endmodule