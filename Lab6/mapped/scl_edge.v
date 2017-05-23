
module scl_edge ( clk, n_rst, scl, falling_edge_found, rising_edge_found );
  input clk, n_rst, scl;
  output falling_edge_found, rising_edge_found;
  wire   rise, fall, N1, N2, n4;
  assign falling_edge_found = N1;
  assign rising_edge_found = N2;

  DFFSR rise_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(rise) );
  DFFSR fall_reg ( .D(rise), .CLK(clk), .R(1'b1), .S(n_rst), .Q(fall) );
  AND2X1 U8 ( .A(n4), .B(rise), .Y(N2) );
  NOR2X1 U9 ( .A(rise), .B(n4), .Y(N1) );
  INVX1 U10 ( .A(fall), .Y(n4) );
endmodule

