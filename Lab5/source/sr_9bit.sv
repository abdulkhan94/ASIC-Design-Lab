// $Id: $
// File name:   sr_9bit.sv
// Created:     2/15/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: shift reg
module sr_9bit(
  input wire clk,
  input wire n_rst,
  input wire shift_strobe,
  input wire serial_in,
  output reg [7:0] packet_data,
  output reg stop_bit
  );
  
  reg [8:0] data;
  
  defparam SH.NUM_BITS = 9;
  defparam SH.SHIFT_MSB = 0;
  
  
  flex_stp_sr SH (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .shift_enable(shift_strobe), .parallel_out(data));
  
  assign packet_data[7:0] = data[7:0];
  assign stop_bit = data[8];
  
  
endmodule
  
