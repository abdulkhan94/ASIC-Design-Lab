
module sync_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;


  DFFSR temp2_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;


  DFFSR temp2_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, stop_found, start_found, byte_received, 
        ack_prep, check_ack, ack_done, rw_mode, address_match, sda_in, 
        rx_enable, tx_enable, read_enable, sda_mode, load_data );
  output [1:0] sda_mode;
  input clk, n_rst, stop_found, start_found, byte_received, ack_prep,
         check_ack, ack_done, rw_mode, address_match, sda_in;
  output rx_enable, tx_enable, read_enable, load_data;
  wire   n66, n67, n68, n69, n5, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83;
  wire   [3:0] state;

  DFFSR \state_reg[0]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[3]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  INVX2 U7 ( .A(n77), .Y(load_data) );
  INVX2 U8 ( .A(n71), .Y(n15) );
  INVX2 U9 ( .A(n22), .Y(n23) );
  AND2X1 U10 ( .A(n15), .B(n30), .Y(n5) );
  AND2X2 U11 ( .A(n12), .B(n5), .Y(tx_enable) );
  INVX1 U12 ( .A(tx_enable), .Y(n79) );
  INVX1 U13 ( .A(n15), .Y(n7) );
  INVX1 U14 ( .A(state[2]), .Y(n71) );
  BUFX2 U15 ( .A(ack_done), .Y(n8) );
  AND2X2 U16 ( .A(n82), .B(n31), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n83) );
  INVX1 U18 ( .A(state[0]), .Y(n22) );
  INVX1 U19 ( .A(n17), .Y(n10) );
  INVX1 U20 ( .A(state[1]), .Y(n31) );
  INVX2 U21 ( .A(n23), .Y(n11) );
  OR2X2 U22 ( .A(n80), .B(n11), .Y(n77) );
  AND2X2 U23 ( .A(n82), .B(n16), .Y(n12) );
  AND2X2 U24 ( .A(n30), .B(n71), .Y(n13) );
  INVX1 U25 ( .A(stop_found), .Y(n57) );
  INVX1 U26 ( .A(n31), .Y(n16) );
  INVX2 U27 ( .A(n19), .Y(n21) );
  BUFX2 U28 ( .A(tx_enable), .Y(n14) );
  BUFX2 U29 ( .A(n31), .Y(n17) );
  INVX1 U30 ( .A(read_enable), .Y(n18) );
  BUFX2 U31 ( .A(n82), .Y(n19) );
  BUFX2 U32 ( .A(load_data), .Y(n20) );
  INVX1 U33 ( .A(state[0]), .Y(n30) );
  INVX2 U34 ( .A(state[3]), .Y(n82) );
  NAND3X1 U35 ( .A(n23), .B(n15), .C(n12), .Y(n35) );
  INVX2 U36 ( .A(check_ack), .Y(n36) );
  NAND2X1 U37 ( .A(n10), .B(n21), .Y(n32) );
  INVX2 U38 ( .A(n32), .Y(n24) );
  NAND2X1 U39 ( .A(n24), .B(n13), .Y(n47) );
  NOR2X1 U40 ( .A(state[1]), .B(state[2]), .Y(n25) );
  NAND3X1 U41 ( .A(state[3]), .B(state[0]), .C(n25), .Y(n81) );
  OAI21X1 U42 ( .A(ack_done), .B(n47), .C(n18), .Y(n38) );
  INVX2 U43 ( .A(sda_in), .Y(n41) );
  NAND3X1 U44 ( .A(n13), .B(n21), .C(n17), .Y(n40) );
  INVX2 U45 ( .A(n40), .Y(n26) );
  OAI21X1 U46 ( .A(n57), .B(n41), .C(n26), .Y(n73) );
  INVX2 U47 ( .A(n73), .Y(n27) );
  AOI21X1 U48 ( .A(n38), .B(n57), .C(n27), .Y(n28) );
  OAI21X1 U49 ( .A(n35), .B(n36), .C(n28), .Y(n68) );
  NAND2X1 U50 ( .A(address_match), .B(rw_mode), .Y(n54) );
  INVX2 U51 ( .A(n54), .Y(n29) );
  NAND2X1 U52 ( .A(n13), .B(n12), .Y(n53) );
  INVX2 U53 ( .A(n53), .Y(n55) );
  NAND2X1 U54 ( .A(n29), .B(n55), .Y(n64) );
  AND2X2 U55 ( .A(n64), .B(n79), .Y(n46) );
  INVX2 U56 ( .A(ack_prep), .Y(n33) );
  OAI22X1 U57 ( .A(n83), .B(n33), .C(n32), .D(n57), .Y(n34) );
  NAND3X1 U58 ( .A(n7), .B(n34), .C(n23), .Y(n45) );
  NAND3X1 U59 ( .A(n23), .B(n12), .C(n7), .Y(n78) );
  INVX2 U60 ( .A(n35), .Y(n37) );
  NAND2X1 U61 ( .A(n37), .B(n36), .Y(n51) );
  OAI21X1 U62 ( .A(n8), .B(n78), .C(n51), .Y(n43) );
  NAND2X1 U63 ( .A(n9), .B(n15), .Y(n80) );
  NOR2X1 U64 ( .A(n20), .B(n38), .Y(n39) );
  OAI21X1 U65 ( .A(n41), .B(n40), .C(n39), .Y(n42) );
  OAI21X1 U66 ( .A(n43), .B(n42), .C(n57), .Y(n44) );
  NAND3X1 U67 ( .A(n46), .B(n45), .C(n44), .Y(n66) );
  INVX2 U68 ( .A(n78), .Y(n49) );
  INVX2 U69 ( .A(n47), .Y(n48) );
  OAI21X1 U70 ( .A(n49), .B(n48), .C(ack_done), .Y(n50) );
  OAI21X1 U71 ( .A(stop_found), .B(n51), .C(n50), .Y(n52) );
  INVX2 U72 ( .A(n52), .Y(n65) );
  NOR2X1 U73 ( .A(address_match), .B(n53), .Y(n60) );
  INVX2 U74 ( .A(rw_mode), .Y(n59) );
  AOI21X1 U75 ( .A(n55), .B(n54), .C(n20), .Y(n56) );
  OAI21X1 U76 ( .A(n8), .B(n80), .C(n56), .Y(n58) );
  AOI22X1 U77 ( .A(n60), .B(n59), .C(n58), .D(n57), .Y(n61) );
  NAND3X1 U78 ( .A(n65), .B(n79), .C(n61), .Y(n67) );
  NOR2X1 U79 ( .A(ack_prep), .B(stop_found), .Y(n62) );
  MUX2X1 U80 ( .B(start_found), .A(n62), .S(n23), .Y(n63) );
  NOR2X1 U81 ( .A(n63), .B(n83), .Y(n72) );
  NAND2X1 U82 ( .A(n65), .B(n64), .Y(n70) );
  AOI21X1 U83 ( .A(n72), .B(n7), .C(n70), .Y(n76) );
  OAI21X1 U84 ( .A(stop_found), .B(n78), .C(n73), .Y(n74) );
  AOI21X1 U85 ( .A(ack_prep), .B(n14), .C(n74), .Y(n75) );
  NAND2X1 U86 ( .A(n76), .B(n75), .Y(n69) );
  NAND3X1 U87 ( .A(n78), .B(n79), .C(n77), .Y(sda_mode[0]) );
  OAI21X1 U88 ( .A(n23), .B(n80), .C(n79), .Y(sda_mode[1]) );
  INVX2 U89 ( .A(n81), .Y(read_enable) );
  MUX2X1 U90 ( .B(n83), .A(n19), .S(n15), .Y(rx_enable) );
endmodule


module scl_edge ( clk, n_rst, scl, falling_edge_found, rising_edge_found );
  input clk, n_rst, scl;
  output falling_edge_found, rising_edge_found;
  wire   rise, fall, N1, N2, n3, n4;
  assign falling_edge_found = N1;
  assign rising_edge_found = N2;

  DFFSR rise_reg ( .D(scl), .CLK(clk), .R(1'b1), .S(n_rst), .Q(rise) );
  DFFSR fall_reg ( .D(rise), .CLK(clk), .R(1'b1), .S(n_rst), .Q(fall) );
  INVX1 U5 ( .A(rise), .Y(n3) );
  NOR2X1 U6 ( .A(fall), .B(n3), .Y(N2) );
  INVX2 U7 ( .A(fall), .Y(n4) );
  NOR2X1 U8 ( .A(rise), .B(n4), .Y(N1) );
endmodule


module sda_sel ( tx_out, sda_mode, sda_out );
  input [1:0] sda_mode;
  input tx_out;
  output sda_out;
  wire   n1;

  NAND2X1 U3 ( .A(sda_mode[0]), .B(n1), .Y(sda_out) );
  NAND2X1 U4 ( .A(tx_out), .B(sda_mode[1]), .Y(n1) );
endmodule


module fiforam ( wclk, wenable, waddr, raddr, wdata, rdata );
  input [2:0] waddr;
  input [2:0] raddr;
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wenable;
  wire   \fiforeg[0][7] , \fiforeg[0][6] , \fiforeg[0][5] , \fiforeg[0][4] ,
         \fiforeg[0][3] , \fiforeg[0][2] , \fiforeg[0][1] , \fiforeg[0][0] ,
         \fiforeg[1][7] , \fiforeg[1][6] , \fiforeg[1][5] , \fiforeg[1][4] ,
         \fiforeg[1][3] , \fiforeg[1][2] , \fiforeg[1][1] , \fiforeg[1][0] ,
         \fiforeg[2][7] , \fiforeg[2][6] , \fiforeg[2][5] , \fiforeg[2][4] ,
         \fiforeg[2][3] , \fiforeg[2][2] , \fiforeg[2][1] , \fiforeg[2][0] ,
         \fiforeg[3][7] , \fiforeg[3][6] , \fiforeg[3][5] , \fiforeg[3][4] ,
         \fiforeg[3][3] , \fiforeg[3][2] , \fiforeg[3][1] , \fiforeg[3][0] ,
         \fiforeg[4][7] , \fiforeg[4][6] , \fiforeg[4][5] , \fiforeg[4][4] ,
         \fiforeg[4][3] , \fiforeg[4][2] , \fiforeg[4][1] , \fiforeg[4][0] ,
         \fiforeg[5][7] , \fiforeg[5][6] , \fiforeg[5][5] , \fiforeg[5][4] ,
         \fiforeg[5][3] , \fiforeg[5][2] , \fiforeg[5][1] , \fiforeg[5][0] ,
         \fiforeg[6][7] , \fiforeg[6][6] , \fiforeg[6][5] , \fiforeg[6][4] ,
         \fiforeg[6][3] , \fiforeg[6][2] , \fiforeg[6][1] , \fiforeg[6][0] ,
         \fiforeg[7][7] , \fiforeg[7][6] , \fiforeg[7][5] , \fiforeg[7][4] ,
         \fiforeg[7][3] , \fiforeg[7][2] , \fiforeg[7][1] , \fiforeg[7][0] ,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326;

  DFFPOSX1 \fiforeg_reg[7][7]  ( .D(n212), .CLK(wclk), .Q(\fiforeg[7][7] ) );
  DFFPOSX1 \fiforeg_reg[6][7]  ( .D(n213), .CLK(wclk), .Q(\fiforeg[6][7] ) );
  DFFPOSX1 \fiforeg_reg[5][7]  ( .D(n214), .CLK(wclk), .Q(\fiforeg[5][7] ) );
  DFFPOSX1 \fiforeg_reg[4][7]  ( .D(n215), .CLK(wclk), .Q(\fiforeg[4][7] ) );
  DFFPOSX1 \fiforeg_reg[3][7]  ( .D(n216), .CLK(wclk), .Q(\fiforeg[3][7] ) );
  DFFPOSX1 \fiforeg_reg[2][7]  ( .D(n217), .CLK(wclk), .Q(\fiforeg[2][7] ) );
  DFFPOSX1 \fiforeg_reg[1][7]  ( .D(n218), .CLK(wclk), .Q(\fiforeg[1][7] ) );
  DFFPOSX1 \fiforeg_reg[0][7]  ( .D(n219), .CLK(wclk), .Q(\fiforeg[0][7] ) );
  DFFPOSX1 \fiforeg_reg[7][6]  ( .D(n220), .CLK(wclk), .Q(\fiforeg[7][6] ) );
  DFFPOSX1 \fiforeg_reg[6][6]  ( .D(n221), .CLK(wclk), .Q(\fiforeg[6][6] ) );
  DFFPOSX1 \fiforeg_reg[5][6]  ( .D(n222), .CLK(wclk), .Q(\fiforeg[5][6] ) );
  DFFPOSX1 \fiforeg_reg[4][6]  ( .D(n223), .CLK(wclk), .Q(\fiforeg[4][6] ) );
  DFFPOSX1 \fiforeg_reg[3][6]  ( .D(n224), .CLK(wclk), .Q(\fiforeg[3][6] ) );
  DFFPOSX1 \fiforeg_reg[2][6]  ( .D(n225), .CLK(wclk), .Q(\fiforeg[2][6] ) );
  DFFPOSX1 \fiforeg_reg[1][6]  ( .D(n226), .CLK(wclk), .Q(\fiforeg[1][6] ) );
  DFFPOSX1 \fiforeg_reg[0][6]  ( .D(n227), .CLK(wclk), .Q(\fiforeg[0][6] ) );
  DFFPOSX1 \fiforeg_reg[7][5]  ( .D(n228), .CLK(wclk), .Q(\fiforeg[7][5] ) );
  DFFPOSX1 \fiforeg_reg[6][5]  ( .D(n229), .CLK(wclk), .Q(\fiforeg[6][5] ) );
  DFFPOSX1 \fiforeg_reg[5][5]  ( .D(n230), .CLK(wclk), .Q(\fiforeg[5][5] ) );
  DFFPOSX1 \fiforeg_reg[4][5]  ( .D(n231), .CLK(wclk), .Q(\fiforeg[4][5] ) );
  DFFPOSX1 \fiforeg_reg[3][5]  ( .D(n232), .CLK(wclk), .Q(\fiforeg[3][5] ) );
  DFFPOSX1 \fiforeg_reg[2][5]  ( .D(n233), .CLK(wclk), .Q(\fiforeg[2][5] ) );
  DFFPOSX1 \fiforeg_reg[1][5]  ( .D(n234), .CLK(wclk), .Q(\fiforeg[1][5] ) );
  DFFPOSX1 \fiforeg_reg[0][5]  ( .D(n235), .CLK(wclk), .Q(\fiforeg[0][5] ) );
  DFFPOSX1 \fiforeg_reg[7][4]  ( .D(n236), .CLK(wclk), .Q(\fiforeg[7][4] ) );
  DFFPOSX1 \fiforeg_reg[6][4]  ( .D(n237), .CLK(wclk), .Q(\fiforeg[6][4] ) );
  DFFPOSX1 \fiforeg_reg[5][4]  ( .D(n238), .CLK(wclk), .Q(\fiforeg[5][4] ) );
  DFFPOSX1 \fiforeg_reg[4][4]  ( .D(n239), .CLK(wclk), .Q(\fiforeg[4][4] ) );
  DFFPOSX1 \fiforeg_reg[3][4]  ( .D(n240), .CLK(wclk), .Q(\fiforeg[3][4] ) );
  DFFPOSX1 \fiforeg_reg[2][4]  ( .D(n241), .CLK(wclk), .Q(\fiforeg[2][4] ) );
  DFFPOSX1 \fiforeg_reg[1][4]  ( .D(n242), .CLK(wclk), .Q(\fiforeg[1][4] ) );
  DFFPOSX1 \fiforeg_reg[0][4]  ( .D(n243), .CLK(wclk), .Q(\fiforeg[0][4] ) );
  DFFPOSX1 \fiforeg_reg[7][3]  ( .D(n244), .CLK(wclk), .Q(\fiforeg[7][3] ) );
  DFFPOSX1 \fiforeg_reg[6][3]  ( .D(n245), .CLK(wclk), .Q(\fiforeg[6][3] ) );
  DFFPOSX1 \fiforeg_reg[5][3]  ( .D(n246), .CLK(wclk), .Q(\fiforeg[5][3] ) );
  DFFPOSX1 \fiforeg_reg[4][3]  ( .D(n247), .CLK(wclk), .Q(\fiforeg[4][3] ) );
  DFFPOSX1 \fiforeg_reg[3][3]  ( .D(n248), .CLK(wclk), .Q(\fiforeg[3][3] ) );
  DFFPOSX1 \fiforeg_reg[2][3]  ( .D(n249), .CLK(wclk), .Q(\fiforeg[2][3] ) );
  DFFPOSX1 \fiforeg_reg[1][3]  ( .D(n250), .CLK(wclk), .Q(\fiforeg[1][3] ) );
  DFFPOSX1 \fiforeg_reg[0][3]  ( .D(n251), .CLK(wclk), .Q(\fiforeg[0][3] ) );
  DFFPOSX1 \fiforeg_reg[7][2]  ( .D(n252), .CLK(wclk), .Q(\fiforeg[7][2] ) );
  DFFPOSX1 \fiforeg_reg[6][2]  ( .D(n253), .CLK(wclk), .Q(\fiforeg[6][2] ) );
  DFFPOSX1 \fiforeg_reg[5][2]  ( .D(n254), .CLK(wclk), .Q(\fiforeg[5][2] ) );
  DFFPOSX1 \fiforeg_reg[4][2]  ( .D(n255), .CLK(wclk), .Q(\fiforeg[4][2] ) );
  DFFPOSX1 \fiforeg_reg[3][2]  ( .D(n256), .CLK(wclk), .Q(\fiforeg[3][2] ) );
  DFFPOSX1 \fiforeg_reg[2][2]  ( .D(n257), .CLK(wclk), .Q(\fiforeg[2][2] ) );
  DFFPOSX1 \fiforeg_reg[1][2]  ( .D(n258), .CLK(wclk), .Q(\fiforeg[1][2] ) );
  DFFPOSX1 \fiforeg_reg[0][2]  ( .D(n259), .CLK(wclk), .Q(\fiforeg[0][2] ) );
  DFFPOSX1 \fiforeg_reg[7][1]  ( .D(n260), .CLK(wclk), .Q(\fiforeg[7][1] ) );
  DFFPOSX1 \fiforeg_reg[6][1]  ( .D(n261), .CLK(wclk), .Q(\fiforeg[6][1] ) );
  DFFPOSX1 \fiforeg_reg[5][1]  ( .D(n262), .CLK(wclk), .Q(\fiforeg[5][1] ) );
  DFFPOSX1 \fiforeg_reg[4][1]  ( .D(n263), .CLK(wclk), .Q(\fiforeg[4][1] ) );
  DFFPOSX1 \fiforeg_reg[3][1]  ( .D(n264), .CLK(wclk), .Q(\fiforeg[3][1] ) );
  DFFPOSX1 \fiforeg_reg[2][1]  ( .D(n265), .CLK(wclk), .Q(\fiforeg[2][1] ) );
  DFFPOSX1 \fiforeg_reg[1][1]  ( .D(n266), .CLK(wclk), .Q(\fiforeg[1][1] ) );
  DFFPOSX1 \fiforeg_reg[0][1]  ( .D(n267), .CLK(wclk), .Q(\fiforeg[0][1] ) );
  DFFPOSX1 \fiforeg_reg[7][0]  ( .D(n275), .CLK(wclk), .Q(\fiforeg[7][0] ) );
  DFFPOSX1 \fiforeg_reg[6][0]  ( .D(n268), .CLK(wclk), .Q(\fiforeg[6][0] ) );
  DFFPOSX1 \fiforeg_reg[5][0]  ( .D(n269), .CLK(wclk), .Q(\fiforeg[5][0] ) );
  DFFPOSX1 \fiforeg_reg[4][0]  ( .D(n270), .CLK(wclk), .Q(\fiforeg[4][0] ) );
  DFFPOSX1 \fiforeg_reg[3][0]  ( .D(n271), .CLK(wclk), .Q(\fiforeg[3][0] ) );
  DFFPOSX1 \fiforeg_reg[2][0]  ( .D(n272), .CLK(wclk), .Q(\fiforeg[2][0] ) );
  DFFPOSX1 \fiforeg_reg[1][0]  ( .D(n273), .CLK(wclk), .Q(\fiforeg[1][0] ) );
  DFFPOSX1 \fiforeg_reg[0][0]  ( .D(n274), .CLK(wclk), .Q(\fiforeg[0][0] ) );
  NAND3X1 U93 ( .A(n92), .B(n93), .C(n94), .Y(rdata[7]) );
  NOR2X1 U94 ( .A(n95), .B(n96), .Y(n94) );
  NAND3X1 U99 ( .A(n101), .B(n102), .C(n103), .Y(rdata[6]) );
  NOR2X1 U100 ( .A(n104), .B(n105), .Y(n103) );
  NAND3X1 U105 ( .A(n106), .B(n107), .C(n108), .Y(rdata[5]) );
  NOR2X1 U106 ( .A(n109), .B(n110), .Y(n108) );
  NAND3X1 U111 ( .A(n111), .B(n112), .C(n113), .Y(rdata[4]) );
  NOR2X1 U112 ( .A(n114), .B(n115), .Y(n113) );
  NAND3X1 U117 ( .A(n116), .B(n117), .C(n118), .Y(rdata[3]) );
  NOR2X1 U118 ( .A(n119), .B(n120), .Y(n118) );
  NAND3X1 U123 ( .A(n121), .B(n122), .C(n123), .Y(rdata[2]) );
  NOR2X1 U124 ( .A(n124), .B(n125), .Y(n123) );
  NAND3X1 U129 ( .A(n126), .B(n127), .C(n128), .Y(rdata[1]) );
  NOR2X1 U130 ( .A(n129), .B(n130), .Y(n128) );
  NAND3X1 U135 ( .A(n131), .B(n132), .C(n133), .Y(rdata[0]) );
  NOR2X1 U136 ( .A(n134), .B(n135), .Y(n133) );
  NAND3X1 U138 ( .A(n14), .B(n325), .C(raddr[2]), .Y(n98) );
  NAND3X1 U139 ( .A(n326), .B(n325), .C(raddr[2]), .Y(n97) );
  NAND3X1 U141 ( .A(raddr[1]), .B(n14), .C(raddr[2]), .Y(n100) );
  NAND3X1 U142 ( .A(raddr[1]), .B(n326), .C(raddr[2]), .Y(n99) );
  NAND3X1 U144 ( .A(n326), .B(n324), .C(raddr[1]), .Y(n136) );
  NAND3X1 U145 ( .A(n14), .B(n324), .C(raddr[1]), .Y(n137) );
  NAND3X1 U147 ( .A(n325), .B(n324), .C(n326), .Y(n138) );
  NAND3X1 U148 ( .A(n325), .B(n324), .C(n14), .Y(n139) );
  INVX2 U2 ( .A(n37), .Y(n38) );
  INVX4 U3 ( .A(n38), .Y(n303) );
  INVX8 U4 ( .A(n67), .Y(n68) );
  BUFX4 U5 ( .A(n98), .Y(n1) );
  INVX1 U6 ( .A(wenable), .Y(n10) );
  MUX2X1 U7 ( .B(n2), .A(n199), .S(n11), .Y(n239) );
  INVX2 U8 ( .A(n11), .Y(n58) );
  MUX2X1 U9 ( .B(n2), .A(n192), .S(n9), .Y(n240) );
  INVX4 U10 ( .A(n9), .Y(n308) );
  INVX2 U11 ( .A(n8), .Y(n9) );
  BUFX2 U12 ( .A(n295), .Y(n26) );
  INVX8 U13 ( .A(n65), .Y(n2) );
  MUX2X1 U14 ( .B(n2), .A(n198), .S(n39), .Y(n238) );
  MUX2X1 U15 ( .B(n2), .A(n193), .S(n70), .Y(n242) );
  INVX4 U16 ( .A(n195), .Y(n65) );
  AND2X2 U17 ( .A(n19), .B(n45), .Y(n3) );
  AND2X2 U18 ( .A(n20), .B(n48), .Y(n4) );
  AND2X2 U19 ( .A(n50), .B(n51), .Y(n5) );
  INVX1 U20 ( .A(waddr[1]), .Y(n6) );
  INVX1 U21 ( .A(waddr[1]), .Y(n7) );
  INVX1 U22 ( .A(n305), .Y(n39) );
  INVX4 U23 ( .A(n77), .Y(n305) );
  INVX1 U24 ( .A(n25), .Y(n8) );
  MUX2X1 U25 ( .B(wdata[7]), .A(n302), .S(n10), .Y(n315) );
  INVX1 U26 ( .A(n304), .Y(n11) );
  INVX4 U27 ( .A(n67), .Y(n12) );
  BUFX2 U28 ( .A(n305), .Y(n36) );
  INVX1 U29 ( .A(n71), .Y(n13) );
  BUFX2 U30 ( .A(waddr[2]), .Y(n61) );
  INVX2 U31 ( .A(waddr[1]), .Y(n78) );
  INVX2 U32 ( .A(n12), .Y(n312) );
  BUFX4 U33 ( .A(raddr[0]), .Y(n14) );
  BUFX4 U34 ( .A(n97), .Y(n15) );
  AND2X2 U35 ( .A(n44), .B(n45), .Y(n16) );
  AND2X2 U36 ( .A(n47), .B(n48), .Y(n17) );
  AND2X2 U37 ( .A(n21), .B(n51), .Y(n18) );
  NAND2X1 U38 ( .A(n205), .B(n43), .Y(n19) );
  NAND2X1 U39 ( .A(n176), .B(n46), .Y(n20) );
  NAND2X1 U40 ( .A(n147), .B(n49), .Y(n21) );
  AND2X2 U41 ( .A(n42), .B(n41), .Y(n22) );
  AND2X2 U42 ( .A(n24), .B(n41), .Y(n23) );
  MUX2X1 U43 ( .B(n288), .A(n291), .S(n39), .Y(n222) );
  MUX2X1 U44 ( .B(wdata[2]), .A(n161), .S(n49), .Y(n166) );
  INVX4 U45 ( .A(n71), .Y(n72) );
  NAND2X1 U46 ( .A(n85), .B(n66), .Y(n24) );
  BUFX2 U47 ( .A(n296), .Y(n25) );
  INVX2 U48 ( .A(n296), .Y(n71) );
  INVX4 U49 ( .A(n293), .Y(n69) );
  MUX2X1 U50 ( .B(wdata[6]), .A(n283), .S(n46), .Y(n288) );
  MUX2X1 U51 ( .B(wdata[6]), .A(n283), .S(n43), .Y(n56) );
  INVX4 U52 ( .A(n73), .Y(n27) );
  INVX2 U53 ( .A(n295), .Y(n73) );
  INVX2 U54 ( .A(waddr[0]), .Y(n60) );
  INVX2 U55 ( .A(waddr[2]), .Y(n79) );
  AND2X2 U56 ( .A(n24), .B(n41), .Y(n28) );
  AND2X2 U57 ( .A(n42), .B(n41), .Y(n29) );
  AND2X2 U58 ( .A(n19), .B(n45), .Y(n30) );
  AND2X2 U59 ( .A(n44), .B(n45), .Y(n31) );
  AND2X2 U60 ( .A(n20), .B(n48), .Y(n32) );
  AND2X2 U61 ( .A(n47), .B(n48), .Y(n33) );
  AND2X2 U62 ( .A(n21), .B(n51), .Y(n34) );
  AND2X2 U63 ( .A(n50), .B(n51), .Y(n35) );
  INVX4 U64 ( .A(n75), .Y(n37) );
  NAND2X1 U65 ( .A(wdata[0]), .B(n40), .Y(n41) );
  NAND2X1 U66 ( .A(n85), .B(n66), .Y(n42) );
  INVX1 U67 ( .A(n66), .Y(n40) );
  NAND2X1 U68 ( .A(n205), .B(n43), .Y(n44) );
  NAND2X1 U69 ( .A(wdata[5]), .B(wenable), .Y(n45) );
  INVX1 U70 ( .A(wenable), .Y(n43) );
  NAND2X1 U71 ( .A(n176), .B(n46), .Y(n47) );
  NAND2X1 U72 ( .A(wdata[3]), .B(wenable), .Y(n48) );
  INVX1 U73 ( .A(wenable), .Y(n46) );
  NAND2X1 U74 ( .A(n147), .B(n49), .Y(n50) );
  NAND2X1 U75 ( .A(wdata[1]), .B(wenable), .Y(n51) );
  INVX1 U76 ( .A(wenable), .Y(n49) );
  MUX2X1 U77 ( .B(n168), .A(n53), .S(n314), .Y(n253) );
  BUFX4 U78 ( .A(n166), .Y(n52) );
  BUFX4 U79 ( .A(n166), .Y(n53) );
  INVX4 U80 ( .A(n78), .Y(n64) );
  BUFX4 U81 ( .A(n315), .Y(n54) );
  BUFX4 U82 ( .A(n315), .Y(n55) );
  INVX2 U83 ( .A(n79), .Y(n57) );
  INVX2 U84 ( .A(n62), .Y(n63) );
  INVX2 U85 ( .A(waddr[0]), .Y(n62) );
  INVX1 U86 ( .A(n74), .Y(n59) );
  INVX4 U87 ( .A(n74), .Y(n314) );
  INVX4 U88 ( .A(n294), .Y(n67) );
  INVX1 U89 ( .A(wenable), .Y(n66) );
  INVX4 U90 ( .A(n76), .Y(n304) );
  INVX8 U91 ( .A(n69), .Y(n70) );
  INVX2 U92 ( .A(\fiforeg[7][0] ), .Y(n90) );
  NAND3X1 U95 ( .A(n64), .B(n61), .C(n62), .Y(n74) );
  NAND3X1 U96 ( .A(n64), .B(n61), .C(n63), .Y(n75) );
  AOI22X1 U97 ( .A(\fiforeg[6][0] ), .B(n314), .C(\fiforeg[7][0] ), .D(n37), 
        .Y(n84) );
  NAND3X1 U98 ( .A(n7), .B(n62), .C(n57), .Y(n76) );
  NAND3X1 U101 ( .A(n6), .B(n61), .C(n63), .Y(n77) );
  AOI22X1 U102 ( .A(\fiforeg[4][0] ), .B(n304), .C(\fiforeg[5][0] ), .D(n305), 
        .Y(n83) );
  NAND3X1 U103 ( .A(n6), .B(n79), .C(n60), .Y(n294) );
  INVX2 U104 ( .A(\fiforeg[0][0] ), .Y(n89) );
  NAND3X1 U107 ( .A(n7), .B(waddr[0]), .C(n79), .Y(n293) );
  INVX2 U108 ( .A(\fiforeg[1][0] ), .Y(n88) );
  OAI22X1 U109 ( .A(n12), .B(n89), .C(n70), .D(n88), .Y(n81) );
  NAND3X1 U110 ( .A(n79), .B(n64), .C(waddr[0]), .Y(n296) );
  INVX2 U113 ( .A(\fiforeg[3][0] ), .Y(n87) );
  NAND3X1 U114 ( .A(n64), .B(n60), .C(n79), .Y(n295) );
  INVX2 U115 ( .A(\fiforeg[2][0] ), .Y(n86) );
  OAI22X1 U116 ( .A(n72), .B(n87), .C(n27), .D(n86), .Y(n80) );
  NOR2X1 U119 ( .A(n80), .B(n81), .Y(n82) );
  NAND3X1 U120 ( .A(n84), .B(n83), .C(n82), .Y(n85) );
  MUX2X1 U121 ( .B(n90), .A(n23), .S(n303), .Y(n275) );
  INVX2 U122 ( .A(\fiforeg[4][0] ), .Y(n141) );
  MUX2X1 U125 ( .B(n141), .A(n22), .S(n304), .Y(n270) );
  INVX2 U126 ( .A(\fiforeg[5][0] ), .Y(n140) );
  MUX2X1 U127 ( .B(n140), .A(n28), .S(n36), .Y(n269) );
  INVX2 U128 ( .A(n27), .Y(n306) );
  MUX2X1 U131 ( .B(n86), .A(n29), .S(n306), .Y(n272) );
  MUX2X1 U132 ( .B(n87), .A(n23), .S(n308), .Y(n271) );
  INVX2 U133 ( .A(n70), .Y(n310) );
  MUX2X1 U134 ( .B(n88), .A(n22), .S(n310), .Y(n273) );
  MUX2X1 U137 ( .B(n89), .A(n28), .S(n312), .Y(n274) );
  INVX2 U140 ( .A(\fiforeg[6][0] ), .Y(n91) );
  MUX2X1 U143 ( .B(n91), .A(n29), .S(n314), .Y(n268) );
  OAI22X1 U146 ( .A(n99), .B(n91), .C(n100), .D(n90), .Y(n134) );
  OAI22X1 U149 ( .A(n15), .B(n141), .C(n1), .D(n140), .Y(n135) );
  AOI22X1 U150 ( .A(\fiforeg[0][0] ), .B(n321), .C(\fiforeg[1][0] ), .D(n320), 
        .Y(n131) );
  AOI22X1 U151 ( .A(\fiforeg[2][0] ), .B(n323), .C(\fiforeg[3][0] ), .D(n322), 
        .Y(n132) );
  INVX2 U152 ( .A(\fiforeg[7][1] ), .Y(n152) );
  AOI22X1 U153 ( .A(\fiforeg[6][1] ), .B(n314), .C(\fiforeg[7][1] ), .D(n37), 
        .Y(n146) );
  AOI22X1 U154 ( .A(\fiforeg[4][1] ), .B(n304), .C(\fiforeg[5][1] ), .D(n305), 
        .Y(n145) );
  INVX2 U155 ( .A(\fiforeg[0][1] ), .Y(n151) );
  INVX2 U156 ( .A(\fiforeg[1][1] ), .Y(n150) );
  OAI22X1 U157 ( .A(n12), .B(n151), .C(n70), .D(n150), .Y(n143) );
  INVX2 U158 ( .A(\fiforeg[3][1] ), .Y(n149) );
  INVX2 U159 ( .A(\fiforeg[2][1] ), .Y(n148) );
  OAI22X1 U160 ( .A(n72), .B(n149), .C(n27), .D(n148), .Y(n142) );
  NOR2X1 U161 ( .A(n142), .B(n143), .Y(n144) );
  NAND3X1 U162 ( .A(n146), .B(n145), .C(n144), .Y(n147) );
  MUX2X1 U163 ( .B(n152), .A(n34), .S(n303), .Y(n260) );
  INVX2 U164 ( .A(\fiforeg[4][1] ), .Y(n155) );
  MUX2X1 U165 ( .B(n155), .A(n5), .S(n304), .Y(n263) );
  INVX2 U166 ( .A(\fiforeg[5][1] ), .Y(n154) );
  MUX2X1 U167 ( .B(n154), .A(n18), .S(n36), .Y(n262) );
  MUX2X1 U168 ( .B(n148), .A(n35), .S(n306), .Y(n265) );
  MUX2X1 U169 ( .B(n149), .A(n34), .S(n308), .Y(n264) );
  MUX2X1 U170 ( .B(n150), .A(n18), .S(n310), .Y(n266) );
  MUX2X1 U171 ( .B(n151), .A(n35), .S(n312), .Y(n267) );
  INVX2 U172 ( .A(\fiforeg[6][1] ), .Y(n153) );
  MUX2X1 U173 ( .B(n153), .A(n5), .S(n314), .Y(n261) );
  OAI22X1 U174 ( .A(n99), .B(n153), .C(n100), .D(n152), .Y(n129) );
  OAI22X1 U175 ( .A(n15), .B(n155), .C(n1), .D(n154), .Y(n130) );
  AOI22X1 U176 ( .A(\fiforeg[0][1] ), .B(n321), .C(\fiforeg[1][1] ), .D(n320), 
        .Y(n126) );
  AOI22X1 U177 ( .A(\fiforeg[2][1] ), .B(n323), .C(\fiforeg[3][1] ), .D(n322), 
        .Y(n127) );
  INVX2 U178 ( .A(\fiforeg[7][2] ), .Y(n167) );
  AOI22X1 U179 ( .A(\fiforeg[6][2] ), .B(n314), .C(\fiforeg[7][2] ), .D(n37), 
        .Y(n160) );
  AOI22X1 U180 ( .A(\fiforeg[4][2] ), .B(n304), .C(\fiforeg[5][2] ), .D(n305), 
        .Y(n159) );
  INVX2 U181 ( .A(\fiforeg[0][2] ), .Y(n165) );
  INVX2 U182 ( .A(\fiforeg[1][2] ), .Y(n164) );
  OAI22X1 U183 ( .A(n68), .B(n165), .C(n70), .D(n164), .Y(n157) );
  INVX2 U184 ( .A(\fiforeg[3][2] ), .Y(n163) );
  INVX2 U185 ( .A(\fiforeg[2][2] ), .Y(n162) );
  OAI22X1 U186 ( .A(n163), .B(n72), .C(n27), .D(n162), .Y(n156) );
  NOR2X1 U187 ( .A(n157), .B(n156), .Y(n158) );
  NAND3X1 U188 ( .A(n160), .B(n159), .C(n158), .Y(n161) );
  MUX2X1 U189 ( .B(n167), .A(n53), .S(n303), .Y(n252) );
  INVX2 U190 ( .A(\fiforeg[4][2] ), .Y(n170) );
  MUX2X1 U191 ( .B(n170), .A(n53), .S(n304), .Y(n255) );
  INVX2 U192 ( .A(\fiforeg[5][2] ), .Y(n169) );
  MUX2X1 U193 ( .B(n169), .A(n53), .S(n36), .Y(n254) );
  MUX2X1 U194 ( .B(n162), .A(n52), .S(n306), .Y(n257) );
  MUX2X1 U195 ( .B(n163), .A(n52), .S(n308), .Y(n256) );
  MUX2X1 U196 ( .B(n164), .A(n52), .S(n310), .Y(n258) );
  MUX2X1 U197 ( .B(n165), .A(n52), .S(n312), .Y(n259) );
  INVX2 U198 ( .A(\fiforeg[6][2] ), .Y(n168) );
  OAI22X1 U199 ( .A(n99), .B(n168), .C(n100), .D(n167), .Y(n124) );
  OAI22X1 U200 ( .A(n15), .B(n170), .C(n1), .D(n169), .Y(n125) );
  AOI22X1 U201 ( .A(\fiforeg[0][2] ), .B(n321), .C(\fiforeg[1][2] ), .D(n320), 
        .Y(n121) );
  AOI22X1 U202 ( .A(\fiforeg[2][2] ), .B(n323), .C(\fiforeg[3][2] ), .D(n322), 
        .Y(n122) );
  INVX2 U203 ( .A(\fiforeg[7][3] ), .Y(n181) );
  AOI22X1 U204 ( .A(\fiforeg[6][3] ), .B(n314), .C(\fiforeg[7][3] ), .D(n37), 
        .Y(n175) );
  AOI22X1 U205 ( .A(\fiforeg[4][3] ), .B(n304), .C(\fiforeg[5][3] ), .D(n305), 
        .Y(n174) );
  INVX2 U206 ( .A(\fiforeg[0][3] ), .Y(n180) );
  INVX2 U207 ( .A(\fiforeg[1][3] ), .Y(n179) );
  OAI22X1 U208 ( .A(n12), .B(n180), .C(n70), .D(n179), .Y(n172) );
  INVX2 U209 ( .A(\fiforeg[3][3] ), .Y(n178) );
  INVX2 U210 ( .A(\fiforeg[2][3] ), .Y(n177) );
  OAI22X1 U211 ( .A(n72), .B(n178), .C(n27), .D(n177), .Y(n171) );
  NOR2X1 U212 ( .A(n171), .B(n172), .Y(n173) );
  NAND3X1 U213 ( .A(n175), .B(n174), .C(n173), .Y(n176) );
  MUX2X1 U214 ( .B(n181), .A(n4), .S(n303), .Y(n244) );
  INVX2 U215 ( .A(\fiforeg[4][3] ), .Y(n184) );
  MUX2X1 U216 ( .B(n184), .A(n33), .S(n304), .Y(n247) );
  INVX2 U217 ( .A(\fiforeg[5][3] ), .Y(n183) );
  MUX2X1 U218 ( .B(n183), .A(n32), .S(n36), .Y(n246) );
  MUX2X1 U219 ( .B(n177), .A(n17), .S(n306), .Y(n249) );
  MUX2X1 U220 ( .B(n178), .A(n4), .S(n308), .Y(n248) );
  MUX2X1 U221 ( .B(n179), .A(n17), .S(n310), .Y(n250) );
  MUX2X1 U222 ( .B(n180), .A(n32), .S(n312), .Y(n251) );
  INVX2 U223 ( .A(\fiforeg[6][3] ), .Y(n182) );
  MUX2X1 U224 ( .B(n182), .A(n33), .S(n59), .Y(n245) );
  OAI22X1 U225 ( .A(n99), .B(n182), .C(n100), .D(n181), .Y(n119) );
  OAI22X1 U226 ( .A(n15), .B(n184), .C(n1), .D(n183), .Y(n120) );
  AOI22X1 U227 ( .A(\fiforeg[0][3] ), .B(n321), .C(\fiforeg[1][3] ), .D(n320), 
        .Y(n116) );
  AOI22X1 U228 ( .A(\fiforeg[2][3] ), .B(n323), .C(\fiforeg[3][3] ), .D(n322), 
        .Y(n117) );
  INVX2 U229 ( .A(\fiforeg[7][4] ), .Y(n196) );
  AOI22X1 U230 ( .A(\fiforeg[6][4] ), .B(n314), .C(\fiforeg[7][4] ), .D(n37), 
        .Y(n189) );
  AOI22X1 U231 ( .A(\fiforeg[4][4] ), .B(n304), .C(\fiforeg[5][4] ), .D(n305), 
        .Y(n188) );
  INVX2 U232 ( .A(\fiforeg[0][4] ), .Y(n194) );
  INVX2 U233 ( .A(\fiforeg[1][4] ), .Y(n193) );
  OAI22X1 U234 ( .A(n68), .B(n194), .C(n70), .D(n193), .Y(n186) );
  INVX2 U235 ( .A(\fiforeg[3][4] ), .Y(n192) );
  INVX2 U236 ( .A(\fiforeg[2][4] ), .Y(n191) );
  OAI22X1 U237 ( .A(n25), .B(n192), .C(n26), .D(n191), .Y(n185) );
  NOR2X1 U238 ( .A(n185), .B(n186), .Y(n187) );
  NAND3X1 U239 ( .A(n189), .B(n188), .C(n187), .Y(n190) );
  MUX2X1 U240 ( .B(n190), .A(wdata[4]), .S(wenable), .Y(n195) );
  MUX2X1 U241 ( .B(n196), .A(n2), .S(n303), .Y(n236) );
  INVX2 U242 ( .A(\fiforeg[4][4] ), .Y(n199) );
  INVX2 U243 ( .A(\fiforeg[5][4] ), .Y(n198) );
  MUX2X1 U244 ( .B(n191), .A(n2), .S(n306), .Y(n241) );
  MUX2X1 U245 ( .B(n194), .A(n2), .S(n312), .Y(n243) );
  INVX2 U246 ( .A(\fiforeg[6][4] ), .Y(n197) );
  MUX2X1 U247 ( .B(n197), .A(n2), .S(n59), .Y(n237) );
  OAI22X1 U248 ( .A(n99), .B(n197), .C(n100), .D(n196), .Y(n114) );
  OAI22X1 U249 ( .A(n15), .B(n199), .C(n1), .D(n198), .Y(n115) );
  AOI22X1 U250 ( .A(\fiforeg[0][4] ), .B(n321), .C(\fiforeg[1][4] ), .D(n320), 
        .Y(n111) );
  AOI22X1 U251 ( .A(\fiforeg[2][4] ), .B(n323), .C(\fiforeg[3][4] ), .D(n322), 
        .Y(n112) );
  INVX2 U252 ( .A(\fiforeg[7][5] ), .Y(n210) );
  AOI22X1 U253 ( .A(\fiforeg[6][5] ), .B(n314), .C(\fiforeg[7][5] ), .D(n37), 
        .Y(n204) );
  AOI22X1 U254 ( .A(\fiforeg[4][5] ), .B(n304), .C(\fiforeg[5][5] ), .D(n305), 
        .Y(n203) );
  INVX2 U255 ( .A(\fiforeg[0][5] ), .Y(n209) );
  INVX2 U256 ( .A(\fiforeg[1][5] ), .Y(n208) );
  OAI22X1 U257 ( .A(n12), .B(n209), .C(n70), .D(n208), .Y(n201) );
  INVX2 U258 ( .A(\fiforeg[3][5] ), .Y(n207) );
  INVX2 U259 ( .A(\fiforeg[2][5] ), .Y(n206) );
  OAI22X1 U260 ( .A(n72), .B(n207), .C(n27), .D(n206), .Y(n200) );
  NOR2X1 U261 ( .A(n200), .B(n201), .Y(n202) );
  NAND3X1 U262 ( .A(n204), .B(n203), .C(n202), .Y(n205) );
  MUX2X1 U263 ( .B(n210), .A(n3), .S(n303), .Y(n228) );
  INVX2 U264 ( .A(\fiforeg[4][5] ), .Y(n277) );
  MUX2X1 U265 ( .B(n277), .A(n31), .S(n304), .Y(n231) );
  INVX2 U266 ( .A(\fiforeg[5][5] ), .Y(n276) );
  MUX2X1 U267 ( .B(n276), .A(n30), .S(n36), .Y(n230) );
  MUX2X1 U268 ( .B(n206), .A(n16), .S(n306), .Y(n233) );
  MUX2X1 U269 ( .B(n207), .A(n3), .S(n308), .Y(n232) );
  MUX2X1 U270 ( .B(n208), .A(n16), .S(n310), .Y(n234) );
  MUX2X1 U271 ( .B(n209), .A(n30), .S(n312), .Y(n235) );
  INVX2 U272 ( .A(\fiforeg[6][5] ), .Y(n211) );
  MUX2X1 U273 ( .B(n211), .A(n31), .S(n59), .Y(n229) );
  OAI22X1 U274 ( .A(n99), .B(n211), .C(n100), .D(n210), .Y(n109) );
  OAI22X1 U275 ( .A(n15), .B(n277), .C(n1), .D(n276), .Y(n110) );
  AOI22X1 U276 ( .A(\fiforeg[0][5] ), .B(n321), .C(\fiforeg[1][5] ), .D(n320), 
        .Y(n106) );
  AOI22X1 U277 ( .A(\fiforeg[2][5] ), .B(n323), .C(\fiforeg[3][5] ), .D(n322), 
        .Y(n107) );
  INVX2 U278 ( .A(\fiforeg[7][6] ), .Y(n289) );
  AOI22X1 U279 ( .A(\fiforeg[6][6] ), .B(n314), .C(\fiforeg[7][6] ), .D(n37), 
        .Y(n282) );
  AOI22X1 U280 ( .A(\fiforeg[4][6] ), .B(n304), .C(\fiforeg[5][6] ), .D(n305), 
        .Y(n281) );
  INVX2 U281 ( .A(\fiforeg[0][6] ), .Y(n287) );
  INVX2 U282 ( .A(\fiforeg[1][6] ), .Y(n286) );
  OAI22X1 U283 ( .A(n287), .B(n68), .C(n70), .D(n286), .Y(n279) );
  INVX2 U284 ( .A(\fiforeg[3][6] ), .Y(n285) );
  INVX2 U285 ( .A(\fiforeg[2][6] ), .Y(n284) );
  OAI22X1 U286 ( .A(n285), .B(n13), .C(n26), .D(n284), .Y(n278) );
  NOR2X1 U287 ( .A(n279), .B(n278), .Y(n280) );
  NAND3X1 U288 ( .A(n282), .B(n281), .C(n280), .Y(n283) );
  MUX2X1 U289 ( .B(n289), .A(n288), .S(n37), .Y(n220) );
  INVX2 U290 ( .A(\fiforeg[4][6] ), .Y(n292) );
  MUX2X1 U291 ( .B(n292), .A(n56), .S(n58), .Y(n223) );
  INVX2 U292 ( .A(\fiforeg[5][6] ), .Y(n291) );
  MUX2X1 U293 ( .B(n284), .A(n56), .S(n306), .Y(n225) );
  MUX2X1 U294 ( .B(n285), .A(n288), .S(n308), .Y(n224) );
  MUX2X1 U295 ( .B(n286), .A(n288), .S(n310), .Y(n226) );
  MUX2X1 U296 ( .B(n287), .A(n56), .S(n312), .Y(n227) );
  INVX2 U297 ( .A(\fiforeg[6][6] ), .Y(n290) );
  MUX2X1 U298 ( .B(n290), .A(n56), .S(n59), .Y(n221) );
  OAI22X1 U299 ( .A(n99), .B(n290), .C(n100), .D(n289), .Y(n104) );
  OAI22X1 U300 ( .A(n15), .B(n292), .C(n1), .D(n291), .Y(n105) );
  AOI22X1 U301 ( .A(\fiforeg[0][6] ), .B(n321), .C(\fiforeg[1][6] ), .D(n320), 
        .Y(n101) );
  AOI22X1 U302 ( .A(\fiforeg[2][6] ), .B(n323), .C(\fiforeg[3][6] ), .D(n322), 
        .Y(n102) );
  INVX2 U303 ( .A(\fiforeg[7][7] ), .Y(n316) );
  AOI22X1 U304 ( .A(n314), .B(\fiforeg[6][7] ), .C(n37), .D(\fiforeg[7][7] ), 
        .Y(n301) );
  AOI22X1 U305 ( .A(n304), .B(\fiforeg[4][7] ), .C(n305), .D(\fiforeg[5][7] ), 
        .Y(n300) );
  INVX2 U306 ( .A(\fiforeg[0][7] ), .Y(n313) );
  INVX2 U307 ( .A(\fiforeg[1][7] ), .Y(n311) );
  OAI22X1 U308 ( .A(n68), .B(n313), .C(n311), .D(n70), .Y(n298) );
  INVX2 U309 ( .A(\fiforeg[3][7] ), .Y(n309) );
  INVX2 U310 ( .A(\fiforeg[2][7] ), .Y(n307) );
  OAI22X1 U311 ( .A(n309), .B(n72), .C(n307), .D(n27), .Y(n297) );
  NOR2X1 U312 ( .A(n298), .B(n297), .Y(n299) );
  NAND3X1 U313 ( .A(n300), .B(n301), .C(n299), .Y(n302) );
  MUX2X1 U314 ( .B(n316), .A(n54), .S(n303), .Y(n212) );
  INVX2 U315 ( .A(\fiforeg[4][7] ), .Y(n319) );
  MUX2X1 U316 ( .B(n319), .A(n54), .S(n58), .Y(n215) );
  INVX2 U317 ( .A(\fiforeg[5][7] ), .Y(n318) );
  MUX2X1 U318 ( .B(n318), .A(n54), .S(n36), .Y(n214) );
  MUX2X1 U319 ( .B(n307), .A(n54), .S(n306), .Y(n217) );
  MUX2X1 U320 ( .B(n309), .A(n55), .S(n308), .Y(n216) );
  MUX2X1 U321 ( .B(n311), .A(n55), .S(n310), .Y(n218) );
  MUX2X1 U322 ( .B(n313), .A(n55), .S(n312), .Y(n219) );
  INVX2 U323 ( .A(\fiforeg[6][7] ), .Y(n317) );
  MUX2X1 U324 ( .B(n317), .A(n55), .S(n59), .Y(n213) );
  OAI22X1 U325 ( .A(n99), .B(n317), .C(n100), .D(n316), .Y(n95) );
  OAI22X1 U326 ( .A(n15), .B(n319), .C(n1), .D(n318), .Y(n96) );
  AOI22X1 U327 ( .A(\fiforeg[0][7] ), .B(n321), .C(\fiforeg[1][7] ), .D(n320), 
        .Y(n92) );
  AOI22X1 U328 ( .A(\fiforeg[2][7] ), .B(n323), .C(\fiforeg[3][7] ), .D(n322), 
        .Y(n93) );
  INVX2 U329 ( .A(n139), .Y(n320) );
  INVX2 U330 ( .A(n138), .Y(n321) );
  INVX2 U331 ( .A(n137), .Y(n322) );
  INVX2 U332 ( .A(n136), .Y(n323) );
  INVX2 U333 ( .A(raddr[2]), .Y(n324) );
  INVX2 U334 ( .A(raddr[1]), .Y(n325) );
  INVX2 U335 ( .A(raddr[0]), .Y(n326) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n9, n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(n13), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(n10), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  INVX1 U4 ( .A(wenable), .Y(n19) );
  INVX2 U11 ( .A(n12), .Y(n11) );
  INVX2 U12 ( .A(binary_r[3]), .Y(n12) );
  INVX1 U14 ( .A(binary_nxt[1]), .Y(n9) );
  INVX2 U15 ( .A(n9), .Y(n10) );
  XOR2X1 U16 ( .A(n29), .B(n11), .Y(n30) );
  XNOR2X1 U17 ( .A(wenable), .B(n17), .Y(n13) );
  XNOR2X1 U18 ( .A(n23), .B(n13), .Y(wptr_nxt[0]) );
  XNOR2X1 U19 ( .A(n27), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  INVX2 U20 ( .A(n18), .Y(n16) );
  INVX4 U21 ( .A(n30), .Y(wptr_nxt[3]) );
  INVX1 U22 ( .A(wenable), .Y(n32) );
  INVX1 U23 ( .A(binary_r[1]), .Y(n18) );
  INVX2 U24 ( .A(binary_r[0]), .Y(n17) );
  NAND2X1 U25 ( .A(n17), .B(n18), .Y(n22) );
  NAND3X1 U26 ( .A(wenable), .B(n16), .C(binary_r[0]), .Y(n21) );
  NAND2X1 U27 ( .A(n19), .B(n18), .Y(n20) );
  NAND3X1 U28 ( .A(n22), .B(n21), .C(n20), .Y(n23) );
  INVX2 U29 ( .A(n23), .Y(binary_nxt[1]) );
  NAND2X1 U30 ( .A(wenable), .B(binary_r[0]), .Y(n35) );
  NAND2X1 U31 ( .A(binary_r[2]), .B(n16), .Y(n26) );
  INVX2 U32 ( .A(binary_r[2]), .Y(n31) );
  NAND2X1 U33 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n34) );
  INVX2 U34 ( .A(n34), .Y(n28) );
  NOR2X1 U35 ( .A(binary_r[2]), .B(n28), .Y(n24) );
  AOI21X1 U36 ( .A(n32), .B(n31), .C(n24), .Y(n25) );
  OAI21X1 U37 ( .A(n35), .B(n26), .C(n25), .Y(n27) );
  INVX2 U38 ( .A(n27), .Y(binary_nxt[2]) );
  NAND3X1 U39 ( .A(wenable), .B(n28), .C(binary_r[2]), .Y(n29) );
  NAND3X1 U40 ( .A(binary_r[3]), .B(n32), .C(n31), .Y(n39) );
  XOR2X1 U41 ( .A(binary_r[3]), .B(binary_r[2]), .Y(n33) );
  OAI21X1 U42 ( .A(binary_r[2]), .B(n34), .C(n33), .Y(n38) );
  INVX2 U43 ( .A(n35), .Y(n36) );
  NAND3X1 U44 ( .A(n16), .B(n12), .C(n36), .Y(n37) );
  NAND3X1 U45 ( .A(n39), .B(n38), .C(n37), .Y(wptr_nxt[2]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n25, \gray_wptr[2] , N5, n2, n3, n4, n6, n18, n19, n20, n21, n22, n23,
         n24;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  DFFSR \wrptr_r1_reg[3]  ( .D(rptr[3]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[3]) );
  DFFSR \wrptr_r1_reg[2]  ( .D(rptr[2]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[2]) );
  DFFSR \wrptr_r1_reg[1]  ( .D(rptr[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[1]) );
  DFFSR \wrptr_r1_reg[0]  ( .D(rptr[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        wrptr_r1[0]) );
  DFFSR \wrptr_r2_reg[3]  ( .D(wrptr_r1[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[3]) );
  DFFSR \wrptr_r2_reg[2]  ( .D(wrptr_r1[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[2]) );
  DFFSR \wrptr_r2_reg[1]  ( .D(wrptr_r1[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[1]) );
  DFFSR \wrptr_r2_reg[0]  ( .D(wrptr_r1[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wrptr_r2[0]) );
  DFFSR full_flag_r_reg ( .D(N5), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        full_flag) );
  DFFSR \waddr_reg[2]  ( .D(\gray_wptr[2] ), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(waddr[2]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        n25) );
  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  NAND2X1 U15 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U16 ( .A(wptr_nxt[1]), .B(wrptr_r2[1]), .Y(n3) );
  AND2X1 U17 ( .A(n19), .B(n18), .Y(n4) );
  INVX4 U18 ( .A(n24), .Y(wenable_fifo) );
  XOR2X1 U19 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n6) );
  XOR2X1 U20 ( .A(wptr_nxt[3]), .B(n6), .Y(n21) );
  NOR2X1 U21 ( .A(n22), .B(n2), .Y(N5) );
  BUFX4 U22 ( .A(n25), .Y(waddr[0]) );
  INVX1 U23 ( .A(full_flag), .Y(n23) );
  XNOR2X1 U24 ( .A(wptr_nxt[0]), .B(wrptr_r2[0]), .Y(n19) );
  XOR2X1 U25 ( .A(wptr_nxt[3]), .B(wrptr_r2[3]), .Y(n18) );
  INVX2 U26 ( .A(wptr_nxt[2]), .Y(n20) );
  XNOR2X1 U27 ( .A(n21), .B(n20), .Y(n22) );
  NAND2X1 U28 ( .A(wenable), .B(n23), .Y(n24) );
  XOR2X1 U29 ( .A(wptr_nxt[2]), .B(wptr_nxt[3]), .Y(\gray_wptr[2] ) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   \binary_nxt[0] , n1, n2, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(\binary_nxt[0] ), .CLK(rclk), .R(rst_n), .S(
        1'b1), .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(n48), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(n46), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  DFFSR \gray_r_reg[1]  ( .D(n2), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(rptr[1])
         );
  INVX1 U3 ( .A(rptr_nxt[1]), .Y(n1) );
  INVX1 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(binary_r[2]), .Y(n12) );
  BUFX2 U14 ( .A(renable), .Y(n11) );
  AND2X2 U15 ( .A(renable), .B(n17), .Y(n19) );
  INVX4 U16 ( .A(n12), .Y(n13) );
  INVX2 U17 ( .A(n38), .Y(n14) );
  INVX2 U18 ( .A(binary_r[1]), .Y(n38) );
  BUFX2 U19 ( .A(n11), .Y(n15) );
  XOR2X1 U20 ( .A(n32), .B(n16), .Y(n20) );
  NAND2X1 U21 ( .A(n12), .B(n31), .Y(n16) );
  AND2X2 U22 ( .A(binary_r[1]), .B(binary_r[0]), .Y(n17) );
  INVX2 U23 ( .A(n17), .Y(n41) );
  INVX1 U24 ( .A(n22), .Y(n18) );
  NOR2X1 U25 ( .A(n19), .B(n29), .Y(n32) );
  AND2X2 U26 ( .A(n20), .B(n27), .Y(rptr_nxt[1]) );
  XOR2X1 U27 ( .A(n15), .B(n18), .Y(\binary_nxt[0] ) );
  INVX2 U28 ( .A(binary_r[0]), .Y(n22) );
  NAND2X1 U29 ( .A(n22), .B(n38), .Y(n28) );
  INVX2 U30 ( .A(n28), .Y(n23) );
  INVX2 U31 ( .A(renable), .Y(n42) );
  OAI22X1 U32 ( .A(n41), .B(n42), .C(n14), .D(n15), .Y(n21) );
  NOR2X1 U33 ( .A(n23), .B(n21), .Y(n48) );
  OAI21X1 U34 ( .A(n22), .B(n38), .C(n28), .Y(n25) );
  OAI21X1 U35 ( .A(n18), .B(n23), .C(n41), .Y(n24) );
  AOI22X1 U36 ( .A(n25), .B(n42), .C(n15), .D(n24), .Y(rptr_nxt[0]) );
  NAND2X1 U37 ( .A(n41), .B(n12), .Y(n30) );
  NAND3X1 U38 ( .A(n11), .B(n13), .C(n17), .Y(n27) );
  NAND2X1 U39 ( .A(n30), .B(n27), .Y(n26) );
  AOI21X1 U40 ( .A(n42), .B(n12), .C(n26), .Y(n46) );
  OAI21X1 U41 ( .A(renable), .B(n14), .C(n28), .Y(n29) );
  NAND2X1 U42 ( .A(renable), .B(n30), .Y(n31) );
  NAND3X1 U43 ( .A(binary_r[3]), .B(n13), .C(n17), .Y(n36) );
  INVX2 U44 ( .A(binary_r[3]), .Y(n34) );
  AOI21X1 U45 ( .A(n13), .B(n17), .C(binary_r[3]), .Y(n33) );
  AOI21X1 U46 ( .A(n42), .B(n34), .C(n33), .Y(n35) );
  OAI21X1 U47 ( .A(n36), .B(n42), .C(n35), .Y(n37) );
  INVX2 U48 ( .A(n37), .Y(rptr_nxt[3]) );
  NOR2X1 U49 ( .A(binary_r[3]), .B(n38), .Y(n39) );
  NAND3X1 U50 ( .A(n11), .B(n18), .C(n39), .Y(n45) );
  XOR2X1 U51 ( .A(binary_r[3]), .B(n13), .Y(n40) );
  OAI21X1 U52 ( .A(n13), .B(n41), .C(n40), .Y(n44) );
  NAND3X1 U53 ( .A(binary_r[3]), .B(n42), .C(n12), .Y(n43) );
  NAND3X1 U54 ( .A(n45), .B(n44), .C(n43), .Y(rptr_nxt[2]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n2, n3, n4, n17, n18, n19, n20,
         n21;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  DFFSR \rwptr_r1_reg[3]  ( .D(wptr[3]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[3]) );
  DFFSR \rwptr_r1_reg[2]  ( .D(wptr[2]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[2]) );
  DFFSR \rwptr_r1_reg[1]  ( .D(wptr[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[1]) );
  DFFSR \rwptr_r1_reg[0]  ( .D(wptr[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        rwptr_r1[0]) );
  DFFSR \rwptr_r2_reg[3]  ( .D(rwptr_r1[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[3]) );
  DFFSR \rwptr_r2_reg[2]  ( .D(rwptr_r1[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[2]) );
  DFFSR \rwptr_r2_reg[1]  ( .D(rwptr_r1[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[1]) );
  DFFSR \rwptr_r2_reg[0]  ( .D(rwptr_r1[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rwptr_r2[0]) );
  DFFSR empty_flag_r_reg ( .D(N3), .CLK(rclk), .R(1'b1), .S(rst_n), .Q(
        empty_flag) );
  DFFSR \raddr_reg[2]  ( .D(\gray_rptr[2] ), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(raddr[2]) );
  DFFSR \raddr_reg[1]  ( .D(n2), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(raddr[1])
         );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
  XOR2X1 U15 ( .A(rptr_nxt[1]), .B(rwptr_r2[1]), .Y(n20) );
  INVX2 U16 ( .A(n3), .Y(renable_p2) );
  INVX1 U17 ( .A(rptr_nxt[1]), .Y(n1) );
  INVX1 U18 ( .A(n1), .Y(n2) );
  NAND2X1 U19 ( .A(n21), .B(renable), .Y(n3) );
  XOR2X1 U20 ( .A(rptr_nxt[0]), .B(rwptr_r2[0]), .Y(n19) );
  XNOR2X1 U21 ( .A(rptr_nxt[2]), .B(rwptr_r2[2]), .Y(n17) );
  XNOR2X1 U22 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n4) );
  NAND2X1 U23 ( .A(n17), .B(n4), .Y(n18) );
  NOR3X1 U24 ( .A(n19), .B(n20), .C(n18), .Y(N3) );
  INVX2 U25 ( .A(empty_flag), .Y(n21) );
  XOR2X1 U26 ( .A(rptr_nxt[2]), .B(rptr_nxt[3]), .Y(\gray_rptr[2] ) );
endmodule


module fifo ( r_clk, w_clk, n_rst, r_enable, w_enable, w_data, r_data, empty, 
        full );
  input [7:0] w_data;
  output [7:0] r_data;
  input r_clk, w_clk, n_rst, r_enable, w_enable;
  output empty, full;
  wire   wenable_fifo;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  wire   [3:0] rptr;
  wire   [3:0] wptr;

  fiforam UFIFORAM ( .wclk(w_clk), .wenable(wenable_fifo), .waddr(waddr), 
        .raddr(raddr), .wdata(w_data), .rdata(r_data) );
  write_fifo_ctrl UWFC ( .wclk(w_clk), .rst_n(n_rst), .wenable(w_enable), 
        .rptr(rptr), .wenable_fifo(wenable_fifo), .wptr(wptr), .waddr(waddr), 
        .full_flag(full) );
  read_fifo_ctrl URFC ( .rclk(r_clk), .rst_n(n_rst), .renable(r_enable), 
        .wptr(wptr), .rptr(rptr), .raddr(raddr), .empty_flag(empty) );
endmodule


module tx_fifo ( clk, n_rst, read_enable, write_enable, write_data, read_data, 
        fifo_empty, fifo_full );
  input [7:0] write_data;
  output [7:0] read_data;
  input clk, n_rst, read_enable, write_enable;
  output fifo_empty, fifo_full;


  fifo FI ( .r_clk(clk), .w_clk(clk), .n_rst(n_rst), .r_enable(read_enable), 
        .w_enable(write_enable), .w_data(write_data), .r_data(read_data), 
        .empty(fifo_empty), .full(fifo_full) );
endmodule


module decode ( clk, n_rst, scl, sda_in, starting_byte, rw_mode, address_match, 
        start_found, stop_found );
  input [7:0] starting_byte;
  input clk, n_rst, scl, sda_in;
  output rw_mode, address_match, start_found, stop_found;
  wire   sc1, sc2, sd1, sd2, N1, N2, n12, n13, n14, n19, n9, n10, n11, n15,
         n16, n17;

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
  NOR2X1 U14 ( .A(n12), .B(n13), .Y(n19) );
  NAND3X1 U15 ( .A(starting_byte[6]), .B(starting_byte[5]), .C(
        starting_byte[7]), .Y(n13) );
  NAND3X1 U16 ( .A(starting_byte[4]), .B(n17), .C(n14), .Y(n12) );
  NOR2X1 U17 ( .A(starting_byte[3]), .B(starting_byte[2]), .Y(n14) );
  NAND2X1 U11 ( .A(sc2), .B(sc1), .Y(n15) );
  INVX2 U12 ( .A(sd2), .Y(n9) );
  NAND2X1 U13 ( .A(sd1), .B(n9), .Y(n10) );
  NOR2X1 U18 ( .A(n15), .B(n10), .Y(N2) );
  INVX2 U19 ( .A(sd1), .Y(n11) );
  NAND2X1 U20 ( .A(sd2), .B(n11), .Y(n16) );
  NOR2X1 U21 ( .A(n16), .B(n15), .Y(N1) );
  INVX2 U22 ( .A(starting_byte[1]), .Y(n17) );
endmodule


module flex_stp_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n10, n12, n14, n16, n18, n20, n22, n24, n26, n1, n2, n3, n4, n5, n6,
         n7, n8;

  DFFSR \parallel_out_reg[0]  ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n22), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[7]  ( .D(n12), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  OAI21X1 U17 ( .A(shift_enable), .B(n8), .C(n10), .Y(n26) );
  NAND2X1 U18 ( .A(serial_in), .B(shift_enable), .Y(n10) );
  INVX2 U2 ( .A(parallel_out[1]), .Y(n1) );
  MUX2X1 U3 ( .B(n1), .A(n8), .S(shift_enable), .Y(n24) );
  INVX2 U4 ( .A(parallel_out[2]), .Y(n2) );
  MUX2X1 U5 ( .B(n2), .A(n1), .S(shift_enable), .Y(n22) );
  INVX2 U6 ( .A(parallel_out[3]), .Y(n3) );
  MUX2X1 U7 ( .B(n3), .A(n2), .S(shift_enable), .Y(n20) );
  INVX2 U8 ( .A(parallel_out[4]), .Y(n4) );
  MUX2X1 U9 ( .B(n4), .A(n3), .S(shift_enable), .Y(n18) );
  INVX2 U10 ( .A(parallel_out[5]), .Y(n5) );
  MUX2X1 U11 ( .B(n5), .A(n4), .S(shift_enable), .Y(n16) );
  INVX2 U12 ( .A(parallel_out[6]), .Y(n6) );
  MUX2X1 U13 ( .B(n6), .A(n5), .S(shift_enable), .Y(n14) );
  INVX2 U14 ( .A(parallel_out[7]), .Y(n7) );
  MUX2X1 U15 ( .B(n7), .A(n6), .S(shift_enable), .Y(n12) );
  INVX2 U16 ( .A(parallel_out[0]), .Y(n8) );
endmodule


module rx_sr ( clk, n_rst, sda_in, rising_edge_found, rx_enable, rx_data );
  output [7:0] rx_data;
  input clk, n_rst, sda_in, rising_edge_found, rx_enable;
  wire   _0_net_;

  flex_stp_sr_NUM_BITS8_SHIFT_MSB1 FLEX ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .serial_in(sda_in), .parallel_out(rx_data) );
  AND2X2 U1 ( .A(rx_enable), .B(rising_edge_found), .Y(_0_net_) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n29, n30, n31, n32, n33, n34, n35, n36, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54;
  wire   [6:0] temp;

  DFFSR \temp_reg[0]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[0])
         );
  DFFSR \temp_reg[1]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[1])
         );
  DFFSR \temp_reg[2]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[2])
         );
  DFFSR \temp_reg[3]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[3])
         );
  DFFSR \temp_reg[4]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[4])
         );
  DFFSR \temp_reg[5]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[5])
         );
  DFFSR \temp_reg[6]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp[6])
         );
  DFFSR \temp_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(serial_out) );
  NAND2X1 U11 ( .A(shift_enable), .B(n_rst), .Y(n9) );
  NAND2X1 U12 ( .A(n13), .B(n10), .Y(n12) );
  INVX2 U13 ( .A(n9), .Y(n10) );
  INVX2 U14 ( .A(n12), .Y(n51) );
  AND2X2 U15 ( .A(parallel_in[0]), .B(n15), .Y(n11) );
  NOR2X1 U16 ( .A(n11), .B(n20), .Y(n21) );
  INVX2 U17 ( .A(load_enable), .Y(n13) );
  INVX1 U18 ( .A(n18), .Y(n14) );
  BUFX2 U19 ( .A(load_enable), .Y(n15) );
  INVX1 U20 ( .A(n21), .Y(n36) );
  BUFX2 U21 ( .A(n15), .Y(n16) );
  INVX1 U22 ( .A(n18), .Y(n17) );
  NAND2X1 U23 ( .A(n23), .B(n13), .Y(n18) );
  INVX2 U24 ( .A(n22), .Y(n50) );
  NAND3X1 U25 ( .A(shift_enable), .B(n_rst), .C(n13), .Y(n23) );
  NAND2X1 U26 ( .A(n23), .B(n13), .Y(n22) );
  INVX2 U27 ( .A(temp[0]), .Y(n19) );
  OAI21X1 U28 ( .A(n18), .B(n19), .C(n12), .Y(n20) );
  NAND2X1 U29 ( .A(temp[1]), .B(n50), .Y(n26) );
  NAND2X1 U30 ( .A(n51), .B(temp[0]), .Y(n25) );
  NAND2X1 U31 ( .A(parallel_in[1]), .B(n15), .Y(n24) );
  NAND3X1 U32 ( .A(n26), .B(n24), .C(n25), .Y(n35) );
  NAND2X1 U33 ( .A(temp[2]), .B(n50), .Y(n37) );
  NAND2X1 U34 ( .A(temp[1]), .B(n51), .Y(n28) );
  NAND2X1 U35 ( .A(parallel_in[2]), .B(n16), .Y(n27) );
  NAND3X1 U36 ( .A(n37), .B(n27), .C(n28), .Y(n34) );
  NAND2X1 U37 ( .A(temp[3]), .B(n50), .Y(n40) );
  NAND2X1 U38 ( .A(temp[2]), .B(n51), .Y(n39) );
  NAND2X1 U39 ( .A(parallel_in[3]), .B(n16), .Y(n38) );
  NAND3X1 U40 ( .A(n40), .B(n38), .C(n39), .Y(n33) );
  NAND2X1 U41 ( .A(temp[4]), .B(n50), .Y(n43) );
  NAND2X1 U42 ( .A(temp[3]), .B(n51), .Y(n42) );
  NAND2X1 U43 ( .A(parallel_in[4]), .B(n16), .Y(n41) );
  NAND3X1 U44 ( .A(n43), .B(n41), .C(n42), .Y(n32) );
  NAND2X1 U45 ( .A(temp[5]), .B(n50), .Y(n46) );
  NAND2X1 U46 ( .A(temp[4]), .B(n51), .Y(n45) );
  NAND2X1 U47 ( .A(parallel_in[5]), .B(n16), .Y(n44) );
  NAND3X1 U48 ( .A(n46), .B(n44), .C(n45), .Y(n31) );
  NAND2X1 U49 ( .A(temp[6]), .B(n14), .Y(n49) );
  NAND2X1 U50 ( .A(temp[5]), .B(n51), .Y(n48) );
  NAND2X1 U51 ( .A(parallel_in[6]), .B(n16), .Y(n47) );
  NAND3X1 U52 ( .A(n49), .B(n47), .C(n48), .Y(n30) );
  NAND2X1 U53 ( .A(serial_out), .B(n17), .Y(n54) );
  NAND2X1 U54 ( .A(temp[6]), .B(n51), .Y(n53) );
  NAND2X1 U55 ( .A(parallel_in[7]), .B(n16), .Y(n52) );
  NAND3X1 U56 ( .A(n52), .B(n54), .C(n53), .Y(n29) );
endmodule


module tx_sr ( clk, n_rst, falling_edge_found, tx_enable, tx_data, load_data, 
        tx_out );
  input [7:0] tx_data;
  input clk, n_rst, falling_edge_found, tx_enable, load_data;
  output tx_out;
  wire   _0_net_;

  flex_pts_sr_NUM_BITS8_SHIFT_MSB1 FLEX ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(_0_net_), .load_enable(load_data), .parallel_in(tx_data), 
        .serial_out(tx_out) );
  AND2X2 U1 ( .A(tx_enable), .B(falling_edge_found), .Y(_0_net_) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n98, n33, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97;
  wire   [3:0] D_state;

  DFFSR \Q_state_reg[3]  ( .D(D_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \Q_state_reg[2]  ( .D(D_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \Q_state_reg[1]  ( .D(D_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \Q_state_reg[0]  ( .D(D_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n98) );
  DFFPOSX1 rolltemp_reg ( .D(n33), .CLK(clk), .Q(rollover_flag) );
  NAND2X1 U3 ( .A(n32), .B(n31), .Y(n1) );
  BUFX2 U4 ( .A(n98), .Y(count_out[0]) );
  AND2X2 U5 ( .A(n19), .B(n38), .Y(n3) );
  AND2X2 U6 ( .A(rollover_val[0]), .B(n_rst), .Y(n4) );
  AND2X2 U7 ( .A(rollover_val[1]), .B(n_rst), .Y(n5) );
  INVX2 U8 ( .A(n87), .Y(D_state[0]) );
  BUFX2 U9 ( .A(count_out[1]), .Y(n6) );
  INVX1 U10 ( .A(n82), .Y(n7) );
  NAND2X1 U11 ( .A(n49), .B(n12), .Y(n8) );
  INVX1 U12 ( .A(n39), .Y(n9) );
  INVX4 U13 ( .A(count_enable), .Y(n49) );
  NAND2X1 U14 ( .A(n19), .B(n1), .Y(n10) );
  MUX2X1 U15 ( .B(n39), .A(n40), .S(n11), .Y(n41) );
  INVX1 U16 ( .A(n59), .Y(n11) );
  INVX8 U17 ( .A(clear), .Y(n72) );
  BUFX2 U18 ( .A(count_out[2]), .Y(n12) );
  AND2X1 U19 ( .A(count_enable), .B(n23), .Y(n14) );
  AND2X1 U20 ( .A(n51), .B(n50), .Y(n16) );
  AND2X2 U21 ( .A(n62), .B(n63), .Y(n13) );
  AND2X2 U22 ( .A(n21), .B(n20), .Y(n15) );
  XNOR2X1 U23 ( .A(n98), .B(rollover_val[0]), .Y(n30) );
  XNOR2X1 U24 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n28) );
  AND2X2 U25 ( .A(rollover_val[2]), .B(n72), .Y(n17) );
  INVX2 U26 ( .A(n_rst), .Y(n26) );
  INVX1 U27 ( .A(n55), .Y(n39) );
  BUFX2 U28 ( .A(count_out[3]), .Y(n18) );
  INVX1 U29 ( .A(n47), .Y(n19) );
  NAND2X1 U30 ( .A(n3), .B(n14), .Y(n63) );
  AND2X2 U31 ( .A(n12), .B(n42), .Y(n20) );
  INVX2 U32 ( .A(n20), .Y(n82) );
  INVX1 U37 ( .A(n98), .Y(n47) );
  AND2X2 U38 ( .A(n76), .B(n75), .Y(n21) );
  AND2X2 U39 ( .A(n44), .B(n22), .Y(n68) );
  NOR2X1 U40 ( .A(n23), .B(n64), .Y(n22) );
  INVX1 U41 ( .A(n44), .Y(n24) );
  INVX1 U42 ( .A(count_out[1]), .Y(n23) );
  OR2X2 U43 ( .A(n23), .B(n24), .Y(n62) );
  NAND2X1 U44 ( .A(n15), .B(n83), .Y(n84) );
  INVX1 U45 ( .A(n83), .Y(n25) );
  XNOR2X1 U46 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n27) );
  AND2X2 U47 ( .A(n28), .B(n27), .Y(n32) );
  XNOR2X1 U48 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n29) );
  AND2X2 U49 ( .A(n29), .B(n30), .Y(n31) );
  NAND2X1 U50 ( .A(n32), .B(n31), .Y(n42) );
  NAND2X1 U51 ( .A(n1), .B(n18), .Y(n55) );
  NAND2X1 U52 ( .A(count_enable), .B(n55), .Y(n52) );
  INVX2 U53 ( .A(n52), .Y(n40) );
  NAND2X1 U54 ( .A(n32), .B(n31), .Y(n38) );
  NAND3X1 U55 ( .A(n6), .B(n3), .C(n20), .Y(n59) );
  NAND2X1 U56 ( .A(n18), .B(n49), .Y(n51) );
  AOI21X1 U57 ( .A(n51), .B(n41), .C(clear), .Y(D_state[3]) );
  NAND2X1 U58 ( .A(n42), .B(n10), .Y(n43) );
  NAND2X1 U59 ( .A(count_enable), .B(n43), .Y(n44) );
  NOR2X1 U60 ( .A(clear), .B(n13), .Y(D_state[1]) );
  NAND3X1 U61 ( .A(count_enable), .B(n6), .C(n3), .Y(n77) );
  INVX2 U62 ( .A(n77), .Y(n45) );
  NAND2X1 U63 ( .A(n6), .B(n3), .Y(n81) );
  MUX2X1 U64 ( .B(n45), .A(n81), .S(n20), .Y(n46) );
  NAND2X1 U65 ( .A(n49), .B(n12), .Y(n76) );
  AOI21X1 U66 ( .A(n46), .B(n8), .C(clear), .Y(D_state[2]) );
  MUX2X1 U67 ( .B(n47), .A(n3), .S(count_enable), .Y(n86) );
  NAND2X1 U68 ( .A(n86), .B(n72), .Y(n87) );
  NAND2X1 U69 ( .A(rollover_val[3]), .B(n72), .Y(n54) );
  INVX2 U70 ( .A(rollover_val[3]), .Y(n50) );
  AOI21X1 U71 ( .A(clear), .B(n50), .C(n26), .Y(n48) );
  OAI21X1 U72 ( .A(n54), .B(n51), .C(n48), .Y(n71) );
  NOR2X1 U73 ( .A(n49), .B(n54), .Y(n53) );
  AOI22X1 U74 ( .A(n53), .B(n55), .C(n16), .D(n52), .Y(n60) );
  NOR2X1 U75 ( .A(n54), .B(n55), .Y(n57) );
  AND2X2 U76 ( .A(n16), .B(n9), .Y(n56) );
  OAI21X1 U77 ( .A(n57), .B(n56), .C(n59), .Y(n58) );
  OAI21X1 U78 ( .A(n60), .B(n59), .C(n58), .Y(n70) );
  INVX2 U79 ( .A(rollover_val[1]), .Y(n61) );
  NAND3X1 U80 ( .A(n_rst), .B(n72), .C(n61), .Y(n64) );
  NOR2X1 U81 ( .A(n64), .B(n63), .Y(n67) );
  NAND2X1 U82 ( .A(n5), .B(clear), .Y(n65) );
  OAI21X1 U83 ( .A(rollover_flag), .B(n_rst), .C(n65), .Y(n66) );
  NOR3X1 U84 ( .A(n66), .B(n68), .C(n67), .Y(n69) );
  OAI21X1 U85 ( .A(n70), .B(n71), .C(n69), .Y(n97) );
  NAND3X1 U86 ( .A(n45), .B(n82), .C(n17), .Y(n80) );
  INVX2 U87 ( .A(rollover_val[2]), .Y(n75) );
  OAI21X1 U88 ( .A(n75), .B(n8), .C(n72), .Y(n74) );
  NAND2X1 U89 ( .A(clear), .B(rollover_val[2]), .Y(n73) );
  AOI21X1 U90 ( .A(n74), .B(n73), .C(n26), .Y(n79) );
  NAND3X1 U91 ( .A(n21), .B(n82), .C(n77), .Y(n78) );
  NAND3X1 U92 ( .A(n80), .B(n79), .C(n78), .Y(n95) );
  NAND3X1 U93 ( .A(n25), .B(n7), .C(n17), .Y(n85) );
  INVX2 U94 ( .A(n81), .Y(n83) );
  NAND2X1 U95 ( .A(n85), .B(n84), .Y(n94) );
  INVX2 U96 ( .A(n86), .Y(n92) );
  AOI22X1 U97 ( .A(n4), .B(clear), .C(n5), .D(n13), .Y(n90) );
  INVX2 U98 ( .A(rollover_val[0]), .Y(n88) );
  NAND3X1 U99 ( .A(n_rst), .B(n88), .C(D_state[0]), .Y(n89) );
  NAND2X1 U100 ( .A(n90), .B(n89), .Y(n91) );
  AOI21X1 U101 ( .A(n92), .B(n4), .C(n91), .Y(n93) );
  OAI21X1 U102 ( .A(n95), .B(n94), .C(n93), .Y(n96) );
  NOR2X1 U103 ( .A(n97), .B(n96), .Y(n33) );
endmodule


module timer ( clk, n_rst, rising_edge_found, falling_edge_found, stop_found, 
        start_found, byte_received, ack_prep, check_ack, ack_done );
  input clk, n_rst, rising_edge_found, falling_edge_found, stop_found,
         start_found;
  output byte_received, ack_prep, check_ack, ack_done;
  wire   _0_net_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [3:0] count;

  flex_counter_NUM_CNT_BITS4 FLEX ( .clk(clk), .n_rst(n_rst), .clear(n2), 
        .count_enable(rising_edge_found), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b1}), .count_out(count) );
  INVX1 U3 ( .A(n6), .Y(check_ack) );
  INVX4 U4 ( .A(_0_net_), .Y(n1) );
  INVX8 U5 ( .A(n1), .Y(n2) );
  INVX1 U6 ( .A(count[0]), .Y(n7) );
  INVX1 U7 ( .A(count[1]), .Y(n4) );
  OR2X2 U8 ( .A(stop_found), .B(start_found), .Y(_0_net_) );
  INVX2 U9 ( .A(falling_edge_found), .Y(n9) );
  INVX2 U10 ( .A(count[2]), .Y(n3) );
  NAND3X1 U11 ( .A(count[3]), .B(n4), .C(n3), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n8) );
  NAND2X1 U13 ( .A(count[0]), .B(n8), .Y(n6) );
  NOR2X1 U14 ( .A(n9), .B(n6), .Y(ack_done) );
  NAND2X1 U15 ( .A(n8), .B(n7), .Y(n10) );
  NOR2X1 U16 ( .A(n10), .B(n9), .Y(ack_prep) );
  INVX2 U17 ( .A(n10), .Y(byte_received) );
endmodule


module i2c_slave ( clk, n_rst, scl, sda_in, sda_out, write_enable, write_data, 
        fifo_empty, fifo_full );
  input [7:0] write_data;
  input clk, n_rst, scl, sda_in, write_enable;
  output sda_out, fifo_empty, fifo_full;
  wire   scl_sync, sda_sync, stopfound, startfound, byterec, checkack, ackprep,
         ackdone, addressmatch, rwmode, txen, rxen, readen, load_data,
         rise_found, fall_found, txout, n1, n2;
  wire   [1:0] sdamode;
  wire   [7:0] read_data;
  wire   [7:0] rxdata;

  sync_1 SCLSYN ( .clk(clk), .n_rst(n_rst), .async_in(scl), .sync_out(scl_sync) );
  sync_0 SDASYN ( .clk(clk), .n_rst(n_rst), .async_in(sda_in), .sync_out(
        sda_sync) );
  controller CONTROLLER ( .clk(clk), .n_rst(n_rst), .stop_found(n1), 
        .start_found(startfound), .byte_received(byterec), .ack_prep(ackprep), 
        .check_ack(checkack), .ack_done(ackdone), .rw_mode(rwmode), 
        .address_match(addressmatch), .sda_in(sda_sync), .rx_enable(rxen), 
        .tx_enable(txen), .read_enable(readen), .sda_mode(sdamode), 
        .load_data(load_data) );
  scl_edge SCL ( .clk(clk), .n_rst(n_rst), .scl(scl_sync), 
        .falling_edge_found(fall_found), .rising_edge_found(rise_found) );
  sda_sel SDA ( .tx_out(txout), .sda_mode(sdamode), .sda_out(sda_out) );
  tx_fifo FIFO ( .clk(clk), .n_rst(n_rst), .read_enable(readen), 
        .write_enable(write_enable), .write_data(write_data), .read_data(
        read_data), .fifo_empty(fifo_empty), .fifo_full(fifo_full) );
  decode DECODE ( .clk(clk), .n_rst(n_rst), .scl(scl_sync), .sda_in(sda_sync), 
        .starting_byte(rxdata), .rw_mode(rwmode), .address_match(addressmatch), 
        .start_found(startfound), .stop_found(stopfound) );
  rx_sr RX ( .clk(clk), .n_rst(n_rst), .sda_in(sda_sync), .rising_edge_found(
        n2), .rx_enable(rxen), .rx_data(rxdata) );
  tx_sr TX ( .clk(clk), .n_rst(n_rst), .falling_edge_found(fall_found), 
        .tx_enable(txen), .tx_data(read_data), .load_data(load_data), .tx_out(
        txout) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .rising_edge_found(n2), 
        .falling_edge_found(fall_found), .stop_found(stopfound), .start_found(
        startfound), .byte_received(byterec), .ack_prep(ackprep), .check_ack(
        checkack), .ack_done(ackdone) );
  BUFX2 U1 ( .A(stopfound), .Y(n1) );
  BUFX4 U2 ( .A(rise_found), .Y(n2) );
endmodule

