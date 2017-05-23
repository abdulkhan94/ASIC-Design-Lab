// $Id: $
// File name:   rcv_block.sv
// Created:     2/15/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: rcv block

module rcv_block(
  input wire clk,
  input wire n_rst,
  input wire serial_in,
  input wire data_read,
  output reg [7:0] rx_data,
  output reg data_ready,
  output reg overrun_error,
  output reg framing_error
  );
  
  reg start;
  reg clear;
  reg enable;
  reg stop;
  reg load;
  reg enabletimer;
  reg done;
  reg shift;
  reg [7:0] data;
  
  start_bit_det ST (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .start_bit_detected(start));
  stop_bit_chk SP (.clk(clk), .n_rst(n_rst), .sbc_clear(clear), .sbc_enable(enable), .stop_bit(stop),.framing_error(framing_error));
  sr_9bit SR (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .packet_data(data), .stop_bit(stop), .shift_strobe(shift));
  rx_data_buff DT (.clk(clk), .n_rst(n_rst), .packet_data(data), .load_buffer(load), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));
  rcu RC (.clk(clk), .n_rst(n_rst), .start_bit_detected(start), .packet_done(done), .framing_error(framing_error), .sbc_clear(clear), .sbc_enable(enable), .enable_timer(enabletimer), .load_buffer(load));
  timer TM (.clk(clk), .n_rst(n_rst), .packet_done(done), .enable_timer(enabletimer), .shift_strobe(shift));
    
endmodule
