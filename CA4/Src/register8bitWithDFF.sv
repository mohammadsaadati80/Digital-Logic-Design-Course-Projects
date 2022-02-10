module register8bitWithDFF(input [7:0] PI, input clk, rst, output [7:0] PO);
	wire [7:0] QQ;
	genvar i;
	generate 
		for (i = 7; i >=0 ; i = i-1) begin : ripple
			DFlipFlop DFF(.D(PI[i]), .clk(clk), .rst(rst), .Q(PO[i]), .Qb(QQ[i]));
		end
	endgenerate
endmodule
