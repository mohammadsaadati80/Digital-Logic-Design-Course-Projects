 `timescale 1ns/1ns
module DFlipFlopWithAlways (input D, clk, rst, output logic Q);
	always #74 @(posedge clk) begin
		if(rst) Q <= 1'b0;
		else Q<= D;
	end
endmodule
