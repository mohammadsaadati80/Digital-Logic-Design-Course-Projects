module MSSDP(input clk, sIn, output logic outValid, Error, output logic [1:0]d, output logic [3:0]p);
  logic [3:0] pstate, nstate;
  logic en3, en9, enSH, co3, co9, ld, rst;
  wire [7:0] data;
  wire [2:0] po3;
  wire [8:0] po9;
  parameter [3:0] Wait = 4'd0, start = 4'd1, size = 4'd2, finalLoad = 4'd3, xmit = 4'd4, stop = 4'd5, err = 4'd6;
  always @(pstate, co9, co3, sIn) begin
    rst = 1'b0; outValid = 1'b0; Error = 1'b0; nstate = Wait;
    case(pstate)
      Wait: begin
		 rst = 1'b1 ;
		 if(sIn)
			nstate = Wait;
		else
			nstate = start;
	end
      start: begin
		nstate = size;
 		rst = 1'b0; 
		en3 = 1'b1; 
		enSH = 1'b1; 
	end
      size: begin 
		rst = 1'b0; 
		en3 = 1'b1; 
		enSH = 1'b1; 
		if(co3)
			nstate = finalLoad;
		else
			nstate = size;
	 end
      finalLoad:begin 
		en3 = 1'b0; 
		enSH = 1'b0;  
		ld = 1'b1;
	 	d = data[1:0]; 
		nstate = xmit ;
	 end
      xmit: begin 
		ld = 1'b0 ;
		en9 = 1'b1; 
		outValid = 1'b1 ;
		if(co9)
			nstate = stop;
		else
			nstate = xmit;
	 end
      stop: begin 
		en9 = 1'b0;
		if(sIn)
			nstate = Wait;
		else
			nstate = err;
	 end
      err: begin
		Error = 1'b1; 
		if(sIn)
			nstate = Wait;
		else
			nstate = err;
	end
      default: nstate = Wait;
    endcase
  end
  SR8 shreg(clk, rst, enSH, sIn, data);
  upcnt3 CNT3(clk, rst, en3, co3, po3);
  dncnt9 CNT9(clk, rst, en9, ld, data[7:2], co9, po9);
  DEMUX SEL(sIn, d, p);
  always @(posedge clk)begin
    pstate <= nstate;
  end
  
endmodule

module SR8(input clk, rst, en, sIn, output logic[7:0] PO);

  always @(posedge clk, posedge rst) begin
    if(rst)
	 PO <= 8'b0;
    else begin
	if (en)
		PO <= {sIn, PO[7:1]};
	end 
  end
endmodule

module upcnt3 (input clk, rst, en, output co, output logic [2:0] PO);
  always @ (posedge clk, posedge rst) begin
    if(rst) 
	PO <= 3'b0;
    else if(en) 
	PO <= PO + 1;
  end
  assign co = &{PO};
endmodule

module dncnt9 (input clk, rst, en, ld, input [5:0] PI, output co, output logic [8:0] PO);
  always @(posedge clk, posedge rst) begin
    if(rst) 
	PO <= 9'b0;
    else if(ld) 
	PO[8:3] <= PI;
    else if(en) 
	PO <= PO - 1;
  end
  assign co = ~|{PO};
endmodule

module DEMUX (input sIn, input [1:0]d,output [3:0] p);
    assign p[0] = (d==2'b00) ? sIn : 1'bz;
    assign p[1] = (d==2'b01) ? sIn : 1'bz;
    assign p[2] = (d==2'b10) ? sIn : 1'bz;
    assign p[3] = (d==2'b11) ? sIn : 1'bz;   
endmodule
