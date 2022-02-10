 `timescale 1ns/1ns
module TBQ4();
	logic D = 1;
 	logic Clk = 1;
	logic RST = 0;
	wire Q, Qbar, Q2, Q2bar;
	clkDLatchWithRST cDLR(.D(D), .clk(Clk), .rst(RST), .Q(Q), .Qb(Qbar));
	clkDLatchWithRST2 cDLR2(.D(D), .clk(Clk), .rst(RST), .Q(Q2), .Qb(Q2bar));
	always #300 Clk <= ~Clk;
	initial begin
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#1200 RST = ~RST;
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#1500 RST = ~RST;
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#600 $stop;
	end

endmodule

