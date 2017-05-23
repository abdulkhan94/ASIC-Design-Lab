
module flex_pts_sr ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31;
  wire   [2:0] temp;

  DFFSR \temp_reg[0]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[0])
         );
  DFFSR \temp_reg[1]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[1])
         );
  DFFSR \temp_reg[2]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[2])
         );
  DFFSR \temp_reg[3]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(serial_out) );
  NAND2X1 U23 ( .A(n21), .B(n22), .Y(n20) );
  MUX2X1 U24 ( .B(parallel_in[0]), .A(temp[0]), .S(n23), .Y(n21) );
  OAI21X1 U25 ( .A(n23), .B(n24), .C(n25), .Y(n19) );
  AOI22X1 U26 ( .A(temp[1]), .B(n26), .C(n27), .D(temp[0]), .Y(n25) );
  INVX1 U27 ( .A(parallel_in[1]), .Y(n24) );
  OAI21X1 U28 ( .A(n23), .B(n28), .C(n29), .Y(n18) );
  AOI22X1 U29 ( .A(temp[2]), .B(n26), .C(n27), .D(temp[1]), .Y(n29) );
  INVX1 U30 ( .A(parallel_in[2]), .Y(n28) );
  OAI21X1 U31 ( .A(n23), .B(n30), .C(n31), .Y(n17) );
  AOI22X1 U32 ( .A(serial_out), .B(n26), .C(temp[2]), .D(n27), .Y(n31) );
  NOR2X1 U33 ( .A(n27), .B(load_enable), .Y(n26) );
  INVX1 U34 ( .A(n22), .Y(n27) );
  NAND3X1 U35 ( .A(n_rst), .B(n23), .C(shift_enable), .Y(n22) );
  INVX1 U36 ( .A(parallel_in[3]), .Y(n30) );
  INVX1 U37 ( .A(load_enable), .Y(n23) );
endmodule

