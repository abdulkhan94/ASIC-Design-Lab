
module decode ( clk, n_rst, scl, sda_in, starting_byte, rw_mode, address_match, 
        start_found, stop_found );
  input [7:0] starting_byte;
  input clk, n_rst, scl, sda_in;
  output rw_mode, address_match, start_found, stop_found;
  wire   sc1, sc2, sd1, sd2, N1, N2, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29;

  DFFSR sc1_reg ( .D(scl), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sc1) );
  DFFSR sc2_reg ( .D(sc1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sc2) );
  DFFSR sd1_reg ( .D(sda_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sd1) );
  DFFSR sd2_reg ( .D(sd1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sd2) );
  DFFSR start_found_reg ( .D(N1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        start_found) );
  DFFSR address_match_reg ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        address_match) );
  DFFSR rw_mode_reg ( .D(starting_byte[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rw_mode) );
  DFFSR stop_found_reg ( .D(N2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(stop_found) );
  NOR2X1 U24 ( .A(n20), .B(n21), .Y(n19) );
  NAND3X1 U25 ( .A(starting_byte[6]), .B(starting_byte[5]), .C(
        starting_byte[7]), .Y(n21) );
  NAND3X1 U26 ( .A(starting_byte[4]), .B(n22), .C(n23), .Y(n20) );
  NOR2X1 U27 ( .A(starting_byte[3]), .B(starting_byte[2]), .Y(n23) );
  INVX1 U28 ( .A(starting_byte[1]), .Y(n22) );
  NOR2X1 U29 ( .A(n24), .B(n25), .Y(N2) );
  NAND2X1 U30 ( .A(sd1), .B(sc2), .Y(n25) );
  NAND2X1 U31 ( .A(sc1), .B(n26), .Y(n24) );
  INVX1 U32 ( .A(sd2), .Y(n26) );
  NOR2X1 U33 ( .A(n27), .B(n28), .Y(N1) );
  NAND2X1 U34 ( .A(sd2), .B(sc2), .Y(n28) );
  NAND2X1 U35 ( .A(sc1), .B(n29), .Y(n27) );
  INVX1 U36 ( .A(sd1), .Y(n29) );
endmodule

