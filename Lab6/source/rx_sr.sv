// $Id: $
// File name:   rx_sr.sv
// Created:     2/28/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: Receiving Shift Register


module rx_sr(
  input wire clk,
  input wire n_rst,
  input wire sda_in,
  input wire rising_edge_found,
  input wire rx_enable,
  output reg [7:0] rx_data
  );
  

defparam FLEX.NUM_BITS = 8;
defparam FLEX.SHIFT_MSB = 1;


flex_stp_sr FLEX (.clk(clk), .n_rst(n_rst), .serial_in(sda_in), .shift_enable((rising_edge_found && rx_enable)), .parallel_out(rx_data));
  

  
endmodule