 `timescale 1ns/1ns
module TBQ10();
    logic sIn = 0;
    logic clk = 1;
    logic rst = 0;
    wire SO;
    wire [7:0]PO;
    wire SO2;
    wire [7:0]PO2;
    shiftRegister8bitWithDFF SR8bDDF(sIn, clk, rst, PO, SO);
    shiftRegister8bitWithDFFWithAlways SR8bDDFA(sIn, clk, rst, PO2, SO2);
    always #1200 clk <= ~clk;
    initial begin  
        #1200 sIn = 1;
        #1200 sIn = 0;
        #1800 sIn = 1;
        #1800 rst = 1;
        #2400 rst = 0;
        #2400 sIn = 1;
        #2400 sIn = 0;
	#2400 sIn = 0;
        #2400 sIn = 1;
	#3600 sIn = 1;
	#3600 sIn = 0;
        #3600 $stop;
    end
endmodule
