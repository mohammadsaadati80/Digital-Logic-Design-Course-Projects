`timescale 1ns/1ns
module TBMSSD();
  logic sIn = 1'b1;
  logic clk = 1'b0;
  wire valid,error;
  wire valid2,error2;
  wire[1:0] d;
  wire[1:0] d2;
  wire[3:0] port;
  wire[3:0] port2;
  parameter [1:0] p = 2'd2;
  parameter [5:0] n = 6'd6;
  MSSDP UUT(clk,sIn,valid,error,d,port);
  MSSD UUT2(clk,sIn,valid2,error2,d2,port2);
  integer i;
  always #250 clk = ~clk;
  initial begin
    #500 sIn = 1'b0;
    for(i=0;i<2;i = i+1)
      #500 sIn = p[i];
    for(i=0;i<6;i = i+1)
      #500 sIn = n[i];
    repeat(8*n) #500 sIn = $random;
    #500 sIn = 1;
    #1000 $stop;
  end

endmodule
