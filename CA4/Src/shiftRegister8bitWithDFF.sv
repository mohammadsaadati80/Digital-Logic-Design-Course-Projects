 `timescale 1ns/1ns
module shiftRegister8bitWithDFF(input sIn, clk, rst, output [7:0] PO, output SO);
	wire [8:0] DL;
	wire [7:0] Q;
	assign DL[8] = sIn;
	genvar i;
	generate
		for (i = 8; i > 0; i = i - 1) begin : ripple
			DFlipFlop DFF(.D(DL[i]), .clk(clk) , .rst(rst), .Q(DL[i - 1]), .Qb(Q[i - 1]));
			assign PO[i - 1] = DL[i - 1];
		end
	endgenerate
	assign SO = PO[0];
endmodule

