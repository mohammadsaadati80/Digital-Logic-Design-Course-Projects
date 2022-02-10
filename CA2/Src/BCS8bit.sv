 `timescale 1ns/1ns
module BCS8bit ( input [7:0] A, B, input eq, gt, output EQ, GT);
	wire [8:0] EQJ;
	wire [8:0] GTJ;
	assign EQJ[8] = eq;
	assign GTJ[8] = gt;
	assign EQ = EQJ[0];
	assign GT = GTJ[0];
	genvar i;
	generate 
		for (i = 7;i>=0;i=i-1) begin: ripple
			BCS1bit bcs(.a(A[i]), .b(B[i]), .eq(EQJ[i+1]), .gt(GTJ[i+1]), .EQ(EQJ[i]), .GT(GTJ[i]));
		end
	endgenerate 
	
endmodule