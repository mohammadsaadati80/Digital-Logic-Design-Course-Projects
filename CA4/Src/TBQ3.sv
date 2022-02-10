 `timescale 1ns/1ns
module TBQ3();
	logic D = 0;
 	logic Clk = 1;
	wire Q, Qbar;
	clkDLatchWithDelay clkCLWD(.D(D), .clk(Clk), .Q(Q), .Qb(Qbar));
	always #300 Clk <= ~Clk;
	initial begin
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#1200;
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#1500;
		repeat(4) #150 D = ~D;
		repeat(6) #100 D = ~D;
		repeat(8) #75 D = ~D;
		repeat(5) #1200 D = ~D;
		repeat(5) #900 D = ~D;
		repeat(5) #600 D = ~D;
		#608 D = ~D;
		#900 $stop;
	end

endmodule
