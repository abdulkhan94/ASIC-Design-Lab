// $Id: $
// File name:   timer.sv
// Created:     2/15/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: timer

module timer(
  input wire clk,
  input wire n_rst,
  input wire enable_timer,
  output reg shift_strobe,
  output reg packet_done
  );
  reg [3:0] count_out;
  reg [3:0] data2;
  reg flag;
  
  
  flex_counter F1 (.clk(clk), .n_rst(n_rst), .count_enable(enable_timer), .clear(packet_done), .rollover_val(4'b1010), .rollover_flag(flag), .count_out(count_out));
  flex_counter F2 (.clk(clk), .n_rst(n_rst), .count_enable(flag), .clear(packet_done), .rollover_val(4'b1001), .rollover_flag(packet_done), .count_out(data2));
  assign shift_strobe = flag;
  
endmodule

  