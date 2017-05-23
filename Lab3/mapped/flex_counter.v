
module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97;

  DFFSR \count_out_reg[0]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  OAI21X1 U55 ( .A(count_out[0]), .B(n61), .C(n62), .Y(n60) );
  MUX2X1 U56 ( .B(count_out[0]), .A(n63), .S(n64), .Y(n62) );
  NOR2X1 U57 ( .A(clear), .B(n65), .Y(n63) );
  OAI21X1 U58 ( .A(n66), .B(n67), .C(n68), .Y(n59) );
  MUX2X1 U59 ( .B(n69), .A(n70), .S(count_out[1]), .Y(n68) );
  NOR2X1 U60 ( .A(n71), .B(n61), .Y(n69) );
  INVX1 U61 ( .A(rollover_val[1]), .Y(n66) );
  OAI21X1 U62 ( .A(n72), .B(n67), .C(n73), .Y(n58) );
  MUX2X1 U63 ( .B(n74), .A(n75), .S(count_out[2]), .Y(n73) );
  NOR2X1 U64 ( .A(n61), .B(n76), .Y(n74) );
  INVX1 U65 ( .A(rollover_val[2]), .Y(n72) );
  OAI21X1 U66 ( .A(n77), .B(n67), .C(n78), .Y(n57) );
  MUX2X1 U67 ( .B(n79), .A(n80), .S(count_out[3]), .Y(n78) );
  OAI21X1 U68 ( .A(count_out[2]), .B(n61), .C(n81), .Y(n80) );
  INVX1 U69 ( .A(n75), .Y(n81) );
  OAI21X1 U70 ( .A(count_out[1]), .B(n61), .C(n82), .Y(n75) );
  INVX1 U71 ( .A(n70), .Y(n82) );
  OAI21X1 U72 ( .A(count_out[0]), .B(n61), .C(n64), .Y(n70) );
  NOR2X1 U73 ( .A(n76), .B(n83), .Y(n79) );
  NAND2X1 U74 ( .A(n84), .B(count_out[2]), .Y(n83) );
  INVX1 U75 ( .A(n61), .Y(n84) );
  NAND3X1 U76 ( .A(n64), .B(n85), .C(n65), .Y(n61) );
  OR2X1 U77 ( .A(n86), .B(n87), .Y(n65) );
  OAI21X1 U78 ( .A(rollover_val[0]), .B(n71), .C(n88), .Y(n87) );
  INVX1 U79 ( .A(count_out[0]), .Y(n71) );
  INVX1 U80 ( .A(rollover_val[3]), .Y(n77) );
  OAI21X1 U81 ( .A(n64), .B(n89), .C(n67), .Y(n56) );
  NAND3X1 U82 ( .A(n90), .B(n91), .C(n92), .Y(n67) );
  AOI21X1 U83 ( .A(rollover_val[2]), .B(n93), .C(n94), .Y(n92) );
  NAND2X1 U84 ( .A(n64), .B(n85), .Y(n94) );
  INVX1 U85 ( .A(clear), .Y(n85) );
  MUX2X1 U86 ( .B(n95), .A(n86), .S(n76), .Y(n91) );
  NAND2X1 U87 ( .A(count_out[1]), .B(count_out[0]), .Y(n76) );
  OR2X1 U88 ( .A(n93), .B(n96), .Y(n86) );
  OAI21X1 U89 ( .A(rollover_val[2]), .B(n93), .C(n96), .Y(n95) );
  XOR2X1 U90 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n96) );
  XOR2X1 U91 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n93) );
  AOI21X1 U92 ( .A(rollover_val[0]), .B(count_out[0]), .C(n97), .Y(n90) );
  MUX2X1 U93 ( .B(count_out[0]), .A(rollover_val[0]), .S(n88), .Y(n97) );
  XNOR2X1 U94 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n88) );
  INVX1 U95 ( .A(rollover_flag), .Y(n89) );
  OR2X1 U96 ( .A(count_enable), .B(clear), .Y(n64) );
endmodule

