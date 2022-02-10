 `timescale 1ns/1ns
module TCS8bit ( input [7:0] A, B, input eq, gt, output EQ, GT);
	wire [4:0] EQJ;
	wire [4:0] GTJ;
	assign EQJ[4] = eq;
	assign GTJ[4] = gt;
	assign EQ = EQJ[0];
	assign GT = GTJ[0];
	genvar i;
	generate 
		for (i = 3;i>=0;i=i-1) begin: ripple
			TCS2bit tcs(.A(A[(2*i + 1): 2*i]), .B(B[(2*i + 1): 2*i]), .eq(EQJ[i+1]), .gt(GTJ[i+1]), .EQ(EQJ[i]), .GT(GTJ[i]));
		end
	endgenerate 
	
endmodule