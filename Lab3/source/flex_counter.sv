// $Id: $
// File name:   flex_counter.sv
// Created:     1/28/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: flexible counter
module flex_counter
#(
  parameter NUM_CNT_BITS = 4
  )
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS -1 :0] rollover_val,
	output reg [NUM_CNT_BITS - 1:0] count_out,
	output reg rollover_flag
);
reg [NUM_CNT_BITS -1:0] nxt;
reg nxtflag;


 always_ff @ (negedge n_rst, posedge clk)
  begin
    if (n_rst == 1'b0) begin
      count_out[NUM_CNT_BITS -1 :0] <= '0;
      rollover_flag <= 0;
    end 
    else begin
      if(clear == 1) begin
        count_out[NUM_CNT_BITS - 1:0] <= '0;
        rollover_flag <=0;
        end
      else begin
        count_out <= nxt;
        rollover_flag <= nxtflag;
      end
    end
   
    end
    
    always_comb
    begin 
      nxt = count_out;
      nxtflag = rollover_flag;
      if (count_enable == 1'b1) begin
        if((rollover_val - count_out) == 1'b1) begin
        nxtflag = 1;
        nxt = rollover_val;
      end 
     else if(count_out == rollover_val) begin
          nxtflag = 0;
          nxt = 1;
        end
        else begin
           nxt = count_out + 1;
           nxtflag = 0;
      end
    end
  end
    endmodule
    