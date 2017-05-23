
module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
  NOR2X1 U7 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n2, n3, n4, n5;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  INVX2 U3 ( .A(sbc_enable), .Y(n2) );
  INVX2 U4 ( .A(stop_bit), .Y(n3) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n2), .C(sbc_enable), .D(n3), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n17, n19, n21,
         n23, n25, n27, n29, n2, n30;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n2), .Y(n3) );
  OAI22X1 U4 ( .A(n2), .B(n4), .C(n30), .D(n1), .Y(n15) );
  INVX1 U5 ( .A(parallel_out[1]), .Y(n1) );
  OAI22X1 U6 ( .A(n2), .B(n5), .C(n30), .D(n4), .Y(n17) );
  INVX1 U7 ( .A(parallel_out[2]), .Y(n4) );
  OAI22X1 U8 ( .A(n2), .B(n6), .C(n30), .D(n5), .Y(n19) );
  INVX1 U9 ( .A(parallel_out[3]), .Y(n5) );
  OAI22X1 U10 ( .A(n2), .B(n7), .C(n30), .D(n6), .Y(n21) );
  INVX1 U11 ( .A(parallel_out[4]), .Y(n6) );
  OAI22X1 U12 ( .A(n2), .B(n8), .C(n30), .D(n7), .Y(n23) );
  INVX1 U13 ( .A(parallel_out[5]), .Y(n7) );
  OAI22X1 U14 ( .A(n2), .B(n9), .C(n30), .D(n8), .Y(n25) );
  INVX1 U15 ( .A(parallel_out[6]), .Y(n8) );
  OAI22X1 U16 ( .A(n2), .B(n10), .C(n30), .D(n9), .Y(n27) );
  INVX1 U17 ( .A(parallel_out[7]), .Y(n9) );
  OAI21X1 U19 ( .A(n30), .B(n10), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(n30), .Y(n11) );
  INVX1 U21 ( .A(parallel_out[8]), .Y(n10) );
  INVX2 U18 ( .A(n2), .Y(n30) );
  INVX2 U31 ( .A(shift_enable), .Y(n2) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 SH ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19, n21, n23,
         n25, n27, n29, n30, n31, n2, n32;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  AOI22X1 U4 ( .A(rx_data[0]), .B(n32), .C(packet_data[0]), .D(n2), .Y(n1) );
  INVX1 U5 ( .A(n3), .Y(n17) );
  AOI22X1 U6 ( .A(rx_data[1]), .B(n32), .C(packet_data[1]), .D(n2), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(n19) );
  AOI22X1 U8 ( .A(rx_data[2]), .B(n32), .C(packet_data[2]), .D(n2), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n21) );
  AOI22X1 U10 ( .A(rx_data[3]), .B(n32), .C(packet_data[3]), .D(n2), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(n23) );
  AOI22X1 U12 ( .A(rx_data[4]), .B(n32), .C(packet_data[4]), .D(n2), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(n25) );
  AOI22X1 U14 ( .A(rx_data[5]), .B(n32), .C(packet_data[5]), .D(n2), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(n27) );
  AOI22X1 U16 ( .A(rx_data[6]), .B(n32), .C(packet_data[6]), .D(n2), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(n29) );
  AOI22X1 U18 ( .A(rx_data[7]), .B(n32), .C(packet_data[7]), .D(n2), .Y(n9) );
  NOR2X1 U19 ( .A(data_read), .B(n10), .Y(n30) );
  AOI21X1 U20 ( .A(n2), .B(data_ready), .C(overrun_error), .Y(n10) );
  OAI21X1 U21 ( .A(data_read), .B(n11), .C(n32), .Y(n31) );
  INVX1 U23 ( .A(data_ready), .Y(n11) );
  BUFX2 U22 ( .A(load_buffer), .Y(n2) );
  INVX2 U34 ( .A(load_buffer), .Y(n32) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n1, n2, n4, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22;
  wire   [2:0] state;
  wire   [2:0] nxtstate;

  DFFSR \state_reg[0]  ( .D(nxtstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nxtstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nxtstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  INVX2 U3 ( .A(n8), .Y(n9) );
  INVX1 U4 ( .A(n20), .Y(n1) );
  INVX1 U5 ( .A(n15), .Y(n2) );
  INVX2 U6 ( .A(n10), .Y(sbc_clear) );
  INVX2 U7 ( .A(state[0]), .Y(n20) );
  BUFX2 U11 ( .A(n15), .Y(n4) );
  INVX2 U12 ( .A(state[1]), .Y(n8) );
  INVX1 U13 ( .A(enable_timer), .Y(n10) );
  INVX1 U14 ( .A(packet_done), .Y(n14) );
  NAND2X1 U15 ( .A(n9), .B(n1), .Y(n12) );
  OAI21X1 U16 ( .A(n9), .B(n1), .C(n2), .Y(n11) );
  OAI21X1 U17 ( .A(framing_error), .B(n12), .C(n11), .Y(nxtstate[2]) );
  INVX2 U18 ( .A(state[2]), .Y(n15) );
  NAND3X1 U19 ( .A(n15), .B(state[0]), .C(n8), .Y(n19) );
  OAI21X1 U20 ( .A(n20), .B(n2), .C(n9), .Y(n13) );
  OAI21X1 U21 ( .A(n10), .B(n14), .C(n13), .Y(nxtstate[1]) );
  NAND3X1 U22 ( .A(n9), .B(n4), .C(n20), .Y(n22) );
  AND2X2 U23 ( .A(start_bit_detected), .B(n4), .Y(n17) );
  OAI21X1 U24 ( .A(packet_done), .B(n9), .C(n4), .Y(n16) );
  MUX2X1 U25 ( .B(n17), .A(n16), .S(n1), .Y(n18) );
  NAND2X1 U26 ( .A(n22), .B(n18), .Y(nxtstate[0]) );
  INVX2 U27 ( .A(n19), .Y(enable_timer) );
  NAND2X1 U28 ( .A(state[2]), .B(n20), .Y(n21) );
  NOR2X1 U29 ( .A(n9), .B(n21), .Y(load_buffer) );
  INVX2 U30 ( .A(n22), .Y(sbc_enable) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n68, n69, n70, n52, n53, n54, n55, n56, n1, n2, n3, n4, n7, n9, n10,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67;

  DFFSR \count_out_reg[0]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n70)
         );
  DFFSR \count_out_reg[1]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n69)
         );
  DFFSR \count_out_reg[3]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n68)
         );
  DFFSR \count_out_reg[2]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX2 U8 ( .A(n68), .Y(n7) );
  INVX2 U9 ( .A(n7), .Y(count_out[3]) );
  XNOR2X1 U10 ( .A(n51), .B(n50), .Y(n57) );
  NAND2X1 U11 ( .A(n38), .B(n34), .Y(n1) );
  INVX2 U12 ( .A(n1), .Y(n41) );
  INVX1 U13 ( .A(n38), .Y(n2) );
  INVX2 U14 ( .A(n2), .Y(n3) );
  INVX1 U15 ( .A(n69), .Y(n4) );
  INVX2 U16 ( .A(n4), .Y(count_out[1]) );
  INVX2 U17 ( .A(n17), .Y(count_out[0]) );
  INVX1 U18 ( .A(rollover_flag), .Y(n64) );
  INVX1 U19 ( .A(n43), .Y(n9) );
  INVX1 U20 ( .A(clear), .Y(n16) );
  INVX1 U21 ( .A(n65), .Y(n43) );
  AND2X2 U22 ( .A(n63), .B(n45), .Y(n10) );
  INVX1 U23 ( .A(n10), .Y(n37) );
  OR2X2 U24 ( .A(count_enable), .B(clear), .Y(n65) );
  NAND2X1 U25 ( .A(n65), .B(n16), .Y(n46) );
  INVX2 U26 ( .A(n46), .Y(n63) );
  INVX2 U27 ( .A(count_out[2]), .Y(n30) );
  XOR2X1 U28 ( .A(n30), .B(rollover_val[2]), .Y(n47) );
  INVX2 U29 ( .A(rollover_val[1]), .Y(n29) );
  XOR2X1 U30 ( .A(n69), .B(n29), .Y(n60) );
  INVX2 U31 ( .A(n70), .Y(n17) );
  XOR2X1 U32 ( .A(n17), .B(rollover_val[0]), .Y(n59) );
  AND2X2 U33 ( .A(n60), .B(n59), .Y(n19) );
  XOR2X1 U34 ( .A(n7), .B(rollover_val[3]), .Y(n18) );
  NAND3X1 U35 ( .A(n47), .B(n19), .C(n18), .Y(n45) );
  NAND2X1 U36 ( .A(n69), .B(n70), .Y(n40) );
  NOR2X1 U37 ( .A(count_out[3]), .B(n40), .Y(n20) );
  MUX2X1 U38 ( .B(count_out[3]), .A(n20), .S(count_out[2]), .Y(n36) );
  XOR2X1 U39 ( .A(n30), .B(rollover_val[2]), .Y(n22) );
  INVX2 U40 ( .A(rollover_val[0]), .Y(n21) );
  NAND2X1 U41 ( .A(n22), .B(n21), .Y(n27) );
  XOR2X1 U42 ( .A(n7), .B(rollover_val[3]), .Y(n24) );
  NAND2X1 U43 ( .A(count_out[1]), .B(n29), .Y(n23) );
  NAND2X1 U44 ( .A(n24), .B(n23), .Y(n26) );
  NOR2X1 U45 ( .A(count_out[0]), .B(clear), .Y(n25) );
  OAI21X1 U46 ( .A(n26), .B(n27), .C(n25), .Y(n28) );
  AND2X2 U47 ( .A(n28), .B(n65), .Y(n38) );
  XOR2X1 U48 ( .A(n7), .B(rollover_val[3]), .Y(n50) );
  NAND2X1 U49 ( .A(n50), .B(n29), .Y(n33) );
  OAI21X1 U50 ( .A(n30), .B(rollover_val[2]), .C(n59), .Y(n32) );
  NOR2X1 U51 ( .A(count_out[1]), .B(clear), .Y(n31) );
  OAI21X1 U52 ( .A(n33), .B(n32), .C(n31), .Y(n34) );
  NAND2X1 U53 ( .A(count_out[3]), .B(n1), .Y(n35) );
  OAI21X1 U54 ( .A(n37), .B(n36), .C(n35), .Y(n53) );
  NAND2X1 U55 ( .A(n10), .B(count_out[0]), .Y(n39) );
  MUX2X1 U56 ( .B(n39), .A(n3), .S(count_out[1]), .Y(n55) );
  INVX2 U57 ( .A(n40), .Y(n49) );
  NAND2X1 U58 ( .A(n10), .B(n49), .Y(n42) );
  MUX2X1 U59 ( .B(n42), .A(n41), .S(count_out[2]), .Y(n54) );
  MUX2X1 U60 ( .B(n10), .A(n43), .S(count_out[0]), .Y(n44) );
  OAI21X1 U61 ( .A(n46), .B(n45), .C(n44), .Y(n56) );
  XOR2X1 U62 ( .A(n47), .B(n49), .Y(n58) );
  INVX2 U63 ( .A(rollover_val[2]), .Y(n48) );
  NAND2X1 U64 ( .A(n49), .B(n48), .Y(n51) );
  NAND2X1 U65 ( .A(n58), .B(n57), .Y(n67) );
  INVX2 U66 ( .A(n59), .Y(n62) );
  XOR2X1 U67 ( .A(n60), .B(count_out[0]), .Y(n61) );
  NAND3X1 U68 ( .A(n63), .B(n62), .C(n61), .Y(n66) );
  OAI22X1 U69 ( .A(n67), .B(n66), .C(n9), .D(n64), .Y(n52) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n69, n70, n71, n72, n1, n3, n4, n5, n6, n7, n9, n16, n17, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n57, n58, n59, n60, n61, n62, n63;

  DFFSR \count_out_reg[0]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n71)
         );
  DFFSR \count_out_reg[1]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n70)
         );
  DFFSR \count_out_reg[3]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n69)
         );
  DFFSR \count_out_reg[2]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n72)
         );
  INVX4 U8 ( .A(n16), .Y(n17) );
  AND2X2 U9 ( .A(n45), .B(n46), .Y(n1) );
  XNOR2X1 U10 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n38) );
  XNOR2X1 U11 ( .A(n70), .B(rollover_val[1]), .Y(n46) );
  INVX2 U12 ( .A(n39), .Y(count_out[3]) );
  INVX2 U13 ( .A(n36), .Y(n3) );
  NOR2X1 U14 ( .A(count_enable), .B(clear), .Y(n4) );
  INVX2 U15 ( .A(n36), .Y(n49) );
  XNOR2X1 U16 ( .A(n17), .B(rollover_val[0]), .Y(n45) );
  INVX1 U17 ( .A(n45), .Y(n48) );
  AND2X2 U18 ( .A(n3), .B(n35), .Y(n5) );
  INVX1 U19 ( .A(n5), .Y(n30) );
  BUFX2 U20 ( .A(n35), .Y(n6) );
  INVX1 U21 ( .A(n70), .Y(n7) );
  INVX2 U22 ( .A(n7), .Y(count_out[1]) );
  INVX2 U23 ( .A(n72), .Y(n9) );
  INVX4 U24 ( .A(n9), .Y(rollover_flag) );
  INVX1 U25 ( .A(rollover_flag), .Y(n50) );
  INVX1 U26 ( .A(clear), .Y(n19) );
  INVX2 U27 ( .A(n71), .Y(n16) );
  INVX1 U28 ( .A(n16), .Y(count_out[0]) );
  OR2X2 U29 ( .A(count_enable), .B(clear), .Y(n51) );
  NAND2X1 U30 ( .A(n51), .B(n19), .Y(n36) );
  INVX2 U31 ( .A(n69), .Y(n39) );
  XOR2X1 U32 ( .A(n39), .B(rollover_val[3]), .Y(n24) );
  NAND3X1 U33 ( .A(n24), .B(n38), .C(n1), .Y(n35) );
  NAND2X1 U34 ( .A(n5), .B(count_out[0]), .Y(n22) );
  NOR2X1 U35 ( .A(count_out[0]), .B(n36), .Y(n20) );
  AOI21X1 U36 ( .A(n20), .B(n6), .C(n4), .Y(n21) );
  MUX2X1 U37 ( .B(n22), .A(n21), .S(count_out[1]), .Y(n60) );
  NAND2X1 U38 ( .A(count_out[1]), .B(n17), .Y(n40) );
  NOR2X1 U39 ( .A(n69), .B(n40), .Y(n23) );
  MUX2X1 U40 ( .B(count_out[3]), .A(n23), .S(count_out[2]), .Y(n31) );
  INVX2 U41 ( .A(n38), .Y(n26) );
  NAND2X1 U42 ( .A(n24), .B(n51), .Y(n25) );
  NOR2X1 U43 ( .A(n26), .B(n25), .Y(n28) );
  NOR2X1 U44 ( .A(n4), .B(n16), .Y(n27) );
  AOI22X1 U45 ( .A(n28), .B(n1), .C(n27), .D(count_out[1]), .Y(n29) );
  OAI21X1 U46 ( .A(n4), .B(n49), .C(n29), .Y(n32) );
  OAI22X1 U47 ( .A(n31), .B(n30), .C(n32), .D(n39), .Y(n62) );
  INVX2 U48 ( .A(n40), .Y(n37) );
  NAND2X1 U49 ( .A(n5), .B(n37), .Y(n33) );
  MUX2X1 U50 ( .B(n33), .A(n32), .S(count_out[2]), .Y(n61) );
  MUX2X1 U51 ( .B(n49), .A(n4), .S(count_out[0]), .Y(n34) );
  OAI21X1 U52 ( .A(n36), .B(n6), .C(n34), .Y(n59) );
  XOR2X1 U53 ( .A(n38), .B(n37), .Y(n44) );
  XOR2X1 U54 ( .A(n39), .B(rollover_val[3]), .Y(n42) );
  NOR2X1 U55 ( .A(rollover_val[2]), .B(n40), .Y(n41) );
  XOR2X1 U56 ( .A(n42), .B(n41), .Y(n43) );
  NAND2X1 U57 ( .A(n44), .B(n43), .Y(n58) );
  XOR2X1 U58 ( .A(n46), .B(count_out[0]), .Y(n47) );
  NAND3X1 U59 ( .A(n49), .B(n48), .C(n47), .Y(n57) );
  OAI22X1 U60 ( .A(n58), .B(n57), .C(n51), .D(n50), .Y(n63) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;


  flex_counter_1 F1 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_0 F2 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_strobe), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start, clear, enable, stop, shift, load, done, enabletimer;
  wire   [7:0] data;

  start_bit_det ST ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start) );
  stop_bit_chk SP ( .clk(clk), .n_rst(n_rst), .sbc_clear(clear), .sbc_enable(
        enable), .stop_bit(stop), .framing_error(framing_error) );
  sr_9bit SR ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift), .serial_in(
        serial_in), .packet_data(data), .stop_bit(stop) );
  rx_data_buff DT ( .clk(clk), .n_rst(n_rst), .load_buffer(load), 
        .packet_data(data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  rcu RC ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start), .packet_done(
        done), .framing_error(framing_error), .sbc_clear(clear), .sbc_enable(
        enable), .load_buffer(load), .enable_timer(enabletimer) );
  timer TM ( .clk(clk), .n_rst(n_rst), .enable_timer(enabletimer), 
        .shift_strobe(shift), .packet_done(done) );
endmodule

