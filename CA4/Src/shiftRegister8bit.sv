 `timescale 1ns/1ns
module shiftRegister8bit(input sIn, clk, rst, output [7:0] PO, output SO);
	wire [8:0] DL;
	wire [7:0] Q;
	assign DL[8] = sIn;
	always @(DL) $display("%b", DL);
	genvar i;
	generate
		for (i = 8; i > 0; i = i - 1) begin : ripple
			clkDLatchWithRST2 clkDLRst(.D(DL[i]), .clk(clk) , .rst(rst), .Q(DL[i - 1]), .Qb(Q[i - 1]));
		end
	endgenerate
	assign PO = DL[7:0];
	assign SO = PO[0];
endmodule

