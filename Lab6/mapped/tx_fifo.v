
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
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194;

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
  BUFX2 U2 ( .A(n98), .Y(n1) );
  BUFX2 U3 ( .A(n96), .Y(n2) );
  BUFX2 U4 ( .A(n97), .Y(n3) );
  BUFX2 U5 ( .A(n95), .Y(n4) );
  NAND3X1 U6 ( .A(n5), .B(n6), .C(n7), .Y(rdata[7]) );
  NOR2X1 U7 ( .A(n8), .B(n9), .Y(n7) );
  OAI22X1 U8 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n9) );
  OAI22X1 U9 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n8) );
  AOI22X1 U10 ( .A(\fiforeg[5][7] ), .B(n18), .C(\fiforeg[4][7] ), .D(n19), 
        .Y(n6) );
  AOI22X1 U11 ( .A(\fiforeg[7][7] ), .B(n20), .C(\fiforeg[6][7] ), .D(n21), 
        .Y(n5) );
  NAND3X1 U12 ( .A(n22), .B(n23), .C(n24), .Y(rdata[6]) );
  NOR2X1 U13 ( .A(n25), .B(n26), .Y(n24) );
  OAI22X1 U14 ( .A(n10), .B(n27), .C(n12), .D(n28), .Y(n26) );
  OAI22X1 U15 ( .A(n14), .B(n29), .C(n16), .D(n30), .Y(n25) );
  AOI22X1 U16 ( .A(\fiforeg[5][6] ), .B(n18), .C(\fiforeg[4][6] ), .D(n19), 
        .Y(n23) );
  AOI22X1 U17 ( .A(\fiforeg[7][6] ), .B(n20), .C(\fiforeg[6][6] ), .D(n21), 
        .Y(n22) );
  NAND3X1 U18 ( .A(n31), .B(n32), .C(n33), .Y(rdata[5]) );
  NOR2X1 U19 ( .A(n34), .B(n35), .Y(n33) );
  OAI22X1 U20 ( .A(n10), .B(n36), .C(n12), .D(n37), .Y(n35) );
  OAI22X1 U21 ( .A(n14), .B(n38), .C(n16), .D(n39), .Y(n34) );
  AOI22X1 U22 ( .A(\fiforeg[5][5] ), .B(n18), .C(\fiforeg[4][5] ), .D(n19), 
        .Y(n32) );
  AOI22X1 U23 ( .A(\fiforeg[7][5] ), .B(n20), .C(\fiforeg[6][5] ), .D(n21), 
        .Y(n31) );
  NAND3X1 U24 ( .A(n40), .B(n41), .C(n42), .Y(rdata[4]) );
  NOR2X1 U25 ( .A(n43), .B(n44), .Y(n42) );
  OAI22X1 U26 ( .A(n10), .B(n45), .C(n12), .D(n46), .Y(n44) );
  OAI22X1 U27 ( .A(n14), .B(n47), .C(n16), .D(n48), .Y(n43) );
  AOI22X1 U28 ( .A(\fiforeg[5][4] ), .B(n18), .C(\fiforeg[4][4] ), .D(n19), 
        .Y(n41) );
  AOI22X1 U29 ( .A(\fiforeg[7][4] ), .B(n20), .C(\fiforeg[6][4] ), .D(n21), 
        .Y(n40) );
  NAND3X1 U30 ( .A(n49), .B(n50), .C(n51), .Y(rdata[3]) );
  NOR2X1 U31 ( .A(n52), .B(n53), .Y(n51) );
  OAI22X1 U32 ( .A(n10), .B(n54), .C(n12), .D(n55), .Y(n53) );
  OAI22X1 U33 ( .A(n14), .B(n56), .C(n16), .D(n57), .Y(n52) );
  AOI22X1 U34 ( .A(\fiforeg[5][3] ), .B(n18), .C(\fiforeg[4][3] ), .D(n19), 
        .Y(n50) );
  AOI22X1 U35 ( .A(\fiforeg[7][3] ), .B(n20), .C(\fiforeg[6][3] ), .D(n21), 
        .Y(n49) );
  NAND3X1 U36 ( .A(n58), .B(n59), .C(n60), .Y(rdata[2]) );
  NOR2X1 U37 ( .A(n61), .B(n62), .Y(n60) );
  OAI22X1 U38 ( .A(n10), .B(n63), .C(n12), .D(n64), .Y(n62) );
  OAI22X1 U39 ( .A(n14), .B(n65), .C(n16), .D(n66), .Y(n61) );
  AOI22X1 U40 ( .A(\fiforeg[5][2] ), .B(n18), .C(\fiforeg[4][2] ), .D(n19), 
        .Y(n59) );
  AOI22X1 U41 ( .A(\fiforeg[7][2] ), .B(n20), .C(\fiforeg[6][2] ), .D(n21), 
        .Y(n58) );
  NAND3X1 U42 ( .A(n67), .B(n68), .C(n69), .Y(rdata[1]) );
  NOR2X1 U43 ( .A(n70), .B(n71), .Y(n69) );
  OAI22X1 U44 ( .A(n10), .B(n72), .C(n12), .D(n73), .Y(n71) );
  OAI22X1 U45 ( .A(n14), .B(n74), .C(n16), .D(n75), .Y(n70) );
  AOI22X1 U46 ( .A(\fiforeg[5][1] ), .B(n18), .C(\fiforeg[4][1] ), .D(n19), 
        .Y(n68) );
  AOI22X1 U47 ( .A(\fiforeg[7][1] ), .B(n20), .C(\fiforeg[6][1] ), .D(n21), 
        .Y(n67) );
  NAND3X1 U48 ( .A(n76), .B(n77), .C(n78), .Y(rdata[0]) );
  NOR2X1 U49 ( .A(n79), .B(n80), .Y(n78) );
  OAI22X1 U50 ( .A(n10), .B(n81), .C(n12), .D(n82), .Y(n80) );
  NAND3X1 U51 ( .A(n83), .B(n84), .C(n85), .Y(n12) );
  NAND3X1 U52 ( .A(n83), .B(n84), .C(raddr[0]), .Y(n10) );
  OAI22X1 U53 ( .A(n14), .B(n86), .C(n16), .D(n87), .Y(n79) );
  NAND3X1 U54 ( .A(n85), .B(n84), .C(raddr[1]), .Y(n16) );
  NAND3X1 U55 ( .A(raddr[0]), .B(n84), .C(raddr[1]), .Y(n14) );
  INVX1 U56 ( .A(raddr[2]), .Y(n84) );
  AOI22X1 U57 ( .A(\fiforeg[5][0] ), .B(n18), .C(\fiforeg[4][0] ), .D(n19), 
        .Y(n77) );
  INVX1 U58 ( .A(n88), .Y(n19) );
  NAND3X1 U59 ( .A(n85), .B(n83), .C(raddr[2]), .Y(n88) );
  INVX1 U60 ( .A(n89), .Y(n18) );
  NAND3X1 U61 ( .A(raddr[0]), .B(n83), .C(raddr[2]), .Y(n89) );
  INVX1 U62 ( .A(raddr[1]), .Y(n83) );
  AOI22X1 U63 ( .A(\fiforeg[7][0] ), .B(n20), .C(\fiforeg[6][0] ), .D(n21), 
        .Y(n76) );
  INVX1 U64 ( .A(n90), .Y(n21) );
  NAND3X1 U65 ( .A(raddr[2]), .B(n85), .C(raddr[1]), .Y(n90) );
  INVX1 U66 ( .A(raddr[0]), .Y(n85) );
  INVX1 U67 ( .A(n91), .Y(n20) );
  NAND3X1 U68 ( .A(raddr[2]), .B(raddr[0]), .C(raddr[1]), .Y(n91) );
  MUX2X1 U69 ( .B(n92), .A(n93), .S(n94), .Y(n275) );
  INVX1 U70 ( .A(\fiforeg[7][0] ), .Y(n93) );
  MUX2X1 U71 ( .B(n92), .A(n82), .S(n4), .Y(n274) );
  MUX2X1 U72 ( .B(n92), .A(n81), .S(n2), .Y(n273) );
  MUX2X1 U73 ( .B(n92), .A(n87), .S(n3), .Y(n272) );
  MUX2X1 U74 ( .B(n92), .A(n86), .S(n1), .Y(n271) );
  MUX2X1 U75 ( .B(n92), .A(n99), .S(n100), .Y(n270) );
  INVX1 U76 ( .A(\fiforeg[4][0] ), .Y(n99) );
  MUX2X1 U77 ( .B(n92), .A(n101), .S(n102), .Y(n269) );
  INVX1 U78 ( .A(\fiforeg[5][0] ), .Y(n101) );
  MUX2X1 U79 ( .B(n92), .A(n103), .S(n104), .Y(n268) );
  INVX1 U80 ( .A(\fiforeg[6][0] ), .Y(n103) );
  MUX2X1 U81 ( .B(n105), .A(wdata[0]), .S(wenable), .Y(n92) );
  NAND3X1 U82 ( .A(n106), .B(n107), .C(n108), .Y(n105) );
  NOR2X1 U83 ( .A(n109), .B(n110), .Y(n108) );
  OAI22X1 U84 ( .A(n81), .B(n2), .C(n82), .D(n4), .Y(n110) );
  INVX1 U85 ( .A(\fiforeg[0][0] ), .Y(n82) );
  INVX1 U86 ( .A(\fiforeg[1][0] ), .Y(n81) );
  OAI22X1 U87 ( .A(n86), .B(n1), .C(n87), .D(n3), .Y(n109) );
  INVX1 U88 ( .A(\fiforeg[2][0] ), .Y(n87) );
  INVX1 U89 ( .A(\fiforeg[3][0] ), .Y(n86) );
  AOI22X1 U90 ( .A(n111), .B(\fiforeg[6][0] ), .C(n112), .D(\fiforeg[4][0] ), 
        .Y(n107) );
  AOI22X1 U91 ( .A(n113), .B(\fiforeg[5][0] ), .C(n114), .D(\fiforeg[7][0] ), 
        .Y(n106) );
  MUX2X1 U92 ( .B(n115), .A(n73), .S(n4), .Y(n267) );
  MUX2X1 U93 ( .B(n115), .A(n72), .S(n2), .Y(n266) );
  MUX2X1 U94 ( .B(n115), .A(n75), .S(n3), .Y(n265) );
  MUX2X1 U95 ( .B(n115), .A(n74), .S(n1), .Y(n264) );
  MUX2X1 U96 ( .B(n115), .A(n116), .S(n100), .Y(n263) );
  INVX1 U97 ( .A(\fiforeg[4][1] ), .Y(n116) );
  MUX2X1 U98 ( .B(n115), .A(n117), .S(n102), .Y(n262) );
  INVX1 U99 ( .A(\fiforeg[5][1] ), .Y(n117) );
  MUX2X1 U100 ( .B(n115), .A(n118), .S(n104), .Y(n261) );
  INVX1 U101 ( .A(\fiforeg[6][1] ), .Y(n118) );
  MUX2X1 U102 ( .B(n115), .A(n119), .S(n94), .Y(n260) );
  INVX1 U103 ( .A(\fiforeg[7][1] ), .Y(n119) );
  MUX2X1 U104 ( .B(n120), .A(wdata[1]), .S(wenable), .Y(n115) );
  NAND3X1 U105 ( .A(n121), .B(n122), .C(n123), .Y(n120) );
  NOR2X1 U106 ( .A(n124), .B(n125), .Y(n123) );
  OAI22X1 U107 ( .A(n72), .B(n2), .C(n73), .D(n4), .Y(n125) );
  INVX1 U108 ( .A(\fiforeg[0][1] ), .Y(n73) );
  INVX1 U109 ( .A(\fiforeg[1][1] ), .Y(n72) );
  OAI22X1 U110 ( .A(n74), .B(n1), .C(n75), .D(n3), .Y(n124) );
  INVX1 U111 ( .A(\fiforeg[2][1] ), .Y(n75) );
  INVX1 U112 ( .A(\fiforeg[3][1] ), .Y(n74) );
  AOI22X1 U113 ( .A(n111), .B(\fiforeg[6][1] ), .C(n112), .D(\fiforeg[4][1] ), 
        .Y(n122) );
  AOI22X1 U114 ( .A(n113), .B(\fiforeg[5][1] ), .C(n114), .D(\fiforeg[7][1] ), 
        .Y(n121) );
  MUX2X1 U115 ( .B(n126), .A(n64), .S(n4), .Y(n259) );
  MUX2X1 U116 ( .B(n126), .A(n63), .S(n2), .Y(n258) );
  MUX2X1 U117 ( .B(n126), .A(n66), .S(n3), .Y(n257) );
  MUX2X1 U118 ( .B(n126), .A(n65), .S(n1), .Y(n256) );
  MUX2X1 U119 ( .B(n126), .A(n127), .S(n100), .Y(n255) );
  INVX1 U120 ( .A(\fiforeg[4][2] ), .Y(n127) );
  MUX2X1 U121 ( .B(n126), .A(n128), .S(n102), .Y(n254) );
  INVX1 U122 ( .A(\fiforeg[5][2] ), .Y(n128) );
  MUX2X1 U123 ( .B(n126), .A(n129), .S(n104), .Y(n253) );
  INVX1 U124 ( .A(\fiforeg[6][2] ), .Y(n129) );
  MUX2X1 U125 ( .B(n126), .A(n130), .S(n94), .Y(n252) );
  INVX1 U126 ( .A(\fiforeg[7][2] ), .Y(n130) );
  MUX2X1 U127 ( .B(n131), .A(wdata[2]), .S(wenable), .Y(n126) );
  NAND3X1 U128 ( .A(n132), .B(n133), .C(n134), .Y(n131) );
  NOR2X1 U129 ( .A(n135), .B(n136), .Y(n134) );
  OAI22X1 U130 ( .A(n63), .B(n2), .C(n64), .D(n4), .Y(n136) );
  INVX1 U131 ( .A(\fiforeg[0][2] ), .Y(n64) );
  INVX1 U132 ( .A(\fiforeg[1][2] ), .Y(n63) );
  OAI22X1 U133 ( .A(n65), .B(n1), .C(n66), .D(n3), .Y(n135) );
  INVX1 U134 ( .A(\fiforeg[2][2] ), .Y(n66) );
  INVX1 U135 ( .A(\fiforeg[3][2] ), .Y(n65) );
  AOI22X1 U136 ( .A(n111), .B(\fiforeg[6][2] ), .C(n112), .D(\fiforeg[4][2] ), 
        .Y(n133) );
  AOI22X1 U137 ( .A(n113), .B(\fiforeg[5][2] ), .C(n114), .D(\fiforeg[7][2] ), 
        .Y(n132) );
  MUX2X1 U138 ( .B(n137), .A(n55), .S(n4), .Y(n251) );
  MUX2X1 U139 ( .B(n137), .A(n54), .S(n2), .Y(n250) );
  MUX2X1 U140 ( .B(n137), .A(n57), .S(n3), .Y(n249) );
  MUX2X1 U141 ( .B(n137), .A(n56), .S(n1), .Y(n248) );
  MUX2X1 U142 ( .B(n137), .A(n138), .S(n100), .Y(n247) );
  INVX1 U143 ( .A(\fiforeg[4][3] ), .Y(n138) );
  MUX2X1 U144 ( .B(n137), .A(n139), .S(n102), .Y(n246) );
  INVX1 U145 ( .A(\fiforeg[5][3] ), .Y(n139) );
  MUX2X1 U146 ( .B(n137), .A(n140), .S(n104), .Y(n245) );
  INVX1 U147 ( .A(\fiforeg[6][3] ), .Y(n140) );
  MUX2X1 U148 ( .B(n137), .A(n141), .S(n94), .Y(n244) );
  INVX1 U149 ( .A(\fiforeg[7][3] ), .Y(n141) );
  MUX2X1 U150 ( .B(n142), .A(wdata[3]), .S(wenable), .Y(n137) );
  NAND3X1 U151 ( .A(n143), .B(n144), .C(n145), .Y(n142) );
  NOR2X1 U152 ( .A(n146), .B(n147), .Y(n145) );
  OAI22X1 U153 ( .A(n54), .B(n2), .C(n55), .D(n4), .Y(n147) );
  INVX1 U154 ( .A(\fiforeg[0][3] ), .Y(n55) );
  INVX1 U155 ( .A(\fiforeg[1][3] ), .Y(n54) );
  OAI22X1 U156 ( .A(n56), .B(n1), .C(n57), .D(n3), .Y(n146) );
  INVX1 U157 ( .A(\fiforeg[2][3] ), .Y(n57) );
  INVX1 U158 ( .A(\fiforeg[3][3] ), .Y(n56) );
  AOI22X1 U159 ( .A(n111), .B(\fiforeg[6][3] ), .C(n112), .D(\fiforeg[4][3] ), 
        .Y(n144) );
  AOI22X1 U160 ( .A(n113), .B(\fiforeg[5][3] ), .C(n114), .D(\fiforeg[7][3] ), 
        .Y(n143) );
  MUX2X1 U161 ( .B(n148), .A(n46), .S(n4), .Y(n243) );
  MUX2X1 U162 ( .B(n148), .A(n45), .S(n2), .Y(n242) );
  MUX2X1 U163 ( .B(n148), .A(n48), .S(n3), .Y(n241) );
  MUX2X1 U164 ( .B(n148), .A(n47), .S(n1), .Y(n240) );
  MUX2X1 U165 ( .B(n148), .A(n149), .S(n100), .Y(n239) );
  INVX1 U166 ( .A(\fiforeg[4][4] ), .Y(n149) );
  MUX2X1 U167 ( .B(n148), .A(n150), .S(n102), .Y(n238) );
  INVX1 U168 ( .A(\fiforeg[5][4] ), .Y(n150) );
  MUX2X1 U169 ( .B(n148), .A(n151), .S(n104), .Y(n237) );
  INVX1 U170 ( .A(\fiforeg[6][4] ), .Y(n151) );
  MUX2X1 U171 ( .B(n148), .A(n152), .S(n94), .Y(n236) );
  INVX1 U172 ( .A(\fiforeg[7][4] ), .Y(n152) );
  MUX2X1 U173 ( .B(n153), .A(wdata[4]), .S(wenable), .Y(n148) );
  NAND3X1 U174 ( .A(n154), .B(n155), .C(n156), .Y(n153) );
  NOR2X1 U175 ( .A(n157), .B(n158), .Y(n156) );
  OAI22X1 U176 ( .A(n45), .B(n2), .C(n46), .D(n4), .Y(n158) );
  INVX1 U177 ( .A(\fiforeg[0][4] ), .Y(n46) );
  INVX1 U178 ( .A(\fiforeg[1][4] ), .Y(n45) );
  OAI22X1 U179 ( .A(n47), .B(n1), .C(n48), .D(n3), .Y(n157) );
  INVX1 U180 ( .A(\fiforeg[2][4] ), .Y(n48) );
  INVX1 U181 ( .A(\fiforeg[3][4] ), .Y(n47) );
  AOI22X1 U182 ( .A(n111), .B(\fiforeg[6][4] ), .C(n112), .D(\fiforeg[4][4] ), 
        .Y(n155) );
  AOI22X1 U183 ( .A(n113), .B(\fiforeg[5][4] ), .C(n114), .D(\fiforeg[7][4] ), 
        .Y(n154) );
  MUX2X1 U184 ( .B(n159), .A(n37), .S(n4), .Y(n235) );
  MUX2X1 U185 ( .B(n159), .A(n36), .S(n2), .Y(n234) );
  MUX2X1 U186 ( .B(n159), .A(n39), .S(n3), .Y(n233) );
  MUX2X1 U187 ( .B(n159), .A(n38), .S(n1), .Y(n232) );
  MUX2X1 U188 ( .B(n159), .A(n160), .S(n100), .Y(n231) );
  INVX1 U189 ( .A(\fiforeg[4][5] ), .Y(n160) );
  MUX2X1 U190 ( .B(n159), .A(n161), .S(n102), .Y(n230) );
  INVX1 U191 ( .A(\fiforeg[5][5] ), .Y(n161) );
  MUX2X1 U192 ( .B(n159), .A(n162), .S(n104), .Y(n229) );
  INVX1 U193 ( .A(\fiforeg[6][5] ), .Y(n162) );
  MUX2X1 U194 ( .B(n159), .A(n163), .S(n94), .Y(n228) );
  INVX1 U195 ( .A(\fiforeg[7][5] ), .Y(n163) );
  MUX2X1 U196 ( .B(n164), .A(wdata[5]), .S(wenable), .Y(n159) );
  NAND3X1 U197 ( .A(n165), .B(n166), .C(n167), .Y(n164) );
  NOR2X1 U198 ( .A(n168), .B(n169), .Y(n167) );
  OAI22X1 U199 ( .A(n36), .B(n2), .C(n37), .D(n4), .Y(n169) );
  INVX1 U200 ( .A(\fiforeg[0][5] ), .Y(n37) );
  INVX1 U201 ( .A(\fiforeg[1][5] ), .Y(n36) );
  OAI22X1 U202 ( .A(n38), .B(n1), .C(n39), .D(n3), .Y(n168) );
  INVX1 U203 ( .A(\fiforeg[2][5] ), .Y(n39) );
  INVX1 U204 ( .A(\fiforeg[3][5] ), .Y(n38) );
  AOI22X1 U205 ( .A(n111), .B(\fiforeg[6][5] ), .C(n112), .D(\fiforeg[4][5] ), 
        .Y(n166) );
  AOI22X1 U206 ( .A(n113), .B(\fiforeg[5][5] ), .C(n114), .D(\fiforeg[7][5] ), 
        .Y(n165) );
  MUX2X1 U207 ( .B(n170), .A(n28), .S(n4), .Y(n227) );
  MUX2X1 U208 ( .B(n170), .A(n27), .S(n2), .Y(n226) );
  MUX2X1 U209 ( .B(n170), .A(n30), .S(n3), .Y(n225) );
  MUX2X1 U210 ( .B(n170), .A(n29), .S(n1), .Y(n224) );
  MUX2X1 U211 ( .B(n170), .A(n171), .S(n100), .Y(n223) );
  INVX1 U212 ( .A(\fiforeg[4][6] ), .Y(n171) );
  MUX2X1 U213 ( .B(n170), .A(n172), .S(n102), .Y(n222) );
  INVX1 U214 ( .A(\fiforeg[5][6] ), .Y(n172) );
  MUX2X1 U215 ( .B(n170), .A(n173), .S(n104), .Y(n221) );
  INVX1 U216 ( .A(\fiforeg[6][6] ), .Y(n173) );
  MUX2X1 U217 ( .B(n170), .A(n174), .S(n94), .Y(n220) );
  INVX1 U218 ( .A(\fiforeg[7][6] ), .Y(n174) );
  MUX2X1 U219 ( .B(n175), .A(wdata[6]), .S(wenable), .Y(n170) );
  NAND3X1 U220 ( .A(n176), .B(n177), .C(n178), .Y(n175) );
  NOR2X1 U221 ( .A(n179), .B(n180), .Y(n178) );
  OAI22X1 U222 ( .A(n27), .B(n2), .C(n28), .D(n4), .Y(n180) );
  INVX1 U223 ( .A(\fiforeg[0][6] ), .Y(n28) );
  INVX1 U224 ( .A(\fiforeg[1][6] ), .Y(n27) );
  OAI22X1 U225 ( .A(n29), .B(n1), .C(n30), .D(n3), .Y(n179) );
  INVX1 U226 ( .A(\fiforeg[2][6] ), .Y(n30) );
  INVX1 U227 ( .A(\fiforeg[3][6] ), .Y(n29) );
  AOI22X1 U228 ( .A(n111), .B(\fiforeg[6][6] ), .C(n112), .D(\fiforeg[4][6] ), 
        .Y(n177) );
  AOI22X1 U229 ( .A(n113), .B(\fiforeg[5][6] ), .C(n114), .D(\fiforeg[7][6] ), 
        .Y(n176) );
  MUX2X1 U230 ( .B(n181), .A(n13), .S(n4), .Y(n219) );
  MUX2X1 U231 ( .B(n181), .A(n11), .S(n2), .Y(n218) );
  MUX2X1 U232 ( .B(n181), .A(n17), .S(n3), .Y(n217) );
  MUX2X1 U233 ( .B(n181), .A(n15), .S(n1), .Y(n216) );
  MUX2X1 U234 ( .B(n181), .A(n182), .S(n100), .Y(n215) );
  INVX1 U235 ( .A(\fiforeg[4][7] ), .Y(n182) );
  MUX2X1 U236 ( .B(n181), .A(n183), .S(n102), .Y(n214) );
  INVX1 U237 ( .A(\fiforeg[5][7] ), .Y(n183) );
  MUX2X1 U238 ( .B(n181), .A(n184), .S(n104), .Y(n213) );
  INVX1 U239 ( .A(\fiforeg[6][7] ), .Y(n184) );
  MUX2X1 U240 ( .B(n181), .A(n185), .S(n94), .Y(n212) );
  INVX1 U241 ( .A(\fiforeg[7][7] ), .Y(n185) );
  MUX2X1 U242 ( .B(n186), .A(wdata[7]), .S(wenable), .Y(n181) );
  NAND3X1 U243 ( .A(n187), .B(n188), .C(n189), .Y(n186) );
  NOR2X1 U244 ( .A(n190), .B(n191), .Y(n189) );
  OAI22X1 U245 ( .A(n11), .B(n2), .C(n13), .D(n4), .Y(n191) );
  NAND3X1 U246 ( .A(n192), .B(n193), .C(n194), .Y(n95) );
  INVX1 U247 ( .A(\fiforeg[0][7] ), .Y(n13) );
  NAND3X1 U248 ( .A(n192), .B(n193), .C(waddr[0]), .Y(n96) );
  INVX1 U249 ( .A(\fiforeg[1][7] ), .Y(n11) );
  OAI22X1 U250 ( .A(n15), .B(n1), .C(n17), .D(n3), .Y(n190) );
  NAND3X1 U251 ( .A(n194), .B(n193), .C(waddr[1]), .Y(n97) );
  INVX1 U252 ( .A(\fiforeg[2][7] ), .Y(n17) );
  NAND3X1 U253 ( .A(waddr[0]), .B(n193), .C(waddr[1]), .Y(n98) );
  INVX1 U254 ( .A(waddr[2]), .Y(n193) );
  INVX1 U255 ( .A(\fiforeg[3][7] ), .Y(n15) );
  AOI22X1 U256 ( .A(n111), .B(\fiforeg[6][7] ), .C(n112), .D(\fiforeg[4][7] ), 
        .Y(n188) );
  INVX1 U257 ( .A(n100), .Y(n112) );
  NAND3X1 U258 ( .A(n194), .B(n192), .C(waddr[2]), .Y(n100) );
  INVX1 U259 ( .A(n104), .Y(n111) );
  NAND3X1 U260 ( .A(waddr[1]), .B(n194), .C(waddr[2]), .Y(n104) );
  INVX1 U261 ( .A(waddr[0]), .Y(n194) );
  AOI22X1 U262 ( .A(n113), .B(\fiforeg[5][7] ), .C(n114), .D(\fiforeg[7][7] ), 
        .Y(n187) );
  INVX1 U263 ( .A(n94), .Y(n114) );
  NAND3X1 U264 ( .A(waddr[1]), .B(waddr[0]), .C(waddr[2]), .Y(n94) );
  INVX1 U265 ( .A(n102), .Y(n113) );
  NAND3X1 U266 ( .A(waddr[0]), .B(n192), .C(waddr[2]), .Y(n102) );
  INVX1 U267 ( .A(waddr[1]), .Y(n192) );
endmodule


module write_ptr ( wclk, rst_n, wenable, wptr, wptr_nxt );
  output [3:0] wptr;
  output [3:0] wptr_nxt;
  input wclk, rst_n, wenable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(wptr_nxt[3]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(wptr_nxt[2]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), 
        .Q(wptr[0]) );
  XOR2X1 U11 ( .A(wptr_nxt[3]), .B(binary_nxt[2]), .Y(wptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(wptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(wptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(wptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(wenable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(wenable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(wenable), .Y(binary_nxt[0]) );
endmodule


module write_fifo_ctrl ( wclk, rst_n, wenable, rptr, wenable_fifo, wptr, waddr, 
        full_flag );
  input [3:0] rptr;
  output [3:0] wptr;
  output [2:0] waddr;
  input wclk, rst_n, wenable;
  output wenable_fifo, full_flag;
  wire   n22, \gray_wptr[2] , N5, n2, n3, n16, n17, n18, n19, n20, n21;
  wire   [3:0] wptr_nxt;
  wire   [3:0] wrptr_r2;
  wire   [3:0] wrptr_r1;

  write_ptr WPU1 ( .wclk(wclk), .rst_n(rst_n), .wenable(wenable_fifo), .wptr(
        wptr), .wptr_nxt(wptr_nxt) );
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
  DFFSR \waddr_reg[1]  ( .D(wptr_nxt[1]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[1]) );
  DFFSR \waddr_reg[0]  ( .D(wptr_nxt[0]), .CLK(wclk), .R(rst_n), .S(1'b1), .Q(
        waddr[0]) );
  BUFX2 U15 ( .A(n22), .Y(wenable_fifo) );
  NOR2X1 U16 ( .A(full_flag), .B(n2), .Y(n22) );
  INVX1 U17 ( .A(wenable), .Y(n2) );
  NOR2X1 U18 ( .A(n3), .B(n16), .Y(N5) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Y(n16) );
  XOR2X1 U20 ( .A(n19), .B(\gray_wptr[2] ), .Y(n18) );
  XOR2X1 U21 ( .A(wptr_nxt[3]), .B(wptr_nxt[2]), .Y(\gray_wptr[2] ) );
  XNOR2X1 U22 ( .A(wrptr_r2[3]), .B(wrptr_r2[2]), .Y(n19) );
  XNOR2X1 U23 ( .A(wrptr_r2[1]), .B(wptr_nxt[1]), .Y(n17) );
  NAND2X1 U24 ( .A(n20), .B(n21), .Y(n3) );
  XOR2X1 U25 ( .A(wrptr_r2[3]), .B(wptr_nxt[3]), .Y(n21) );
  XNOR2X1 U26 ( .A(wrptr_r2[0]), .B(wptr_nxt[0]), .Y(n20) );
endmodule


module read_ptr ( rclk, rst_n, renable, rptr, rptr_nxt );
  output [3:0] rptr;
  output [3:0] rptr_nxt;
  input rclk, rst_n, renable;
  wire   n9, n10, n11, n12;
  wire   [2:0] binary_nxt;
  wire   [3:0] binary_r;

  DFFSR \binary_r_reg[0]  ( .D(binary_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[0]) );
  DFFSR \binary_r_reg[1]  ( .D(binary_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[1]) );
  DFFSR \binary_r_reg[2]  ( .D(binary_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[2]) );
  DFFSR \binary_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(binary_r[3]) );
  DFFSR \gray_r_reg[3]  ( .D(rptr_nxt[3]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[3]) );
  DFFSR \gray_r_reg[2]  ( .D(rptr_nxt[2]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[2]) );
  DFFSR \gray_r_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[1]) );
  DFFSR \gray_r_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), 
        .Q(rptr[0]) );
  XOR2X1 U11 ( .A(rptr_nxt[3]), .B(binary_nxt[2]), .Y(rptr_nxt[2]) );
  XNOR2X1 U12 ( .A(n9), .B(binary_r[3]), .Y(rptr_nxt[3]) );
  NAND2X1 U13 ( .A(binary_r[2]), .B(n10), .Y(n9) );
  XOR2X1 U14 ( .A(binary_nxt[2]), .B(binary_nxt[1]), .Y(rptr_nxt[1]) );
  XOR2X1 U15 ( .A(binary_nxt[1]), .B(binary_nxt[0]), .Y(rptr_nxt[0]) );
  XOR2X1 U16 ( .A(n10), .B(binary_r[2]), .Y(binary_nxt[2]) );
  INVX1 U17 ( .A(n11), .Y(n10) );
  NAND3X1 U18 ( .A(binary_r[1]), .B(binary_r[0]), .C(renable), .Y(n11) );
  XNOR2X1 U19 ( .A(n12), .B(binary_r[1]), .Y(binary_nxt[1]) );
  NAND2X1 U20 ( .A(renable), .B(binary_r[0]), .Y(n12) );
  XOR2X1 U21 ( .A(binary_r[0]), .B(renable), .Y(binary_nxt[0]) );
endmodule


module read_fifo_ctrl ( rclk, rst_n, renable, wptr, rptr, raddr, empty_flag );
  input [3:0] wptr;
  output [3:0] rptr;
  output [2:0] raddr;
  input rclk, rst_n, renable;
  output empty_flag;
  wire   renable_p2, \gray_rptr[2] , N3, n1, n2, n3, n16, n17, n18, n19, n20;
  wire   [3:0] rptr_nxt;
  wire   [3:0] rwptr_r2;
  wire   [3:0] rwptr_r1;

  read_ptr RPU1 ( .rclk(rclk), .rst_n(rst_n), .renable(renable_p2), .rptr(rptr), .rptr_nxt(rptr_nxt) );
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
  DFFSR \raddr_reg[1]  ( .D(rptr_nxt[1]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[1]) );
  DFFSR \raddr_reg[0]  ( .D(rptr_nxt[0]), .CLK(rclk), .R(rst_n), .S(1'b1), .Q(
        raddr[0]) );
  NOR2X1 U15 ( .A(empty_flag), .B(n1), .Y(renable_p2) );
  INVX1 U16 ( .A(renable), .Y(n1) );
  NOR2X1 U17 ( .A(n2), .B(n3), .Y(N3) );
  NAND2X1 U18 ( .A(n16), .B(n17), .Y(n3) );
  XOR2X1 U19 ( .A(n18), .B(\gray_rptr[2] ), .Y(n17) );
  XOR2X1 U20 ( .A(rptr_nxt[3]), .B(rptr_nxt[2]), .Y(\gray_rptr[2] ) );
  XNOR2X1 U21 ( .A(rwptr_r2[3]), .B(rwptr_r2[2]), .Y(n18) );
  XNOR2X1 U22 ( .A(rwptr_r2[1]), .B(rptr_nxt[1]), .Y(n16) );
  NAND2X1 U23 ( .A(n19), .B(n20), .Y(n2) );
  XNOR2X1 U24 ( .A(rwptr_r2[0]), .B(rptr_nxt[0]), .Y(n20) );
  XNOR2X1 U25 ( .A(rptr_nxt[3]), .B(rwptr_r2[3]), .Y(n19) );
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

