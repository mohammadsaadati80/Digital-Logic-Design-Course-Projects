 `timescale 1ns/1ns
module shiftRegister8bitWithDFFWithAlways(input sIn, clk, rst, output [7:0] PO, output SO);
	wire [8:0] DL;
	assign DL[8] = sIn;
	genvar i;
	generate
		for (i = 8; i > 0; i = i - 1) begin : ripple
			DFlipFlopWithAlways DFFA(.D(DL[i]), .clk(clk) , .rst(rst), .Q(DL[i - 1]));
			assign PO[i - 1] = DL[i - 1];
		end
	endgenerate
	assign SO = PO[0];
endmodule