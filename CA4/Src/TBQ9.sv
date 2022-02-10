 `timescale 1ns/1ns
module TBQ9();
	logic D = 0;
 	logic Clk = 1;
	logic RST = 0;
	wire Q;
	DFlipFlopWithAlways DFFA(.D(D), .clk(Clk), .rst(RST), .Q(Q));
	always #900 Clk <= ~Clk;
	initial begin
		repeat(4) #450 D = ~D;
		repeat(6) #300 D = ~D;
		repeat(8) #225 D = ~D;
		repeat(5) #3600 D = ~D;
		repeat(5) #2700 D = ~D;
		repeat(5) #1800 D = ~D;
		#3600 RST = ~RST;
		repeat(4) #450 D = ~D;
		repeat(6) #300 D = ~D;
		repeat(8) #225 D = ~D;
		repeat(5) #3600 D = ~D;
		repeat(5) #2700 D = ~D;
		repeat(5) #1800 D = ~D;
		#4500 RST = ~RST;
		repeat(4) #450 D = ~D;
		repeat(6) #300 D = ~D;
		repeat(8) #225 D = ~D;
		repeat(5) #3600 D = ~D;
		repeat(5) #2700 D = ~D;
		repeat(5) #1800 D = ~D;
		#1800 $stop;
	end

endmodule
