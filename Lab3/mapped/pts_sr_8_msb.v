
module flex_pts_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n6, n1, n2, n3;

  DFFSR serial_out_reg ( .D(n6), .CLK(clk), .R(1'b1), .S(n_rst), .Q(serial_out) );
  INVX1 U2 ( .A(n1), .Y(n6) );
  MUX2X1 U3 ( .B(serial_out), .A(parallel_in[7]), .S(n2), .Y(n1) );
  NOR2X1 U4 ( .A(load_enable), .B(n3), .Y(n2) );
  INVX1 U5 ( .A(shift_enable), .Y(n3) );
endmodule


module pts_sr_8_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr_NUM_BITS8_SHIFT_MSB1 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .load_enable(load_enable), .parallel_in(
        parallel_in), .serial_out(serial_out) );
endmodule

