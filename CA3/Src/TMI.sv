 `timescale 1ns/1ns
module TMI(input [1:0] A, input ci, output [1:0] S, output co);
	wire [1:0] p;
	assign p = {A};
	assign #(40,35) S[0] = (p == 2'b00) ? ci :
				 (p == 2'b01) ? ~ci :
				 (p == 2'b10) ? ci :
				 (p == 2'b11) ? ~ci : 1'bx;
	
	assign #(40,35) S[1] = (p == 4'b00) ? 0 :
				 (p == 4'b01) ? ci :
				 (p == 4'b10) ? 1 :
				 (p == 4'b11) ? ~ci : 1'bx;

	assign #(40,35) co = (p == 2'b00) ? 0 :
				 (p == 2'b01) ? 0 :
				 (p == 2'b10) ? 0 :
				 (p == 2'b11) ? ci : 1'bx;
endmodule
