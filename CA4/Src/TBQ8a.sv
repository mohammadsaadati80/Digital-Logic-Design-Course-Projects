 `timescale 1ns/1ns
module TBQ8a();
    logic [7:0] PI = 8'b10010100;
    logic clk = 1;
    logic rst = 0;
    wire [7:0]PO;
    register8bitWithDFF R8bDDF(PI, clk, rst, PO);
    always #1200 clk <= ~clk;
    initial begin  
        #1200 PI[1] = 1;
        #1200 PI[7] = 0;
        #1800 PI[3] = 1;
        #1800 rst = 1;
        #2400 rst = 0;
        #2400 PI[5] = 1;
        #2400 PI[4] = 0;
	#2400 PI[5] = 0;
        #2400 PI[7] = 1;
	#3600 PI[6] = 1;
	#3600 PI[1] = 0;
        #3600 $stop;
    end
endmodule
