
module sync ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;


  DFFSR temp2_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_reset, dr, overflow, cnt_up, modwait, op, src1, 
        src2, dest, err );
  output [1:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, overflow;
  output cnt_up, modwait, err;
  wire   nxtm, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n74;
  wire   [3:0] state;
  wire   [3:0] nxtstate;
  assign dest[3] = 1'b0;
  assign src2[3] = 1'b0;
  assign src1[3] = 1'b0;

  DFFSR \state_reg[0]  ( .D(nxtstate[0]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(nxtstate[3]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(nxtstate[1]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(nxtstate[2]), .CLK(clk), .R(n_reset), .S(1'b1), 
        .Q(state[2]) );
  DFFSR err_reg ( .D(n74), .CLK(clk), .R(n_reset), .S(1'b1), .Q(err) );
  DFFSR modwait_reg ( .D(nxtm), .CLK(clk), .R(n_reset), .S(1'b1), .Q(modwait)
         );
  INVX1 U9 ( .A(n60), .Y(n7) );
  INVX2 U10 ( .A(n7), .Y(n8) );
  BUFX4 U11 ( .A(state[0]), .Y(n35) );
  BUFX2 U12 ( .A(n35), .Y(n22) );
  BUFX2 U13 ( .A(state[1]), .Y(n9) );
  BUFX2 U14 ( .A(state[1]), .Y(n33) );
  NAND2X1 U15 ( .A(n38), .B(n39), .Y(n10) );
  INVX2 U16 ( .A(n33), .Y(n28) );
  INVX2 U17 ( .A(n9), .Y(n16) );
  INVX2 U18 ( .A(n51), .Y(n25) );
  INVX2 U19 ( .A(n25), .Y(n15) );
  BUFX2 U20 ( .A(n62), .Y(n11) );
  INVX1 U21 ( .A(n33), .Y(n26) );
  INVX2 U22 ( .A(n61), .Y(src2[0]) );
  BUFX2 U23 ( .A(n22), .Y(n12) );
  BUFX2 U24 ( .A(n40), .Y(n13) );
  INVX2 U25 ( .A(n54), .Y(n14) );
  BUFX2 U26 ( .A(state[2]), .Y(n29) );
  INVX2 U27 ( .A(n29), .Y(n51) );
  INVX1 U28 ( .A(n65), .Y(cnt_up) );
  INVX1 U29 ( .A(n19), .Y(n17) );
  INVX1 U30 ( .A(state[3]), .Y(n50) );
  INVX1 U31 ( .A(state[0]), .Y(n18) );
  INVX2 U32 ( .A(n50), .Y(n19) );
  BUFX2 U33 ( .A(state[3]), .Y(n34) );
  INVX2 U34 ( .A(n16), .Y(n20) );
  BUFX2 U35 ( .A(n19), .Y(n21) );
  INVX1 U36 ( .A(n18), .Y(n23) );
  INVX1 U37 ( .A(src1[1]), .Y(n67) );
  AND2X2 U38 ( .A(n32), .B(n50), .Y(n24) );
  INVX2 U39 ( .A(n16), .Y(n27) );
  BUFX2 U40 ( .A(state[2]), .Y(n32) );
  BUFX2 U41 ( .A(n18), .Y(n30) );
  BUFX2 U42 ( .A(n11), .Y(n31) );
  INVX1 U43 ( .A(n66), .Y(n54) );
  INVX1 U44 ( .A(src2[1]), .Y(n44) );
  BUFX2 U45 ( .A(n38), .Y(n36) );
  BUFX2 U46 ( .A(n8), .Y(n37) );
  AND2X2 U47 ( .A(n18), .B(n9), .Y(n38) );
  INVX1 U48 ( .A(op[0]), .Y(n70) );
  AND2X2 U49 ( .A(n50), .B(n29), .Y(n39) );
  INVX1 U50 ( .A(n24), .Y(n45) );
  AND2X2 U51 ( .A(n35), .B(n28), .Y(n40) );
  INVX1 U52 ( .A(src1[2]), .Y(n68) );
  BUFX2 U53 ( .A(n63), .Y(n41) );
  OR2X1 U54 ( .A(n57), .B(n58), .Y(nxtstate[0]) );
  NAND3X1 U55 ( .A(n25), .B(n23), .C(n20), .Y(n43) );
  NOR2X1 U56 ( .A(n32), .B(n35), .Y(n42) );
  NAND3X1 U57 ( .A(n19), .B(n26), .C(n42), .Y(n61) );
  OAI21X1 U58 ( .A(n21), .B(n43), .C(n61), .Y(src2[1]) );
  NOR2X1 U59 ( .A(n44), .B(overflow), .Y(nxtstate[3]) );
  NAND2X1 U60 ( .A(n38), .B(n39), .Y(n63) );
  OAI21X1 U61 ( .A(n20), .B(n45), .C(n41), .Y(n47) );
  NOR2X1 U62 ( .A(n32), .B(n34), .Y(n46) );
  NAND3X1 U63 ( .A(n23), .B(n46), .C(n27), .Y(n65) );
  OR2X2 U64 ( .A(n47), .B(cnt_up), .Y(nxtstate[2]) );
  NAND2X1 U65 ( .A(n40), .B(n39), .Y(n60) );
  NAND2X1 U66 ( .A(n63), .B(n60), .Y(src1[2]) );
  AOI21X1 U67 ( .A(n30), .B(n15), .C(n13), .Y(n49) );
  NAND2X1 U68 ( .A(dr), .B(n17), .Y(n48) );
  OAI21X1 U69 ( .A(n49), .B(n48), .C(n68), .Y(nxtstate[1]) );
  NAND3X1 U70 ( .A(n15), .B(n17), .C(n36), .Y(n71) );
  NAND2X1 U71 ( .A(n41), .B(n71), .Y(dest[2]) );
  NAND3X1 U72 ( .A(n13), .B(n17), .C(n15), .Y(n59) );
  NAND3X1 U73 ( .A(n34), .B(n28), .C(n51), .Y(n62) );
  OAI22X1 U74 ( .A(dr), .B(n59), .C(n12), .D(n31), .Y(n58) );
  NAND3X1 U75 ( .A(n27), .B(n22), .C(n24), .Y(n64) );
  NAND2X1 U76 ( .A(n64), .B(n11), .Y(n52) );
  INVX2 U77 ( .A(n52), .Y(n69) );
  INVX2 U78 ( .A(overflow), .Y(n56) );
  NOR2X1 U79 ( .A(n35), .B(n34), .Y(n53) );
  NAND3X1 U80 ( .A(n26), .B(n32), .C(n53), .Y(n66) );
  NOR2X1 U81 ( .A(dest[2]), .B(n54), .Y(n55) );
  OAI21X1 U82 ( .A(n69), .B(n56), .C(n55), .Y(n57) );
  INVX2 U83 ( .A(n59), .Y(n74) );
  NAND3X1 U84 ( .A(n37), .B(n71), .C(n65), .Y(dest[0]) );
  NAND2X1 U85 ( .A(n37), .B(n14), .Y(dest[1]) );
  NOR2X1 U86 ( .A(n30), .B(n62), .Y(src2[2]) );
  NAND3X1 U87 ( .A(n64), .B(n66), .C(n10), .Y(src1[0]) );
  NAND2X1 U88 ( .A(n66), .B(n65), .Y(src1[1]) );
  NAND3X1 U89 ( .A(n69), .B(n68), .C(n67), .Y(op[0]) );
  NAND2X1 U90 ( .A(n71), .B(n69), .Y(op[1]) );
  NAND2X1 U91 ( .A(n71), .B(n70), .Y(nxtm) );
endmodule


module datapath_ctrl ( op, w_data_sel, w_en, alu_op );
  input [1:0] op;
  output w_data_sel, w_en, alu_op;
  wire   n2, n3;

  INVX1 U1 ( .A(n3), .Y(w_data_sel) );
  INVX2 U2 ( .A(op[1]), .Y(n2) );
  INVX2 U3 ( .A(op[0]), .Y(n3) );
  NOR2X1 U4 ( .A(n2), .B(n3), .Y(alu_op) );
  NAND2X1 U5 ( .A(n3), .B(n2), .Y(w_en) );
endmodule


module regfile_NUM_REG_ADDR_BITS4_REG_SIZE_BITS16 ( clk, n_reset, w_sel, 
        r1_sel, r2_sel, w_data, w_en, r1_data, r2_data, outreg_data );
  input [3:0] w_sel;
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [15:0] w_data;
  output [15:0] r1_data;
  output [15:0] r2_data;
  output [15:0] outreg_data;
  input clk, n_reset, w_en;
  wire   \regs[15][15] , \regs[15][14] , \regs[15][13] , \regs[15][12] ,
         \regs[15][11] , \regs[15][10] , \regs[15][9] , \regs[15][8] ,
         \regs[15][7] , \regs[15][6] , \regs[15][5] , \regs[15][4] ,
         \regs[15][3] , \regs[15][2] , \regs[15][1] , \regs[15][0] ,
         \regs[14][15] , \regs[14][14] , \regs[14][13] , \regs[14][12] ,
         \regs[14][11] , \regs[14][10] , \regs[14][9] , \regs[14][8] ,
         \regs[14][7] , \regs[14][6] , \regs[14][5] , \regs[14][4] ,
         \regs[14][3] , \regs[14][2] , \regs[14][1] , \regs[14][0] ,
         \regs[13][15] , \regs[13][14] , \regs[13][13] , \regs[13][12] ,
         \regs[13][11] , \regs[13][10] , \regs[13][9] , \regs[13][8] ,
         \regs[13][7] , \regs[13][6] , \regs[13][5] , \regs[13][4] ,
         \regs[13][3] , \regs[13][2] , \regs[13][1] , \regs[13][0] ,
         \regs[12][15] , \regs[12][14] , \regs[12][13] , \regs[12][12] ,
         \regs[12][11] , \regs[12][10] , \regs[12][9] , \regs[12][8] ,
         \regs[12][7] , \regs[12][6] , \regs[12][5] , \regs[12][4] ,
         \regs[12][3] , \regs[12][2] , \regs[12][1] , \regs[12][0] ,
         \regs[11][15] , \regs[11][14] , \regs[11][13] , \regs[11][12] ,
         \regs[11][11] , \regs[11][10] , \regs[11][9] , \regs[11][8] ,
         \regs[11][7] , \regs[11][6] , \regs[11][5] , \regs[11][4] ,
         \regs[11][3] , \regs[11][2] , \regs[11][1] , \regs[11][0] ,
         \regs[10][15] , \regs[10][14] , \regs[10][13] , \regs[10][12] ,
         \regs[10][11] , \regs[10][10] , \regs[10][9] , \regs[10][8] ,
         \regs[10][7] , \regs[10][6] , \regs[10][5] , \regs[10][4] ,
         \regs[10][3] , \regs[10][2] , \regs[10][1] , \regs[10][0] ,
         \regs[9][15] , \regs[9][14] , \regs[9][13] , \regs[9][12] ,
         \regs[9][11] , \regs[9][10] , \regs[9][9] , \regs[9][8] ,
         \regs[9][7] , \regs[9][6] , \regs[9][5] , \regs[9][4] , \regs[9][3] ,
         \regs[9][2] , \regs[9][1] , \regs[9][0] , \regs[8][15] ,
         \regs[8][14] , \regs[8][13] , \regs[8][12] , \regs[8][11] ,
         \regs[8][10] , \regs[8][9] , \regs[8][8] , \regs[8][7] , \regs[8][6] ,
         \regs[8][5] , \regs[8][4] , \regs[8][3] , \regs[8][2] , \regs[8][1] ,
         \regs[8][0] , \regs[7][15] , \regs[7][14] , \regs[7][13] ,
         \regs[7][12] , \regs[7][11] , \regs[7][10] , \regs[7][9] ,
         \regs[7][8] , \regs[7][7] , \regs[7][6] , \regs[7][5] , \regs[7][4] ,
         \regs[7][3] , \regs[7][2] , \regs[7][1] , \regs[7][0] , \regs[6][15] ,
         \regs[6][14] , \regs[6][13] , \regs[6][12] , \regs[6][11] ,
         \regs[6][10] , \regs[6][9] , \regs[6][8] , \regs[6][7] , \regs[6][6] ,
         \regs[6][5] , \regs[6][4] , \regs[6][3] , \regs[6][2] , \regs[6][1] ,
         \regs[6][0] , \regs[5][15] , \regs[5][14] , \regs[5][13] ,
         \regs[5][12] , \regs[5][11] , \regs[5][10] , \regs[5][9] ,
         \regs[5][8] , \regs[5][7] , \regs[5][6] , \regs[5][5] , \regs[5][4] ,
         \regs[5][3] , \regs[5][2] , \regs[5][1] , \regs[5][0] , \regs[4][15] ,
         \regs[4][14] , \regs[4][13] , \regs[4][12] , \regs[4][11] ,
         \regs[4][10] , \regs[4][9] , \regs[4][8] , \regs[4][7] , \regs[4][6] ,
         \regs[4][5] , \regs[4][4] , \regs[4][3] , \regs[4][2] , \regs[4][1] ,
         \regs[4][0] , \regs[3][15] , \regs[3][14] , \regs[3][13] ,
         \regs[3][12] , \regs[3][11] , \regs[3][10] , \regs[3][9] ,
         \regs[3][8] , \regs[3][7] , \regs[3][6] , \regs[3][5] , \regs[3][4] ,
         \regs[3][3] , \regs[3][2] , \regs[3][1] , \regs[3][0] , \regs[2][15] ,
         \regs[2][14] , \regs[2][13] , \regs[2][12] , \regs[2][11] ,
         \regs[2][10] , \regs[2][9] , \regs[2][8] , \regs[2][7] , \regs[2][6] ,
         \regs[2][5] , \regs[2][4] , \regs[2][3] , \regs[2][2] , \regs[2][1] ,
         \regs[2][0] , \regs[1][15] , \regs[1][14] , \regs[1][13] ,
         \regs[1][12] , \regs[1][11] , \regs[1][10] , \regs[1][9] ,
         \regs[1][8] , \regs[1][7] , \regs[1][6] , \regs[1][5] , \regs[1][4] ,
         \regs[1][3] , \regs[1][2] , \regs[1][1] , \regs[1][0] , n769, n985,
         n987, n989, n990, n991, n992, n993, n994, n995, n996, n997, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1016, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1034, n1035, n1037, n1038, n1039, n1040, n1041, n1042, n1043,
         n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1127, n1133,
         n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143,
         n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153,
         n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163,
         n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173,
         n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n986, n988, n998, n1015, n1017,
         n1033, n1036, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1128, n1129, n1130,
         n1131, n1132, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316,
         n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326,
         n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336,
         n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346,
         n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1357,
         n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367,
         n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377,
         n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387,
         n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397,
         n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407,
         n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417,
         n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427,
         n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437,
         n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447,
         n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457,
         n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467,
         n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477,
         n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486;

  DFFSR \regs_reg[15][15]  ( .D(n1473), .CLK(clk), .R(n409), .S(1'b1), .Q(
        \regs[15][15] ) );
  DFFSR \regs_reg[15][14]  ( .D(n1465), .CLK(clk), .R(n409), .S(1'b1), .Q(
        \regs[15][14] ) );
  DFFSR \regs_reg[15][13]  ( .D(n1457), .CLK(clk), .R(n409), .S(1'b1), .Q(
        \regs[15][13] ) );
  DFFSR \regs_reg[15][12]  ( .D(n1481), .CLK(clk), .R(n409), .S(1'b1), .Q(
        \regs[15][12] ) );
  DFFSR \regs_reg[15][11]  ( .D(n1441), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][11] ) );
  DFFSR \regs_reg[15][10]  ( .D(n1433), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][10] ) );
  DFFSR \regs_reg[15][9]  ( .D(n1425), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][9] ) );
  DFFSR \regs_reg[15][8]  ( .D(n1449), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][8] ) );
  DFFSR \regs_reg[15][7]  ( .D(n1409), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][7] ) );
  DFFSR \regs_reg[15][6]  ( .D(n1400), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][6] ) );
  DFFSR \regs_reg[15][5]  ( .D(n1392), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][5] ) );
  DFFSR \regs_reg[15][4]  ( .D(n1416), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][4] ) );
  DFFSR \regs_reg[15][3]  ( .D(n1376), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][3] ) );
  DFFSR \regs_reg[15][2]  ( .D(n1368), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][2] ) );
  DFFSR \regs_reg[15][1]  ( .D(n1360), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][1] ) );
  DFFSR \regs_reg[15][0]  ( .D(n1384), .CLK(clk), .R(n408), .S(1'b1), .Q(
        \regs[15][0] ) );
  DFFSR \regs_reg[14][15]  ( .D(n1472), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][15] ) );
  DFFSR \regs_reg[14][14]  ( .D(n1464), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][14] ) );
  DFFSR \regs_reg[14][13]  ( .D(n1456), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][13] ) );
  DFFSR \regs_reg[14][12]  ( .D(n1480), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][12] ) );
  DFFSR \regs_reg[14][11]  ( .D(n1440), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][11] ) );
  DFFSR \regs_reg[14][10]  ( .D(n1432), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][10] ) );
  DFFSR \regs_reg[14][9]  ( .D(n1424), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][9] ) );
  DFFSR \regs_reg[14][8]  ( .D(n1448), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][8] ) );
  DFFSR \regs_reg[14][7]  ( .D(n1408), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][7] ) );
  DFFSR \regs_reg[14][6]  ( .D(n1399), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][6] ) );
  DFFSR \regs_reg[14][5]  ( .D(n1391), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][5] ) );
  DFFSR \regs_reg[14][4]  ( .D(n1415), .CLK(clk), .R(n407), .S(1'b1), .Q(
        \regs[14][4] ) );
  DFFSR \regs_reg[14][3]  ( .D(n1375), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[14][3] ) );
  DFFSR \regs_reg[14][2]  ( .D(n1367), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[14][2] ) );
  DFFSR \regs_reg[14][1]  ( .D(n1359), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[14][1] ) );
  DFFSR \regs_reg[14][0]  ( .D(n1383), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[14][0] ) );
  DFFSR \regs_reg[13][15]  ( .D(n1471), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][15] ) );
  DFFSR \regs_reg[13][14]  ( .D(n1463), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][14] ) );
  DFFSR \regs_reg[13][13]  ( .D(n1455), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][13] ) );
  DFFSR \regs_reg[13][12]  ( .D(n1479), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][12] ) );
  DFFSR \regs_reg[13][11]  ( .D(n1439), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][11] ) );
  DFFSR \regs_reg[13][10]  ( .D(n1431), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][10] ) );
  DFFSR \regs_reg[13][9]  ( .D(n1423), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][9] ) );
  DFFSR \regs_reg[13][8]  ( .D(n1447), .CLK(clk), .R(n406), .S(1'b1), .Q(
        \regs[13][8] ) );
  DFFSR \regs_reg[13][7]  ( .D(n1407), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][7] ) );
  DFFSR \regs_reg[13][6]  ( .D(n1398), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][6] ) );
  DFFSR \regs_reg[13][5]  ( .D(n1390), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][5] ) );
  DFFSR \regs_reg[13][4]  ( .D(n1414), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][4] ) );
  DFFSR \regs_reg[13][3]  ( .D(n1374), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][3] ) );
  DFFSR \regs_reg[13][2]  ( .D(n1366), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][2] ) );
  DFFSR \regs_reg[13][1]  ( .D(n1358), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][1] ) );
  DFFSR \regs_reg[13][0]  ( .D(n1382), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[13][0] ) );
  DFFSR \regs_reg[12][15]  ( .D(n1470), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[12][15] ) );
  DFFSR \regs_reg[12][14]  ( .D(n1462), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[12][14] ) );
  DFFSR \regs_reg[12][13]  ( .D(n1454), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[12][13] ) );
  DFFSR \regs_reg[12][12]  ( .D(n1478), .CLK(clk), .R(n405), .S(1'b1), .Q(
        \regs[12][12] ) );
  DFFSR \regs_reg[12][11]  ( .D(n1438), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][11] ) );
  DFFSR \regs_reg[12][10]  ( .D(n1430), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][10] ) );
  DFFSR \regs_reg[12][9]  ( .D(n1422), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][9] ) );
  DFFSR \regs_reg[12][8]  ( .D(n1446), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][8] ) );
  DFFSR \regs_reg[12][7]  ( .D(n1406), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][7] ) );
  DFFSR \regs_reg[12][6]  ( .D(n1405), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][6] ) );
  DFFSR \regs_reg[12][5]  ( .D(n1397), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][5] ) );
  DFFSR \regs_reg[12][4]  ( .D(n1421), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][4] ) );
  DFFSR \regs_reg[12][3]  ( .D(n1381), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][3] ) );
  DFFSR \regs_reg[12][2]  ( .D(n1373), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][2] ) );
  DFFSR \regs_reg[12][1]  ( .D(n1365), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][1] ) );
  DFFSR \regs_reg[12][0]  ( .D(n1389), .CLK(clk), .R(n404), .S(1'b1), .Q(
        \regs[12][0] ) );
  DFFSR \regs_reg[11][15]  ( .D(n1268), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][15] ) );
  DFFSR \regs_reg[11][14]  ( .D(n1267), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][14] ) );
  DFFSR \regs_reg[11][13]  ( .D(n1266), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][13] ) );
  DFFSR \regs_reg[11][12]  ( .D(n1265), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][12] ) );
  DFFSR \regs_reg[11][11]  ( .D(n1264), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][11] ) );
  DFFSR \regs_reg[11][10]  ( .D(n1263), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][10] ) );
  DFFSR \regs_reg[11][9]  ( .D(n1262), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][9] ) );
  DFFSR \regs_reg[11][8]  ( .D(n1261), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][8] ) );
  DFFSR \regs_reg[11][7]  ( .D(n1260), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][7] ) );
  DFFSR \regs_reg[11][6]  ( .D(n1259), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][6] ) );
  DFFSR \regs_reg[11][5]  ( .D(n1258), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][5] ) );
  DFFSR \regs_reg[11][4]  ( .D(n1257), .CLK(clk), .R(n403), .S(1'b1), .Q(
        \regs[11][4] ) );
  DFFSR \regs_reg[11][3]  ( .D(n1256), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[11][3] ) );
  DFFSR \regs_reg[11][2]  ( .D(n1255), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[11][2] ) );
  DFFSR \regs_reg[11][1]  ( .D(n1254), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[11][1] ) );
  DFFSR \regs_reg[11][0]  ( .D(n1253), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[11][0] ) );
  DFFSR \regs_reg[10][15]  ( .D(n1252), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][15] ) );
  DFFSR \regs_reg[10][14]  ( .D(n1251), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][14] ) );
  DFFSR \regs_reg[10][13]  ( .D(n1250), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][13] ) );
  DFFSR \regs_reg[10][12]  ( .D(n1249), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][12] ) );
  DFFSR \regs_reg[10][11]  ( .D(n1248), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][11] ) );
  DFFSR \regs_reg[10][10]  ( .D(n1247), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][10] ) );
  DFFSR \regs_reg[10][9]  ( .D(n1246), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][9] ) );
  DFFSR \regs_reg[10][8]  ( .D(n1245), .CLK(clk), .R(n402), .S(1'b1), .Q(
        \regs[10][8] ) );
  DFFSR \regs_reg[10][7]  ( .D(n1244), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][7] ) );
  DFFSR \regs_reg[10][6]  ( .D(n1243), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][6] ) );
  DFFSR \regs_reg[10][5]  ( .D(n1242), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][5] ) );
  DFFSR \regs_reg[10][4]  ( .D(n1241), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][4] ) );
  DFFSR \regs_reg[10][3]  ( .D(n1240), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][3] ) );
  DFFSR \regs_reg[10][2]  ( .D(n1239), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][2] ) );
  DFFSR \regs_reg[10][1]  ( .D(n1238), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][1] ) );
  DFFSR \regs_reg[10][0]  ( .D(n1237), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[10][0] ) );
  DFFSR \regs_reg[9][15]  ( .D(n1236), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[9][15] ) );
  DFFSR \regs_reg[9][14]  ( .D(n1235), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[9][14] ) );
  DFFSR \regs_reg[9][13]  ( .D(n1234), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[9][13] ) );
  DFFSR \regs_reg[9][12]  ( .D(n1233), .CLK(clk), .R(n401), .S(1'b1), .Q(
        \regs[9][12] ) );
  DFFSR \regs_reg[9][11]  ( .D(n1232), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][11] ) );
  DFFSR \regs_reg[9][10]  ( .D(n1231), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][10] ) );
  DFFSR \regs_reg[9][9]  ( .D(n1230), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][9] ) );
  DFFSR \regs_reg[9][8]  ( .D(n1229), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][8] ) );
  DFFSR \regs_reg[9][7]  ( .D(n1228), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][7] ) );
  DFFSR \regs_reg[9][6]  ( .D(n1227), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][6] ) );
  DFFSR \regs_reg[9][5]  ( .D(n1226), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][5] ) );
  DFFSR \regs_reg[9][4]  ( .D(n1225), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][4] ) );
  DFFSR \regs_reg[9][3]  ( .D(n1224), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][3] ) );
  DFFSR \regs_reg[9][2]  ( .D(n1223), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][2] ) );
  DFFSR \regs_reg[9][1]  ( .D(n1222), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][1] ) );
  DFFSR \regs_reg[9][0]  ( .D(n1221), .CLK(clk), .R(n400), .S(1'b1), .Q(
        \regs[9][0] ) );
  DFFSR \regs_reg[8][15]  ( .D(n1220), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][15] ) );
  DFFSR \regs_reg[8][14]  ( .D(n1219), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][14] ) );
  DFFSR \regs_reg[8][13]  ( .D(n1218), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][13] ) );
  DFFSR \regs_reg[8][12]  ( .D(n1217), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][12] ) );
  DFFSR \regs_reg[8][11]  ( .D(n1216), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][11] ) );
  DFFSR \regs_reg[8][10]  ( .D(n1215), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][10] ) );
  DFFSR \regs_reg[8][9]  ( .D(n1214), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][9] ) );
  DFFSR \regs_reg[8][8]  ( .D(n1213), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][8] ) );
  DFFSR \regs_reg[8][7]  ( .D(n1212), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][7] ) );
  DFFSR \regs_reg[8][6]  ( .D(n1211), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][6] ) );
  DFFSR \regs_reg[8][5]  ( .D(n1210), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][5] ) );
  DFFSR \regs_reg[8][4]  ( .D(n1209), .CLK(clk), .R(n399), .S(1'b1), .Q(
        \regs[8][4] ) );
  DFFSR \regs_reg[8][3]  ( .D(n1208), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[8][3] ) );
  DFFSR \regs_reg[8][2]  ( .D(n1207), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[8][2] ) );
  DFFSR \regs_reg[8][1]  ( .D(n1206), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[8][1] ) );
  DFFSR \regs_reg[8][0]  ( .D(n1205), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[8][0] ) );
  DFFSR \regs_reg[7][15]  ( .D(n1204), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][15] ) );
  DFFSR \regs_reg[7][14]  ( .D(n1203), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][14] ) );
  DFFSR \regs_reg[7][13]  ( .D(n1202), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][13] ) );
  DFFSR \regs_reg[7][12]  ( .D(n1201), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][12] ) );
  DFFSR \regs_reg[7][11]  ( .D(n1200), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][11] ) );
  DFFSR \regs_reg[7][10]  ( .D(n1199), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][10] ) );
  DFFSR \regs_reg[7][9]  ( .D(n1198), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][9] ) );
  DFFSR \regs_reg[7][8]  ( .D(n1197), .CLK(clk), .R(n398), .S(1'b1), .Q(
        \regs[7][8] ) );
  DFFSR \regs_reg[7][7]  ( .D(n1196), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][7] ) );
  DFFSR \regs_reg[7][6]  ( .D(n1195), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][6] ) );
  DFFSR \regs_reg[7][5]  ( .D(n1194), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][5] ) );
  DFFSR \regs_reg[7][4]  ( .D(n1193), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][4] ) );
  DFFSR \regs_reg[7][3]  ( .D(n1192), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][3] ) );
  DFFSR \regs_reg[7][2]  ( .D(n1191), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][2] ) );
  DFFSR \regs_reg[7][1]  ( .D(n1190), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][1] ) );
  DFFSR \regs_reg[7][0]  ( .D(n1189), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[7][0] ) );
  DFFSR \regs_reg[6][15]  ( .D(n1188), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[6][15] ) );
  DFFSR \regs_reg[6][14]  ( .D(n1187), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[6][14] ) );
  DFFSR \regs_reg[6][13]  ( .D(n1186), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[6][13] ) );
  DFFSR \regs_reg[6][12]  ( .D(n1185), .CLK(clk), .R(n397), .S(1'b1), .Q(
        \regs[6][12] ) );
  DFFSR \regs_reg[6][11]  ( .D(n1184), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][11] ) );
  DFFSR \regs_reg[6][10]  ( .D(n1183), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][10] ) );
  DFFSR \regs_reg[6][9]  ( .D(n1182), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][9] ) );
  DFFSR \regs_reg[6][8]  ( .D(n1181), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][8] ) );
  DFFSR \regs_reg[6][7]  ( .D(n1180), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][7] ) );
  DFFSR \regs_reg[6][6]  ( .D(n1179), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][6] ) );
  DFFSR \regs_reg[6][5]  ( .D(n1178), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][5] ) );
  DFFSR \regs_reg[6][4]  ( .D(n1177), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][4] ) );
  DFFSR \regs_reg[6][3]  ( .D(n1176), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][3] ) );
  DFFSR \regs_reg[6][2]  ( .D(n1175), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][2] ) );
  DFFSR \regs_reg[6][1]  ( .D(n1174), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][1] ) );
  DFFSR \regs_reg[6][0]  ( .D(n1173), .CLK(clk), .R(n396), .S(1'b1), .Q(
        \regs[6][0] ) );
  DFFSR \regs_reg[5][15]  ( .D(n1172), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][15] ) );
  DFFSR \regs_reg[5][14]  ( .D(n1171), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][14] ) );
  DFFSR \regs_reg[5][13]  ( .D(n1170), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][13] ) );
  DFFSR \regs_reg[5][12]  ( .D(n1169), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][12] ) );
  DFFSR \regs_reg[5][11]  ( .D(n1168), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][11] ) );
  DFFSR \regs_reg[5][10]  ( .D(n1167), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][10] ) );
  DFFSR \regs_reg[5][9]  ( .D(n1166), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][9] ) );
  DFFSR \regs_reg[5][8]  ( .D(n1165), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][8] ) );
  DFFSR \regs_reg[5][7]  ( .D(n1164), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][7] ) );
  DFFSR \regs_reg[5][6]  ( .D(n1163), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][6] ) );
  DFFSR \regs_reg[5][5]  ( .D(n1162), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][5] ) );
  DFFSR \regs_reg[5][4]  ( .D(n1161), .CLK(clk), .R(n395), .S(1'b1), .Q(
        \regs[5][4] ) );
  DFFSR \regs_reg[5][3]  ( .D(n1160), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[5][3] ) );
  DFFSR \regs_reg[5][2]  ( .D(n1159), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[5][2] ) );
  DFFSR \regs_reg[5][1]  ( .D(n1158), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[5][1] ) );
  DFFSR \regs_reg[5][0]  ( .D(n1157), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[5][0] ) );
  DFFSR \regs_reg[4][15]  ( .D(n1156), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][15] ) );
  DFFSR \regs_reg[4][14]  ( .D(n1155), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][14] ) );
  DFFSR \regs_reg[4][13]  ( .D(n1154), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][13] ) );
  DFFSR \regs_reg[4][12]  ( .D(n1153), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][12] ) );
  DFFSR \regs_reg[4][11]  ( .D(n1152), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][11] ) );
  DFFSR \regs_reg[4][10]  ( .D(n1151), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][10] ) );
  DFFSR \regs_reg[4][9]  ( .D(n1150), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][9] ) );
  DFFSR \regs_reg[4][8]  ( .D(n1149), .CLK(clk), .R(n394), .S(1'b1), .Q(
        \regs[4][8] ) );
  DFFSR \regs_reg[4][7]  ( .D(n1148), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][7] ) );
  DFFSR \regs_reg[4][6]  ( .D(n1147), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][6] ) );
  DFFSR \regs_reg[4][5]  ( .D(n1146), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][5] ) );
  DFFSR \regs_reg[4][4]  ( .D(n1145), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][4] ) );
  DFFSR \regs_reg[4][3]  ( .D(n1144), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][3] ) );
  DFFSR \regs_reg[4][2]  ( .D(n1143), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][2] ) );
  DFFSR \regs_reg[4][1]  ( .D(n1142), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][1] ) );
  DFFSR \regs_reg[4][0]  ( .D(n1141), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[4][0] ) );
  DFFSR \regs_reg[3][15]  ( .D(n1477), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[3][15] ) );
  DFFSR \regs_reg[3][14]  ( .D(n1469), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[3][14] ) );
  DFFSR \regs_reg[3][13]  ( .D(n1461), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[3][13] ) );
  DFFSR \regs_reg[3][12]  ( .D(n1485), .CLK(clk), .R(n393), .S(1'b1), .Q(
        \regs[3][12] ) );
  DFFSR \regs_reg[3][11]  ( .D(n1445), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][11] ) );
  DFFSR \regs_reg[3][10]  ( .D(n1437), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][10] ) );
  DFFSR \regs_reg[3][9]  ( .D(n1429), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][9] ) );
  DFFSR \regs_reg[3][8]  ( .D(n1453), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][8] ) );
  DFFSR \regs_reg[3][7]  ( .D(n1413), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][7] ) );
  DFFSR \regs_reg[3][6]  ( .D(n1404), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][6] ) );
  DFFSR \regs_reg[3][5]  ( .D(n1396), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][5] ) );
  DFFSR \regs_reg[3][4]  ( .D(n1420), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][4] ) );
  DFFSR \regs_reg[3][3]  ( .D(n1380), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][3] ) );
  DFFSR \regs_reg[3][2]  ( .D(n1372), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][2] ) );
  DFFSR \regs_reg[3][1]  ( .D(n1364), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][1] ) );
  DFFSR \regs_reg[3][0]  ( .D(n1388), .CLK(clk), .R(n392), .S(1'b1), .Q(
        \regs[3][0] ) );
  DFFSR \regs_reg[2][15]  ( .D(n1476), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][15] ) );
  DFFSR \regs_reg[2][14]  ( .D(n1468), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][14] ) );
  DFFSR \regs_reg[2][13]  ( .D(n1460), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][13] ) );
  DFFSR \regs_reg[2][12]  ( .D(n1484), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][12] ) );
  DFFSR \regs_reg[2][11]  ( .D(n1444), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][11] ) );
  DFFSR \regs_reg[2][10]  ( .D(n1436), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][10] ) );
  DFFSR \regs_reg[2][9]  ( .D(n1428), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][9] ) );
  DFFSR \regs_reg[2][8]  ( .D(n1452), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][8] ) );
  DFFSR \regs_reg[2][7]  ( .D(n1412), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][7] ) );
  DFFSR \regs_reg[2][6]  ( .D(n1403), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][6] ) );
  DFFSR \regs_reg[2][5]  ( .D(n1395), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][5] ) );
  DFFSR \regs_reg[2][4]  ( .D(n1419), .CLK(clk), .R(n391), .S(1'b1), .Q(
        \regs[2][4] ) );
  DFFSR \regs_reg[2][3]  ( .D(n1379), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[2][3] ) );
  DFFSR \regs_reg[2][2]  ( .D(n1371), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[2][2] ) );
  DFFSR \regs_reg[2][1]  ( .D(n1363), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[2][1] ) );
  DFFSR \regs_reg[2][0]  ( .D(n1387), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[2][0] ) );
  DFFSR \regs_reg[1][15]  ( .D(n1475), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][15] ) );
  DFFSR \regs_reg[1][14]  ( .D(n1467), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][14] ) );
  DFFSR \regs_reg[1][13]  ( .D(n1459), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][13] ) );
  DFFSR \regs_reg[1][12]  ( .D(n1483), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][12] ) );
  DFFSR \regs_reg[1][11]  ( .D(n1443), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][11] ) );
  DFFSR \regs_reg[1][10]  ( .D(n1435), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][10] ) );
  DFFSR \regs_reg[1][9]  ( .D(n1427), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][9] ) );
  DFFSR \regs_reg[1][8]  ( .D(n1451), .CLK(clk), .R(n390), .S(1'b1), .Q(
        \regs[1][8] ) );
  DFFSR \regs_reg[1][7]  ( .D(n1411), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][7] ) );
  DFFSR \regs_reg[1][6]  ( .D(n1402), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][6] ) );
  DFFSR \regs_reg[1][5]  ( .D(n1394), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][5] ) );
  DFFSR \regs_reg[1][4]  ( .D(n1418), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][4] ) );
  DFFSR \regs_reg[1][3]  ( .D(n1378), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][3] ) );
  DFFSR \regs_reg[1][2]  ( .D(n1370), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][2] ) );
  DFFSR \regs_reg[1][1]  ( .D(n1362), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][1] ) );
  DFFSR \regs_reg[1][0]  ( .D(n1386), .CLK(clk), .R(n389), .S(1'b1), .Q(
        \regs[1][0] ) );
  DFFSR \regs_reg[0][15]  ( .D(n1474), .CLK(clk), .R(n389), .S(1'b1), .Q(
        outreg_data[15]) );
  DFFSR \regs_reg[0][14]  ( .D(n1466), .CLK(clk), .R(n389), .S(1'b1), .Q(
        outreg_data[14]) );
  DFFSR \regs_reg[0][13]  ( .D(n1458), .CLK(clk), .R(n389), .S(1'b1), .Q(
        outreg_data[13]) );
  DFFSR \regs_reg[0][12]  ( .D(n1482), .CLK(clk), .R(n389), .S(1'b1), .Q(
        outreg_data[12]) );
  DFFSR \regs_reg[0][11]  ( .D(n1442), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[11]) );
  DFFSR \regs_reg[0][10]  ( .D(n1434), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[10]) );
  DFFSR \regs_reg[0][9]  ( .D(n1426), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[9]) );
  DFFSR \regs_reg[0][8]  ( .D(n1450), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[8]) );
  DFFSR \regs_reg[0][7]  ( .D(n1410), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[7]) );
  DFFSR \regs_reg[0][6]  ( .D(n1401), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[6]) );
  DFFSR \regs_reg[0][5]  ( .D(n1393), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[5]) );
  DFFSR \regs_reg[0][4]  ( .D(n1417), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[4]) );
  DFFSR \regs_reg[0][3]  ( .D(n1377), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[3]) );
  DFFSR \regs_reg[0][2]  ( .D(n1369), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[2]) );
  DFFSR \regs_reg[0][1]  ( .D(n1361), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[1]) );
  DFFSR \regs_reg[0][0]  ( .D(n1385), .CLK(clk), .R(n388), .S(1'b1), .Q(
        outreg_data[0]) );
  AND2X2 U312 ( .A(w_sel[0]), .B(n1133), .Y(n1014) );
  AND2X2 U313 ( .A(n1133), .B(n1357), .Y(n1034) );
  AND2X2 U314 ( .A(w_sel[3]), .B(w_en), .Y(n1133) );
  NOR2X1 U813 ( .A(n435), .B(n295), .Y(n769) );
  NOR2X1 U1019 ( .A(n832), .B(n318), .Y(n985) );
  AOI22X1 U1025 ( .A(n331), .B(w_data[7]), .C(n376), .D(\regs[12][7] ), .Y(
        n987) );
  AOI22X1 U1026 ( .A(w_data[8]), .B(n331), .C(n376), .D(\regs[12][8] ), .Y(
        n989) );
  AOI22X1 U1027 ( .A(w_data[9]), .B(n331), .C(n376), .D(\regs[12][9] ), .Y(
        n990) );
  AOI22X1 U1028 ( .A(n331), .B(w_data[10]), .C(n376), .D(\regs[12][10] ), .Y(
        n991) );
  AOI22X1 U1029 ( .A(w_data[11]), .B(n331), .C(n376), .D(\regs[12][11] ), .Y(
        n992) );
  AOI22X1 U1030 ( .A(n331), .B(w_data[12]), .C(n376), .D(\regs[12][12] ), .Y(
        n993) );
  AOI22X1 U1031 ( .A(w_data[13]), .B(n331), .C(n376), .D(\regs[12][13] ), .Y(
        n994) );
  AOI22X1 U1032 ( .A(w_data[14]), .B(n331), .C(n376), .D(\regs[12][14] ), .Y(
        n995) );
  AOI22X1 U1033 ( .A(w_data[15]), .B(n331), .C(n376), .D(\regs[12][15] ), .Y(
        n996) );
  AOI22X1 U1034 ( .A(n334), .B(w_data[0]), .C(n379), .D(\regs[13][0] ), .Y(
        n997) );
  AOI22X1 U1035 ( .A(n334), .B(w_data[1]), .C(n379), .D(\regs[13][1] ), .Y(
        n999) );
  AOI22X1 U1036 ( .A(n334), .B(w_data[2]), .C(n379), .D(\regs[13][2] ), .Y(
        n1000) );
  AOI22X1 U1037 ( .A(n334), .B(w_data[3]), .C(n379), .D(\regs[13][3] ), .Y(
        n1001) );
  AOI22X1 U1038 ( .A(n334), .B(w_data[4]), .C(n379), .D(\regs[13][4] ), .Y(
        n1002) );
  AOI22X1 U1039 ( .A(n334), .B(w_data[5]), .C(n379), .D(\regs[13][5] ), .Y(
        n1003) );
  AOI22X1 U1040 ( .A(w_data[6]), .B(n334), .C(n379), .D(\regs[13][6] ), .Y(
        n1004) );
  AOI22X1 U1041 ( .A(w_data[7]), .B(n334), .C(n379), .D(\regs[13][7] ), .Y(
        n1005) );
  AOI22X1 U1042 ( .A(w_data[8]), .B(n334), .C(n379), .D(\regs[13][8] ), .Y(
        n1006) );
  AOI22X1 U1043 ( .A(w_data[9]), .B(n334), .C(n379), .D(\regs[13][9] ), .Y(
        n1007) );
  AOI22X1 U1044 ( .A(w_data[10]), .B(n334), .C(n379), .D(\regs[13][10] ), .Y(
        n1008) );
  AOI22X1 U1045 ( .A(w_data[11]), .B(n334), .C(n379), .D(\regs[13][11] ), .Y(
        n1009) );
  AOI22X1 U1046 ( .A(w_data[12]), .B(n334), .C(n379), .D(\regs[13][12] ), .Y(
        n1010) );
  AOI22X1 U1047 ( .A(w_data[13]), .B(n334), .C(n379), .D(\regs[13][13] ), .Y(
        n1011) );
  AOI22X1 U1048 ( .A(w_data[14]), .B(n334), .C(n379), .D(\regs[13][14] ), .Y(
        n1012) );
  AOI22X1 U1049 ( .A(w_data[15]), .B(n334), .C(n379), .D(\regs[13][15] ), .Y(
        n1013) );
  AOI22X1 U1051 ( .A(w_data[0]), .B(n332), .C(n378), .D(\regs[14][0] ), .Y(
        n1016) );
  AOI22X1 U1052 ( .A(w_data[1]), .B(n332), .C(n378), .D(\regs[14][1] ), .Y(
        n1018) );
  AOI22X1 U1053 ( .A(w_data[2]), .B(n332), .C(n378), .D(\regs[14][2] ), .Y(
        n1019) );
  AOI22X1 U1054 ( .A(w_data[3]), .B(n332), .C(n378), .D(\regs[14][3] ), .Y(
        n1020) );
  AOI22X1 U1055 ( .A(w_data[4]), .B(n332), .C(n378), .D(\regs[14][4] ), .Y(
        n1021) );
  AOI22X1 U1056 ( .A(w_data[5]), .B(n332), .C(n378), .D(\regs[14][5] ), .Y(
        n1022) );
  AOI22X1 U1057 ( .A(w_data[6]), .B(n332), .C(n378), .D(\regs[14][6] ), .Y(
        n1023) );
  AOI22X1 U1058 ( .A(w_data[7]), .B(n332), .C(n378), .D(\regs[14][7] ), .Y(
        n1024) );
  AOI22X1 U1059 ( .A(w_data[8]), .B(n332), .C(n378), .D(\regs[14][8] ), .Y(
        n1025) );
  AOI22X1 U1060 ( .A(w_data[9]), .B(n332), .C(n378), .D(\regs[14][9] ), .Y(
        n1026) );
  AOI22X1 U1061 ( .A(w_data[10]), .B(n332), .C(n378), .D(\regs[14][10] ), .Y(
        n1027) );
  AOI22X1 U1062 ( .A(w_data[11]), .B(n332), .C(n378), .D(\regs[14][11] ), .Y(
        n1028) );
  AOI22X1 U1063 ( .A(w_data[12]), .B(n332), .C(n378), .D(\regs[14][12] ), .Y(
        n1029) );
  AOI22X1 U1064 ( .A(w_data[13]), .B(n332), .C(n378), .D(\regs[14][13] ), .Y(
        n1030) );
  AOI22X1 U1065 ( .A(w_data[14]), .B(n332), .C(n378), .D(\regs[14][14] ), .Y(
        n1031) );
  AOI22X1 U1066 ( .A(w_data[15]), .B(n332), .C(n378), .D(\regs[14][15] ), .Y(
        n1032) );
  AOI22X1 U1068 ( .A(w_data[0]), .B(n333), .C(n377), .D(\regs[15][0] ), .Y(
        n1035) );
  AOI22X1 U1069 ( .A(w_data[1]), .B(n333), .C(n377), .D(\regs[15][1] ), .Y(
        n1037) );
  AOI22X1 U1070 ( .A(w_data[2]), .B(n333), .C(n377), .D(\regs[15][2] ), .Y(
        n1038) );
  AOI22X1 U1071 ( .A(w_data[3]), .B(n333), .C(n377), .D(\regs[15][3] ), .Y(
        n1039) );
  AOI22X1 U1072 ( .A(w_data[4]), .B(n333), .C(n377), .D(\regs[15][4] ), .Y(
        n1040) );
  AOI22X1 U1073 ( .A(w_data[5]), .B(n333), .C(n377), .D(\regs[15][5] ), .Y(
        n1041) );
  AOI22X1 U1074 ( .A(w_data[6]), .B(n333), .C(n377), .D(\regs[15][6] ), .Y(
        n1042) );
  AOI22X1 U1075 ( .A(w_data[7]), .B(n333), .C(n377), .D(\regs[15][7] ), .Y(
        n1043) );
  AOI22X1 U1076 ( .A(w_data[8]), .B(n333), .C(n377), .D(\regs[15][8] ), .Y(
        n1044) );
  AOI22X1 U1077 ( .A(w_data[9]), .B(n333), .C(n377), .D(\regs[15][9] ), .Y(
        n1045) );
  AOI22X1 U1078 ( .A(w_data[10]), .B(n333), .C(n377), .D(\regs[15][10] ), .Y(
        n1046) );
  AOI22X1 U1079 ( .A(w_data[11]), .B(n333), .C(n377), .D(\regs[15][11] ), .Y(
        n1047) );
  AOI22X1 U1080 ( .A(w_data[12]), .B(n333), .C(n377), .D(\regs[15][12] ), .Y(
        n1048) );
  AOI22X1 U1081 ( .A(w_data[13]), .B(n333), .C(n377), .D(\regs[15][13] ), .Y(
        n1049) );
  AOI22X1 U1082 ( .A(w_data[14]), .B(n333), .C(n377), .D(\regs[15][14] ), .Y(
        n1050) );
  AOI22X1 U1083 ( .A(w_data[15]), .B(n333), .C(n377), .D(\regs[15][15] ), .Y(
        n1051) );
  NOR2X1 U1222 ( .A(n1486), .B(w_sel[3]), .Y(n1127) );
  AOI22X1 U1293 ( .A(n331), .B(w_data[0]), .C(n376), .D(\regs[12][0] ), .Y(
        n1134) );
  AOI22X1 U1294 ( .A(n331), .B(w_data[1]), .C(n376), .D(\regs[12][1] ), .Y(
        n1135) );
  AOI22X1 U1295 ( .A(n331), .B(w_data[2]), .C(n376), .D(\regs[12][2] ), .Y(
        n1136) );
  AOI22X1 U1296 ( .A(n331), .B(w_data[3]), .C(n376), .D(\regs[12][3] ), .Y(
        n1137) );
  AOI22X1 U1297 ( .A(n331), .B(w_data[4]), .C(n376), .D(\regs[12][4] ), .Y(
        n1138) );
  AOI22X1 U1298 ( .A(n331), .B(w_data[5]), .C(n376), .D(\regs[12][5] ), .Y(
        n1139) );
  AOI22X1 U1299 ( .A(w_data[6]), .B(n331), .C(n376), .D(\regs[12][6] ), .Y(
        n1140) );
  INVX1 U258 ( .A(n785), .Y(n257) );
  INVX4 U259 ( .A(n583), .Y(n449) );
  INVX1 U260 ( .A(w_data[14]), .Y(n258) );
  INVX1 U261 ( .A(n258), .Y(n259) );
  INVX1 U262 ( .A(n259), .Y(n752) );
  INVX8 U263 ( .A(w_data[14]), .Y(n264) );
  INVX1 U264 ( .A(n372), .Y(n260) );
  NAND2X1 U265 ( .A(n899), .B(n900), .Y(n261) );
  NAND2X1 U266 ( .A(n898), .B(n262), .Y(r1_data[3]) );
  INVX2 U267 ( .A(n261), .Y(n262) );
  INVX1 U268 ( .A(n320), .Y(n263) );
  BUFX2 U269 ( .A(n1346), .Y(n287) );
  INVX2 U270 ( .A(n370), .Y(n299) );
  INVX1 U271 ( .A(n1346), .Y(n265) );
  INVX1 U272 ( .A(w_data[4]), .Y(n266) );
  INVX1 U273 ( .A(w_data[9]), .Y(n267) );
  INVX1 U274 ( .A(w_data[6]), .Y(n269) );
  INVX1 U275 ( .A(n263), .Y(n268) );
  INVX1 U276 ( .A(n257), .Y(n272) );
  INVX4 U277 ( .A(n366), .Y(n270) );
  INVX4 U278 ( .A(n366), .Y(n367) );
  INVX1 U279 ( .A(n273), .Y(n271) );
  INVX8 U280 ( .A(r2_sel[0]), .Y(n584) );
  INVX2 U281 ( .A(n367), .Y(n883) );
  INVX4 U282 ( .A(n436), .Y(n789) );
  INVX8 U283 ( .A(w_data[13]), .Y(n273) );
  INVX1 U284 ( .A(n271), .Y(n274) );
  INVX4 U285 ( .A(n1342), .Y(n368) );
  BUFX2 U286 ( .A(n1337), .Y(n292) );
  INVX2 U287 ( .A(n373), .Y(n882) );
  INVX2 U288 ( .A(n288), .Y(n347) );
  INVX2 U289 ( .A(n410), .Y(n412) );
  AND2X2 U290 ( .A(w_sel[1]), .B(w_sel[2]), .Y(n275) );
  AND2X2 U291 ( .A(w_sel[2]), .B(n425), .Y(n276) );
  OR2X1 U292 ( .A(n564), .B(n563), .Y(n277) );
  OR2X1 U293 ( .A(n608), .B(n607), .Y(n278) );
  AND2X1 U294 ( .A(n452), .B(n450), .Y(n279) );
  INVX2 U295 ( .A(\regs[7][9] ), .Y(n643) );
  MUX2X1 U296 ( .B(n280), .A(n674), .S(n424), .Y(n1199) );
  MUX2X1 U297 ( .B(n280), .A(n676), .S(n431), .Y(n1183) );
  MUX2X1 U298 ( .B(n280), .A(n659), .S(n428), .Y(n1167) );
  MUX2X1 U299 ( .B(n280), .A(n660), .S(n426), .Y(n1151) );
  MUX2X1 U300 ( .B(n280), .A(n1094), .S(n410), .Y(n1434) );
  MUX2X1 U301 ( .B(n280), .A(n1095), .S(n423), .Y(n1435) );
  INVX8 U302 ( .A(w_data[10]), .Y(n280) );
  INVX8 U303 ( .A(w_data[7]), .Y(n282) );
  MUX2X1 U304 ( .B(n281), .A(n532), .S(n431), .Y(n1177) );
  MUX2X1 U305 ( .B(n281), .A(n531), .S(n428), .Y(n1161) );
  MUX2X1 U306 ( .B(n281), .A(n530), .S(n426), .Y(n1145) );
  INVX8 U307 ( .A(w_data[4]), .Y(n281) );
  MUX2X1 U308 ( .B(n711), .A(n709), .S(n424), .Y(n1201) );
  MUX2X1 U309 ( .B(n711), .A(n710), .S(n431), .Y(n1185) );
  MUX2X1 U310 ( .B(n641), .A(n1074), .S(n410), .Y(n1426) );
  MUX2X1 U311 ( .B(n617), .A(n615), .S(n424), .Y(n1197) );
  MUX2X1 U315 ( .B(n617), .A(n616), .S(n431), .Y(n1181) );
  MUX2X1 U316 ( .B(n574), .A(n569), .S(n424), .Y(n1195) );
  MUX2X1 U317 ( .B(n574), .A(n570), .S(n431), .Y(n1179) );
  MUX2X1 U318 ( .B(n574), .A(n944), .S(n413), .Y(n1404) );
  MUX2X1 U319 ( .B(n574), .A(n943), .S(n430), .Y(n1403) );
  MUX2X1 U320 ( .B(n574), .A(n947), .S(n428), .Y(n1163) );
  MUX2X1 U321 ( .B(n574), .A(n949), .S(n426), .Y(n1147) );
  MUX2X1 U322 ( .B(n574), .A(n942), .S(n423), .Y(n1402) );
  INVX4 U323 ( .A(n423), .Y(n774) );
  MUX2X1 U324 ( .B(n574), .A(n941), .S(n410), .Y(n1401) );
  MUX2X1 U325 ( .B(n641), .A(n643), .S(n424), .Y(n1198) );
  INVX8 U326 ( .A(w_data[6]), .Y(n574) );
  MUX2X1 U327 ( .B(n641), .A(n640), .S(n431), .Y(n1182) );
  MUX2X1 U328 ( .B(n641), .A(n639), .S(n428), .Y(n1166) );
  MUX2X1 U329 ( .B(n641), .A(n638), .S(n426), .Y(n1150) );
  MUX2X1 U330 ( .B(n641), .A(n1077), .S(n413), .Y(n1429) );
  MUX2X1 U331 ( .B(n641), .A(n1076), .S(n430), .Y(n1428) );
  MUX2X1 U332 ( .B(n641), .A(n1075), .S(n423), .Y(n1427) );
  NAND2X1 U333 ( .A(n284), .B(n283), .Y(r1_data[7]) );
  INVX2 U334 ( .A(n983), .Y(n283) );
  INVX1 U335 ( .A(n984), .Y(n284) );
  INVX1 U336 ( .A(n366), .Y(n285) );
  INVX2 U337 ( .A(n368), .Y(n286) );
  INVX4 U338 ( .A(n368), .Y(n369) );
  INVX4 U339 ( .A(n788), .Y(n312) );
  INVX2 U340 ( .A(n1346), .Y(n372) );
  BUFX2 U341 ( .A(n1338), .Y(n288) );
  BUFX4 U342 ( .A(n1338), .Y(n289) );
  BUFX4 U343 ( .A(n1338), .Y(n290) );
  INVX2 U344 ( .A(n948), .Y(n1338) );
  INVX4 U345 ( .A(n372), .Y(n373) );
  BUFX2 U346 ( .A(n668), .Y(n291) );
  BUFX4 U347 ( .A(n1337), .Y(n293) );
  BUFX4 U348 ( .A(n1337), .Y(n294) );
  INVX2 U349 ( .A(n950), .Y(n1337) );
  INVX1 U350 ( .A(n434), .Y(n295) );
  INVX2 U351 ( .A(r2_sel[2]), .Y(n434) );
  INVX8 U352 ( .A(n1339), .Y(n296) );
  INVX8 U353 ( .A(n296), .Y(n297) );
  INVX8 U354 ( .A(n296), .Y(n298) );
  INVX8 U355 ( .A(w_data[11]), .Y(n320) );
  INVX2 U356 ( .A(n370), .Y(n317) );
  INVX1 U357 ( .A(r1_sel[0]), .Y(n300) );
  INVX1 U358 ( .A(n368), .Y(n301) );
  INVX8 U359 ( .A(n802), .Y(n302) );
  INVX8 U360 ( .A(n302), .Y(n303) );
  INVX8 U361 ( .A(n302), .Y(n304) );
  INVX1 U362 ( .A(n375), .Y(n305) );
  MUX2X1 U363 ( .B(n617), .A(n613), .S(n428), .Y(n1165) );
  MUX2X1 U364 ( .B(n617), .A(n614), .S(n426), .Y(n1149) );
  MUX2X1 U365 ( .B(n617), .A(n1057), .S(n413), .Y(n1453) );
  MUX2X1 U366 ( .B(n617), .A(n1056), .S(n430), .Y(n1452) );
  INVX8 U367 ( .A(w_data[9]), .Y(n641) );
  MUX2X1 U368 ( .B(n320), .A(n689), .S(n424), .Y(n1200) );
  MUX2X1 U369 ( .B(n320), .A(n690), .S(n431), .Y(n1184) );
  MUX2X1 U370 ( .B(n320), .A(n687), .S(n428), .Y(n1168) );
  AND2X2 U371 ( .A(n434), .B(n435), .Y(n306) );
  AND2X1 U372 ( .A(n434), .B(n435), .Y(n325) );
  INVX2 U373 ( .A(n292), .Y(n345) );
  INVX4 U374 ( .A(n584), .Y(n307) );
  MUX2X1 U375 ( .B(n617), .A(n1055), .S(n423), .Y(n1451) );
  INVX1 U376 ( .A(w_data[8]), .Y(n308) );
  INVX2 U377 ( .A(n462), .Y(n788) );
  BUFX2 U378 ( .A(n833), .Y(n309) );
  MUX2X1 U379 ( .B(n320), .A(n688), .S(n426), .Y(n1152) );
  MUX2X1 U380 ( .B(n320), .A(n1117), .S(n413), .Y(n1445) );
  MUX2X1 U381 ( .B(n320), .A(n1116), .S(n430), .Y(n1444) );
  MUX2X1 U382 ( .B(n320), .A(n1115), .S(n423), .Y(n1443) );
  NAND2X1 U383 ( .A(\regs[7][0] ), .B(n310), .Y(n311) );
  NAND2X1 U384 ( .A(n311), .B(n437), .Y(n447) );
  INVX1 U385 ( .A(n355), .Y(n310) );
  NAND2X1 U386 ( .A(n451), .B(n279), .Y(r2_data[0]) );
  INVX2 U387 ( .A(n312), .Y(n313) );
  INVX8 U388 ( .A(n312), .Y(n314) );
  MUX2X1 U389 ( .B(n785), .A(n1347), .S(n413), .Y(n1477) );
  MUX2X1 U390 ( .B(n785), .A(n1345), .S(n430), .Y(n1476) );
  MUX2X1 U391 ( .B(n785), .A(n1343), .S(n423), .Y(n1475) );
  INVX8 U392 ( .A(w_data[5]), .Y(n554) );
  INVX8 U393 ( .A(n374), .Y(n375) );
  INVX4 U394 ( .A(r2_sel[1]), .Y(n374) );
  OR2X2 U395 ( .A(n706), .B(n705), .Y(r2_data[11]) );
  INVX1 U396 ( .A(n368), .Y(n315) );
  INVX2 U397 ( .A(n309), .Y(n316) );
  INVX2 U398 ( .A(n265), .Y(n322) );
  NOR2X1 U399 ( .A(n565), .B(n277), .Y(n567) );
  MUX2X1 U400 ( .B(n785), .A(n1341), .S(n410), .Y(n1474) );
  INVX1 U401 ( .A(n831), .Y(n318) );
  NAND2X1 U402 ( .A(\regs[7][9] ), .B(n354), .Y(n319) );
  NAND2X1 U403 ( .A(n319), .B(n642), .Y(n655) );
  INVX1 U404 ( .A(n353), .Y(n321) );
  MUX2X1 U405 ( .B(n273), .A(n730), .S(n424), .Y(n1202) );
  MUX2X1 U406 ( .B(n273), .A(n731), .S(n431), .Y(n1186) );
  MUX2X1 U407 ( .B(n273), .A(n728), .S(n428), .Y(n1170) );
  MUX2X1 U408 ( .B(n273), .A(n1291), .S(n410), .Y(n1458) );
  MUX2X1 U409 ( .B(n273), .A(n729), .S(n426), .Y(n1154) );
  MUX2X1 U410 ( .B(n273), .A(n1294), .S(n413), .Y(n1461) );
  MUX2X1 U411 ( .B(n273), .A(n1293), .S(n430), .Y(n1460) );
  MUX2X1 U412 ( .B(n273), .A(n1292), .S(n423), .Y(n1459) );
  INVX1 U413 ( .A(r1_sel[0]), .Y(n353) );
  INVX4 U414 ( .A(r1_sel[0]), .Y(n351) );
  NOR2X1 U415 ( .A(n609), .B(n278), .Y(n611) );
  BUFX4 U416 ( .A(n786), .Y(n323) );
  BUFX4 U417 ( .A(n786), .Y(n324) );
  INVX2 U418 ( .A(n675), .Y(n786) );
  INVX8 U419 ( .A(w_data[12]), .Y(n711) );
  INVX4 U420 ( .A(n1348), .Y(n370) );
  INVX2 U421 ( .A(n369), .Y(n884) );
  INVX2 U422 ( .A(n371), .Y(n881) );
  MUX2X1 U423 ( .B(n320), .A(n1114), .S(n410), .Y(n1442) );
  INVX1 U424 ( .A(n306), .Y(n582) );
  INVX2 U425 ( .A(n355), .Y(n326) );
  INVX2 U426 ( .A(n355), .Y(n327) );
  NAND3X1 U427 ( .A(n374), .B(n584), .C(n449), .Y(n328) );
  AND2X1 U428 ( .A(n375), .B(n769), .Y(n336) );
  AND2X1 U429 ( .A(n318), .B(r1_sel[3]), .Y(n342) );
  AND2X1 U430 ( .A(n295), .B(r2_sel[3]), .Y(n341) );
  INVX2 U431 ( .A(n792), .Y(n678) );
  INVX2 U432 ( .A(n794), .Y(n677) );
  INVX2 U433 ( .A(r1_sel[1]), .Y(n833) );
  INVX2 U434 ( .A(n424), .Y(n777) );
  INVX2 U435 ( .A(n426), .Y(n772) );
  INVX2 U436 ( .A(n428), .Y(n770) );
  INVX2 U437 ( .A(n431), .Y(n779) );
  INVX2 U438 ( .A(n807), .Y(n646) );
  INVX2 U439 ( .A(n809), .Y(n647) );
  AND2X2 U440 ( .A(n335), .B(n352), .Y(n329) );
  AND2X2 U441 ( .A(n335), .B(n321), .Y(n330) );
  INVX2 U442 ( .A(n331), .Y(n376) );
  INVX2 U443 ( .A(n334), .Y(n379) );
  INVX2 U444 ( .A(n332), .Y(n378) );
  INVX2 U445 ( .A(n333), .Y(n377) );
  INVX2 U446 ( .A(n360), .Y(n361) );
  INVX2 U447 ( .A(n364), .Y(n365) );
  INVX2 U448 ( .A(n358), .Y(n359) );
  BUFX2 U449 ( .A(n583), .Y(n346) );
  INVX2 U450 ( .A(n430), .Y(n781) );
  INVX2 U451 ( .A(n413), .Y(n782) );
  INVX2 U452 ( .A(n421), .Y(n776) );
  INVX2 U453 ( .A(n418), .Y(n775) );
  INVX2 U454 ( .A(n416), .Y(n784) );
  INVX2 U455 ( .A(n414), .Y(n783) );
  INVX2 U456 ( .A(n819), .Y(n1322) );
  INVX2 U457 ( .A(n818), .Y(n1323) );
  INVX2 U458 ( .A(n1329), .Y(n364) );
  INVX2 U459 ( .A(n1325), .Y(n360) );
  INVX2 U460 ( .A(n1327), .Y(n358) );
  INVX2 U461 ( .A(n362), .Y(n363) );
  INVX2 U462 ( .A(n1331), .Y(n362) );
  AND2X2 U463 ( .A(n276), .B(n1034), .Y(n331) );
  AND2X2 U464 ( .A(n275), .B(n1034), .Y(n332) );
  AND2X2 U465 ( .A(n275), .B(n1014), .Y(n333) );
  AND2X2 U466 ( .A(n1014), .B(n276), .Y(n334) );
  INVX2 U467 ( .A(n806), .Y(n357) );
  INVX2 U468 ( .A(n791), .Y(n356) );
  AND2X2 U469 ( .A(n985), .B(n316), .Y(n335) );
  AND2X2 U470 ( .A(n832), .B(r1_sel[2]), .Y(n337) );
  AND2X2 U471 ( .A(n1127), .B(n420), .Y(n338) );
  AND2X2 U472 ( .A(n1127), .B(w_sel[0]), .Y(n339) );
  AND2X2 U473 ( .A(n1127), .B(n1357), .Y(n340) );
  BUFX2 U474 ( .A(n380), .Y(n388) );
  BUFX2 U475 ( .A(n380), .Y(n389) );
  BUFX2 U476 ( .A(n380), .Y(n390) );
  BUFX2 U477 ( .A(n381), .Y(n391) );
  BUFX2 U478 ( .A(n381), .Y(n392) );
  BUFX2 U479 ( .A(n381), .Y(n393) );
  BUFX2 U480 ( .A(n382), .Y(n394) );
  BUFX2 U481 ( .A(n382), .Y(n395) );
  BUFX2 U482 ( .A(n382), .Y(n396) );
  BUFX2 U483 ( .A(n383), .Y(n397) );
  BUFX2 U484 ( .A(n383), .Y(n398) );
  BUFX2 U485 ( .A(n383), .Y(n399) );
  BUFX2 U486 ( .A(n384), .Y(n400) );
  BUFX2 U487 ( .A(n384), .Y(n401) );
  BUFX2 U488 ( .A(n384), .Y(n402) );
  BUFX2 U489 ( .A(n385), .Y(n403) );
  BUFX2 U490 ( .A(n385), .Y(n404) );
  BUFX2 U491 ( .A(n385), .Y(n405) );
  BUFX2 U492 ( .A(n386), .Y(n406) );
  BUFX2 U493 ( .A(n386), .Y(n407) );
  BUFX2 U494 ( .A(n386), .Y(n408) );
  BUFX2 U495 ( .A(n387), .Y(n409) );
  BUFX2 U496 ( .A(n_reset), .Y(n387) );
  BUFX2 U497 ( .A(n_reset), .Y(n380) );
  BUFX2 U498 ( .A(n_reset), .Y(n381) );
  BUFX2 U499 ( .A(n_reset), .Y(n382) );
  BUFX2 U500 ( .A(n_reset), .Y(n383) );
  BUFX2 U501 ( .A(n_reset), .Y(n384) );
  BUFX2 U502 ( .A(n_reset), .Y(n385) );
  BUFX2 U503 ( .A(n_reset), .Y(n386) );
  INVX4 U504 ( .A(n670), .Y(n343) );
  INVX8 U505 ( .A(n343), .Y(n344) );
  INVX8 U506 ( .A(w_data[8]), .Y(n617) );
  MUX2X1 U507 ( .B(n785), .A(n778), .S(n424), .Y(n1204) );
  MUX2X1 U508 ( .B(n785), .A(n780), .S(n431), .Y(n1188) );
  MUX2X1 U509 ( .B(n785), .A(n771), .S(n428), .Y(n1172) );
  MUX2X1 U510 ( .B(n785), .A(n773), .S(n426), .Y(n1156) );
  INVX4 U511 ( .A(n673), .Y(n354) );
  AND2X2 U512 ( .A(n831), .B(n832), .Y(n348) );
  AND2X2 U513 ( .A(n832), .B(n831), .Y(n349) );
  BUFX4 U514 ( .A(r1_sel[1]), .Y(n350) );
  INVX4 U515 ( .A(n1344), .Y(n366) );
  INVX1 U516 ( .A(n321), .Y(n352) );
  INVX8 U517 ( .A(w_data[15]), .Y(n785) );
  INVX4 U518 ( .A(w_data[0]), .Y(n432) );
  INVX4 U519 ( .A(w_data[1]), .Y(n460) );
  INVX4 U520 ( .A(w_data[2]), .Y(n483) );
  INVX4 U521 ( .A(w_data[3]), .Y(n507) );
  INVX8 U522 ( .A(n354), .Y(n355) );
  INVX4 U523 ( .A(n344), .Y(n803) );
  INVX4 U524 ( .A(n668), .Y(n804) );
  INVX4 U525 ( .A(n448), .Y(n802) );
  INVX4 U526 ( .A(n493), .Y(n801) );
  INVX4 U527 ( .A(n829), .Y(n1340) );
  INVX4 U528 ( .A(n830), .Y(n1339) );
  INVX8 U529 ( .A(n370), .Y(n371) );
  INVX2 U530 ( .A(outreg_data[0]), .Y(n834) );
  INVX2 U531 ( .A(w_sel[2]), .Y(n420) );
  INVX2 U532 ( .A(w_sel[0]), .Y(n1357) );
  INVX2 U533 ( .A(w_sel[1]), .Y(n425) );
  NAND3X1 U534 ( .A(n338), .B(n1357), .C(n425), .Y(n410) );
  MUX2X1 U535 ( .B(n834), .A(n432), .S(n412), .Y(n1385) );
  INVX2 U536 ( .A(outreg_data[1]), .Y(n411) );
  MUX2X1 U537 ( .B(n411), .A(n460), .S(n412), .Y(n1361) );
  INVX2 U538 ( .A(outreg_data[2]), .Y(n870) );
  MUX2X1 U539 ( .B(n870), .A(n483), .S(n412), .Y(n1369) );
  INVX2 U540 ( .A(outreg_data[3]), .Y(n516) );
  MUX2X1 U541 ( .B(n516), .A(n507), .S(n412), .Y(n1377) );
  INVX2 U542 ( .A(outreg_data[4]), .Y(n910) );
  MUX2X1 U543 ( .B(n910), .A(n281), .S(n412), .Y(n1417) );
  INVX2 U544 ( .A(outreg_data[5]), .Y(n930) );
  MUX2X1 U545 ( .B(n930), .A(n554), .S(n412), .Y(n1393) );
  INVX2 U546 ( .A(outreg_data[6]), .Y(n941) );
  INVX2 U547 ( .A(outreg_data[7]), .Y(n974) );
  MUX2X1 U548 ( .B(n974), .A(n282), .S(n412), .Y(n1410) );
  INVX2 U549 ( .A(outreg_data[8]), .Y(n1054) );
  MUX2X1 U550 ( .B(n1054), .A(n308), .S(n412), .Y(n1450) );
  INVX2 U551 ( .A(outreg_data[9]), .Y(n1074) );
  INVX2 U552 ( .A(outreg_data[10]), .Y(n1094) );
  INVX2 U553 ( .A(outreg_data[11]), .Y(n1114) );
  INVX2 U554 ( .A(outreg_data[12]), .Y(n1271) );
  MUX2X1 U555 ( .B(n1271), .A(n711), .S(n412), .Y(n1482) );
  INVX2 U556 ( .A(outreg_data[13]), .Y(n1291) );
  INVX2 U557 ( .A(outreg_data[14]), .Y(n1311) );
  MUX2X1 U558 ( .B(n1311), .A(n264), .S(n412), .Y(n1466) );
  INVX2 U559 ( .A(outreg_data[15]), .Y(n1341) );
  INVX2 U560 ( .A(\regs[3][0] ), .Y(n837) );
  NAND3X1 U561 ( .A(w_sel[1]), .B(w_sel[0]), .C(n338), .Y(n413) );
  MUX2X1 U562 ( .B(n837), .A(n432), .S(n782), .Y(n1388) );
  INVX2 U563 ( .A(\regs[11][0] ), .Y(n415) );
  NAND3X1 U564 ( .A(n1014), .B(w_sel[1]), .C(n420), .Y(n414) );
  MUX2X1 U565 ( .B(n415), .A(n432), .S(n783), .Y(n1253) );
  INVX2 U566 ( .A(\regs[10][0] ), .Y(n417) );
  NAND3X1 U567 ( .A(n1034), .B(w_sel[1]), .C(n420), .Y(n416) );
  MUX2X1 U568 ( .B(n417), .A(n432), .S(n784), .Y(n1237) );
  INVX2 U569 ( .A(\regs[9][0] ), .Y(n419) );
  NAND3X1 U570 ( .A(n1014), .B(n420), .C(n425), .Y(n418) );
  MUX2X1 U571 ( .B(n419), .A(n432), .S(n775), .Y(n1221) );
  INVX2 U572 ( .A(\regs[8][0] ), .Y(n422) );
  NAND3X1 U573 ( .A(n1034), .B(n420), .C(n425), .Y(n421) );
  MUX2X1 U574 ( .B(n422), .A(n432), .S(n776), .Y(n1205) );
  INVX2 U575 ( .A(\regs[1][0] ), .Y(n835) );
  NAND3X1 U576 ( .A(n338), .B(w_sel[0]), .C(n425), .Y(n423) );
  MUX2X1 U577 ( .B(n835), .A(n432), .S(n774), .Y(n1386) );
  INVX2 U578 ( .A(\regs[7][0] ), .Y(n438) );
  NAND2X1 U579 ( .A(n339), .B(n275), .Y(n424) );
  MUX2X1 U580 ( .B(n438), .A(n432), .S(n777), .Y(n1189) );
  INVX2 U581 ( .A(\regs[4][0] ), .Y(n427) );
  NAND2X1 U582 ( .A(n276), .B(n340), .Y(n426) );
  MUX2X1 U583 ( .B(n427), .A(n432), .S(n772), .Y(n1141) );
  INVX2 U584 ( .A(\regs[5][0] ), .Y(n429) );
  NAND2X1 U585 ( .A(n276), .B(n339), .Y(n428) );
  MUX2X1 U586 ( .B(n429), .A(n432), .S(n770), .Y(n1157) );
  INVX2 U587 ( .A(\regs[2][0] ), .Y(n836) );
  NAND3X1 U588 ( .A(w_sel[1]), .B(n1357), .C(n338), .Y(n430) );
  MUX2X1 U589 ( .B(n836), .A(n432), .S(n781), .Y(n1387) );
  INVX2 U590 ( .A(\regs[6][0] ), .Y(n433) );
  NAND2X1 U591 ( .A(n275), .B(n340), .Y(n431) );
  MUX2X1 U592 ( .B(n433), .A(n432), .S(n779), .Y(n1173) );
  INVX2 U593 ( .A(r2_sel[3]), .Y(n435) );
  NAND2X1 U594 ( .A(r2_sel[2]), .B(n435), .Y(n583) );
  NAND3X1 U595 ( .A(n375), .B(n584), .C(n449), .Y(n675) );
  NAND3X1 U596 ( .A(n306), .B(n584), .C(n375), .Y(n436) );
  AOI22X1 U597 ( .A(n323), .B(\regs[6][0] ), .C(n789), .D(\regs[2][0] ), .Y(
        n452) );
  NAND3X1 U598 ( .A(r2_sel[0]), .B(n375), .C(n449), .Y(n673) );
  NAND3X1 U599 ( .A(n306), .B(r2_sel[0]), .C(n374), .Y(n670) );
  NAND3X1 U600 ( .A(n325), .B(n584), .C(n374), .Y(n668) );
  AOI22X1 U601 ( .A(n803), .B(\regs[1][0] ), .C(n804), .D(outreg_data[0]), .Y(
        n437) );
  NAND3X1 U602 ( .A(n306), .B(r2_sel[0]), .C(n375), .Y(n462) );
  NOR2X1 U603 ( .A(n837), .B(n312), .Y(n446) );
  NAND2X1 U604 ( .A(n336), .B(n584), .Y(n794) );
  NAND2X1 U605 ( .A(n336), .B(n307), .Y(n792) );
  AOI22X1 U606 ( .A(n677), .B(\regs[10][0] ), .C(n678), .D(\regs[11][0] ), .Y(
        n440) );
  NAND3X1 U607 ( .A(n375), .B(n307), .C(n341), .Y(n791) );
  NAND3X1 U608 ( .A(n375), .B(n341), .C(n584), .Y(n790) );
  INVX2 U609 ( .A(n790), .Y(n679) );
  AOI22X1 U610 ( .A(n356), .B(\regs[15][0] ), .C(n679), .D(\regs[14][0] ), .Y(
        n439) );
  AND2X2 U611 ( .A(n440), .B(n439), .Y(n444) );
  NAND3X1 U612 ( .A(n769), .B(n305), .C(n584), .Y(n809) );
  NAND3X1 U613 ( .A(n769), .B(n307), .C(n305), .Y(n807) );
  AOI22X1 U614 ( .A(n647), .B(\regs[8][0] ), .C(n646), .D(\regs[9][0] ), .Y(
        n442) );
  NAND3X1 U615 ( .A(n341), .B(n307), .C(n305), .Y(n806) );
  NAND3X1 U616 ( .A(n341), .B(n305), .C(n584), .Y(n805) );
  INVX2 U617 ( .A(n805), .Y(n648) );
  AOI22X1 U618 ( .A(n357), .B(\regs[13][0] ), .C(n648), .D(\regs[12][0] ), .Y(
        n441) );
  AND2X2 U619 ( .A(n442), .B(n441), .Y(n443) );
  NAND2X1 U620 ( .A(n444), .B(n443), .Y(n445) );
  NOR3X1 U621 ( .A(n445), .B(n446), .C(n447), .Y(n451) );
  NAND3X1 U622 ( .A(r2_sel[0]), .B(n374), .C(n449), .Y(n448) );
  NAND3X1 U623 ( .A(n374), .B(n584), .C(n449), .Y(n493) );
  AOI22X1 U624 ( .A(n304), .B(\regs[5][0] ), .C(n801), .D(\regs[4][0] ), .Y(
        n450) );
  INVX2 U625 ( .A(\regs[5][1] ), .Y(n453) );
  MUX2X1 U626 ( .B(n453), .A(n460), .S(n770), .Y(n1158) );
  INVX2 U627 ( .A(\regs[4][1] ), .Y(n472) );
  MUX2X1 U628 ( .B(n472), .A(n460), .S(n772), .Y(n1142) );
  INVX2 U629 ( .A(\regs[1][1] ), .Y(n469) );
  MUX2X1 U630 ( .B(n469), .A(n460), .S(n774), .Y(n1362) );
  INVX2 U631 ( .A(\regs[7][1] ), .Y(n470) );
  MUX2X1 U632 ( .B(n470), .A(n460), .S(n777), .Y(n1190) );
  INVX2 U633 ( .A(\regs[6][1] ), .Y(n454) );
  MUX2X1 U634 ( .B(n454), .A(n460), .S(n779), .Y(n1174) );
  INVX2 U635 ( .A(\regs[2][1] ), .Y(n455) );
  MUX2X1 U636 ( .B(n455), .A(n460), .S(n781), .Y(n1363) );
  INVX2 U637 ( .A(\regs[3][1] ), .Y(n456) );
  MUX2X1 U638 ( .B(n456), .A(n460), .S(n782), .Y(n1364) );
  INVX2 U639 ( .A(\regs[9][1] ), .Y(n457) );
  MUX2X1 U640 ( .B(n457), .A(n460), .S(n775), .Y(n1222) );
  INVX2 U641 ( .A(\regs[8][1] ), .Y(n458) );
  MUX2X1 U642 ( .B(n458), .A(n460), .S(n776), .Y(n1206) );
  INVX2 U643 ( .A(\regs[11][1] ), .Y(n459) );
  MUX2X1 U644 ( .B(n459), .A(n460), .S(n783), .Y(n1254) );
  INVX2 U645 ( .A(\regs[10][1] ), .Y(n461) );
  MUX2X1 U646 ( .B(n461), .A(n460), .S(n784), .Y(n1238) );
  AOI22X1 U647 ( .A(n323), .B(\regs[6][1] ), .C(n789), .D(\regs[2][1] ), .Y(
        n477) );
  AOI22X1 U648 ( .A(n646), .B(\regs[9][1] ), .C(n647), .D(\regs[8][1] ), .Y(
        n467) );
  AOI22X1 U649 ( .A(n678), .B(\regs[11][1] ), .C(n677), .D(\regs[10][1] ), .Y(
        n466) );
  INVX2 U650 ( .A(\regs[13][1] ), .Y(n848) );
  INVX2 U651 ( .A(\regs[12][1] ), .Y(n847) );
  OAI22X1 U652 ( .A(n848), .B(n806), .C(n847), .D(n805), .Y(n464) );
  INVX2 U653 ( .A(\regs[15][1] ), .Y(n850) );
  INVX2 U654 ( .A(\regs[14][1] ), .Y(n849) );
  OAI22X1 U655 ( .A(n850), .B(n791), .C(n849), .D(n790), .Y(n463) );
  NOR2X1 U656 ( .A(n464), .B(n463), .Y(n465) );
  NAND3X1 U657 ( .A(n467), .B(n466), .C(n465), .Y(n468) );
  AOI21X1 U658 ( .A(n314), .B(\regs[3][1] ), .C(n468), .Y(n476) );
  OAI22X1 U659 ( .A(n470), .B(n355), .C(n469), .D(n344), .Y(n474) );
  AOI22X1 U660 ( .A(n304), .B(\regs[5][1] ), .C(n804), .D(outreg_data[1]), .Y(
        n471) );
  OAI21X1 U661 ( .A(n472), .B(n328), .C(n471), .Y(n473) );
  NOR2X1 U662 ( .A(n474), .B(n473), .Y(n475) );
  NAND3X1 U663 ( .A(n477), .B(n476), .C(n475), .Y(r2_data[1]) );
  INVX2 U664 ( .A(\regs[5][2] ), .Y(n478) );
  MUX2X1 U665 ( .B(n478), .A(n483), .S(n770), .Y(n1159) );
  INVX2 U666 ( .A(\regs[4][2] ), .Y(n494) );
  MUX2X1 U667 ( .B(n494), .A(n483), .S(n772), .Y(n1143) );
  INVX2 U668 ( .A(\regs[1][2] ), .Y(n871) );
  MUX2X1 U669 ( .B(n871), .A(n483), .S(n774), .Y(n1370) );
  INVX2 U670 ( .A(\regs[7][2] ), .Y(n491) );
  MUX2X1 U671 ( .B(n491), .A(n483), .S(n777), .Y(n1191) );
  INVX2 U672 ( .A(\regs[6][2] ), .Y(n479) );
  MUX2X1 U673 ( .B(n479), .A(n483), .S(n779), .Y(n1175) );
  INVX2 U674 ( .A(\regs[2][2] ), .Y(n872) );
  MUX2X1 U675 ( .B(n872), .A(n483), .S(n781), .Y(n1371) );
  INVX2 U676 ( .A(\regs[3][2] ), .Y(n873) );
  MUX2X1 U677 ( .B(n873), .A(n483), .S(n782), .Y(n1372) );
  INVX2 U678 ( .A(\regs[9][2] ), .Y(n480) );
  MUX2X1 U679 ( .B(n480), .A(n483), .S(n775), .Y(n1223) );
  INVX2 U680 ( .A(\regs[8][2] ), .Y(n481) );
  MUX2X1 U681 ( .B(n481), .A(n483), .S(n776), .Y(n1207) );
  INVX2 U682 ( .A(\regs[11][2] ), .Y(n482) );
  MUX2X1 U683 ( .B(n482), .A(n483), .S(n783), .Y(n1255) );
  INVX2 U684 ( .A(\regs[10][2] ), .Y(n484) );
  MUX2X1 U685 ( .B(n484), .A(n483), .S(n784), .Y(n1239) );
  AOI22X1 U686 ( .A(n324), .B(\regs[6][2] ), .C(n789), .D(\regs[2][2] ), .Y(
        n499) );
  AOI22X1 U687 ( .A(n646), .B(\regs[9][2] ), .C(n647), .D(\regs[8][2] ), .Y(
        n489) );
  AOI22X1 U688 ( .A(n678), .B(\regs[11][2] ), .C(n677), .D(\regs[10][2] ), .Y(
        n488) );
  INVX2 U689 ( .A(\regs[13][2] ), .Y(n862) );
  INVX2 U690 ( .A(\regs[12][2] ), .Y(n861) );
  OAI22X1 U691 ( .A(n862), .B(n806), .C(n861), .D(n805), .Y(n486) );
  INVX2 U692 ( .A(\regs[15][2] ), .Y(n864) );
  INVX2 U693 ( .A(\regs[14][2] ), .Y(n863) );
  OAI22X1 U694 ( .A(n864), .B(n791), .C(n863), .D(n790), .Y(n485) );
  NOR2X1 U695 ( .A(n486), .B(n485), .Y(n487) );
  NAND3X1 U696 ( .A(n489), .B(n488), .C(n487), .Y(n490) );
  AOI21X1 U697 ( .A(n314), .B(\regs[3][2] ), .C(n490), .Y(n498) );
  OAI22X1 U698 ( .A(n491), .B(n355), .C(n871), .D(n344), .Y(n496) );
  AOI22X1 U699 ( .A(n304), .B(\regs[5][2] ), .C(n804), .D(outreg_data[2]), .Y(
        n492) );
  OAI21X1 U700 ( .A(n494), .B(n328), .C(n492), .Y(n495) );
  NOR2X1 U701 ( .A(n496), .B(n495), .Y(n497) );
  NAND3X1 U702 ( .A(n499), .B(n498), .C(n497), .Y(r2_data[2]) );
  INVX2 U703 ( .A(\regs[5][3] ), .Y(n515) );
  MUX2X1 U704 ( .B(n515), .A(n507), .S(n770), .Y(n1160) );
  INVX2 U705 ( .A(\regs[4][3] ), .Y(n517) );
  MUX2X1 U706 ( .B(n517), .A(n507), .S(n772), .Y(n1144) );
  INVX2 U707 ( .A(\regs[1][3] ), .Y(n521) );
  MUX2X1 U708 ( .B(n521), .A(n507), .S(n774), .Y(n1378) );
  INVX2 U709 ( .A(\regs[7][3] ), .Y(n500) );
  MUX2X1 U710 ( .B(n500), .A(n507), .S(n777), .Y(n1192) );
  INVX2 U711 ( .A(\regs[6][3] ), .Y(n501) );
  MUX2X1 U712 ( .B(n501), .A(n507), .S(n779), .Y(n1176) );
  INVX2 U713 ( .A(\regs[2][3] ), .Y(n502) );
  MUX2X1 U714 ( .B(n502), .A(n507), .S(n781), .Y(n1379) );
  INVX2 U715 ( .A(\regs[3][3] ), .Y(n503) );
  MUX2X1 U716 ( .B(n503), .A(n507), .S(n782), .Y(n1380) );
  INVX2 U717 ( .A(\regs[9][3] ), .Y(n504) );
  MUX2X1 U718 ( .B(n504), .A(n507), .S(n775), .Y(n1224) );
  INVX2 U719 ( .A(\regs[8][3] ), .Y(n505) );
  MUX2X1 U720 ( .B(n505), .A(n507), .S(n776), .Y(n1208) );
  INVX2 U721 ( .A(\regs[11][3] ), .Y(n506) );
  MUX2X1 U722 ( .B(n506), .A(n507), .S(n783), .Y(n1256) );
  INVX2 U723 ( .A(\regs[10][3] ), .Y(n508) );
  MUX2X1 U724 ( .B(n508), .A(n507), .S(n784), .Y(n1240) );
  AOI22X1 U725 ( .A(n324), .B(\regs[6][3] ), .C(n789), .D(\regs[2][3] ), .Y(
        n525) );
  AOI22X1 U726 ( .A(n646), .B(\regs[9][3] ), .C(n647), .D(\regs[8][3] ), .Y(
        n513) );
  AOI22X1 U727 ( .A(n678), .B(\regs[11][3] ), .C(n677), .D(\regs[10][3] ), .Y(
        n512) );
  INVX2 U728 ( .A(\regs[13][3] ), .Y(n888) );
  INVX2 U729 ( .A(\regs[12][3] ), .Y(n887) );
  OAI22X1 U730 ( .A(n888), .B(n806), .C(n887), .D(n805), .Y(n510) );
  INVX2 U731 ( .A(\regs[15][3] ), .Y(n890) );
  INVX2 U732 ( .A(\regs[14][3] ), .Y(n889) );
  OAI22X1 U733 ( .A(n890), .B(n791), .C(n889), .D(n790), .Y(n509) );
  NOR2X1 U734 ( .A(n510), .B(n509), .Y(n511) );
  NAND3X1 U735 ( .A(n513), .B(n512), .C(n511), .Y(n514) );
  AOI21X1 U736 ( .A(n314), .B(\regs[3][3] ), .C(n514), .Y(n524) );
  INVX2 U737 ( .A(n355), .Y(n787) );
  NOR2X1 U738 ( .A(n515), .B(n346), .Y(n519) );
  OAI22X1 U739 ( .A(n517), .B(n346), .C(n516), .D(n582), .Y(n518) );
  AOI22X1 U740 ( .A(n519), .B(n307), .C(n518), .D(n584), .Y(n520) );
  OAI22X1 U741 ( .A(n521), .B(n344), .C(n375), .D(n520), .Y(n522) );
  AOI21X1 U742 ( .A(n787), .B(\regs[7][3] ), .C(n522), .Y(n523) );
  NAND3X1 U743 ( .A(n525), .B(n524), .C(n523), .Y(r2_data[3]) );
  INVX2 U744 ( .A(\regs[7][4] ), .Y(n534) );
  MUX2X1 U745 ( .B(n534), .A(n281), .S(n777), .Y(n1193) );
  INVX2 U746 ( .A(\regs[11][4] ), .Y(n526) );
  MUX2X1 U747 ( .B(n526), .A(n266), .S(n783), .Y(n1257) );
  INVX2 U748 ( .A(\regs[10][4] ), .Y(n527) );
  MUX2X1 U749 ( .B(n527), .A(n266), .S(n784), .Y(n1241) );
  INVX2 U750 ( .A(\regs[9][4] ), .Y(n528) );
  MUX2X1 U751 ( .B(n528), .A(n266), .S(n775), .Y(n1225) );
  INVX2 U752 ( .A(\regs[8][4] ), .Y(n529) );
  MUX2X1 U753 ( .B(n529), .A(n266), .S(n776), .Y(n1209) );
  INVX2 U754 ( .A(\regs[4][4] ), .Y(n530) );
  INVX2 U755 ( .A(\regs[5][4] ), .Y(n531) );
  INVX2 U756 ( .A(\regs[6][4] ), .Y(n532) );
  INVX2 U757 ( .A(\regs[1][4] ), .Y(n911) );
  MUX2X1 U758 ( .B(n911), .A(n281), .S(n774), .Y(n1418) );
  INVX2 U759 ( .A(\regs[3][4] ), .Y(n913) );
  MUX2X1 U760 ( .B(n913), .A(n281), .S(n782), .Y(n1420) );
  INVX2 U761 ( .A(\regs[2][4] ), .Y(n912) );
  MUX2X1 U762 ( .B(n912), .A(n281), .S(n781), .Y(n1419) );
  AOI22X1 U763 ( .A(n789), .B(\regs[2][4] ), .C(n314), .D(\regs[3][4] ), .Y(
        n546) );
  AOI22X1 U764 ( .A(n304), .B(\regs[5][4] ), .C(n801), .D(\regs[4][4] ), .Y(
        n533) );
  OAI21X1 U765 ( .A(n534), .B(n355), .C(n533), .Y(n543) );
  NOR2X1 U766 ( .A(n910), .B(n291), .Y(n542) );
  AOI22X1 U767 ( .A(n677), .B(\regs[10][4] ), .C(n678), .D(\regs[11][4] ), .Y(
        n536) );
  AOI22X1 U768 ( .A(n356), .B(\regs[15][4] ), .C(n679), .D(\regs[14][4] ), .Y(
        n535) );
  AND2X2 U769 ( .A(n536), .B(n535), .Y(n540) );
  AOI22X1 U770 ( .A(n647), .B(\regs[8][4] ), .C(n646), .D(\regs[9][4] ), .Y(
        n538) );
  AOI22X1 U771 ( .A(n357), .B(\regs[13][4] ), .C(n648), .D(\regs[12][4] ), .Y(
        n537) );
  AND2X2 U772 ( .A(n538), .B(n537), .Y(n539) );
  NAND2X1 U773 ( .A(n540), .B(n539), .Y(n541) );
  NOR3X1 U774 ( .A(n543), .B(n542), .C(n541), .Y(n545) );
  AOI22X1 U775 ( .A(n803), .B(\regs[1][4] ), .C(n324), .D(\regs[6][4] ), .Y(
        n544) );
  NAND3X1 U776 ( .A(n546), .B(n545), .C(n544), .Y(r2_data[4]) );
  INVX2 U777 ( .A(\regs[7][5] ), .Y(n556) );
  MUX2X1 U778 ( .B(n556), .A(n554), .S(n777), .Y(n1194) );
  INVX2 U779 ( .A(\regs[11][5] ), .Y(n547) );
  MUX2X1 U780 ( .B(n547), .A(n554), .S(n783), .Y(n1258) );
  INVX2 U781 ( .A(\regs[10][5] ), .Y(n548) );
  MUX2X1 U782 ( .B(n548), .A(n554), .S(n784), .Y(n1242) );
  INVX2 U783 ( .A(\regs[9][5] ), .Y(n549) );
  MUX2X1 U784 ( .B(n549), .A(n554), .S(n775), .Y(n1226) );
  INVX2 U785 ( .A(\regs[8][5] ), .Y(n550) );
  MUX2X1 U786 ( .B(n550), .A(n554), .S(n776), .Y(n1210) );
  INVX2 U787 ( .A(\regs[4][5] ), .Y(n551) );
  MUX2X1 U788 ( .B(n551), .A(n554), .S(n772), .Y(n1146) );
  INVX2 U789 ( .A(\regs[5][5] ), .Y(n552) );
  MUX2X1 U790 ( .B(n552), .A(n554), .S(n770), .Y(n1162) );
  INVX2 U791 ( .A(\regs[6][5] ), .Y(n553) );
  MUX2X1 U792 ( .B(n553), .A(n554), .S(n779), .Y(n1178) );
  INVX2 U793 ( .A(\regs[1][5] ), .Y(n931) );
  MUX2X1 U794 ( .B(n931), .A(n554), .S(n774), .Y(n1394) );
  INVX2 U795 ( .A(\regs[3][5] ), .Y(n933) );
  MUX2X1 U796 ( .B(n933), .A(n554), .S(n782), .Y(n1396) );
  INVX2 U797 ( .A(\regs[2][5] ), .Y(n932) );
  MUX2X1 U798 ( .B(n932), .A(n554), .S(n781), .Y(n1395) );
  AOI22X1 U799 ( .A(n789), .B(\regs[2][5] ), .C(n314), .D(\regs[3][5] ), .Y(
        n568) );
  AOI22X1 U800 ( .A(n303), .B(\regs[5][5] ), .C(n801), .D(\regs[4][5] ), .Y(
        n555) );
  OAI21X1 U801 ( .A(n556), .B(n355), .C(n555), .Y(n565) );
  NOR2X1 U802 ( .A(n930), .B(n668), .Y(n564) );
  AOI22X1 U803 ( .A(n677), .B(\regs[10][5] ), .C(n678), .D(\regs[11][5] ), .Y(
        n558) );
  AOI22X1 U804 ( .A(n356), .B(\regs[15][5] ), .C(n679), .D(\regs[14][5] ), .Y(
        n557) );
  AND2X2 U805 ( .A(n558), .B(n557), .Y(n562) );
  AOI22X1 U806 ( .A(n647), .B(\regs[8][5] ), .C(n646), .D(\regs[9][5] ), .Y(
        n560) );
  AOI22X1 U807 ( .A(n357), .B(\regs[13][5] ), .C(n648), .D(\regs[12][5] ), .Y(
        n559) );
  AND2X2 U808 ( .A(n560), .B(n559), .Y(n561) );
  NAND2X1 U809 ( .A(n562), .B(n561), .Y(n563) );
  AOI22X1 U810 ( .A(n803), .B(\regs[1][5] ), .C(n324), .D(\regs[6][5] ), .Y(
        n566) );
  NAND3X1 U811 ( .A(n568), .B(n567), .C(n566), .Y(r2_data[5]) );
  INVX2 U812 ( .A(\regs[5][6] ), .Y(n947) );
  INVX2 U814 ( .A(\regs[4][6] ), .Y(n949) );
  INVX2 U815 ( .A(\regs[1][6] ), .Y(n942) );
  INVX2 U816 ( .A(\regs[7][6] ), .Y(n569) );
  INVX2 U817 ( .A(\regs[6][6] ), .Y(n570) );
  INVX2 U818 ( .A(\regs[2][6] ), .Y(n943) );
  INVX2 U819 ( .A(\regs[3][6] ), .Y(n944) );
  INVX2 U820 ( .A(\regs[9][6] ), .Y(n571) );
  MUX2X1 U821 ( .B(n571), .A(n269), .S(n775), .Y(n1227) );
  INVX2 U822 ( .A(\regs[8][6] ), .Y(n572) );
  MUX2X1 U823 ( .B(n572), .A(n269), .S(n776), .Y(n1211) );
  INVX2 U824 ( .A(\regs[11][6] ), .Y(n573) );
  MUX2X1 U825 ( .B(n573), .A(n269), .S(n783), .Y(n1259) );
  INVX2 U826 ( .A(\regs[10][6] ), .Y(n575) );
  MUX2X1 U827 ( .B(n575), .A(n269), .S(n784), .Y(n1243) );
  AOI22X1 U828 ( .A(n323), .B(\regs[6][6] ), .C(n789), .D(\regs[2][6] ), .Y(
        n591) );
  AOI22X1 U829 ( .A(n646), .B(\regs[9][6] ), .C(n647), .D(\regs[8][6] ), .Y(
        n580) );
  AOI22X1 U830 ( .A(n678), .B(\regs[11][6] ), .C(n677), .D(\regs[10][6] ), .Y(
        n579) );
  INVX2 U831 ( .A(\regs[13][6] ), .Y(n952) );
  INVX2 U832 ( .A(\regs[12][6] ), .Y(n951) );
  OAI22X1 U833 ( .A(n952), .B(n806), .C(n951), .D(n805), .Y(n577) );
  INVX2 U834 ( .A(\regs[15][6] ), .Y(n954) );
  INVX2 U835 ( .A(\regs[14][6] ), .Y(n953) );
  OAI22X1 U836 ( .A(n954), .B(n791), .C(n953), .D(n790), .Y(n576) );
  NOR2X1 U837 ( .A(n577), .B(n576), .Y(n578) );
  NAND3X1 U838 ( .A(n580), .B(n579), .C(n578), .Y(n581) );
  AOI21X1 U839 ( .A(n314), .B(\regs[3][6] ), .C(n581), .Y(n590) );
  NOR2X1 U840 ( .A(n947), .B(n346), .Y(n586) );
  OAI22X1 U841 ( .A(n949), .B(n346), .C(n941), .D(n582), .Y(n585) );
  AOI22X1 U842 ( .A(n586), .B(n307), .C(n585), .D(n584), .Y(n587) );
  OAI22X1 U843 ( .A(n942), .B(n344), .C(n375), .D(n587), .Y(n588) );
  AOI21X1 U844 ( .A(n327), .B(\regs[7][6] ), .C(n588), .Y(n589) );
  NAND3X1 U845 ( .A(n591), .B(n590), .C(n589), .Y(r2_data[6]) );
  INVX2 U846 ( .A(\regs[7][7] ), .Y(n600) );
  MUX2X1 U847 ( .B(n600), .A(n282), .S(n777), .Y(n1196) );
  INVX2 U848 ( .A(\regs[11][7] ), .Y(n592) );
  MUX2X1 U849 ( .B(n592), .A(n282), .S(n783), .Y(n1260) );
  INVX2 U850 ( .A(\regs[10][7] ), .Y(n593) );
  MUX2X1 U851 ( .B(n593), .A(n282), .S(n784), .Y(n1244) );
  INVX2 U852 ( .A(\regs[9][7] ), .Y(n594) );
  MUX2X1 U853 ( .B(n594), .A(n282), .S(n775), .Y(n1228) );
  INVX2 U854 ( .A(\regs[8][7] ), .Y(n595) );
  MUX2X1 U855 ( .B(n595), .A(n282), .S(n776), .Y(n1212) );
  INVX2 U856 ( .A(\regs[4][7] ), .Y(n596) );
  MUX2X1 U857 ( .B(n596), .A(n282), .S(n772), .Y(n1148) );
  INVX2 U858 ( .A(\regs[5][7] ), .Y(n597) );
  MUX2X1 U859 ( .B(n597), .A(n282), .S(n770), .Y(n1164) );
  INVX2 U860 ( .A(\regs[6][7] ), .Y(n598) );
  MUX2X1 U861 ( .B(n598), .A(n282), .S(n779), .Y(n1180) );
  INVX2 U862 ( .A(\regs[1][7] ), .Y(n975) );
  MUX2X1 U863 ( .B(n975), .A(n282), .S(n774), .Y(n1411) );
  INVX2 U864 ( .A(\regs[3][7] ), .Y(n977) );
  MUX2X1 U865 ( .B(n977), .A(n282), .S(n782), .Y(n1413) );
  INVX2 U866 ( .A(\regs[2][7] ), .Y(n976) );
  MUX2X1 U867 ( .B(n976), .A(n282), .S(n781), .Y(n1412) );
  AOI22X1 U868 ( .A(n789), .B(\regs[2][7] ), .C(n314), .D(\regs[3][7] ), .Y(
        n612) );
  AOI22X1 U869 ( .A(n303), .B(\regs[5][7] ), .C(n801), .D(\regs[4][7] ), .Y(
        n599) );
  OAI21X1 U870 ( .A(n600), .B(n355), .C(n599), .Y(n609) );
  NOR2X1 U871 ( .A(n974), .B(n668), .Y(n608) );
  AOI22X1 U872 ( .A(n677), .B(\regs[10][7] ), .C(n678), .D(\regs[11][7] ), .Y(
        n602) );
  AOI22X1 U873 ( .A(n356), .B(\regs[15][7] ), .C(n679), .D(\regs[14][7] ), .Y(
        n601) );
  AND2X2 U874 ( .A(n602), .B(n601), .Y(n606) );
  AOI22X1 U875 ( .A(n647), .B(\regs[8][7] ), .C(n646), .D(\regs[9][7] ), .Y(
        n604) );
  AOI22X1 U876 ( .A(n357), .B(\regs[13][7] ), .C(n648), .D(\regs[12][7] ), .Y(
        n603) );
  AND2X2 U877 ( .A(n604), .B(n603), .Y(n605) );
  NAND2X1 U878 ( .A(n606), .B(n605), .Y(n607) );
  AOI22X1 U879 ( .A(n803), .B(\regs[1][7] ), .C(n323), .D(\regs[6][7] ), .Y(
        n610) );
  NAND3X1 U880 ( .A(n612), .B(n611), .C(n610), .Y(r2_data[7]) );
  INVX2 U881 ( .A(\regs[5][8] ), .Y(n613) );
  INVX2 U882 ( .A(\regs[4][8] ), .Y(n614) );
  INVX2 U883 ( .A(\regs[1][8] ), .Y(n1055) );
  INVX2 U884 ( .A(\regs[9][8] ), .Y(n625) );
  MUX2X1 U885 ( .B(n625), .A(n617), .S(n775), .Y(n1229) );
  INVX2 U886 ( .A(\regs[8][8] ), .Y(n626) );
  MUX2X1 U887 ( .B(n626), .A(n617), .S(n776), .Y(n1213) );
  INVX2 U888 ( .A(\regs[7][8] ), .Y(n615) );
  INVX2 U889 ( .A(\regs[6][8] ), .Y(n616) );
  INVX2 U890 ( .A(\regs[2][8] ), .Y(n1056) );
  INVX2 U891 ( .A(\regs[3][8] ), .Y(n1057) );
  INVX2 U892 ( .A(\regs[11][8] ), .Y(n618) );
  MUX2X1 U893 ( .B(n618), .A(n617), .S(n783), .Y(n1261) );
  INVX2 U894 ( .A(\regs[10][8] ), .Y(n619) );
  MUX2X1 U895 ( .B(n619), .A(n617), .S(n784), .Y(n1245) );
  AOI22X1 U896 ( .A(n326), .B(\regs[7][8] ), .C(n324), .D(\regs[6][8] ), .Y(
        n624) );
  AOI22X1 U897 ( .A(n789), .B(\regs[2][8] ), .C(n314), .D(\regs[3][8] ), .Y(
        n623) );
  INVX2 U898 ( .A(\regs[15][8] ), .Y(n1015) );
  INVX2 U899 ( .A(\regs[14][8] ), .Y(n998) );
  OAI22X1 U900 ( .A(n1015), .B(n791), .C(n998), .D(n790), .Y(n621) );
  OAI22X1 U901 ( .A(n619), .B(n794), .C(n618), .D(n792), .Y(n620) );
  NOR2X1 U902 ( .A(n621), .B(n620), .Y(n622) );
  NAND3X1 U903 ( .A(n624), .B(n623), .C(n622), .Y(n633) );
  AOI22X1 U904 ( .A(n304), .B(\regs[5][8] ), .C(n801), .D(\regs[4][8] ), .Y(
        n631) );
  AOI22X1 U905 ( .A(n804), .B(outreg_data[8]), .C(n803), .D(\regs[1][8] ), .Y(
        n630) );
  INVX2 U906 ( .A(\regs[13][8] ), .Y(n988) );
  INVX2 U907 ( .A(\regs[12][8] ), .Y(n986) );
  OAI22X1 U908 ( .A(n988), .B(n806), .C(n986), .D(n805), .Y(n628) );
  OAI22X1 U909 ( .A(n626), .B(n809), .C(n625), .D(n807), .Y(n627) );
  NOR2X1 U910 ( .A(n628), .B(n627), .Y(n629) );
  NAND3X1 U911 ( .A(n631), .B(n629), .C(n630), .Y(n632) );
  OR2X2 U912 ( .A(n633), .B(n632), .Y(r2_data[8]) );
  INVX2 U913 ( .A(\regs[11][9] ), .Y(n634) );
  MUX2X1 U914 ( .B(n634), .A(n267), .S(n783), .Y(n1262) );
  INVX2 U915 ( .A(\regs[10][9] ), .Y(n635) );
  MUX2X1 U916 ( .B(n635), .A(n267), .S(n784), .Y(n1246) );
  INVX2 U917 ( .A(\regs[9][9] ), .Y(n636) );
  MUX2X1 U918 ( .B(n636), .A(n267), .S(n775), .Y(n1230) );
  INVX2 U919 ( .A(\regs[8][9] ), .Y(n637) );
  MUX2X1 U920 ( .B(n637), .A(n267), .S(n776), .Y(n1214) );
  INVX2 U921 ( .A(\regs[4][9] ), .Y(n638) );
  INVX2 U922 ( .A(\regs[5][9] ), .Y(n639) );
  INVX2 U923 ( .A(\regs[6][9] ), .Y(n640) );
  INVX2 U924 ( .A(\regs[1][9] ), .Y(n1075) );
  INVX2 U925 ( .A(\regs[3][9] ), .Y(n1077) );
  INVX2 U926 ( .A(\regs[2][9] ), .Y(n1076) );
  AOI22X1 U927 ( .A(n789), .B(\regs[2][9] ), .C(n314), .D(\regs[3][9] ), .Y(
        n658) );
  AOI22X1 U928 ( .A(n303), .B(\regs[5][9] ), .C(n801), .D(\regs[4][9] ), .Y(
        n642) );
  NOR2X1 U929 ( .A(n1074), .B(n291), .Y(n654) );
  AOI22X1 U930 ( .A(n677), .B(\regs[10][9] ), .C(n678), .D(\regs[11][9] ), .Y(
        n645) );
  AOI22X1 U931 ( .A(n356), .B(\regs[15][9] ), .C(n679), .D(\regs[14][9] ), .Y(
        n644) );
  AND2X2 U932 ( .A(n645), .B(n644), .Y(n652) );
  AOI22X1 U933 ( .A(n647), .B(\regs[8][9] ), .C(n646), .D(\regs[9][9] ), .Y(
        n650) );
  AOI22X1 U934 ( .A(n357), .B(\regs[13][9] ), .C(n648), .D(\regs[12][9] ), .Y(
        n649) );
  AND2X2 U935 ( .A(n650), .B(n649), .Y(n651) );
  NAND2X1 U936 ( .A(n652), .B(n651), .Y(n653) );
  NOR3X1 U937 ( .A(n653), .B(n654), .C(n655), .Y(n657) );
  AOI22X1 U938 ( .A(n803), .B(\regs[1][9] ), .C(n323), .D(\regs[6][9] ), .Y(
        n656) );
  NAND3X1 U939 ( .A(n658), .B(n657), .C(n656), .Y(r2_data[9]) );
  INVX2 U940 ( .A(\regs[9][10] ), .Y(n663) );
  MUX2X1 U941 ( .B(n663), .A(n280), .S(n775), .Y(n1231) );
  INVX2 U942 ( .A(\regs[8][10] ), .Y(n664) );
  MUX2X1 U943 ( .B(n664), .A(n280), .S(n776), .Y(n1215) );
  INVX2 U944 ( .A(\regs[5][10] ), .Y(n659) );
  INVX2 U945 ( .A(\regs[4][10] ), .Y(n660) );
  INVX2 U946 ( .A(\regs[1][10] ), .Y(n1095) );
  INVX2 U947 ( .A(\regs[7][10] ), .Y(n674) );
  INVX2 U948 ( .A(\regs[6][10] ), .Y(n676) );
  INVX2 U949 ( .A(\regs[11][10] ), .Y(n661) );
  MUX2X1 U950 ( .B(n661), .A(n280), .S(n783), .Y(n1263) );
  INVX2 U951 ( .A(\regs[10][10] ), .Y(n662) );
  MUX2X1 U952 ( .B(n662), .A(n280), .S(n784), .Y(n1247) );
  INVX2 U953 ( .A(\regs[2][10] ), .Y(n1096) );
  MUX2X1 U954 ( .B(n1096), .A(n280), .S(n781), .Y(n1436) );
  INVX2 U955 ( .A(\regs[3][10] ), .Y(n1097) );
  MUX2X1 U956 ( .B(n1097), .A(n280), .S(n782), .Y(n1437) );
  INVX2 U957 ( .A(\regs[13][10] ), .Y(n1086) );
  INVX2 U958 ( .A(\regs[12][10] ), .Y(n1085) );
  OAI22X1 U959 ( .A(n1086), .B(n806), .C(n1085), .D(n805), .Y(n666) );
  OAI22X1 U960 ( .A(n664), .B(n809), .C(n663), .D(n807), .Y(n665) );
  NOR2X1 U961 ( .A(n666), .B(n665), .Y(n667) );
  OAI21X1 U962 ( .A(n1094), .B(n291), .C(n667), .Y(n672) );
  AOI22X1 U963 ( .A(n303), .B(\regs[5][10] ), .C(n801), .D(\regs[4][10] ), .Y(
        n669) );
  OAI21X1 U964 ( .A(n1095), .B(n344), .C(n669), .Y(n671) );
  NOR2X1 U965 ( .A(n672), .B(n671), .Y(n686) );
  OAI22X1 U966 ( .A(n676), .B(n675), .C(n674), .D(n355), .Y(n684) );
  AOI22X1 U967 ( .A(n678), .B(\regs[11][10] ), .C(n677), .D(\regs[10][10] ), 
        .Y(n682) );
  AOI22X1 U968 ( .A(n679), .B(\regs[14][10] ), .C(n356), .D(\regs[15][10] ), 
        .Y(n681) );
  AOI22X1 U969 ( .A(n789), .B(\regs[2][10] ), .C(n313), .D(\regs[3][10] ), .Y(
        n680) );
  NAND3X1 U970 ( .A(n682), .B(n681), .C(n680), .Y(n683) );
  NOR2X1 U971 ( .A(n684), .B(n683), .Y(n685) );
  NAND2X1 U972 ( .A(n686), .B(n685), .Y(r2_data[10]) );
  INVX2 U973 ( .A(\regs[5][11] ), .Y(n687) );
  INVX2 U974 ( .A(\regs[4][11] ), .Y(n688) );
  INVX2 U975 ( .A(\regs[1][11] ), .Y(n1115) );
  INVX2 U976 ( .A(\regs[9][11] ), .Y(n698) );
  MUX2X1 U977 ( .B(n698), .A(n268), .S(n775), .Y(n1232) );
  INVX2 U978 ( .A(\regs[8][11] ), .Y(n699) );
  MUX2X1 U979 ( .B(n699), .A(n268), .S(n776), .Y(n1216) );
  INVX2 U980 ( .A(\regs[7][11] ), .Y(n689) );
  INVX2 U981 ( .A(\regs[6][11] ), .Y(n690) );
  INVX2 U982 ( .A(\regs[2][11] ), .Y(n1116) );
  INVX2 U983 ( .A(\regs[3][11] ), .Y(n1117) );
  INVX2 U984 ( .A(\regs[11][11] ), .Y(n691) );
  MUX2X1 U985 ( .B(n691), .A(n268), .S(n783), .Y(n1264) );
  INVX2 U986 ( .A(\regs[10][11] ), .Y(n692) );
  MUX2X1 U987 ( .B(n692), .A(n268), .S(n784), .Y(n1248) );
  AOI22X1 U988 ( .A(n787), .B(\regs[7][11] ), .C(n324), .D(\regs[6][11] ), .Y(
        n697) );
  AOI22X1 U989 ( .A(n789), .B(\regs[2][11] ), .C(n314), .D(\regs[3][11] ), .Y(
        n696) );
  INVX2 U990 ( .A(\regs[15][11] ), .Y(n1108) );
  INVX2 U991 ( .A(\regs[14][11] ), .Y(n1107) );
  OAI22X1 U992 ( .A(n1108), .B(n791), .C(n1107), .D(n790), .Y(n694) );
  OAI22X1 U993 ( .A(n692), .B(n794), .C(n691), .D(n792), .Y(n693) );
  NOR2X1 U994 ( .A(n694), .B(n693), .Y(n695) );
  NAND3X1 U995 ( .A(n697), .B(n696), .C(n695), .Y(n706) );
  AOI22X1 U996 ( .A(n304), .B(\regs[5][11] ), .C(n801), .D(\regs[4][11] ), .Y(
        n704) );
  AOI22X1 U997 ( .A(n804), .B(outreg_data[11]), .C(n803), .D(\regs[1][11] ), 
        .Y(n703) );
  INVX2 U998 ( .A(\regs[13][11] ), .Y(n1106) );
  INVX2 U999 ( .A(\regs[12][11] ), .Y(n1105) );
  OAI22X1 U1000 ( .A(n1106), .B(n806), .C(n1105), .D(n805), .Y(n701) );
  OAI22X1 U1001 ( .A(n699), .B(n809), .C(n698), .D(n807), .Y(n700) );
  NOR2X1 U1002 ( .A(n701), .B(n700), .Y(n702) );
  NAND3X1 U1003 ( .A(n703), .B(n702), .C(n704), .Y(n705) );
  INVX2 U1004 ( .A(\regs[5][12] ), .Y(n707) );
  MUX2X1 U1005 ( .B(n707), .A(n711), .S(n770), .Y(n1169) );
  INVX2 U1006 ( .A(\regs[4][12] ), .Y(n708) );
  MUX2X1 U1007 ( .B(n708), .A(n711), .S(n772), .Y(n1153) );
  INVX2 U1008 ( .A(\regs[1][12] ), .Y(n1272) );
  MUX2X1 U1009 ( .B(n1272), .A(n711), .S(n774), .Y(n1483) );
  INVX2 U1010 ( .A(\regs[9][12] ), .Y(n719) );
  MUX2X1 U1011 ( .B(n719), .A(n711), .S(n775), .Y(n1233) );
  INVX2 U1012 ( .A(\regs[8][12] ), .Y(n720) );
  MUX2X1 U1013 ( .B(n720), .A(n711), .S(n776), .Y(n1217) );
  INVX2 U1014 ( .A(\regs[7][12] ), .Y(n709) );
  INVX2 U1015 ( .A(\regs[6][12] ), .Y(n710) );
  INVX2 U1016 ( .A(\regs[2][12] ), .Y(n1273) );
  MUX2X1 U1017 ( .B(n1273), .A(n711), .S(n781), .Y(n1484) );
  INVX2 U1018 ( .A(\regs[3][12] ), .Y(n1274) );
  MUX2X1 U1020 ( .B(n1274), .A(n711), .S(n782), .Y(n1485) );
  INVX2 U1021 ( .A(\regs[11][12] ), .Y(n712) );
  MUX2X1 U1022 ( .B(n712), .A(n711), .S(n783), .Y(n1265) );
  INVX2 U1023 ( .A(\regs[10][12] ), .Y(n713) );
  MUX2X1 U1024 ( .B(n713), .A(n711), .S(n784), .Y(n1249) );
  AOI22X1 U1050 ( .A(n326), .B(\regs[7][12] ), .C(n324), .D(\regs[6][12] ), 
        .Y(n718) );
  AOI22X1 U1067 ( .A(n789), .B(\regs[2][12] ), .C(n314), .D(\regs[3][12] ), 
        .Y(n717) );
  INVX2 U1084 ( .A(\regs[15][12] ), .Y(n1129) );
  INVX2 U1085 ( .A(\regs[14][12] ), .Y(n1128) );
  OAI22X1 U1086 ( .A(n1129), .B(n791), .C(n1128), .D(n790), .Y(n715) );
  OAI22X1 U1087 ( .A(n713), .B(n794), .C(n712), .D(n792), .Y(n714) );
  NOR2X1 U1088 ( .A(n715), .B(n714), .Y(n716) );
  NAND3X1 U1089 ( .A(n718), .B(n717), .C(n716), .Y(n727) );
  AOI22X1 U1090 ( .A(n304), .B(\regs[5][12] ), .C(n801), .D(\regs[4][12] ), 
        .Y(n725) );
  AOI22X1 U1091 ( .A(n804), .B(outreg_data[12]), .C(n803), .D(\regs[1][12] ), 
        .Y(n724) );
  INVX2 U1092 ( .A(\regs[13][12] ), .Y(n1126) );
  INVX2 U1093 ( .A(\regs[12][12] ), .Y(n1125) );
  OAI22X1 U1094 ( .A(n1126), .B(n806), .C(n1125), .D(n805), .Y(n722) );
  OAI22X1 U1095 ( .A(n720), .B(n809), .C(n719), .D(n807), .Y(n721) );
  NOR2X1 U1096 ( .A(n722), .B(n721), .Y(n723) );
  NAND3X1 U1097 ( .A(n725), .B(n724), .C(n723), .Y(n726) );
  OR2X2 U1098 ( .A(n727), .B(n726), .Y(r2_data[12]) );
  INVX2 U1099 ( .A(\regs[5][13] ), .Y(n728) );
  INVX2 U1100 ( .A(\regs[4][13] ), .Y(n729) );
  INVX2 U1101 ( .A(\regs[1][13] ), .Y(n1292) );
  INVX2 U1102 ( .A(\regs[9][13] ), .Y(n739) );
  MUX2X1 U1103 ( .B(n739), .A(n274), .S(n775), .Y(n1234) );
  INVX2 U1104 ( .A(\regs[8][13] ), .Y(n740) );
  MUX2X1 U1105 ( .B(n740), .A(n274), .S(n776), .Y(n1218) );
  INVX2 U1106 ( .A(\regs[7][13] ), .Y(n730) );
  INVX2 U1107 ( .A(\regs[6][13] ), .Y(n731) );
  INVX2 U1108 ( .A(\regs[2][13] ), .Y(n1293) );
  INVX2 U1109 ( .A(\regs[3][13] ), .Y(n1294) );
  INVX2 U1110 ( .A(\regs[11][13] ), .Y(n732) );
  MUX2X1 U1111 ( .B(n732), .A(n274), .S(n783), .Y(n1266) );
  INVX2 U1112 ( .A(\regs[10][13] ), .Y(n733) );
  MUX2X1 U1113 ( .B(n733), .A(n274), .S(n784), .Y(n1250) );
  AOI22X1 U1114 ( .A(n327), .B(\regs[7][13] ), .C(n323), .D(\regs[6][13] ), 
        .Y(n738) );
  AOI22X1 U1115 ( .A(n789), .B(\regs[2][13] ), .C(n314), .D(\regs[3][13] ), 
        .Y(n737) );
  INVX2 U1116 ( .A(\regs[15][13] ), .Y(n1285) );
  INVX2 U1117 ( .A(\regs[14][13] ), .Y(n1284) );
  OAI22X1 U1118 ( .A(n1285), .B(n791), .C(n1284), .D(n790), .Y(n735) );
  OAI22X1 U1119 ( .A(n733), .B(n794), .C(n732), .D(n792), .Y(n734) );
  NOR2X1 U1120 ( .A(n735), .B(n734), .Y(n736) );
  NAND3X1 U1121 ( .A(n738), .B(n737), .C(n736), .Y(n747) );
  AOI22X1 U1122 ( .A(n304), .B(\regs[5][13] ), .C(n801), .D(\regs[4][13] ), 
        .Y(n745) );
  AOI22X1 U1123 ( .A(n804), .B(outreg_data[13]), .C(n803), .D(\regs[1][13] ), 
        .Y(n744) );
  INVX2 U1124 ( .A(\regs[13][13] ), .Y(n1283) );
  INVX2 U1125 ( .A(\regs[12][13] ), .Y(n1282) );
  OAI22X1 U1126 ( .A(n1283), .B(n806), .C(n1282), .D(n805), .Y(n742) );
  OAI22X1 U1127 ( .A(n740), .B(n809), .C(n739), .D(n807), .Y(n741) );
  NOR2X1 U1128 ( .A(n742), .B(n741), .Y(n743) );
  NAND3X1 U1129 ( .A(n745), .B(n744), .C(n743), .Y(n746) );
  OR2X2 U1130 ( .A(n747), .B(n746), .Y(r2_data[13]) );
  INVX2 U1131 ( .A(\regs[5][14] ), .Y(n748) );
  MUX2X1 U1132 ( .B(n748), .A(n264), .S(n770), .Y(n1171) );
  INVX2 U1133 ( .A(\regs[4][14] ), .Y(n749) );
  MUX2X1 U1134 ( .B(n749), .A(n264), .S(n772), .Y(n1155) );
  INVX2 U1135 ( .A(\regs[1][14] ), .Y(n1312) );
  MUX2X1 U1136 ( .B(n1312), .A(n264), .S(n774), .Y(n1467) );
  INVX2 U1137 ( .A(\regs[9][14] ), .Y(n760) );
  MUX2X1 U1138 ( .B(n760), .A(n752), .S(n775), .Y(n1235) );
  INVX2 U1139 ( .A(\regs[8][14] ), .Y(n761) );
  MUX2X1 U1140 ( .B(n761), .A(n258), .S(n776), .Y(n1219) );
  INVX2 U1141 ( .A(\regs[7][14] ), .Y(n750) );
  MUX2X1 U1142 ( .B(n750), .A(n264), .S(n777), .Y(n1203) );
  INVX2 U1143 ( .A(\regs[6][14] ), .Y(n751) );
  MUX2X1 U1144 ( .B(n751), .A(n264), .S(n779), .Y(n1187) );
  INVX2 U1145 ( .A(\regs[2][14] ), .Y(n1313) );
  MUX2X1 U1146 ( .B(n1313), .A(n264), .S(n781), .Y(n1468) );
  INVX2 U1147 ( .A(\regs[3][14] ), .Y(n1314) );
  MUX2X1 U1148 ( .B(n1314), .A(n264), .S(n782), .Y(n1469) );
  INVX2 U1149 ( .A(\regs[11][14] ), .Y(n753) );
  MUX2X1 U1150 ( .B(n753), .A(n752), .S(n783), .Y(n1267) );
  INVX2 U1151 ( .A(\regs[10][14] ), .Y(n754) );
  MUX2X1 U1152 ( .B(n754), .A(n258), .S(n784), .Y(n1251) );
  AOI22X1 U1153 ( .A(n326), .B(\regs[7][14] ), .C(n323), .D(\regs[6][14] ), 
        .Y(n759) );
  AOI22X1 U1154 ( .A(n789), .B(\regs[2][14] ), .C(n314), .D(\regs[3][14] ), 
        .Y(n758) );
  INVX2 U1155 ( .A(\regs[15][14] ), .Y(n1305) );
  INVX2 U1156 ( .A(\regs[14][14] ), .Y(n1304) );
  OAI22X1 U1157 ( .A(n1305), .B(n791), .C(n1304), .D(n790), .Y(n756) );
  OAI22X1 U1158 ( .A(n754), .B(n794), .C(n753), .D(n792), .Y(n755) );
  NOR2X1 U1159 ( .A(n756), .B(n755), .Y(n757) );
  NAND3X1 U1160 ( .A(n759), .B(n758), .C(n757), .Y(n768) );
  AOI22X1 U1161 ( .A(n304), .B(\regs[5][14] ), .C(n801), .D(\regs[4][14] ), 
        .Y(n766) );
  AOI22X1 U1162 ( .A(n804), .B(outreg_data[14]), .C(n803), .D(\regs[1][14] ), 
        .Y(n765) );
  INVX2 U1163 ( .A(\regs[13][14] ), .Y(n1303) );
  INVX2 U1164 ( .A(\regs[12][14] ), .Y(n1302) );
  OAI22X1 U1165 ( .A(n1303), .B(n806), .C(n1302), .D(n805), .Y(n763) );
  OAI22X1 U1166 ( .A(n761), .B(n809), .C(n760), .D(n807), .Y(n762) );
  NOR2X1 U1167 ( .A(n763), .B(n762), .Y(n764) );
  NAND3X1 U1168 ( .A(n766), .B(n765), .C(n764), .Y(n767) );
  OR2X2 U1169 ( .A(n768), .B(n767), .Y(r2_data[14]) );
  INVX2 U1170 ( .A(\regs[5][15] ), .Y(n771) );
  INVX2 U1171 ( .A(\regs[4][15] ), .Y(n773) );
  INVX2 U1172 ( .A(\regs[1][15] ), .Y(n1343) );
  INVX2 U1173 ( .A(\regs[9][15] ), .Y(n808) );
  MUX2X1 U1174 ( .B(n808), .A(n272), .S(n775), .Y(n1236) );
  INVX2 U1175 ( .A(\regs[8][15] ), .Y(n810) );
  MUX2X1 U1176 ( .B(n810), .A(n272), .S(n776), .Y(n1220) );
  INVX2 U1177 ( .A(\regs[7][15] ), .Y(n778) );
  INVX2 U1178 ( .A(\regs[6][15] ), .Y(n780) );
  INVX2 U1179 ( .A(\regs[2][15] ), .Y(n1345) );
  INVX2 U1180 ( .A(\regs[3][15] ), .Y(n1347) );
  INVX2 U1181 ( .A(\regs[11][15] ), .Y(n793) );
  MUX2X1 U1182 ( .B(n793), .A(n272), .S(n783), .Y(n1268) );
  INVX2 U1183 ( .A(\regs[10][15] ), .Y(n795) );
  MUX2X1 U1184 ( .B(n795), .A(n272), .S(n784), .Y(n1252) );
  AOI22X1 U1185 ( .A(n787), .B(\regs[7][15] ), .C(n324), .D(\regs[6][15] ), 
        .Y(n800) );
  AOI22X1 U1186 ( .A(n789), .B(\regs[2][15] ), .C(n314), .D(\regs[3][15] ), 
        .Y(n799) );
  INVX2 U1187 ( .A(\regs[15][15] ), .Y(n1330) );
  INVX2 U1188 ( .A(\regs[14][15] ), .Y(n1328) );
  OAI22X1 U1189 ( .A(n1330), .B(n791), .C(n1328), .D(n790), .Y(n797) );
  OAI22X1 U1190 ( .A(n795), .B(n794), .C(n793), .D(n792), .Y(n796) );
  NOR2X1 U1191 ( .A(n797), .B(n796), .Y(n798) );
  NAND3X1 U1192 ( .A(n800), .B(n799), .C(n798), .Y(n817) );
  AOI22X1 U1193 ( .A(n304), .B(\regs[5][15] ), .C(n801), .D(\regs[4][15] ), 
        .Y(n815) );
  AOI22X1 U1194 ( .A(n804), .B(outreg_data[15]), .C(n803), .D(\regs[1][15] ), 
        .Y(n814) );
  INVX2 U1195 ( .A(\regs[13][15] ), .Y(n1326) );
  INVX2 U1196 ( .A(\regs[12][15] ), .Y(n1324) );
  OAI22X1 U1197 ( .A(n1326), .B(n806), .C(n1324), .D(n805), .Y(n812) );
  OAI22X1 U1198 ( .A(n810), .B(n809), .C(n808), .D(n807), .Y(n811) );
  NOR2X1 U1199 ( .A(n812), .B(n811), .Y(n813) );
  NAND3X1 U1200 ( .A(n815), .B(n814), .C(n813), .Y(n816) );
  OR2X2 U1201 ( .A(n817), .B(n816), .Y(r2_data[15]) );
  NAND3X1 U1202 ( .A(n985), .B(n321), .C(n309), .Y(n818) );
  NAND3X1 U1203 ( .A(n985), .B(n309), .C(n352), .Y(n819) );
  AOI22X1 U1204 ( .A(\regs[9][0] ), .B(n1323), .C(\regs[8][0] ), .D(n1322), 
        .Y(n828) );
  AOI22X1 U1205 ( .A(\regs[11][0] ), .B(n330), .C(\regs[10][0] ), .D(n329), 
        .Y(n827) );
  NAND3X1 U1206 ( .A(n342), .B(n321), .C(n309), .Y(n1327) );
  INVX2 U1207 ( .A(\regs[13][0] ), .Y(n821) );
  NAND3X1 U1208 ( .A(n342), .B(n309), .C(n352), .Y(n1325) );
  INVX2 U1209 ( .A(\regs[12][0] ), .Y(n820) );
  OAI22X1 U1210 ( .A(n359), .B(n821), .C(n361), .D(n820), .Y(n825) );
  NAND3X1 U1211 ( .A(n316), .B(n321), .C(n342), .Y(n1331) );
  INVX2 U1212 ( .A(\regs[15][0] ), .Y(n823) );
  NAND3X1 U1213 ( .A(n342), .B(n316), .C(n352), .Y(n1329) );
  INVX2 U1214 ( .A(\regs[14][0] ), .Y(n822) );
  OAI22X1 U1215 ( .A(n363), .B(n823), .C(n365), .D(n822), .Y(n824) );
  NOR2X1 U1216 ( .A(n825), .B(n824), .Y(n826) );
  NAND3X1 U1217 ( .A(n828), .B(n827), .C(n826), .Y(n844) );
  INVX2 U1218 ( .A(r1_sel[3]), .Y(n832) );
  NAND3X1 U1219 ( .A(r1_sel[0]), .B(n833), .C(n337), .Y(n948) );
  NAND3X1 U1220 ( .A(n833), .B(n300), .C(n337), .Y(n950) );
  AOI22X1 U1221 ( .A(\regs[5][0] ), .B(n290), .C(\regs[4][0] ), .D(n293), .Y(
        n842) );
  NAND3X1 U1223 ( .A(r1_sel[0]), .B(n337), .C(n350), .Y(n829) );
  NAND3X1 U1224 ( .A(n350), .B(n337), .C(n353), .Y(n830) );
  AOI22X1 U1225 ( .A(\regs[7][0] ), .B(n1340), .C(\regs[6][0] ), .D(n298), .Y(
        n841) );
  INVX2 U1226 ( .A(r1_sel[2]), .Y(n831) );
  NAND3X1 U1227 ( .A(r1_sel[0]), .B(n833), .C(n349), .Y(n1344) );
  NAND3X1 U1228 ( .A(n833), .B(n351), .C(n348), .Y(n1342) );
  OAI22X1 U1229 ( .A(n285), .B(n835), .C(n286), .D(n834), .Y(n839) );
  NAND3X1 U1230 ( .A(n350), .B(r1_sel[0]), .C(n349), .Y(n1348) );
  NAND3X1 U1231 ( .A(n350), .B(n348), .C(n351), .Y(n1346) );
  OAI22X1 U1232 ( .A(n299), .B(n837), .C(n260), .D(n836), .Y(n838) );
  NOR2X1 U1233 ( .A(n839), .B(n838), .Y(n840) );
  NAND3X1 U1234 ( .A(n842), .B(n841), .C(n840), .Y(n843) );
  OR2X2 U1235 ( .A(n844), .B(n843), .Y(r1_data[0]) );
  AOI22X1 U1236 ( .A(\regs[5][1] ), .B(n290), .C(\regs[4][1] ), .D(n293), .Y(
        n860) );
  AOI22X1 U1237 ( .A(\regs[7][1] ), .B(n1340), .C(\regs[6][1] ), .D(n298), .Y(
        n859) );
  AOI22X1 U1238 ( .A(n882), .B(\regs[2][1] ), .C(\regs[3][1] ), .D(n881), .Y(
        n846) );
  AOI22X1 U1239 ( .A(n884), .B(outreg_data[1]), .C(\regs[1][1] ), .D(n883), 
        .Y(n845) );
  NAND2X1 U1240 ( .A(n846), .B(n845), .Y(n857) );
  AOI22X1 U1241 ( .A(\regs[9][1] ), .B(n1323), .C(\regs[8][1] ), .D(n1322), 
        .Y(n855) );
  AOI22X1 U1242 ( .A(\regs[11][1] ), .B(n330), .C(\regs[10][1] ), .D(n329), 
        .Y(n854) );
  OAI22X1 U1243 ( .A(n359), .B(n848), .C(n361), .D(n847), .Y(n852) );
  OAI22X1 U1244 ( .A(n363), .B(n850), .C(n365), .D(n849), .Y(n851) );
  NOR2X1 U1245 ( .A(n852), .B(n851), .Y(n853) );
  NAND3X1 U1246 ( .A(n855), .B(n854), .C(n853), .Y(n856) );
  NOR2X1 U1247 ( .A(n857), .B(n856), .Y(n858) );
  NAND3X1 U1248 ( .A(n860), .B(n859), .C(n858), .Y(r1_data[1]) );
  AOI22X1 U1249 ( .A(\regs[9][2] ), .B(n1323), .C(\regs[8][2] ), .D(n1322), 
        .Y(n869) );
  AOI22X1 U1250 ( .A(\regs[11][2] ), .B(n330), .C(\regs[10][2] ), .D(n329), 
        .Y(n868) );
  OAI22X1 U1251 ( .A(n359), .B(n862), .C(n1325), .D(n861), .Y(n866) );
  OAI22X1 U1252 ( .A(n363), .B(n864), .C(n365), .D(n863), .Y(n865) );
  NOR2X1 U1253 ( .A(n866), .B(n865), .Y(n867) );
  NAND3X1 U1254 ( .A(n869), .B(n868), .C(n867), .Y(n880) );
  AOI22X1 U1255 ( .A(\regs[5][2] ), .B(n290), .C(\regs[4][2] ), .D(n294), .Y(
        n878) );
  AOI22X1 U1256 ( .A(\regs[7][2] ), .B(n1340), .C(\regs[6][2] ), .D(n298), .Y(
        n877) );
  OAI22X1 U1257 ( .A(n270), .B(n871), .C(n286), .D(n870), .Y(n875) );
  OAI22X1 U1258 ( .A(n371), .B(n873), .C(n287), .D(n872), .Y(n874) );
  NOR2X1 U1259 ( .A(n874), .B(n875), .Y(n876) );
  NAND3X1 U1260 ( .A(n878), .B(n877), .C(n876), .Y(n879) );
  OR2X2 U1261 ( .A(n880), .B(n879), .Y(r1_data[2]) );
  AOI22X1 U1262 ( .A(\regs[5][3] ), .B(n290), .C(\regs[4][3] ), .D(n293), .Y(
        n900) );
  AOI22X1 U1263 ( .A(\regs[7][3] ), .B(n1340), .C(\regs[6][3] ), .D(n298), .Y(
        n899) );
  AOI22X1 U1264 ( .A(n882), .B(\regs[2][3] ), .C(\regs[3][3] ), .D(n881), .Y(
        n886) );
  AOI22X1 U1265 ( .A(outreg_data[3]), .B(n884), .C(\regs[1][3] ), .D(n883), 
        .Y(n885) );
  NAND2X1 U1266 ( .A(n886), .B(n885), .Y(n897) );
  AOI22X1 U1267 ( .A(\regs[9][3] ), .B(n1323), .C(\regs[8][3] ), .D(n1322), 
        .Y(n895) );
  AOI22X1 U1268 ( .A(\regs[11][3] ), .B(n330), .C(\regs[10][3] ), .D(n329), 
        .Y(n894) );
  OAI22X1 U1269 ( .A(n1327), .B(n888), .C(n361), .D(n887), .Y(n892) );
  OAI22X1 U1270 ( .A(n363), .B(n890), .C(n1329), .D(n889), .Y(n891) );
  NOR2X1 U1271 ( .A(n892), .B(n891), .Y(n893) );
  NAND3X1 U1272 ( .A(n895), .B(n894), .C(n893), .Y(n896) );
  NOR2X1 U1273 ( .A(n896), .B(n897), .Y(n898) );
  AOI22X1 U1274 ( .A(\regs[9][4] ), .B(n1323), .C(\regs[8][4] ), .D(n1322), 
        .Y(n909) );
  AOI22X1 U1275 ( .A(\regs[11][4] ), .B(n330), .C(\regs[10][4] ), .D(n329), 
        .Y(n908) );
  INVX2 U1276 ( .A(\regs[13][4] ), .Y(n902) );
  INVX2 U1277 ( .A(\regs[12][4] ), .Y(n901) );
  OAI22X1 U1278 ( .A(n359), .B(n902), .C(n1325), .D(n901), .Y(n906) );
  INVX2 U1279 ( .A(\regs[15][4] ), .Y(n904) );
  INVX2 U1280 ( .A(\regs[14][4] ), .Y(n903) );
  OAI22X1 U1281 ( .A(n363), .B(n904), .C(n365), .D(n903), .Y(n905) );
  NOR2X1 U1282 ( .A(n906), .B(n905), .Y(n907) );
  NAND3X1 U1283 ( .A(n909), .B(n908), .C(n907), .Y(n920) );
  AOI22X1 U1284 ( .A(\regs[5][4] ), .B(n290), .C(\regs[4][4] ), .D(n293), .Y(
        n918) );
  AOI22X1 U1285 ( .A(\regs[7][4] ), .B(n1340), .C(\regs[6][4] ), .D(n298), .Y(
        n917) );
  OAI22X1 U1286 ( .A(n270), .B(n911), .C(n301), .D(n910), .Y(n915) );
  OAI22X1 U1287 ( .A(n317), .B(n913), .C(n322), .D(n912), .Y(n914) );
  NOR2X1 U1288 ( .A(n914), .B(n915), .Y(n916) );
  NAND3X1 U1289 ( .A(n918), .B(n917), .C(n916), .Y(n919) );
  OR2X2 U1290 ( .A(n919), .B(n920), .Y(r1_data[4]) );
  AOI22X1 U1291 ( .A(\regs[9][5] ), .B(n1323), .C(\regs[8][5] ), .D(n1322), 
        .Y(n929) );
  AOI22X1 U1292 ( .A(\regs[11][5] ), .B(n330), .C(\regs[10][5] ), .D(n329), 
        .Y(n928) );
  INVX2 U1300 ( .A(\regs[13][5] ), .Y(n922) );
  INVX2 U1301 ( .A(\regs[12][5] ), .Y(n921) );
  OAI22X1 U1302 ( .A(n1327), .B(n922), .C(n361), .D(n921), .Y(n926) );
  INVX2 U1303 ( .A(\regs[15][5] ), .Y(n924) );
  INVX2 U1304 ( .A(\regs[14][5] ), .Y(n923) );
  OAI22X1 U1305 ( .A(n363), .B(n924), .C(n1329), .D(n923), .Y(n925) );
  NOR2X1 U1306 ( .A(n926), .B(n925), .Y(n927) );
  NAND3X1 U1307 ( .A(n929), .B(n928), .C(n927), .Y(n940) );
  AOI22X1 U1308 ( .A(\regs[5][5] ), .B(n289), .C(\regs[4][5] ), .D(n294), .Y(
        n938) );
  AOI22X1 U1309 ( .A(\regs[7][5] ), .B(n1340), .C(\regs[6][5] ), .D(n297), .Y(
        n937) );
  OAI22X1 U1310 ( .A(n367), .B(n931), .C(n369), .D(n930), .Y(n935) );
  OAI22X1 U1311 ( .A(n371), .B(n933), .C(n373), .D(n932), .Y(n934) );
  NOR2X1 U1312 ( .A(n934), .B(n935), .Y(n936) );
  NAND3X1 U1313 ( .A(n938), .B(n937), .C(n936), .Y(n939) );
  OR2X2 U1314 ( .A(n940), .B(n939), .Y(r1_data[5]) );
  OAI22X1 U1315 ( .A(n270), .B(n942), .C(n286), .D(n941), .Y(n946) );
  OAI22X1 U1316 ( .A(n299), .B(n944), .C(n943), .D(n322), .Y(n945) );
  NOR2X1 U1317 ( .A(n946), .B(n945), .Y(n964) );
  AOI22X1 U1318 ( .A(\regs[7][6] ), .B(n1340), .C(\regs[6][6] ), .D(n298), .Y(
        n963) );
  OAI22X1 U1319 ( .A(n345), .B(n949), .C(n947), .D(n347), .Y(n961) );
  AOI22X1 U1320 ( .A(\regs[9][6] ), .B(n1323), .C(\regs[8][6] ), .D(n1322), 
        .Y(n959) );
  AOI22X1 U1321 ( .A(\regs[11][6] ), .B(n330), .C(\regs[10][6] ), .D(n329), 
        .Y(n958) );
  OAI22X1 U1322 ( .A(n359), .B(n952), .C(n1325), .D(n951), .Y(n956) );
  OAI22X1 U1323 ( .A(n363), .B(n954), .C(n365), .D(n953), .Y(n955) );
  NOR2X1 U1324 ( .A(n956), .B(n955), .Y(n957) );
  NAND3X1 U1325 ( .A(n959), .B(n958), .C(n957), .Y(n960) );
  NOR2X1 U1326 ( .A(n961), .B(n960), .Y(n962) );
  NAND3X1 U1327 ( .A(n964), .B(n963), .C(n962), .Y(r1_data[6]) );
  AOI22X1 U1328 ( .A(\regs[9][7] ), .B(n1323), .C(\regs[8][7] ), .D(n1322), 
        .Y(n973) );
  AOI22X1 U1329 ( .A(\regs[11][7] ), .B(n330), .C(\regs[10][7] ), .D(n329), 
        .Y(n972) );
  INVX2 U1330 ( .A(\regs[13][7] ), .Y(n966) );
  INVX2 U1331 ( .A(\regs[12][7] ), .Y(n965) );
  OAI22X1 U1332 ( .A(n1327), .B(n966), .C(n361), .D(n965), .Y(n970) );
  INVX2 U1333 ( .A(\regs[15][7] ), .Y(n968) );
  INVX2 U1334 ( .A(\regs[14][7] ), .Y(n967) );
  OAI22X1 U1335 ( .A(n363), .B(n968), .C(n1329), .D(n967), .Y(n969) );
  NOR2X1 U1336 ( .A(n970), .B(n969), .Y(n971) );
  NAND3X1 U1337 ( .A(n973), .B(n972), .C(n971), .Y(n984) );
  AOI22X1 U1338 ( .A(\regs[5][7] ), .B(n288), .C(\regs[4][7] ), .D(n292), .Y(
        n982) );
  AOI22X1 U1339 ( .A(\regs[7][7] ), .B(n1340), .C(\regs[6][7] ), .D(n297), .Y(
        n981) );
  OAI22X1 U1340 ( .A(n367), .B(n975), .C(n369), .D(n974), .Y(n979) );
  OAI22X1 U1341 ( .A(n977), .B(n371), .C(n976), .D(n373), .Y(n978) );
  NOR2X1 U1342 ( .A(n978), .B(n979), .Y(n980) );
  NAND3X1 U1343 ( .A(n982), .B(n981), .C(n980), .Y(n983) );
  AOI22X1 U1344 ( .A(\regs[9][8] ), .B(n1323), .C(\regs[8][8] ), .D(n1322), 
        .Y(n1053) );
  AOI22X1 U1345 ( .A(\regs[11][8] ), .B(n330), .C(\regs[10][8] ), .D(n329), 
        .Y(n1052) );
  OAI22X1 U1346 ( .A(n359), .B(n988), .C(n1325), .D(n986), .Y(n1033) );
  OAI22X1 U1347 ( .A(n363), .B(n1015), .C(n365), .D(n998), .Y(n1017) );
  NOR2X1 U1348 ( .A(n1033), .B(n1017), .Y(n1036) );
  NAND3X1 U1349 ( .A(n1053), .B(n1052), .C(n1036), .Y(n1064) );
  AOI22X1 U1350 ( .A(\regs[5][8] ), .B(n289), .C(\regs[4][8] ), .D(n294), .Y(
        n1062) );
  AOI22X1 U1351 ( .A(\regs[7][8] ), .B(n1340), .C(\regs[6][8] ), .D(n298), .Y(
        n1061) );
  OAI22X1 U1352 ( .A(n270), .B(n1055), .C(n301), .D(n1054), .Y(n1059) );
  OAI22X1 U1353 ( .A(n299), .B(n1057), .C(n1056), .D(n322), .Y(n1058) );
  NOR2X1 U1354 ( .A(n1058), .B(n1059), .Y(n1060) );
  NAND3X1 U1355 ( .A(n1062), .B(n1061), .C(n1060), .Y(n1063) );
  OR2X2 U1356 ( .A(n1064), .B(n1063), .Y(r1_data[8]) );
  AOI22X1 U1357 ( .A(\regs[9][9] ), .B(n1323), .C(\regs[8][9] ), .D(n1322), 
        .Y(n1073) );
  AOI22X1 U1358 ( .A(\regs[11][9] ), .B(n330), .C(\regs[10][9] ), .D(n329), 
        .Y(n1072) );
  INVX2 U1359 ( .A(\regs[13][9] ), .Y(n1066) );
  INVX2 U1360 ( .A(\regs[12][9] ), .Y(n1065) );
  OAI22X1 U1361 ( .A(n1327), .B(n1066), .C(n361), .D(n1065), .Y(n1070) );
  INVX2 U1362 ( .A(\regs[15][9] ), .Y(n1068) );
  INVX2 U1363 ( .A(\regs[14][9] ), .Y(n1067) );
  OAI22X1 U1364 ( .A(n363), .B(n1068), .C(n1329), .D(n1067), .Y(n1069) );
  NOR2X1 U1365 ( .A(n1070), .B(n1069), .Y(n1071) );
  NAND3X1 U1366 ( .A(n1073), .B(n1072), .C(n1071), .Y(n1084) );
  AOI22X1 U1367 ( .A(\regs[5][9] ), .B(n289), .C(\regs[4][9] ), .D(n293), .Y(
        n1082) );
  AOI22X1 U1368 ( .A(\regs[7][9] ), .B(n1340), .C(\regs[6][9] ), .D(n297), .Y(
        n1081) );
  OAI22X1 U1369 ( .A(n367), .B(n1075), .C(n369), .D(n1074), .Y(n1079) );
  OAI22X1 U1370 ( .A(n371), .B(n1077), .C(n1076), .D(n287), .Y(n1078) );
  NOR2X1 U1371 ( .A(n1079), .B(n1078), .Y(n1080) );
  NAND3X1 U1372 ( .A(n1082), .B(n1081), .C(n1080), .Y(n1083) );
  OR2X2 U1373 ( .A(n1084), .B(n1083), .Y(r1_data[9]) );
  AOI22X1 U1374 ( .A(\regs[9][10] ), .B(n1323), .C(\regs[8][10] ), .D(n1322), 
        .Y(n1093) );
  AOI22X1 U1375 ( .A(\regs[11][10] ), .B(n330), .C(\regs[10][10] ), .D(n329), 
        .Y(n1092) );
  OAI22X1 U1376 ( .A(n359), .B(n1086), .C(n1325), .D(n1085), .Y(n1090) );
  INVX2 U1377 ( .A(\regs[15][10] ), .Y(n1088) );
  INVX2 U1378 ( .A(\regs[14][10] ), .Y(n1087) );
  OAI22X1 U1379 ( .A(n363), .B(n1088), .C(n365), .D(n1087), .Y(n1089) );
  NOR2X1 U1380 ( .A(n1090), .B(n1089), .Y(n1091) );
  NAND3X1 U1381 ( .A(n1093), .B(n1092), .C(n1091), .Y(n1104) );
  AOI22X1 U1382 ( .A(\regs[5][10] ), .B(n290), .C(\regs[4][10] ), .D(n293), 
        .Y(n1102) );
  AOI22X1 U1383 ( .A(\regs[7][10] ), .B(n1340), .C(\regs[6][10] ), .D(n297), 
        .Y(n1101) );
  OAI22X1 U1384 ( .A(n367), .B(n1095), .C(n1094), .D(n369), .Y(n1099) );
  OAI22X1 U1385 ( .A(n1097), .B(n371), .C(n373), .D(n1096), .Y(n1098) );
  NOR2X1 U1386 ( .A(n1099), .B(n1098), .Y(n1100) );
  NAND3X1 U1387 ( .A(n1102), .B(n1101), .C(n1100), .Y(n1103) );
  OR2X2 U1388 ( .A(n1103), .B(n1104), .Y(r1_data[10]) );
  AOI22X1 U1389 ( .A(\regs[9][11] ), .B(n1323), .C(\regs[8][11] ), .D(n1322), 
        .Y(n1113) );
  AOI22X1 U1390 ( .A(\regs[11][11] ), .B(n330), .C(\regs[10][11] ), .D(n329), 
        .Y(n1112) );
  OAI22X1 U1391 ( .A(n1327), .B(n1106), .C(n361), .D(n1105), .Y(n1110) );
  OAI22X1 U1392 ( .A(n363), .B(n1108), .C(n1329), .D(n1107), .Y(n1109) );
  NOR2X1 U1393 ( .A(n1110), .B(n1109), .Y(n1111) );
  NAND3X1 U1394 ( .A(n1113), .B(n1112), .C(n1111), .Y(n1124) );
  AOI22X1 U1395 ( .A(\regs[5][11] ), .B(n290), .C(\regs[4][11] ), .D(n294), 
        .Y(n1122) );
  AOI22X1 U1396 ( .A(\regs[7][11] ), .B(n1340), .C(\regs[6][11] ), .D(n297), 
        .Y(n1121) );
  OAI22X1 U1397 ( .A(n1115), .B(n270), .C(n369), .D(n1114), .Y(n1119) );
  OAI22X1 U1398 ( .A(n371), .B(n1117), .C(n287), .D(n1116), .Y(n1118) );
  NOR2X1 U1399 ( .A(n1118), .B(n1119), .Y(n1120) );
  NAND3X1 U1400 ( .A(n1122), .B(n1121), .C(n1120), .Y(n1123) );
  OR2X2 U1401 ( .A(n1123), .B(n1124), .Y(r1_data[11]) );
  AOI22X1 U1402 ( .A(\regs[9][12] ), .B(n1323), .C(\regs[8][12] ), .D(n1322), 
        .Y(n1270) );
  AOI22X1 U1403 ( .A(\regs[11][12] ), .B(n330), .C(\regs[10][12] ), .D(n329), 
        .Y(n1269) );
  OAI22X1 U1404 ( .A(n359), .B(n1126), .C(n1325), .D(n1125), .Y(n1131) );
  OAI22X1 U1405 ( .A(n363), .B(n1129), .C(n365), .D(n1128), .Y(n1130) );
  NOR2X1 U1406 ( .A(n1131), .B(n1130), .Y(n1132) );
  NAND3X1 U1407 ( .A(n1270), .B(n1269), .C(n1132), .Y(n1281) );
  AOI22X1 U1408 ( .A(\regs[5][12] ), .B(n289), .C(\regs[4][12] ), .D(n294), 
        .Y(n1279) );
  AOI22X1 U1409 ( .A(\regs[7][12] ), .B(n1340), .C(\regs[6][12] ), .D(n298), 
        .Y(n1278) );
  OAI22X1 U1410 ( .A(n270), .B(n1272), .C(n286), .D(n1271), .Y(n1276) );
  OAI22X1 U1411 ( .A(n317), .B(n1274), .C(n322), .D(n1273), .Y(n1275) );
  NOR2X1 U1412 ( .A(n1276), .B(n1275), .Y(n1277) );
  NAND3X1 U1413 ( .A(n1279), .B(n1278), .C(n1277), .Y(n1280) );
  OR2X2 U1414 ( .A(n1281), .B(n1280), .Y(r1_data[12]) );
  AOI22X1 U1415 ( .A(\regs[9][13] ), .B(n1323), .C(\regs[8][13] ), .D(n1322), 
        .Y(n1290) );
  AOI22X1 U1416 ( .A(\regs[11][13] ), .B(n330), .C(\regs[10][13] ), .D(n329), 
        .Y(n1289) );
  OAI22X1 U1417 ( .A(n1327), .B(n1283), .C(n361), .D(n1282), .Y(n1287) );
  OAI22X1 U1418 ( .A(n363), .B(n1285), .C(n1329), .D(n1284), .Y(n1286) );
  NOR2X1 U1419 ( .A(n1287), .B(n1286), .Y(n1288) );
  NAND3X1 U1420 ( .A(n1290), .B(n1289), .C(n1288), .Y(n1301) );
  AOI22X1 U1421 ( .A(\regs[5][13] ), .B(n289), .C(\regs[4][13] ), .D(n294), 
        .Y(n1299) );
  AOI22X1 U1422 ( .A(\regs[7][13] ), .B(n1340), .C(\regs[6][13] ), .D(n298), 
        .Y(n1298) );
  OAI22X1 U1423 ( .A(n270), .B(n1292), .C(n315), .D(n1291), .Y(n1296) );
  OAI22X1 U1424 ( .A(n317), .B(n1294), .C(n287), .D(n1293), .Y(n1295) );
  NOR2X1 U1425 ( .A(n1296), .B(n1295), .Y(n1297) );
  NAND3X1 U1426 ( .A(n1299), .B(n1298), .C(n1297), .Y(n1300) );
  OR2X2 U1427 ( .A(n1301), .B(n1300), .Y(r1_data[13]) );
  AOI22X1 U1428 ( .A(\regs[9][14] ), .B(n1323), .C(\regs[8][14] ), .D(n1322), 
        .Y(n1310) );
  AOI22X1 U1429 ( .A(\regs[11][14] ), .B(n330), .C(\regs[10][14] ), .D(n329), 
        .Y(n1309) );
  OAI22X1 U1430 ( .A(n359), .B(n1303), .C(n1325), .D(n1302), .Y(n1307) );
  OAI22X1 U1431 ( .A(n363), .B(n1305), .C(n365), .D(n1304), .Y(n1306) );
  NOR2X1 U1432 ( .A(n1307), .B(n1306), .Y(n1308) );
  NAND3X1 U1433 ( .A(n1310), .B(n1309), .C(n1308), .Y(n1321) );
  AOI22X1 U1434 ( .A(\regs[5][14] ), .B(n289), .C(\regs[4][14] ), .D(n294), 
        .Y(n1319) );
  AOI22X1 U1435 ( .A(\regs[7][14] ), .B(n1340), .C(\regs[6][14] ), .D(n298), 
        .Y(n1318) );
  OAI22X1 U1436 ( .A(n270), .B(n1312), .C(n301), .D(n1311), .Y(n1316) );
  OAI22X1 U1437 ( .A(n317), .B(n1314), .C(n260), .D(n1313), .Y(n1315) );
  NOR2X1 U1438 ( .A(n1316), .B(n1315), .Y(n1317) );
  NAND3X1 U1439 ( .A(n1319), .B(n1318), .C(n1317), .Y(n1320) );
  OR2X2 U1440 ( .A(n1321), .B(n1320), .Y(r1_data[14]) );
  AOI22X1 U1441 ( .A(\regs[9][15] ), .B(n1323), .C(\regs[8][15] ), .D(n1322), 
        .Y(n1336) );
  AOI22X1 U1442 ( .A(\regs[11][15] ), .B(n330), .C(\regs[10][15] ), .D(n329), 
        .Y(n1335) );
  OAI22X1 U1443 ( .A(n1327), .B(n1326), .C(n361), .D(n1324), .Y(n1333) );
  OAI22X1 U1444 ( .A(n363), .B(n1330), .C(n1329), .D(n1328), .Y(n1332) );
  NOR2X1 U1445 ( .A(n1333), .B(n1332), .Y(n1334) );
  NAND3X1 U1446 ( .A(n1336), .B(n1335), .C(n1334), .Y(n1355) );
  AOI22X1 U1447 ( .A(\regs[5][15] ), .B(n289), .C(\regs[4][15] ), .D(n293), 
        .Y(n1353) );
  AOI22X1 U1448 ( .A(\regs[7][15] ), .B(n1340), .C(\regs[6][15] ), .D(n298), 
        .Y(n1352) );
  OAI22X1 U1449 ( .A(n270), .B(n1343), .C(n315), .D(n1341), .Y(n1350) );
  OAI22X1 U1450 ( .A(n317), .B(n1347), .C(n322), .D(n1345), .Y(n1349) );
  NOR2X1 U1451 ( .A(n1350), .B(n1349), .Y(n1351) );
  NAND3X1 U1452 ( .A(n1353), .B(n1352), .C(n1351), .Y(n1354) );
  OR2X2 U1453 ( .A(n1355), .B(n1354), .Y(r1_data[15]) );
  INVX2 U1454 ( .A(n999), .Y(n1358) );
  INVX2 U1455 ( .A(n1018), .Y(n1359) );
  INVX2 U1456 ( .A(n1037), .Y(n1360) );
  INVX2 U1457 ( .A(n1135), .Y(n1365) );
  INVX2 U1458 ( .A(n1000), .Y(n1366) );
  INVX2 U1459 ( .A(n1019), .Y(n1367) );
  INVX2 U1460 ( .A(n1038), .Y(n1368) );
  INVX2 U1461 ( .A(n1136), .Y(n1373) );
  INVX2 U1462 ( .A(n1001), .Y(n1374) );
  INVX2 U1463 ( .A(n1020), .Y(n1375) );
  INVX2 U1464 ( .A(n1039), .Y(n1376) );
  INVX2 U1465 ( .A(n1137), .Y(n1381) );
  INVX2 U1466 ( .A(n997), .Y(n1382) );
  INVX2 U1467 ( .A(n1016), .Y(n1383) );
  INVX2 U1468 ( .A(n1035), .Y(n1384) );
  INVX2 U1469 ( .A(n1134), .Y(n1389) );
  INVX2 U1470 ( .A(n1003), .Y(n1390) );
  INVX2 U1471 ( .A(n1022), .Y(n1391) );
  INVX2 U1472 ( .A(n1041), .Y(n1392) );
  INVX2 U1473 ( .A(n1139), .Y(n1397) );
  INVX2 U1474 ( .A(n1004), .Y(n1398) );
  INVX2 U1475 ( .A(n1023), .Y(n1399) );
  INVX2 U1476 ( .A(n1042), .Y(n1400) );
  INVX2 U1477 ( .A(n1140), .Y(n1405) );
  INVX2 U1478 ( .A(n987), .Y(n1406) );
  INVX2 U1479 ( .A(n1005), .Y(n1407) );
  INVX2 U1480 ( .A(n1024), .Y(n1408) );
  INVX2 U1481 ( .A(n1043), .Y(n1409) );
  INVX2 U1482 ( .A(n1002), .Y(n1414) );
  INVX2 U1483 ( .A(n1021), .Y(n1415) );
  INVX2 U1484 ( .A(n1040), .Y(n1416) );
  INVX2 U1485 ( .A(n1138), .Y(n1421) );
  INVX2 U1486 ( .A(n990), .Y(n1422) );
  INVX2 U1487 ( .A(n1007), .Y(n1423) );
  INVX2 U1488 ( .A(n1026), .Y(n1424) );
  INVX2 U1489 ( .A(n1045), .Y(n1425) );
  INVX2 U1490 ( .A(n991), .Y(n1430) );
  INVX2 U1491 ( .A(n1008), .Y(n1431) );
  INVX2 U1492 ( .A(n1027), .Y(n1432) );
  INVX2 U1493 ( .A(n1046), .Y(n1433) );
  INVX2 U1494 ( .A(n992), .Y(n1438) );
  INVX2 U1495 ( .A(n1009), .Y(n1439) );
  INVX2 U1496 ( .A(n1028), .Y(n1440) );
  INVX2 U1497 ( .A(n1047), .Y(n1441) );
  INVX2 U1498 ( .A(n989), .Y(n1446) );
  INVX2 U1499 ( .A(n1006), .Y(n1447) );
  INVX2 U1500 ( .A(n1025), .Y(n1448) );
  INVX2 U1501 ( .A(n1044), .Y(n1449) );
  INVX2 U1502 ( .A(n994), .Y(n1454) );
  INVX2 U1503 ( .A(n1011), .Y(n1455) );
  INVX2 U1504 ( .A(n1030), .Y(n1456) );
  INVX2 U1505 ( .A(n1049), .Y(n1457) );
  INVX2 U1506 ( .A(n995), .Y(n1462) );
  INVX2 U1507 ( .A(n1012), .Y(n1463) );
  INVX2 U1508 ( .A(n1031), .Y(n1464) );
  INVX2 U1509 ( .A(n1050), .Y(n1465) );
  INVX2 U1510 ( .A(n996), .Y(n1470) );
  INVX2 U1511 ( .A(n1013), .Y(n1471) );
  INVX2 U1512 ( .A(n1032), .Y(n1472) );
  INVX2 U1513 ( .A(n1051), .Y(n1473) );
  INVX2 U1514 ( .A(n993), .Y(n1478) );
  INVX2 U1515 ( .A(n1010), .Y(n1479) );
  INVX2 U1516 ( .A(n1029), .Y(n1480) );
  INVX2 U1517 ( .A(n1048), .Y(n1481) );
  INVX2 U1518 ( .A(w_en), .Y(n1486) );
endmodule


module scalable_cla_block_CLA_BLK_SIZE_BITS4_3 ( A, B, Cin, S, PG, GG );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output PG, GG;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39;

  INVX2 U1 ( .A(A[2]), .Y(n10) );
  BUFX4 U2 ( .A(B[3]), .Y(n1) );
  OR2X2 U3 ( .A(A[2]), .B(B[2]), .Y(n34) );
  BUFX2 U4 ( .A(A[0]), .Y(n2) );
  AND2X2 U5 ( .A(n12), .B(n11), .Y(n3) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  BUFX2 U7 ( .A(B[0]), .Y(n4) );
  XNOR2X1 U8 ( .A(Cin), .B(n5), .Y(S[0]) );
  XNOR2X1 U9 ( .A(B[0]), .B(n2), .Y(n5) );
  BUFX2 U10 ( .A(A[3]), .Y(n6) );
  INVX2 U11 ( .A(A[3]), .Y(n12) );
  INVX2 U12 ( .A(B[3]), .Y(n11) );
  NAND2X1 U13 ( .A(n11), .B(n12), .Y(n16) );
  INVX2 U14 ( .A(B[2]), .Y(n7) );
  NAND2X1 U15 ( .A(n10), .B(n7), .Y(n9) );
  AND2X2 U16 ( .A(A[1]), .B(B[1]), .Y(n8) );
  NAND3X1 U17 ( .A(n16), .B(n9), .C(n8), .Y(n21) );
  AND2X2 U18 ( .A(A[0]), .B(B[0]), .Y(n15) );
  NAND2X1 U19 ( .A(n10), .B(n7), .Y(n14) );
  AOI21X1 U20 ( .A(n29), .B(n28), .C(n3), .Y(n13) );
  NAND3X1 U21 ( .A(n14), .B(n15), .C(n13), .Y(n20) );
  NAND3X1 U22 ( .A(A[2]), .B(B[2]), .C(n16), .Y(n18) );
  NAND2X1 U23 ( .A(n1), .B(n6), .Y(n17) );
  AND2X2 U24 ( .A(n18), .B(n17), .Y(n19) );
  NAND3X1 U25 ( .A(n20), .B(n21), .C(n19), .Y(GG) );
  INVX2 U26 ( .A(B[1]), .Y(n29) );
  INVX2 U27 ( .A(A[1]), .Y(n28) );
  NAND2X1 U28 ( .A(n29), .B(n28), .Y(n30) );
  NAND3X1 U29 ( .A(n30), .B(n34), .C(n22), .Y(n23) );
  INVX2 U30 ( .A(n23), .Y(PG) );
  XOR2X1 U31 ( .A(A[1]), .B(n29), .Y(n26) );
  OAI21X1 U32 ( .A(n4), .B(n2), .C(Cin), .Y(n25) );
  NAND2X1 U33 ( .A(B[0]), .B(A[0]), .Y(n24) );
  AND2X2 U34 ( .A(n25), .B(n24), .Y(n27) );
  XOR2X1 U35 ( .A(n26), .B(n27), .Y(S[1]) );
  NAND2X1 U36 ( .A(A[2]), .B(B[2]), .Y(n35) );
  NAND2X1 U37 ( .A(n35), .B(n34), .Y(n33) );
  OAI21X1 U38 ( .A(n29), .B(n28), .C(n27), .Y(n31) );
  NAND2X1 U39 ( .A(n31), .B(n30), .Y(n36) );
  INVX2 U40 ( .A(n36), .Y(n32) );
  XNOR2X1 U41 ( .A(n33), .B(n32), .Y(S[2]) );
  INVX2 U42 ( .A(n34), .Y(n37) );
  OAI21X1 U43 ( .A(n37), .B(n36), .C(n35), .Y(n39) );
  XOR2X1 U44 ( .A(n6), .B(n1), .Y(n38) );
  XOR2X1 U45 ( .A(n39), .B(n38), .Y(S[3]) );
endmodule


module scalable_cla_block_CLA_BLK_SIZE_BITS4_2 ( A, B, Cin, S, PG, GG );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output PG, GG;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;

  OR2X2 U1 ( .A(A[0]), .B(B[0]), .Y(n23) );
  INVX1 U2 ( .A(n40), .Y(n1) );
  XNOR2X1 U3 ( .A(n34), .B(n2), .Y(S[2]) );
  AND2X2 U4 ( .A(n48), .B(n46), .Y(n2) );
  INVX1 U5 ( .A(n12), .Y(n3) );
  BUFX2 U6 ( .A(n48), .Y(n4) );
  OR2X2 U7 ( .A(B[1]), .B(A[1]), .Y(n47) );
  INVX2 U8 ( .A(A[1]), .Y(n5) );
  INVX2 U9 ( .A(A[3]), .Y(n12) );
  INVX1 U10 ( .A(n46), .Y(n52) );
  NOR2X1 U11 ( .A(B[3]), .B(A[3]), .Y(n6) );
  NOR2X1 U12 ( .A(A[3]), .B(B[3]), .Y(n7) );
  NAND2X1 U13 ( .A(n30), .B(n5), .Y(n8) );
  XNOR2X1 U14 ( .A(n49), .B(n4), .Y(n50) );
  XNOR2X1 U15 ( .A(n44), .B(n21), .Y(S[0]) );
  BUFX4 U16 ( .A(A[1]), .Y(n9) );
  INVX4 U17 ( .A(B[1]), .Y(n30) );
  INVX2 U18 ( .A(B[3]), .Y(n35) );
  NAND2X1 U19 ( .A(n35), .B(n12), .Y(n19) );
  OAI21X1 U20 ( .A(n9), .B(B[1]), .C(n19), .Y(n18) );
  INVX2 U21 ( .A(A[2]), .Y(n11) );
  INVX2 U22 ( .A(B[2]), .Y(n10) );
  NAND2X1 U23 ( .A(n11), .B(n10), .Y(n46) );
  NAND3X1 U24 ( .A(B[0]), .B(A[0]), .C(n46), .Y(n17) );
  AOI21X1 U25 ( .A(n11), .B(n10), .C(n7), .Y(n15) );
  NOR2X1 U26 ( .A(n30), .B(n5), .Y(n14) );
  NAND2X1 U27 ( .A(A[2]), .B(B[2]), .Y(n48) );
  OAI22X1 U28 ( .A(n6), .B(n48), .C(n35), .D(n12), .Y(n13) );
  AOI21X1 U29 ( .A(n15), .B(n14), .C(n13), .Y(n16) );
  OAI21X1 U30 ( .A(n18), .B(n17), .C(n16), .Y(GG) );
  NAND3X1 U31 ( .A(n47), .B(n46), .C(n19), .Y(n20) );
  INVX2 U32 ( .A(n20), .Y(PG) );
  XOR2X1 U33 ( .A(A[0]), .B(B[0]), .Y(n21) );
  INVX2 U34 ( .A(n23), .Y(n45) );
  XOR2X1 U35 ( .A(n30), .B(n9), .Y(n24) );
  NAND2X1 U36 ( .A(B[0]), .B(A[0]), .Y(n29) );
  NAND2X1 U37 ( .A(n29), .B(n24), .Y(n22) );
  OAI21X1 U38 ( .A(n45), .B(n24), .C(n22), .Y(n28) );
  NAND3X1 U39 ( .A(n23), .B(Cin), .C(n24), .Y(n27) );
  INVX2 U40 ( .A(Cin), .Y(n44) );
  INVX2 U41 ( .A(n24), .Y(n25) );
  NAND3X1 U42 ( .A(n29), .B(n44), .C(n25), .Y(n26) );
  NAND3X1 U43 ( .A(n26), .B(n27), .C(n28), .Y(S[1]) );
  OAI21X1 U44 ( .A(n5), .B(n30), .C(n29), .Y(n39) );
  INVX2 U45 ( .A(n8), .Y(n32) );
  INVX2 U46 ( .A(n39), .Y(n40) );
  NAND2X1 U47 ( .A(n45), .B(n40), .Y(n36) );
  INVX2 U48 ( .A(n36), .Y(n31) );
  NOR2X1 U49 ( .A(n32), .B(n31), .Y(n33) );
  OAI21X1 U50 ( .A(Cin), .B(n1), .C(n33), .Y(n34) );
  XOR2X1 U51 ( .A(n35), .B(n3), .Y(n42) );
  INVX2 U52 ( .A(n42), .Y(n49) );
  NAND3X1 U53 ( .A(n8), .B(n46), .C(n36), .Y(n37) );
  NOR2X1 U54 ( .A(n49), .B(n37), .Y(n38) );
  OAI21X1 U55 ( .A(Cin), .B(n39), .C(n38), .Y(n55) );
  NAND2X1 U56 ( .A(n40), .B(n4), .Y(n41) );
  NOR2X1 U57 ( .A(n42), .B(n41), .Y(n43) );
  OAI21X1 U58 ( .A(n45), .B(n44), .C(n43), .Y(n54) );
  NAND2X1 U59 ( .A(n49), .B(n8), .Y(n51) );
  OAI21X1 U60 ( .A(n52), .B(n51), .C(n50), .Y(n53) );
  NAND3X1 U61 ( .A(n53), .B(n54), .C(n55), .Y(S[3]) );
endmodule


module scalable_cla_block_CLA_BLK_SIZE_BITS4_1 ( A, B, Cin, S, PG, GG );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output PG, GG;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68;

  AND2X1 U1 ( .A(n56), .B(n6), .Y(n2) );
  AND2X2 U2 ( .A(n50), .B(n18), .Y(n1) );
  AND2X2 U3 ( .A(n50), .B(n18), .Y(n8) );
  INVX2 U4 ( .A(A[1]), .Y(n23) );
  INVX2 U5 ( .A(n48), .Y(n4) );
  INVX1 U6 ( .A(n26), .Y(n22) );
  INVX1 U7 ( .A(n45), .Y(n62) );
  AND2X1 U8 ( .A(n68), .B(n67), .Y(n3) );
  XNOR2X1 U9 ( .A(n49), .B(n4), .Y(S[2]) );
  BUFX2 U10 ( .A(n60), .Y(n5) );
  OR2X2 U11 ( .A(A[2]), .B(B[2]), .Y(n6) );
  NAND2X1 U12 ( .A(B[2]), .B(n14), .Y(n7) );
  NAND3X1 U13 ( .A(n42), .B(n41), .C(n43), .Y(S[1]) );
  INVX1 U14 ( .A(n46), .Y(n9) );
  BUFX2 U15 ( .A(n6), .Y(n10) );
  INVX1 U16 ( .A(n50), .Y(n11) );
  NAND2X1 U17 ( .A(B[0]), .B(A[0]), .Y(n12) );
  OR2X2 U18 ( .A(A[1]), .B(B[1]), .Y(n56) );
  INVX1 U19 ( .A(A[2]), .Y(n13) );
  INVX1 U20 ( .A(n13), .Y(n14) );
  INVX1 U21 ( .A(n44), .Y(n19) );
  INVX4 U22 ( .A(A[3]), .Y(n50) );
  NAND2X1 U23 ( .A(n24), .B(n29), .Y(n16) );
  NAND2X1 U24 ( .A(n27), .B(n15), .Y(n17) );
  NAND2X1 U25 ( .A(n17), .B(n16), .Y(S[0]) );
  INVX1 U26 ( .A(n29), .Y(n15) );
  NAND2X1 U27 ( .A(n3), .B(n66), .Y(S[3]) );
  INVX2 U28 ( .A(B[3]), .Y(n18) );
  INVX2 U29 ( .A(n19), .Y(n20) );
  OR2X2 U30 ( .A(A[0]), .B(B[0]), .Y(n45) );
  INVX2 U31 ( .A(n30), .Y(n27) );
  INVX1 U32 ( .A(n23), .Y(n21) );
  BUFX4 U33 ( .A(B[1]), .Y(n26) );
  INVX2 U34 ( .A(n64), .Y(n30) );
  INVX1 U35 ( .A(n64), .Y(n24) );
  BUFX2 U36 ( .A(B[3]), .Y(n25) );
  NOR2X1 U37 ( .A(n45), .B(n60), .Y(n28) );
  XNOR2X1 U38 ( .A(A[0]), .B(B[0]), .Y(n29) );
  INVX1 U39 ( .A(n56), .Y(n46) );
  NAND2X1 U40 ( .A(n50), .B(n18), .Y(n32) );
  NAND2X1 U41 ( .A(B[0]), .B(A[0]), .Y(n44) );
  NOR2X1 U42 ( .A(n1), .B(n44), .Y(n34) );
  NAND2X1 U43 ( .A(n56), .B(n6), .Y(n37) );
  NAND2X1 U44 ( .A(B[2]), .B(n14), .Y(n53) );
  NAND3X1 U45 ( .A(n6), .B(n21), .C(n26), .Y(n31) );
  NAND2X1 U46 ( .A(n31), .B(n53), .Y(n33) );
  AOI22X1 U47 ( .A(n34), .B(n2), .C(n33), .D(n32), .Y(n36) );
  NAND2X1 U48 ( .A(n25), .B(n11), .Y(n35) );
  NAND2X1 U49 ( .A(n35), .B(n36), .Y(GG) );
  NOR2X1 U50 ( .A(n8), .B(n37), .Y(PG) );
  XOR2X1 U51 ( .A(n23), .B(n26), .Y(n39) );
  NAND3X1 U52 ( .A(n39), .B(n45), .C(n30), .Y(n43) );
  OAI21X1 U53 ( .A(n39), .B(n45), .C(n12), .Y(n38) );
  OAI21X1 U54 ( .A(n39), .B(n20), .C(n38), .Y(n42) );
  INVX2 U55 ( .A(n39), .Y(n40) );
  INVX2 U56 ( .A(Cin), .Y(n64) );
  NAND3X1 U57 ( .A(n40), .B(n20), .C(n27), .Y(n41) );
  OAI21X1 U58 ( .A(n23), .B(n22), .C(n12), .Y(n60) );
  NOR2X1 U59 ( .A(n28), .B(n46), .Y(n47) );
  OAI21X1 U60 ( .A(Cin), .B(n5), .C(n47), .Y(n49) );
  NAND2X1 U61 ( .A(n10), .B(n7), .Y(n48) );
  XOR2X1 U62 ( .A(n50), .B(n25), .Y(n54) );
  NAND3X1 U63 ( .A(n54), .B(n9), .C(n10), .Y(n61) );
  INVX2 U64 ( .A(n61), .Y(n52) );
  INVX2 U65 ( .A(n54), .Y(n55) );
  NAND2X1 U66 ( .A(n55), .B(n7), .Y(n59) );
  INVX2 U67 ( .A(n59), .Y(n51) );
  AOI22X1 U68 ( .A(n52), .B(n60), .C(n28), .D(n51), .Y(n68) );
  XOR2X1 U69 ( .A(n54), .B(n7), .Y(n58) );
  NAND3X1 U70 ( .A(n9), .B(n10), .C(n55), .Y(n57) );
  NAND2X1 U71 ( .A(n58), .B(n57), .Y(n67) );
  NOR2X1 U72 ( .A(n5), .B(n59), .Y(n65) );
  NOR2X1 U73 ( .A(n62), .B(n61), .Y(n63) );
  AOI22X1 U74 ( .A(n65), .B(n27), .C(n24), .D(n63), .Y(n66) );
endmodule


module scalable_cla_block_CLA_BLK_SIZE_BITS4_0 ( A, B, Cin, S, PG, GG );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;
  output PG, GG;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  INVX1 U1 ( .A(A[1]), .Y(n8) );
  AND2X2 U2 ( .A(n15), .B(n21), .Y(n1) );
  INVX2 U3 ( .A(Cin), .Y(n5) );
  XNOR2X1 U4 ( .A(Cin), .B(n2), .Y(S[0]) );
  XNOR2X1 U5 ( .A(B[0]), .B(n3), .Y(n2) );
  BUFX2 U6 ( .A(A[0]), .Y(n3) );
  AND2X2 U7 ( .A(n21), .B(n22), .Y(n4) );
  INVX1 U8 ( .A(n4), .Y(n48) );
  INVX1 U9 ( .A(Cin), .Y(n49) );
  INVX1 U10 ( .A(n32), .Y(n38) );
  AND2X2 U11 ( .A(n32), .B(n39), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n24) );
  OR2X2 U13 ( .A(A[0]), .B(B[0]), .Y(n23) );
  INVX1 U14 ( .A(n21), .Y(n16) );
  AND2X1 U15 ( .A(n54), .B(n53), .Y(n7) );
  XNOR2X1 U16 ( .A(n41), .B(n40), .Y(n42) );
  OR2X2 U17 ( .A(A[2]), .B(B[2]), .Y(n34) );
  NAND2X1 U18 ( .A(n7), .B(n52), .Y(S[3]) );
  INVX2 U19 ( .A(B[3]), .Y(n33) );
  INVX2 U20 ( .A(A[3]), .Y(n13) );
  INVX2 U21 ( .A(B[1]), .Y(n14) );
  NAND2X1 U22 ( .A(n14), .B(n8), .Y(n39) );
  NAND2X1 U23 ( .A(n33), .B(n13), .Y(n10) );
  NAND3X1 U24 ( .A(n39), .B(n34), .C(n10), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(PG) );
  NAND2X1 U26 ( .A(B[0]), .B(A[0]), .Y(n21) );
  INVX2 U27 ( .A(n34), .Y(n44) );
  NAND2X1 U28 ( .A(A[1]), .B(B[1]), .Y(n22) );
  NAND2X1 U29 ( .A(B[2]), .B(A[2]), .Y(n40) );
  OAI21X1 U30 ( .A(n44), .B(n22), .C(n40), .Y(n11) );
  AOI22X1 U31 ( .A(PG), .B(n16), .C(n11), .D(n10), .Y(n12) );
  OAI21X1 U32 ( .A(n33), .B(n13), .C(n12), .Y(GG) );
  XOR2X1 U33 ( .A(n14), .B(A[1]), .Y(n17) );
  INVX2 U34 ( .A(n17), .Y(n15) );
  NAND2X1 U35 ( .A(n49), .B(n1), .Y(n20) );
  AOI22X1 U36 ( .A(n16), .B(n17), .C(n1), .D(n46), .Y(n19) );
  NAND3X1 U37 ( .A(Cin), .B(n23), .C(n17), .Y(n18) );
  NAND3X1 U38 ( .A(n19), .B(n20), .C(n18), .Y(S[1]) );
  NAND2X1 U39 ( .A(n40), .B(n34), .Y(n27) );
  INVX2 U40 ( .A(n27), .Y(n28) );
  INVX2 U41 ( .A(n23), .Y(n46) );
  NAND2X1 U42 ( .A(n46), .B(n4), .Y(n32) );
  OAI21X1 U43 ( .A(n4), .B(n28), .C(n6), .Y(n26) );
  NAND2X1 U44 ( .A(n24), .B(n27), .Y(n25) );
  NAND2X1 U45 ( .A(n26), .B(n25), .Y(n31) );
  NAND3X1 U46 ( .A(Cin), .B(n6), .C(n27), .Y(n30) );
  NAND3X1 U47 ( .A(n4), .B(n5), .C(n28), .Y(n29) );
  NAND3X1 U48 ( .A(n31), .B(n30), .C(n29), .Y(S[2]) );
  XOR2X1 U49 ( .A(n33), .B(A[3]), .Y(n35) );
  INVX2 U50 ( .A(n35), .Y(n41) );
  NAND2X1 U51 ( .A(n40), .B(n41), .Y(n47) );
  INVX2 U52 ( .A(n47), .Y(n37) );
  NAND3X1 U53 ( .A(n35), .B(n39), .C(n34), .Y(n45) );
  INVX2 U54 ( .A(n45), .Y(n36) );
  AOI22X1 U55 ( .A(n38), .B(n37), .C(n36), .D(n48), .Y(n54) );
  NAND2X1 U56 ( .A(n41), .B(n39), .Y(n43) );
  OAI21X1 U57 ( .A(n44), .B(n43), .C(n42), .Y(n53) );
  NOR2X1 U58 ( .A(n46), .B(n45), .Y(n51) );
  NOR2X1 U59 ( .A(n48), .B(n47), .Y(n50) );
  AOI22X1 U60 ( .A(Cin), .B(n51), .C(n5), .D(n50), .Y(n52) );
endmodule


module scalable_cla_addr_NUM_CLA_BLKS4_CLA_BLK_SIZE_BITS4 ( A, B, Cin, S, V );
  input [15:0] A;
  input [15:0] B;
  output [15:0] S;
  input Cin;
  output V;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [3:0] gg_vector;
  wire   [3:0] pg_vector;

  scalable_cla_block_CLA_BLK_SIZE_BITS4_3 CLA_BLK_0 ( .A(A[3:0]), .B(B[3:0]), 
        .Cin(Cin), .S(S[3:0]), .PG(pg_vector[0]), .GG(gg_vector[0]) );
  scalable_cla_block_CLA_BLK_SIZE_BITS4_2 CLA_BLK_1 ( .A(A[7:4]), .B(B[7:4]), 
        .Cin(n16), .S(S[7:4]), .PG(pg_vector[1]), .GG(gg_vector[1]) );
  scalable_cla_block_CLA_BLK_SIZE_BITS4_1 CLA_BLK_2 ( .A(A[11:8]), .B(B[11:8]), 
        .Cin(n17), .S(S[11:8]), .PG(pg_vector[2]), .GG(gg_vector[2]) );
  scalable_cla_block_CLA_BLK_SIZE_BITS4_0 CLA_BLK_3 ( .A(A[15:12]), .B(
        B[15:12]), .Cin(n7), .S(S[15:12]), .PG(pg_vector[3]), .GG(gg_vector[3]) );
  AND2X2 U1 ( .A(pg_vector[1]), .B(pg_vector[2]), .Y(n8) );
  INVX1 U2 ( .A(pg_vector[3]), .Y(n2) );
  OAI21X1 U3 ( .A(n2), .B(n4), .C(n3), .Y(V) );
  INVX2 U4 ( .A(gg_vector[3]), .Y(n3) );
  INVX1 U5 ( .A(n7), .Y(n4) );
  AND2X1 U6 ( .A(gg_vector[1]), .B(pg_vector[2]), .Y(n5) );
  NOR2X1 U7 ( .A(n5), .B(gg_vector[2]), .Y(n10) );
  AND2X2 U8 ( .A(n10), .B(n9), .Y(n6) );
  INVX4 U9 ( .A(n6), .Y(n7) );
  INVX1 U10 ( .A(pg_vector[1]), .Y(n13) );
  NAND2X1 U11 ( .A(pg_vector[0]), .B(Cin), .Y(n14) );
  INVX2 U12 ( .A(n14), .Y(n11) );
  OAI21X1 U13 ( .A(gg_vector[0]), .B(n11), .C(n8), .Y(n9) );
  INVX2 U14 ( .A(gg_vector[0]), .Y(n15) );
  AOI21X1 U15 ( .A(n11), .B(pg_vector[1]), .C(gg_vector[1]), .Y(n12) );
  OAI21X1 U16 ( .A(n13), .B(n15), .C(n12), .Y(n17) );
  NAND2X1 U17 ( .A(n14), .B(n15), .Y(n16) );
endmodule


module alu_DATA_SIZE_BITS16 ( A, B, alu_op, result, overflow );
  input [15:0] A;
  input [15:0] B;
  output [15:0] result;
  input alu_op;
  output overflow;
  wire   int_V, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47;
  wire   [15:0] int_A;
  wire   [15:0] int_B;
  wire   [15:0] int_S;

  scalable_cla_addr_NUM_CLA_BLKS4_CLA_BLK_SIZE_BITS4 CLA_ADDR ( .A(int_A), .B(
        int_B), .Cin(1'b0), .S(int_S), .V(int_V) );
  INVX1 U2 ( .A(n40), .Y(result[7]) );
  NAND2X1 U3 ( .A(A[15]), .B(n27), .Y(n1) );
  INVX4 U4 ( .A(alu_op), .Y(n20) );
  INVX2 U5 ( .A(n27), .Y(n8) );
  INVX1 U6 ( .A(n45), .Y(result[12]) );
  MUX2X1 U7 ( .B(int_S[5]), .A(n18), .S(n27), .Y(n38) );
  INVX1 U8 ( .A(n37), .Y(result[4]) );
  BUFX2 U9 ( .A(A[1]), .Y(n2) );
  OAI21X1 U10 ( .A(n27), .B(n3), .C(n1), .Y(result[15]) );
  INVX2 U11 ( .A(int_S[15]), .Y(n3) );
  INVX1 U12 ( .A(n42), .Y(result[9]) );
  BUFX2 U13 ( .A(A[3]), .Y(n4) );
  INVX1 U14 ( .A(n39), .Y(result[6]) );
  AND2X2 U15 ( .A(n27), .B(A[10]), .Y(n15) );
  INVX1 U16 ( .A(n47), .Y(result[14]) );
  INVX8 U17 ( .A(n19), .Y(n25) );
  INVX1 U18 ( .A(n41), .Y(result[8]) );
  AND2X2 U19 ( .A(A[5]), .B(n9), .Y(int_A[5]) );
  INVX1 U20 ( .A(A[5]), .Y(n28) );
  BUFX2 U21 ( .A(A[7]), .Y(n5) );
  BUFX2 U22 ( .A(A[9]), .Y(n6) );
  BUFX2 U23 ( .A(A[6]), .Y(n7) );
  INVX1 U24 ( .A(n46), .Y(result[13]) );
  INVX1 U25 ( .A(n26), .Y(n16) );
  INVX1 U26 ( .A(n24), .Y(n11) );
  AND2X2 U27 ( .A(n10), .B(A[7]), .Y(int_A[7]) );
  INVX1 U28 ( .A(n19), .Y(n24) );
  INVX1 U29 ( .A(n25), .Y(n10) );
  INVX1 U30 ( .A(n24), .Y(n13) );
  INVX1 U31 ( .A(n24), .Y(n12) );
  INVX1 U32 ( .A(n26), .Y(n9) );
  INVX1 U33 ( .A(n27), .Y(n17) );
  INVX2 U34 ( .A(n26), .Y(n21) );
  AND2X2 U35 ( .A(n8), .B(A[2]), .Y(int_A[2]) );
  AND2X2 U36 ( .A(n8), .B(A[4]), .Y(int_A[4]) );
  AND2X2 U37 ( .A(n9), .B(A[8]), .Y(int_A[8]) );
  AND2X2 U38 ( .A(A[9]), .B(n10), .Y(int_A[9]) );
  AND2X2 U39 ( .A(A[10]), .B(n11), .Y(int_A[10]) );
  AND2X2 U40 ( .A(n12), .B(A[0]), .Y(int_A[0]) );
  AND2X2 U41 ( .A(A[11]), .B(n13), .Y(int_A[11]) );
  AND2X2 U42 ( .A(A[11]), .B(n27), .Y(n14) );
  AND2X2 U43 ( .A(n16), .B(A[6]), .Y(int_A[6]) );
  AND2X2 U44 ( .A(A[3]), .B(n17), .Y(int_A[3]) );
  AND2X2 U45 ( .A(n17), .B(A[1]), .Y(int_A[1]) );
  INVX1 U46 ( .A(n24), .Y(n23) );
  INVX1 U47 ( .A(n44), .Y(result[11]) );
  INVX1 U48 ( .A(n28), .Y(n18) );
  INVX8 U49 ( .A(n20), .Y(n19) );
  INVX8 U50 ( .A(n25), .Y(n22) );
  INVX4 U51 ( .A(n19), .Y(n26) );
  INVX4 U52 ( .A(n19), .Y(n27) );
  AND2X2 U53 ( .A(B[0]), .B(n22), .Y(int_B[0]) );
  AND2X2 U54 ( .A(B[1]), .B(n22), .Y(int_B[1]) );
  AND2X2 U55 ( .A(B[2]), .B(n23), .Y(int_B[2]) );
  AND2X2 U56 ( .A(B[3]), .B(n22), .Y(int_B[3]) );
  AND2X2 U57 ( .A(B[4]), .B(n22), .Y(int_B[4]) );
  AND2X2 U58 ( .A(B[5]), .B(n22), .Y(int_B[5]) );
  AND2X2 U59 ( .A(B[6]), .B(n22), .Y(int_B[6]) );
  AND2X2 U60 ( .A(n22), .B(B[7]), .Y(int_B[7]) );
  AND2X2 U61 ( .A(B[8]), .B(n22), .Y(int_B[8]) );
  AND2X2 U62 ( .A(B[9]), .B(n22), .Y(int_B[9]) );
  AND2X2 U63 ( .A(B[10]), .B(n22), .Y(int_B[10]) );
  AND2X2 U64 ( .A(B[11]), .B(n22), .Y(int_B[11]) );
  AND2X2 U65 ( .A(B[12]), .B(n22), .Y(int_B[12]) );
  AND2X2 U66 ( .A(B[13]), .B(n22), .Y(int_B[13]) );
  AND2X2 U67 ( .A(B[14]), .B(n22), .Y(int_B[14]) );
  AND2X2 U68 ( .A(B[15]), .B(n22), .Y(int_B[15]) );
  INVX2 U69 ( .A(A[12]), .Y(n29) );
  NOR2X1 U70 ( .A(n25), .B(n29), .Y(int_A[12]) );
  INVX2 U71 ( .A(A[13]), .Y(n30) );
  NOR2X1 U72 ( .A(n25), .B(n30), .Y(int_A[13]) );
  INVX2 U73 ( .A(A[14]), .Y(n31) );
  NOR2X1 U74 ( .A(n25), .B(n31), .Y(int_A[14]) );
  INVX2 U75 ( .A(A[15]), .Y(n32) );
  NOR2X1 U76 ( .A(n32), .B(n24), .Y(int_A[15]) );
  AND2X2 U77 ( .A(int_V), .B(n22), .Y(overflow) );
  MUX2X1 U78 ( .B(A[0]), .A(int_S[0]), .S(n21), .Y(n33) );
  INVX2 U79 ( .A(n33), .Y(result[0]) );
  MUX2X1 U80 ( .B(n2), .A(int_S[1]), .S(n21), .Y(n34) );
  INVX2 U81 ( .A(n34), .Y(result[1]) );
  MUX2X1 U82 ( .B(A[2]), .A(int_S[2]), .S(n21), .Y(n35) );
  INVX2 U83 ( .A(n35), .Y(result[2]) );
  MUX2X1 U84 ( .B(n4), .A(int_S[3]), .S(n21), .Y(n36) );
  INVX2 U85 ( .A(n36), .Y(result[3]) );
  MUX2X1 U86 ( .B(A[4]), .A(int_S[4]), .S(n21), .Y(n37) );
  INVX2 U87 ( .A(n38), .Y(result[5]) );
  MUX2X1 U88 ( .B(n7), .A(int_S[6]), .S(n21), .Y(n39) );
  MUX2X1 U89 ( .B(n5), .A(int_S[7]), .S(n21), .Y(n40) );
  MUX2X1 U90 ( .B(A[8]), .A(int_S[8]), .S(n21), .Y(n41) );
  MUX2X1 U91 ( .B(n6), .A(int_S[9]), .S(n21), .Y(n42) );
  OAI22X1 U92 ( .A(n15), .B(int_S[10]), .C(n22), .D(n15), .Y(n43) );
  INVX2 U93 ( .A(n43), .Y(result[10]) );
  OAI22X1 U94 ( .A(n22), .B(n14), .C(n14), .D(int_S[11]), .Y(n44) );
  MUX2X1 U95 ( .B(A[12]), .A(int_S[12]), .S(n21), .Y(n45) );
  MUX2X1 U96 ( .B(A[13]), .A(int_S[13]), .S(n21), .Y(n46) );
  MUX2X1 U97 ( .B(A[14]), .A(int_S[14]), .S(n21), .Y(n47) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data, outreg_data, 
        overflow );
  input [1:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data;
  output [15:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   int_w_data_sel, int_w_en, int_alu_op, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [15:0] int_src1_data;
  wire   [15:0] int_src2_data;
  wire   [15:0] int_result;

  datapath_ctrl DP_CTRL ( .op(op), .w_data_sel(int_w_data_sel), .w_en(int_w_en), .alu_op(int_alu_op) );
  regfile_NUM_REG_ADDR_BITS4_REG_SIZE_BITS16 REG_FILE ( .clk(clk), .n_reset(
        n_reset), .w_sel(dest), .r1_sel(src1), .r2_sel(src2), .w_data({n33, 
        n32, n31, n34, n29, n28, n27, n30, n25, n24, n23, n26, n21, n20, n19, 
        n22}), .w_en(int_w_en), .r1_data(int_src1_data), .r2_data(
        int_src2_data), .outreg_data(outreg_data) );
  alu_DATA_SIZE_BITS16 ALU_MAP ( .A(int_src1_data), .B(int_src2_data), 
        .alu_op(int_alu_op), .result(int_result), .overflow(overflow) );
  INVX2 U1 ( .A(int_w_data_sel), .Y(n1) );
  INVX4 U2 ( .A(n13), .Y(n28) );
  INVX4 U3 ( .A(n12), .Y(n27) );
  INVX4 U4 ( .A(n8), .Y(n23) );
  INVX4 U5 ( .A(n7), .Y(n26) );
  INVX4 U6 ( .A(n10), .Y(n25) );
  INVX4 U7 ( .A(n9), .Y(n24) );
  INVX4 U8 ( .A(n15), .Y(n34) );
  INVX2 U9 ( .A(n1), .Y(n2) );
  INVX4 U10 ( .A(n11), .Y(n30) );
  INVX4 U11 ( .A(n14), .Y(n29) );
  INVX4 U12 ( .A(n17), .Y(n32) );
  INVX4 U13 ( .A(n16), .Y(n31) );
  INVX4 U14 ( .A(n18), .Y(n33) );
  MUX2X1 U15 ( .B(ext_data[0]), .A(int_result[0]), .S(int_w_data_sel), .Y(n3)
         );
  INVX2 U16 ( .A(n3), .Y(n22) );
  MUX2X1 U17 ( .B(ext_data[1]), .A(int_result[1]), .S(int_w_data_sel), .Y(n4)
         );
  INVX2 U18 ( .A(n4), .Y(n19) );
  MUX2X1 U19 ( .B(ext_data[2]), .A(int_result[2]), .S(int_w_data_sel), .Y(n5)
         );
  INVX2 U20 ( .A(n5), .Y(n20) );
  MUX2X1 U21 ( .B(ext_data[3]), .A(int_result[3]), .S(int_w_data_sel), .Y(n6)
         );
  INVX2 U22 ( .A(n6), .Y(n21) );
  MUX2X1 U23 ( .B(ext_data[4]), .A(int_result[4]), .S(int_w_data_sel), .Y(n7)
         );
  MUX2X1 U24 ( .B(ext_data[5]), .A(int_result[5]), .S(int_w_data_sel), .Y(n8)
         );
  AOI22X1 U25 ( .A(int_result[6]), .B(n2), .C(ext_data[6]), .D(n1), .Y(n9) );
  AOI22X1 U26 ( .A(int_result[7]), .B(n2), .C(ext_data[7]), .D(n1), .Y(n10) );
  AOI22X1 U27 ( .A(int_result[8]), .B(n2), .C(ext_data[8]), .D(n1), .Y(n11) );
  AOI22X1 U28 ( .A(int_result[9]), .B(n2), .C(ext_data[9]), .D(n1), .Y(n12) );
  AOI22X1 U29 ( .A(ext_data[10]), .B(n1), .C(int_result[10]), .D(n2), .Y(n13)
         );
  AOI22X1 U30 ( .A(ext_data[11]), .B(n1), .C(int_result[11]), .D(n2), .Y(n14)
         );
  AOI22X1 U31 ( .A(int_result[12]), .B(n2), .C(ext_data[12]), .D(n1), .Y(n15)
         );
  AOI22X1 U32 ( .A(int_result[13]), .B(n2), .C(ext_data[13]), .D(n1), .Y(n16)
         );
  AOI22X1 U33 ( .A(ext_data[14]), .B(n1), .C(int_result[14]), .D(n2), .Y(n17)
         );
  AOI22X1 U34 ( .A(ext_data[15]), .B(n1), .C(int_result[15]), .D(n2), .Y(n18)
         );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n17, n19,
         n20, n21, n22, n23, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n45, n47, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n99, n100, n101;

  XNOR2X1 U1 ( .A(n12), .B(n1), .Y(DIFF[9]) );
  NAND2X1 U2 ( .A(n11), .B(n100), .Y(n1) );
  NAND2X1 U5 ( .A(A[9]), .B(n53), .Y(n11) );
  XOR2X1 U6 ( .A(n15), .B(n2), .Y(DIFF[8]) );
  OAI21X1 U7 ( .A(n15), .B(n13), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n14), .B(n45), .Y(n2) );
  NOR2X1 U10 ( .A(A[8]), .B(n54), .Y(n13) );
  NAND2X1 U11 ( .A(A[8]), .B(n54), .Y(n14) );
  XNOR2X1 U12 ( .A(n20), .B(n3), .Y(DIFF[7]) );
  AOI21X1 U13 ( .A(n99), .B(n20), .C(n17), .Y(n15) );
  NAND2X1 U16 ( .A(n19), .B(n99), .Y(n3) );
  NAND2X1 U19 ( .A(A[7]), .B(n55), .Y(n19) );
  XOR2X1 U20 ( .A(n23), .B(n4), .Y(DIFF[6]) );
  OAI21X1 U21 ( .A(n23), .B(n21), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n22), .B(n47), .Y(n4) );
  NOR2X1 U24 ( .A(A[6]), .B(n56), .Y(n21) );
  NAND2X1 U25 ( .A(A[6]), .B(n56), .Y(n22) );
  XNOR2X1 U26 ( .A(n28), .B(n5), .Y(DIFF[5]) );
  AOI21X1 U27 ( .A(n101), .B(n28), .C(n25), .Y(n23) );
  NAND2X1 U30 ( .A(n27), .B(n101), .Y(n5) );
  NAND2X1 U33 ( .A(A[5]), .B(n57), .Y(n27) );
  XOR2X1 U34 ( .A(n31), .B(n6), .Y(DIFF[4]) );
  OAI21X1 U35 ( .A(n31), .B(n29), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n30), .B(n49), .Y(n6) );
  NOR2X1 U38 ( .A(A[4]), .B(n58), .Y(n29) );
  NAND2X1 U39 ( .A(A[4]), .B(n58), .Y(n30) );
  XNOR2X1 U40 ( .A(n36), .B(n7), .Y(DIFF[3]) );
  AOI21X1 U41 ( .A(n40), .B(n32), .C(n33), .Y(n31) );
  NOR2X1 U42 ( .A(n34), .B(n37), .Y(n32) );
  OAI21X1 U43 ( .A(n34), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U44 ( .A(n35), .B(n50), .Y(n7) );
  NOR2X1 U46 ( .A(A[3]), .B(n59), .Y(n34) );
  NAND2X1 U47 ( .A(A[3]), .B(n59), .Y(n35) );
  XOR2X1 U48 ( .A(n39), .B(n8), .Y(DIFF[2]) );
  OAI21X1 U49 ( .A(n39), .B(n37), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n38), .B(n51), .Y(n8) );
  NOR2X1 U52 ( .A(A[2]), .B(n60), .Y(n37) );
  NAND2X1 U53 ( .A(A[2]), .B(n60), .Y(n38) );
  XOR2X1 U54 ( .A(n9), .B(n43), .Y(DIFF[1]) );
  OAI21X1 U56 ( .A(n41), .B(n43), .C(n42), .Y(n40) );
  NAND2X1 U57 ( .A(n42), .B(n52), .Y(n9) );
  NOR2X1 U59 ( .A(A[1]), .B(n61), .Y(n41) );
  NAND2X1 U60 ( .A(A[1]), .B(n61), .Y(n42) );
  XNOR2X1 U61 ( .A(n62), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U62 ( .A(A[0]), .B(n62), .Y(n43) );
  OR2X2 U76 ( .A(A[7]), .B(n55), .Y(n99) );
  OR2X2 U77 ( .A(A[9]), .B(n53), .Y(n100) );
  OR2X2 U78 ( .A(A[5]), .B(n57), .Y(n101) );
  INVX2 U79 ( .A(B[0]), .Y(n62) );
  INVX2 U80 ( .A(B[1]), .Y(n61) );
  INVX2 U81 ( .A(B[2]), .Y(n60) );
  INVX2 U82 ( .A(B[3]), .Y(n59) );
  INVX2 U83 ( .A(B[4]), .Y(n58) );
  INVX2 U84 ( .A(B[5]), .Y(n57) );
  INVX2 U85 ( .A(B[6]), .Y(n56) );
  INVX2 U86 ( .A(B[7]), .Y(n55) );
  INVX2 U87 ( .A(B[8]), .Y(n54) );
  INVX2 U88 ( .A(B[9]), .Y(n53) );
  INVX2 U89 ( .A(n41), .Y(n52) );
  INVX2 U90 ( .A(n37), .Y(n51) );
  INVX2 U91 ( .A(n34), .Y(n50) );
  INVX2 U92 ( .A(n29), .Y(n49) );
  INVX2 U93 ( .A(n21), .Y(n47) );
  INVX2 U94 ( .A(n13), .Y(n45) );
  INVX2 U95 ( .A(n40), .Y(n39) );
  INVX2 U96 ( .A(n27), .Y(n25) );
  INVX2 U97 ( .A(n19), .Y(n17) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n1, n2, n3, n4, n6, n7, n8, n9, n10, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71;

  DFFSR \count_out_reg[0]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[9]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[2]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_58 ( .A(count_out), .SUM({N40, 
        N39, N38, N37, N36, N35, N34, N33, N32, N31}) );
  flex_counter_NUM_CNT_BITS10_DW01_sub_1 sub_49 ( .A(rollover_val), .B(
        count_out), .CI(1'b0), .DIFF({N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17}) );
  AND2X2 U15 ( .A(n53), .B(n52), .Y(n1) );
  INVX2 U16 ( .A(n2), .Y(n3) );
  NOR2X1 U17 ( .A(count_enable), .B(clear), .Y(n2) );
  INVX4 U18 ( .A(n70), .Y(n67) );
  INVX2 U19 ( .A(count_out[6]), .Y(n45) );
  INVX2 U20 ( .A(N26), .Y(n4) );
  NAND2X1 U21 ( .A(N17), .B(n4), .Y(n6) );
  NOR2X1 U22 ( .A(N25), .B(n6), .Y(n23) );
  NOR2X1 U23 ( .A(N23), .B(N24), .Y(n22) );
  OR2X2 U24 ( .A(N21), .B(N22), .Y(n7) );
  NOR2X1 U25 ( .A(N20), .B(n7), .Y(n9) );
  NOR2X1 U26 ( .A(N18), .B(N19), .Y(n8) );
  AND2X2 U27 ( .A(n9), .B(n8), .Y(n10) );
  NAND3X1 U28 ( .A(n23), .B(n22), .C(n10), .Y(n25) );
  INVX2 U29 ( .A(n25), .Y(n24) );
  INVX2 U30 ( .A(clear), .Y(n26) );
  NAND3X1 U31 ( .A(n24), .B(n26), .C(n3), .Y(n70) );
  NAND3X1 U32 ( .A(n3), .B(n26), .C(n25), .Y(n27) );
  INVX2 U33 ( .A(n27), .Y(n53) );
  XNOR2X1 U34 ( .A(rollover_val[8]), .B(count_out[8]), .Y(n29) );
  XNOR2X1 U35 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n28) );
  NAND2X1 U36 ( .A(n29), .B(n28), .Y(n34) );
  XNOR2X1 U37 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n32) );
  XNOR2X1 U38 ( .A(rollover_val[9]), .B(count_out[9]), .Y(n31) );
  XNOR2X1 U39 ( .A(rollover_val[6]), .B(count_out[6]), .Y(n30) );
  NAND3X1 U40 ( .A(n32), .B(n31), .C(n30), .Y(n33) );
  NOR2X1 U41 ( .A(n34), .B(n33), .Y(n43) );
  XNOR2X1 U42 ( .A(rollover_val[5]), .B(count_out[5]), .Y(n36) );
  XNOR2X1 U43 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n35) );
  NAND2X1 U44 ( .A(n36), .B(n35), .Y(n41) );
  XNOR2X1 U45 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n39) );
  XNOR2X1 U46 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n38) );
  INVX2 U47 ( .A(rollover_val[0]), .Y(n56) );
  XOR2X1 U48 ( .A(n56), .B(count_out[0]), .Y(n37) );
  NAND3X1 U49 ( .A(n39), .B(n38), .C(n37), .Y(n40) );
  NOR2X1 U50 ( .A(n41), .B(n40), .Y(n42) );
  NAND2X1 U51 ( .A(n43), .B(n42), .Y(n52) );
  AOI22X1 U52 ( .A(rollover_val[6]), .B(n67), .C(N37), .D(n1), .Y(n44) );
  OAI21X1 U53 ( .A(n3), .B(n45), .C(n44), .Y(n84) );
  INVX2 U54 ( .A(count_out[3]), .Y(n47) );
  AOI22X1 U55 ( .A(rollover_val[3]), .B(n67), .C(N34), .D(n1), .Y(n46) );
  OAI21X1 U56 ( .A(n3), .B(n47), .C(n46), .Y(n87) );
  INVX2 U57 ( .A(count_out[7]), .Y(n49) );
  AOI22X1 U58 ( .A(rollover_val[7]), .B(n67), .C(N38), .D(n1), .Y(n48) );
  OAI21X1 U59 ( .A(n3), .B(n49), .C(n48), .Y(n83) );
  INVX2 U60 ( .A(count_out[1]), .Y(n51) );
  AOI22X1 U61 ( .A(rollover_val[1]), .B(n67), .C(N32), .D(n1), .Y(n50) );
  OAI21X1 U62 ( .A(n3), .B(n51), .C(n50), .Y(n89) );
  INVX2 U63 ( .A(n52), .Y(n54) );
  OAI21X1 U64 ( .A(N31), .B(n54), .C(n53), .Y(n55) );
  OAI21X1 U65 ( .A(n70), .B(n56), .C(n55), .Y(n57) );
  AOI21X1 U66 ( .A(count_out[0]), .B(n2), .C(n57), .Y(n58) );
  INVX2 U67 ( .A(n58), .Y(n90) );
  INVX2 U68 ( .A(count_out[2]), .Y(n60) );
  AOI22X1 U69 ( .A(rollover_val[2]), .B(n67), .C(N33), .D(n1), .Y(n59) );
  OAI21X1 U70 ( .A(n3), .B(n60), .C(n59), .Y(n88) );
  INVX2 U71 ( .A(count_out[4]), .Y(n62) );
  AOI22X1 U72 ( .A(rollover_val[4]), .B(n67), .C(N35), .D(n1), .Y(n61) );
  OAI21X1 U73 ( .A(n3), .B(n62), .C(n61), .Y(n86) );
  INVX2 U74 ( .A(count_out[5]), .Y(n64) );
  AOI22X1 U75 ( .A(rollover_val[5]), .B(n67), .C(N36), .D(n1), .Y(n63) );
  OAI21X1 U76 ( .A(n3), .B(n64), .C(n63), .Y(n85) );
  INVX2 U77 ( .A(count_out[8]), .Y(n66) );
  AOI22X1 U78 ( .A(rollover_val[8]), .B(n67), .C(N39), .D(n1), .Y(n65) );
  OAI21X1 U79 ( .A(n3), .B(n66), .C(n65), .Y(n82) );
  INVX2 U80 ( .A(count_out[9]), .Y(n69) );
  AOI22X1 U81 ( .A(rollover_val[9]), .B(n67), .C(N40), .D(n1), .Y(n68) );
  OAI21X1 U82 ( .A(n3), .B(n69), .C(n68), .Y(n81) );
  INVX2 U83 ( .A(rollover_flag), .Y(n71) );
  OAI21X1 U84 ( .A(n3), .B(n71), .C(n70), .Y(n80) );
endmodule


module counter ( clk, n_reset, cnt_up, one_k_samples );
  input clk, n_reset, cnt_up;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 A0 ( .clk(clk), .n_rst(n_reset), .clear(1'b0), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module avg_four ( clk, n_reset, sample_data, data_ready, one_k_samples, 
        modwait, avg_out, err );
  input [15:0] sample_data;
  output [15:0] avg_out;
  input clk, n_reset, data_ready;
  output one_k_samples, modwait, err;
  wire   new_dr, overflow, cnt_up, n1;
  wire   [1:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;
  assign avg_out[14] = 1'b0;
  assign avg_out[15] = 1'b0;

  sync SYNC ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(
        new_dr) );
  controller CONTROLLER ( .clk(clk), .n_reset(n_reset), .dr(new_dr), 
        .overflow(overflow), .cnt_up(cnt_up), .modwait(modwait), .op(op), 
        .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2({
        SYNOPSYS_UNCONNECTED__1, src2[2:0]}), .dest({SYNOPSYS_UNCONNECTED__2, 
        dest[2:0]}), .err(err) );
  datapath DATA ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, 
        src1[2:1], n1}), .src2({1'b0, src2[2:0]}), .dest({1'b0, dest[2:0]}), 
        .ext_data(sample_data), .outreg_data({avg_out[13:0], 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4}), .overflow(overflow) );
  counter COUNTER ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), 
        .one_k_samples(one_k_samples) );
  BUFX4 U2 ( .A(src1[0]), .Y(n1) );
endmodule

