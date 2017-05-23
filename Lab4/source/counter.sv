// $Id: $
// File name:   counter.sv
// Created:     2/9/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: counter

module counter(
  input wire clk,
  input wire n_reset,
  input wire cnt_up,
  output wire one_k_samples
  );
  reg [9:0] rollover_val;
  reg [9:0] count_out;
  
  defparam A0.NUM_CNT_BITS = 10;
  
  flex_counter A0(.clk(clk), .n_rst(n_reset), .count_enable(cnt_up), .clear(1'b0), .rollover_val(10'b1111101000), .rollover_flag(one_k_samples),.count_out(count_out));
  
endmodule