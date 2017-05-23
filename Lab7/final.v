module lab7_out_ctrl (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	bus_mode, 
	tx_value);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input [1:0] bus_mode;
   input tx_value;

   // Internal wires
   wire FE_OCPN447_tx_value_int;
   wire FE_RN_961_0;
   wire FE_OFN187_nd_minus;
   wire FE_OFN186_nd_plus;
   wire n9;
   wire n10;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n11;
   wire n12;

   OAI21X1 FE_RC_2013_0 (.Y(n12), 
	.C(n8), 
	.B(FE_OCPN447_tx_value_int), 
	.A(n11));
   BUFX2 FE_OCPC447_tx_value_int (.Y(FE_OCPN447_tx_value_int), 
	.A(tx_value));
   INVX2 FE_RC_1443_0 (.Y(FE_RN_961_0), 
	.A(n5));
   AOI22X1 FE_RC_1442_0 (.Y(n4), 
	.D(n5), 
	.C(n3), 
	.B(FE_RN_961_0), 
	.A(d_minus));
   BUFX2 FE_OFC187_nd_minus (.Y(d_minus), 
	.A(FE_OFN187_nd_minus));
   BUFX2 FE_OFC186_nd_plus (.Y(d_plus), 
	.A(FE_OFN186_nd_plus));
   DFFSR d_minus_reg_reg (.S(1'b1), 
	.R(n_rst), 
	.Q(FE_OFN187_nd_minus), 
	.D(n10), 
	.CLK(clk));
   DFFSR d_plus_reg_reg (.S(n_rst), 
	.R(1'b1), 
	.Q(FE_OFN186_nd_plus), 
	.D(n9), 
	.CLK(clk));
   INVX2 U5 (.Y(n3), 
	.A(tx_value));
   INVX2 U7 (.Y(n7), 
	.A(bus_mode[0]));
   NOR2X1 U8 (.Y(n10), 
	.B(n4), 
	.A(n7));
   INVX4 U9 (.Y(n5), 
	.A(bus_mode[1]));
   NAND2X1 U10 (.Y(n11), 
	.B(n5), 
	.A(bus_mode[0]));
   INVX1 U11 (.Y(n6), 
	.A(d_plus));
   OAI21X1 U12 (.Y(n8), 
	.C(bus_mode[1]), 
	.B(n6), 
	.A(n7));
   INVX2 U14 (.Y(n9), 
	.A(n12));
endmodule

module lab7_encoder (
	clk, 
	n_rst, 
	tx_bit, 
	shift_enable, 
	tx_value);
   input clk;
   input n_rst;
   input tx_bit;
   input shift_enable;
   output tx_value;

   // Internal wires
   wire last_bit;
   wire n4;
   wire n1;
   wire n2;

   DFFSR last_bit_reg (.S(n_rst), 
	.R(1'b1), 
	.Q(last_bit), 
	.D(n4), 
	.CLK(clk));
   XOR2X1 U2 (.Y(tx_value), 
	.B(n2), 
	.A(tx_bit));
   INVX1 U3 (.Y(n1), 
	.A(tx_bit));
   INVX2 U4 (.Y(n2), 
	.A(last_bit));
   MUX2X1 U5 (.Y(n4), 
	.S(shift_enable), 
	.B(n2), 
	.A(n1));
endmodule

module lab7_tx_sr_1 (
	clk, 
	n_rst, 
	shift_enable, 
	tx_enable, 
	tx_data, 
	load_data, 
	tx_out, 
	nclk__L2_N6);
   input clk;
   input n_rst;
   input shift_enable;
   input tx_enable;
   input [7:0] tx_data;
   input load_data;
   output tx_out;
   input nclk__L2_N6;

   // Internal wires
   wire FE_OCPN250_FE_OFN203_load_data_0_int;
   wire FE_RN_881_0;
   wire FE_RN_880_0;
   wire FE_RN_879_0;
   wire FE_RN_876_0;
   wire FE_RN_794_0;
   wire FE_RN_793_0;
   wire FE_RN_792_0;
   wire FE_RN_729_0;
   wire FE_RN_180_0;
   wire FE_RN_179_0;
   wire FE_RN_178_0;
   wire FE_RN_177_0;
   wire FE_RN_176_0;
   wire FE_RN_175_0;
   wire FE_RN_149_0;
   wire FE_RN_148_0;
   wire FE_RN_147_0;
   wire FE_RN_141_0;
   wire FE_RN_140_0;
   wire FE_RN_139_0;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n17;
   wire n18;
   wire n27;
   wire n28;
   wire n37;
   wire n47;
   wire n48;
   wire n49;
   wire [7:1] curr_val;

   NAND3X1 FE_RC_1881_0 (.Y(n36), 
	.C(FE_RN_180_0), 
	.B(FE_RN_179_0), 
	.A(FE_RN_178_0));
   NAND3X1 FE_RC_1569_0 (.Y(n32), 
	.C(FE_RN_792_0), 
	.B(FE_RN_794_0), 
	.A(FE_RN_793_0));
   OAI21X1 FE_RC_1459_0 (.Y(FE_RN_879_0), 
	.C(FE_RN_880_0), 
	.B(FE_RN_881_0), 
	.A(n13));
   BUFX4 FE_OCPC250_FE_OFN203_load_data_0_int (.Y(FE_OCPN250_FE_OFN203_load_data_0_int), 
	.A(load_data));
   INVX2 FE_RC_1265_0 (.Y(FE_RN_881_0), 
	.A(tx_data[7]));
   NAND2X1 FE_RC_1264_0 (.Y(FE_RN_880_0), 
	.B(curr_val[7]), 
	.A(n13));
   OR2X1 FE_RC_1262_0 (.Y(n30), 
	.B(n11), 
	.A(FE_RN_879_0));
   INVX4 FE_RC_1257_0 (.Y(n11), 
	.A(FE_RN_876_0));
   NAND2X1 FE_RC_1256_0 (.Y(FE_RN_876_0), 
	.B(n17), 
	.A(n10));
   NAND2X1 FE_RC_1155_0 (.Y(FE_RN_794_0), 
	.B(FE_OCPN250_FE_OFN203_load_data_0_int), 
	.A(tx_data[5]));
   NAND2X1 FE_RC_1154_0 (.Y(FE_RN_793_0), 
	.B(curr_val[5]), 
	.A(n12));
   NAND2X1 FE_RC_1153_0 (.Y(FE_RN_792_0), 
	.B(n11), 
	.A(curr_val[6]));
   AND2X2 FE_RC_1071_0 (.Y(FE_RN_729_0), 
	.B(n37), 
	.A(n27));
   NAND2X1 FE_RC_1070_0 (.Y(n33), 
	.B(FE_RN_729_0), 
	.A(n28));
   NAND3X1 FE_RC_1064_0 (.Y(n37), 
	.C(n10), 
	.B(n17), 
	.A(curr_val[5]));
   NAND3X1 FE_RC_347_0 (.Y(n34), 
	.C(FE_RN_176_0), 
	.B(FE_RN_177_0), 
	.A(FE_RN_175_0));
   NAND3X1 FE_RC_346_0 (.Y(n31), 
	.C(FE_RN_147_0), 
	.B(FE_RN_148_0), 
	.A(FE_RN_149_0));
   NAND2X1 FE_RC_273_0 (.Y(FE_RN_180_0), 
	.B(tx_data[1]), 
	.A(FE_OCPN250_FE_OFN203_load_data_0_int));
   NAND2X1 FE_RC_272_0 (.Y(FE_RN_179_0), 
	.B(n11), 
	.A(curr_val[2]));
   NAND2X1 FE_RC_271_0 (.Y(FE_RN_178_0), 
	.B(n12), 
	.A(curr_val[1]));
   NAND2X1 FE_RC_269_0 (.Y(FE_RN_177_0), 
	.B(tx_data[3]), 
	.A(FE_OCPN250_FE_OFN203_load_data_0_int));
   NAND2X1 FE_RC_268_0 (.Y(FE_RN_176_0), 
	.B(n11), 
	.A(curr_val[4]));
   NAND2X1 FE_RC_267_0 (.Y(FE_RN_175_0), 
	.B(n12), 
	.A(curr_val[3]));
   NAND2X1 FE_RC_221_0 (.Y(FE_RN_149_0), 
	.B(tx_data[6]), 
	.A(FE_OCPN250_FE_OFN203_load_data_0_int));
   NAND2X1 FE_RC_220_0 (.Y(FE_RN_148_0), 
	.B(n11), 
	.A(curr_val[7]));
   NAND2X1 FE_RC_219_0 (.Y(FE_RN_147_0), 
	.B(n12), 
	.A(curr_val[6]));
   NAND2X1 FE_RC_210_0 (.Y(FE_RN_141_0), 
	.B(tx_data[2]), 
	.A(FE_OCPN250_FE_OFN203_load_data_0_int));
   NAND2X1 FE_RC_209_0 (.Y(FE_RN_140_0), 
	.B(n12), 
	.A(curr_val[2]));
   NAND2X1 FE_RC_208_0 (.Y(FE_RN_139_0), 
	.B(n11), 
	.A(curr_val[3]));
   NAND3X1 FE_RC_207_0 (.Y(n35), 
	.C(FE_RN_139_0), 
	.B(FE_RN_140_0), 
	.A(FE_RN_141_0));
   DFFSR \curr_val_reg[7]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[7]), 
	.D(n30), 
	.CLK(clk));
   DFFSR \curr_val_reg[6]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[6]), 
	.D(n31), 
	.CLK(clk));
   DFFSR \curr_val_reg[5]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[5]), 
	.D(n32), 
	.CLK(clk));
   DFFSR \curr_val_reg[4]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[4]), 
	.D(n33), 
	.CLK(clk));
   DFFSR \curr_val_reg[3]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[3]), 
	.D(n34), 
	.CLK(clk));
   DFFSR \curr_val_reg[2]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[2]), 
	.D(n35), 
	.CLK(clk));
   DFFSR \curr_val_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[1]), 
	.D(n36), 
	.CLK(nclk__L2_N6));
   DFFSR \curr_val_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(tx_out), 
	.D(n29), 
	.CLK(nclk__L2_N6));
   INVX4 U11 (.Y(n9), 
	.A(load_data));
   INVX2 U12 (.Y(n17), 
	.A(load_data));
   AND2X2 U13 (.Y(n13), 
	.B(n18), 
	.A(n9));
   AND2X2 U14 (.Y(n10), 
	.B(tx_enable), 
	.A(shift_enable));
   AND2X2 U17 (.Y(n12), 
	.B(n18), 
	.A(n9));
   NAND2X1 U21 (.Y(n18), 
	.B(shift_enable), 
	.A(tx_enable));
   NAND2X1 U33 (.Y(n28), 
	.B(n12), 
	.A(curr_val[4]));
   NAND2X1 U34 (.Y(n27), 
	.B(FE_OCPN250_FE_OFN203_load_data_0_int), 
	.A(tx_data[4]));
   NAND2X1 U48 (.Y(n49), 
	.B(n11), 
	.A(curr_val[1]));
   NAND2X1 U49 (.Y(n48), 
	.B(n12), 
	.A(tx_out));
   NAND2X1 U50 (.Y(n47), 
	.B(FE_OCPN250_FE_OFN203_load_data_0_int), 
	.A(tx_data[0]));
   NAND3X1 U51 (.Y(n29), 
	.C(n49), 
	.B(n47), 
	.A(n48));
endmodule

module fiforam (
	wclk, 
	wenable, 
	waddr, 
	raddr, 
	wdata, 
	rdata, 
	FE_OCP_RBN140_waddr_0_, 
	FE_OCP_RBN141_waddr_0_, 
	FE_OCP_RBN149_waddr_0_, 
	FE_OCP_RBN150_waddr_0_, 
	FE_OCP_RBN155_waddr_0_, 
	FE_OCP_RBN156_waddr_0_, 
	FE_OCP_RBN166_waddr_0_, 
	FE_OCP_RBN167_waddr_0_, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7, 
	FE_OCP_RBN283_raddr_1_, 
	FE_OCP_RBN287_raddr_1_, 
	FE_OCP_RBN290_waddr_0_, 
	FE_OCP_RBN291_waddr_0_, 
	FE_OCP_RBN296_waddr_2_, 
	FE_OCP_RBN300_FE_OCPN219_wenable_fifo, 
	FE_OCP_RBN301_FE_OCPN219_wenable_fifo, 
	FE_OCP_RBN302_FE_OCPN219_wenable_fifo, 
	FE_OCP_RBN304_FE_OCPN219_wenable_fifo, 
	FE_OCP_RBN305_FE_OCPN219_wenable_fifo, 
	FE_OCP_RBN313_wenable_fifo, 
	FE_OCP_RBN326_waddr_0_, 
	FE_OCP_RBN327_waddr_0_, 
	FE_OCP_RBN334_waddr_1_, 
	FE_OCP_RBN335_waddr_1_, 
	FE_OCP_RBN374_waddr_0_, 
	FE_OCP_RBN375_waddr_0_, 
	FE_OCP_RBN389_waddr_1_, 
	FE_OCP_RBN390_waddr_1_, 
	FE_OCP_RBN391_waddr_1_, 
	FE_OCP_RBN485_waddr_0_, 
	FE_OCP_RBN487_waddr_0_, 
	FE_OCP_RBN488_waddr_0_, 
	FE_OCP_RBN508_waddr_0_, 
	FE_OCP_RBN510_waddr_0_, 
	FE_OCP_RBN511_waddr_0_);
   input wclk;
   input wenable;
   input [2:0] waddr;
   input [2:0] raddr;
   input [7:0] wdata;
   output [7:0] rdata;
   input FE_OCP_RBN140_waddr_0_;
   input FE_OCP_RBN141_waddr_0_;
   input FE_OCP_RBN149_waddr_0_;
   input FE_OCP_RBN150_waddr_0_;
   input FE_OCP_RBN155_waddr_0_;
   input FE_OCP_RBN156_waddr_0_;
   input FE_OCP_RBN166_waddr_0_;
   input FE_OCP_RBN167_waddr_0_;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;
   input FE_OCP_RBN283_raddr_1_;
   input FE_OCP_RBN287_raddr_1_;
   input FE_OCP_RBN290_waddr_0_;
   input FE_OCP_RBN291_waddr_0_;
   input FE_OCP_RBN296_waddr_2_;
   input FE_OCP_RBN300_FE_OCPN219_wenable_fifo;
   input FE_OCP_RBN301_FE_OCPN219_wenable_fifo;
   input FE_OCP_RBN302_FE_OCPN219_wenable_fifo;
   input FE_OCP_RBN304_FE_OCPN219_wenable_fifo;
   input FE_OCP_RBN305_FE_OCPN219_wenable_fifo;
   input FE_OCP_RBN313_wenable_fifo;
   input FE_OCP_RBN326_waddr_0_;
   input FE_OCP_RBN327_waddr_0_;
   input FE_OCP_RBN334_waddr_1_;
   input FE_OCP_RBN335_waddr_1_;
   input FE_OCP_RBN374_waddr_0_;
   input FE_OCP_RBN375_waddr_0_;
   input FE_OCP_RBN389_waddr_1_;
   input FE_OCP_RBN390_waddr_1_;
   input FE_OCP_RBN391_waddr_1_;
   input FE_OCP_RBN485_waddr_0_;
   input FE_OCP_RBN487_waddr_0_;
   input FE_OCP_RBN488_waddr_0_;
   input FE_OCP_RBN508_waddr_0_;
   input FE_OCP_RBN510_waddr_0_;
   input FE_OCP_RBN511_waddr_0_;

   // Internal wires
   wire FE_OCP_RBN515_waddr_0_;
   wire FE_OCP_RBN514_waddr_0_;
   wire FE_OCP_RBN513_waddr_0_;
   wire FE_OCP_RBN512_waddr_0_;
   wire FE_RN_1578_0;
   wire FE_RN_1577_0;
   wire FE_RN_1576_0;
   wire FE_OCP_RBN505_FE_RN_35_0;
   wire FE_OCP_RBN503_FE_RN_126_0;
   wire FE_OCP_RBN502_FE_RN_126_0;
   wire FE_OCP_RBN501_FE_RN_126_0;
   wire FE_OCP_RBN498_FE_RN_126_0;
   wire FE_OCPN482_FE_OFN193_n195;
   wire FE_RN_1535_0;
   wire FE_RN_1534_0;
   wire FE_RN_1533_0;
   wire FE_RN_1532_0;
   wire FE_RN_1531_0;
   wire FE_RN_1530_0;
   wire FE_RN_1529_0;
   wire FE_RN_1528_0;
   wire FE_RN_1527_0;
   wire FE_RN_1477_0;
   wire FE_RN_1476_0;
   wire FE_RN_1431_0;
   wire FE_RN_1430_0;
   wire FE_OCP_RBN477_FE_RN_1149_0;
   wire FE_OCPN466_FE_OFN201_n287;
   wire FE_OCPN465_FE_OFN201_n287;
   wire FE_OCPN464_FE_OFN191_FE_RN_28_0;
   wire FE_OCPN463_FE_OFN198_n194;
   wire FE_OCPN462_FE_OFN198_n194;
   wire FE_RN_1364_0;
   wire FE_RN_1363_0;
   wire FE_RN_1360_0;
   wire FE_RN_1359_0;
   wire FE_RN_1335_0;
   wire FE_RN_1334_0;
   wire FE_OCPN446_FE_OFN193_n195;
   wire FE_OCPN444_FE_OFN202_n283;
   wire FE_OCPN443_FE_OFN202_n283;
   wire FE_OCPN441_FE_OCP_RBN348_FE_RN_511_0;
   wire FE_OCPN440_FE_OCP_RBN312_wenable_fifo;
   wire FE_OCPN439_n65;
   wire FE_OCPN438_raddr_0_;
   wire FE_OCPN432_raddr_2_;
   wire FE_OCPN431_raddr_1_;
   wire FE_RN_1289_0;
   wire FE_RN_1225_0;
   wire FE_RN_1224_0;
   wire FE_RN_1215_0;
   wire FE_RN_1214_0;
   wire FE_RN_1213_0;
   wire FE_RN_1212_0;
   wire FE_RN_1204_0;
   wire FE_RN_1203_0;
   wire FE_RN_1200_0;
   wire FE_RN_1199_0;
   wire FE_RN_1198_0;
   wire FE_RN_1197_0;
   wire FE_RN_1188_0;
   wire FE_RN_1187_0;
   wire FE_OCPN425_n277;
   wire FE_OCPN424_n277;
   wire FE_OCPN422_n16;
   wire FE_OCPN421_n16;
   wire FE_RN_1157_0;
   wire FE_RN_1156_0;
   wire FE_RN_1155_0;
   wire FE_RN_1154_0;
   wire FE_RN_1153_0;
   wire FE_RN_1152_0;
   wire FE_RN_1151_0;
   wire FE_RN_1150_0;
   wire FE_RN_1149_0;
   wire FE_RN_1120_0;
   wire FE_RN_1119_0;
   wire FE_RN_1118_0;
   wire FE_RN_1117_0;
   wire FE_RN_1116_0;
   wire FE_RN_1115_0;
   wire FE_RN_1114_0;
   wire FE_RN_1113_0;
   wire FE_RN_1112_0;
   wire FE_RN_1111_0;
   wire FE_RN_1110_0;
   wire FE_RN_1109_0;
   wire FE_RN_1108_0;
   wire FE_RN_1038_0;
   wire FE_RN_1037_0;
   wire FE_RN_1030_0;
   wire FE_RN_1029_0;
   wire FE_RN_1024_0;
   wire FE_RN_1023_0;
   wire FE_RN_1022_0;
   wire FE_RN_1021_0;
   wire FE_RN_1016_0;
   wire FE_RN_1015_0;
   wire FE_RN_1006_0;
   wire FE_RN_992_0;
   wire FE_RN_991_0;
   wire FE_RN_958_0;
   wire FE_RN_951_0;
   wire FE_RN_946_0;
   wire FE_RN_939_0;
   wire FE_RN_928_0;
   wire FE_RN_927_0;
   wire FE_RN_926_0;
   wire FE_RN_925_0;
   wire FE_RN_924_0;
   wire FE_RN_923_0;
   wire FE_RN_900_0;
   wire FE_RN_899_0;
   wire FE_OCP_RBN408_n193;
   wire FE_OCP_RBN407_n193;
   wire FE_OCP_RBN406_n193;
   wire FE_OCP_RBN405_n193;
   wire FE_OCP_RBN404_n193;
   wire FE_OCP_RBN403_waddr_1_;
   wire FE_OCP_RBN402_waddr_1_;
   wire FE_OCP_RBN397_waddr_1_;
   wire FE_OCP_RBN396_waddr_1_;
   wire FE_OCP_RBN395_waddr_1_;
   wire FE_OCP_RBN394_waddr_1_;
   wire FE_OCPN370_FE_OFN193_n195;
   wire FE_OCPN368_FE_OFN193_n195;
   wire FE_OCPN367_FE_OFN199_n289;
   wire FE_OCPN366_FE_OFN199_n289;
   wire FE_OCPN362_n65;
   wire FE_OCPN361_raddr_0_;
   wire FE_RN_897_0;
   wire FE_RN_896_0;
   wire FE_OCP_RBN353_FE_RN_511_0;
   wire FE_OCP_RBN352_FE_RN_511_0;
   wire FE_OCP_RBN351_FE_RN_511_0;
   wire FE_OCP_RBN350_FE_RN_511_0;
   wire FE_OCP_RBN349_FE_RN_511_0;
   wire FE_OCP_RBN348_FE_RN_511_0;
   wire FE_OCP_RBN315_wenable_fifo;
   wire FE_OCP_RBN314_wenable_fifo;
   wire FE_OCP_RBN285_raddr_1_;
   wire FE_OCPN282_FE_OFN200_n285;
   wire FE_OCPN274_FE_OFN198_n194;
   wire FE_OCPN273_FE_OFN198_n194;
   wire FE_OCPN271_FE_OFN198_n194;
   wire FE_OCPN270_FE_OFN191_FE_RN_28_0;
   wire FE_OCPN269_FE_OFN191_FE_RN_28_0;
   wire FE_OCPN268_FE_OFN191_FE_RN_28_0;
   wire FE_OCPN254_n32;
   wire FE_OCPN253_n32;
   wire FE_OCPN240_FE_OFN200_n285;
   wire FE_OCPN234_n14;
   wire FE_OCPN233_n14;
   wire FE_OCPN224_n207;
   wire FE_OCPN222_n207;
   wire FE_RN_878_0;
   wire FE_RN_875_0;
   wire FE_RN_874_0;
   wire FE_RN_873_0;
   wire FE_RN_872_0;
   wire FE_RN_871_0;
   wire FE_RN_870_0;
   wire FE_RN_869_0;
   wire FE_RN_868_0;
   wire FE_RN_867_0;
   wire FE_RN_866_0;
   wire FE_RN_865_0;
   wire FE_RN_864_0;
   wire FE_RN_863_0;
   wire FE_RN_862_0;
   wire FE_RN_861_0;
   wire FE_RN_790_0;
   wire FE_RN_789_0;
   wire FE_RN_733_0;
   wire FE_RN_732_0;
   wire FE_RN_731_0;
   wire FE_RN_730_0;
   wire FE_OFN202_n283;
   wire FE_OFN201_n287;
   wire FE_OFN200_n285;
   wire FE_OFN199_n289;
   wire FE_OFN198_n194;
   wire FE_OFN197_n205;
   wire FE_OFN196_n205;
   wire FE_OFN195_n205;
   wire FE_OFN193_n195;
   wire FE_OFN192_n195;
   wire FE_OFN191_FE_RN_28_0;
   wire FE_RN_604_0;
   wire FE_RN_599_0;
   wire FE_RN_511_0;
   wire FE_RN_509_0;
   wire FE_RN_508_0;
   wire FE_RN_506_0;
   wire FE_RN_503_0;
   wire FE_RN_502_0;
   wire FE_RN_365_0;
   wire FE_RN_364_0;
   wire FE_RN_361_0;
   wire FE_RN_356_0;
   wire FE_RN_355_0;
   wire FE_RN_354_0;
   wire FE_RN_334_0;
   wire FE_RN_333_0;
   wire FE_RN_332_0;
   wire FE_RN_331_0;
   wire FE_RN_330_0;
   wire FE_RN_329_0;
   wire FE_RN_327_0;
   wire FE_RN_326_0;
   wire FE_RN_325_0;
   wire FE_RN_245_0;
   wire FE_RN_214_0;
   wire FE_RN_213_0;
   wire FE_RN_212_0;
   wire FE_RN_211_0;
   wire FE_RN_205_0;
   wire FE_RN_183_0;
   wire FE_RN_127_0;
   wire FE_RN_126_0;
   wire FE_RN_120_0;
   wire FE_RN_93_0;
   wire FE_RN_47_0;
   wire FE_RN_41_0;
   wire FE_RN_40_0;
   wire FE_RN_38_0;
   wire FE_RN_37_0;
   wire FE_RN_36_0;
   wire FE_RN_35_0;
   wire FE_RN_34_0;
   wire FE_RN_33_0;
   wire FE_RN_32_0;
   wire \fiforeg[0][7] ;
   wire \fiforeg[0][6] ;
   wire \fiforeg[0][5] ;
   wire \fiforeg[0][4] ;
   wire \fiforeg[0][3] ;
   wire \fiforeg[0][2] ;
   wire \fiforeg[0][1] ;
   wire \fiforeg[0][0] ;
   wire \fiforeg[1][7] ;
   wire \fiforeg[1][6] ;
   wire \fiforeg[1][5] ;
   wire \fiforeg[1][4] ;
   wire \fiforeg[1][3] ;
   wire \fiforeg[1][2] ;
   wire \fiforeg[1][1] ;
   wire \fiforeg[1][0] ;
   wire \fiforeg[2][7] ;
   wire \fiforeg[2][6] ;
   wire \fiforeg[2][5] ;
   wire \fiforeg[2][4] ;
   wire \fiforeg[2][3] ;
   wire \fiforeg[2][2] ;
   wire \fiforeg[2][1] ;
   wire \fiforeg[2][0] ;
   wire \fiforeg[3][7] ;
   wire \fiforeg[3][6] ;
   wire \fiforeg[3][5] ;
   wire \fiforeg[3][4] ;
   wire \fiforeg[3][3] ;
   wire \fiforeg[3][2] ;
   wire \fiforeg[3][1] ;
   wire \fiforeg[3][0] ;
   wire \fiforeg[4][7] ;
   wire \fiforeg[4][6] ;
   wire \fiforeg[4][5] ;
   wire \fiforeg[4][4] ;
   wire \fiforeg[4][3] ;
   wire \fiforeg[4][2] ;
   wire \fiforeg[4][1] ;
   wire \fiforeg[4][0] ;
   wire \fiforeg[5][7] ;
   wire \fiforeg[5][6] ;
   wire \fiforeg[5][5] ;
   wire \fiforeg[5][4] ;
   wire \fiforeg[5][3] ;
   wire \fiforeg[5][2] ;
   wire \fiforeg[5][1] ;
   wire \fiforeg[5][0] ;
   wire \fiforeg[6][7] ;
   wire \fiforeg[6][6] ;
   wire \fiforeg[6][5] ;
   wire \fiforeg[6][4] ;
   wire \fiforeg[6][3] ;
   wire \fiforeg[6][2] ;
   wire \fiforeg[6][1] ;
   wire \fiforeg[6][0] ;
   wire \fiforeg[7][7] ;
   wire \fiforeg[7][6] ;
   wire \fiforeg[7][5] ;
   wire \fiforeg[7][4] ;
   wire \fiforeg[7][3] ;
   wire \fiforeg[7][2] ;
   wire \fiforeg[7][1] ;
   wire \fiforeg[7][0] ;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n4;
   wire n15;
   wire n16;
   wire n17;
   wire n32;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n59;
   wire n60;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n82;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n141;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n159;
   wire n160;
   wire n161;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n179;
   wire n180;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n194;
   wire n195;
   wire n204;
   wire n205;
   wire n206;
   wire n208;
   wire n209;
   wire n211;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n288;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;

   BUFX2 FE_OCP_RBC515_waddr_0_ (.Y(FE_OCP_RBN515_waddr_0_), 
	.A(FE_OCP_RBN374_waddr_0_));
   BUFX4 FE_OCP_RBC514_waddr_0_ (.Y(FE_OCP_RBN514_waddr_0_), 
	.A(FE_OCP_RBN374_waddr_0_));
   INVX1 FE_OCP_RBC513_waddr_0_ (.Y(FE_OCP_RBN513_waddr_0_), 
	.A(FE_OCP_RBN514_waddr_0_));
   INVX4 FE_OCP_RBC512_waddr_0_ (.Y(FE_OCP_RBN512_waddr_0_), 
	.A(FE_OCP_RBN514_waddr_0_));
   INVX8 FE_RC_2436_0 (.Y(FE_RN_1578_0), 
	.A(FE_RN_1120_0));
   INVX2 FE_RC_2435_0 (.Y(FE_RN_1577_0), 
	.A(FE_OCPN440_FE_OCP_RBN312_wenable_fifo));
   NAND2X1 FE_RC_2434_0 (.Y(FE_RN_1576_0), 
	.B(FE_RN_1577_0), 
	.A(FE_RN_1578_0));
   NAND2X1 FE_RC_2433_0 (.Y(FE_RN_93_0), 
	.B(FE_RN_1108_0), 
	.A(FE_RN_1576_0));
   INVX4 FE_OCP_RBC505_FE_RN_35_0 (.Y(FE_OCP_RBN505_FE_RN_35_0), 
	.A(FE_RN_35_0));
   INVX4 FE_OCP_RBC503_FE_RN_126_0 (.Y(FE_OCP_RBN503_FE_RN_126_0), 
	.A(FE_OCP_RBN498_FE_RN_126_0));
   INVX2 FE_OCP_RBC502_FE_RN_126_0 (.Y(FE_OCP_RBN502_FE_RN_126_0), 
	.A(FE_OCP_RBN503_FE_RN_126_0));
   INVX8 FE_OCP_RBC501_FE_RN_126_0 (.Y(FE_OCP_RBN501_FE_RN_126_0), 
	.A(FE_OCP_RBN503_FE_RN_126_0));
   INVX8 FE_OCP_RBC498_FE_RN_126_0 (.Y(FE_OCP_RBN498_FE_RN_126_0), 
	.A(FE_RN_126_0));
   BUFX2 FE_OCPC482_FE_OFN193_n195 (.Y(FE_OCPN482_FE_OFN193_n195), 
	.A(FE_OFN193_n195));
   NAND3X1 FE_RC_2412_0 (.Y(FE_OFN201_n287), 
	.C(n65), 
	.B(FE_OCP_RBN285_raddr_1_), 
	.A(n64));
   NAND2X1 FE_RC_2369_0 (.Y(FE_RN_1535_0), 
	.B(FE_OCP_RBN302_FE_OCPN219_wenable_fifo), 
	.A(wdata[6]));
   AOI22X1 FE_RC_2368_0 (.Y(FE_RN_1534_0), 
	.D(n277), 
	.C(\fiforeg[5][6] ), 
	.B(FE_OCP_RBN349_FE_RN_511_0), 
	.A(\fiforeg[4][6] ));
   AOI22X1 FE_RC_2367_0 (.Y(FE_RN_1533_0), 
	.D(FE_OCP_RBN498_FE_RN_126_0), 
	.C(\fiforeg[6][6] ), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][6] ));
   OAI22X1 FE_RC_2366_0 (.Y(FE_RN_1532_0), 
	.D(FE_OFN193_n195), 
	.C(n186), 
	.B(FE_OFN191_FE_RN_28_0), 
	.A(n187));
   OAI22X1 FE_RC_2365_0 (.Y(FE_RN_1531_0), 
	.D(FE_OFN198_n194), 
	.C(n184), 
	.B(FE_OCP_RBN405_n193), 
	.A(n185));
   NOR2X1 FE_RC_2364_0 (.Y(FE_RN_1530_0), 
	.B(FE_RN_1531_0), 
	.A(FE_RN_1532_0));
   NAND3X1 FE_RC_2363_0 (.Y(FE_RN_1529_0), 
	.C(FE_RN_1530_0), 
	.B(FE_RN_1533_0), 
	.A(FE_RN_1534_0));
   NAND2X1 FE_RC_2362_0 (.Y(FE_RN_1528_0), 
	.B(FE_OCP_RBN315_wenable_fifo), 
	.A(FE_RN_1529_0));
   INVX4 FE_RC_2361_0 (.Y(n182), 
	.A(FE_RN_1527_0));
   NAND2X1 FE_RC_2360_0 (.Y(FE_RN_1527_0), 
	.B(FE_RN_1528_0), 
	.A(FE_RN_1535_0));
   AOI21X1 FE_RC_2299_0 (.Y(n220), 
	.C(FE_RN_925_0), 
	.B(n182), 
	.A(FE_OFN197_n205));
   INVX4 FE_RC_2295_0 (.Y(FE_RN_1477_0), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   AND2X1 FE_RC_2294_0 (.Y(FE_RN_1476_0), 
	.B(n147), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   AOI21X1 FE_RC_2293_0 (.Y(n240), 
	.C(FE_RN_1476_0), 
	.B(FE_OCP_RBN505_FE_RN_35_0), 
	.A(FE_RN_1477_0));
   NAND3X1 FE_RC_2277_0 (.Y(n53), 
	.C(n52), 
	.B(n50), 
	.A(n51));
   INVX4 FE_RC_2214_0 (.Y(FE_RN_1431_0), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   AND2X1 FE_RC_2213_0 (.Y(FE_RN_1430_0), 
	.B(n167), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   AOI21X1 FE_RC_2212_0 (.Y(n232), 
	.C(FE_RN_1430_0), 
	.B(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(FE_RN_1431_0));
   INVX4 FE_OCP_RBC477_FE_RN_1149_0 (.Y(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(FE_RN_1149_0));
   BUFX4 FE_OCPC466_FE_OFN201_n287 (.Y(FE_OCPN466_FE_OFN201_n287), 
	.A(FE_OFN201_n287));
   BUFX4 FE_OCPC465_FE_OFN201_n287 (.Y(FE_OCPN465_FE_OFN201_n287), 
	.A(FE_OFN201_n287));
   BUFX2 FE_OCPC464_FE_OFN191_FE_RN_28_0 (.Y(FE_OCPN464_FE_OFN191_FE_RN_28_0), 
	.A(FE_OFN191_FE_RN_28_0));
   BUFX4 FE_OCPC463_FE_OFN198_n194 (.Y(FE_OCPN463_FE_OFN198_n194), 
	.A(FE_OCPN462_FE_OFN198_n194));
   BUFX2 FE_OCPC462_FE_OFN198_n194 (.Y(FE_OCPN462_FE_OFN198_n194), 
	.A(FE_OFN198_n194));
   INVX2 FE_RC_2112_0 (.Y(FE_RN_1364_0), 
	.A(n66));
   NOR2X1 FE_RC_2111_0 (.Y(FE_RN_1363_0), 
	.B(n209), 
	.A(FE_RN_1364_0));
   AOI21X1 FE_RC_2110_0 (.Y(n272), 
	.C(FE_RN_1363_0), 
	.B(n57), 
	.A(n209));
   INVX2 FE_RC_2106_0 (.Y(FE_RN_1360_0), 
	.A(n126));
   NOR2X1 FE_RC_2105_0 (.Y(FE_RN_1359_0), 
	.B(n209), 
	.A(FE_RN_1360_0));
   AOI21X1 FE_RC_2104_0 (.Y(n249), 
	.C(FE_RN_1359_0), 
	.B(n122), 
	.A(n209));
   INVX2 FE_RC_2064_0 (.Y(FE_RN_1335_0), 
	.A(n104));
   NOR2X1 FE_RC_2063_0 (.Y(FE_RN_1334_0), 
	.B(n276), 
	.A(FE_RN_1335_0));
   AOI21X1 FE_RC_2062_0 (.Y(n259), 
	.C(FE_RN_1334_0), 
	.B(n102), 
	.A(n276));
   AOI22X1 FE_RC_2017_0 (.Y(n32), 
	.D(FE_OCPN234_n14), 
	.C(n53), 
	.B(FE_RN_361_0), 
	.A(wdata[0]));
   NAND3X1 FE_RC_2003_0 (.Y(n78), 
	.C(n75), 
	.B(n77), 
	.A(n76));
   AOI22X1 FE_RC_1990_0 (.Y(FE_RN_331_0), 
	.D(\fiforeg[4][3] ), 
	.C(FE_OCP_RBN349_FE_RN_511_0), 
	.B(\fiforeg[5][3] ), 
	.A(n277));
   BUFX2 FE_OCPC446_FE_OFN193_n195 (.Y(FE_OCPN446_FE_OFN193_n195), 
	.A(FE_OFN193_n195));
   BUFX2 FE_OCPC444_FE_OFN202_n283 (.Y(FE_OCPN444_FE_OFN202_n283), 
	.A(FE_OCPN443_FE_OFN202_n283));
   BUFX4 FE_OCPC443_FE_OFN202_n283 (.Y(FE_OCPN443_FE_OFN202_n283), 
	.A(FE_OFN202_n283));
   BUFX2 FE_OCPC441_FE_OCP_RBN348_FE_RN_511_0 (.Y(FE_OCPN441_FE_OCP_RBN348_FE_RN_511_0), 
	.A(FE_OCP_RBN348_FE_RN_511_0));
   BUFX2 FE_OCPC440_FE_OCP_RBN312_wenable_fifo (.Y(FE_OCPN440_FE_OCP_RBN312_wenable_fifo), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   BUFX2 FE_OCPC439_n65 (.Y(FE_OCPN439_n65), 
	.A(n65));
   BUFX2 FE_OCPC438_raddr_0_ (.Y(FE_OCPN438_raddr_0_), 
	.A(raddr[0]));
   BUFX2 FE_OCPC432_raddr_2_ (.Y(FE_OCPN432_raddr_2_), 
	.A(raddr[2]));
   BUFX2 FE_OCPC431_raddr_1_ (.Y(FE_OCPN431_raddr_1_), 
	.A(raddr[1]));
   INVX2 FE_RC_1962_0 (.Y(FE_RN_1289_0), 
	.A(\fiforeg[5][4] ));
   MUX2X1 FE_RC_1961_0 (.Y(n238), 
	.S(FE_OCPN424_n277), 
	.B(FE_RN_1289_0), 
	.A(FE_OCP_RBN505_FE_RN_35_0));
   INVX2 FE_RC_1866_0 (.Y(FE_RN_1225_0), 
	.A(FE_OCPN273_FE_OFN198_n194));
   AND2X2 FE_RC_1865_0 (.Y(FE_RN_1224_0), 
	.B(n282), 
	.A(FE_OCPN273_FE_OFN198_n194));
   AOI21X1 FE_RC_1864_0 (.Y(n219), 
	.C(FE_RN_1224_0), 
	.B(n278), 
	.A(FE_RN_1225_0));
   INVX2 FE_RC_1851_0 (.Y(FE_RN_1215_0), 
	.A(n119));
   NOR2X1 FE_RC_1850_0 (.Y(FE_RN_1214_0), 
	.B(FE_OCP_RBN501_FE_RN_126_0), 
	.A(FE_RN_1215_0));
   AOI21X1 FE_RC_1849_0 (.Y(n245), 
	.C(FE_RN_1214_0), 
	.B(n122), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   INVX2 FE_RC_1848_0 (.Y(FE_RN_1213_0), 
	.A(n120));
   NOR2X1 FE_RC_1847_0 (.Y(FE_RN_1212_0), 
	.B(FE_OFN196_n205), 
	.A(FE_RN_1213_0));
   AOI21X1 FE_RC_1846_0 (.Y(n244), 
	.C(FE_RN_1212_0), 
	.B(n122), 
	.A(FE_OFN196_n205));
   INVX2 FE_RC_1834_0 (.Y(FE_RN_1204_0), 
	.A(n146));
   NOR2X1 FE_RC_1833_0 (.Y(FE_RN_1203_0), 
	.B(n209), 
	.A(FE_RN_1204_0));
   AOI21X1 FE_RC_1832_0 (.Y(n241), 
	.C(FE_RN_1203_0), 
	.B(FE_OCP_RBN505_FE_RN_35_0), 
	.A(n209));
   INVX2 FE_RC_1828_0 (.Y(FE_RN_1200_0), 
	.A(n144));
   NOR2X1 FE_RC_1827_0 (.Y(FE_RN_1199_0), 
	.B(n276), 
	.A(FE_RN_1200_0));
   AOI21X1 FE_RC_1826_0 (.Y(n243), 
	.C(FE_RN_1199_0), 
	.B(n276), 
	.A(FE_OCP_RBN505_FE_RN_35_0));
   INVX2 FE_RC_1825_0 (.Y(FE_RN_1198_0), 
	.A(n159));
   NOR2X1 FE_RC_1824_0 (.Y(FE_RN_1197_0), 
	.B(FE_OCP_RBN501_FE_RN_126_0), 
	.A(FE_RN_1198_0));
   AOI21X1 FE_RC_1823_0 (.Y(n229), 
	.C(FE_RN_1197_0), 
	.B(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   INVX2 FE_RC_1810_0 (.Y(FE_RN_1188_0), 
	.A(n204));
   NOR2X1 FE_RC_1809_0 (.Y(FE_RN_1187_0), 
	.B(FE_OCP_RBN501_FE_RN_126_0), 
	.A(FE_RN_1188_0));
   AOI21X1 FE_RC_1808_0 (.Y(n213), 
	.C(FE_RN_1187_0), 
	.B(n278), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   NAND3X1 FE_RC_1780_0 (.Y(FE_RN_327_0), 
	.C(FE_RN_355_0), 
	.B(FE_RN_356_0), 
	.A(FE_RN_354_0));
   NAND3X1 FE_RC_1771_0 (.Y(rdata[7]), 
	.C(n292), 
	.B(n294), 
	.A(n293));
   OAI22X1 FE_RC_1770_0 (.Y(FE_RN_1154_0), 
	.D(FE_OFN193_n195), 
	.C(n166), 
	.B(FE_OFN191_FE_RN_28_0), 
	.A(n167));
   OAI22X1 FE_RC_1769_0 (.Y(n133), 
	.D(FE_OFN191_FE_RN_28_0), 
	.C(n147), 
	.B(FE_OFN193_n195), 
	.A(n146));
   OAI22X1 FE_RC_1768_0 (.Y(FE_RN_329_0), 
	.D(FE_OCPN464_FE_OFN191_FE_RN_28_0), 
	.C(n127), 
	.B(FE_OCPN446_FE_OFN193_n195), 
	.A(n126));
   AOI22X1 FE_RC_1758_0 (.Y(n136), 
	.D(FE_OCP_RBN349_FE_RN_511_0), 
	.C(\fiforeg[4][4] ), 
	.B(n277), 
	.A(\fiforeg[5][4] ));
   BUFX2 FE_OCPC425_n277 (.Y(FE_OCPN425_n277), 
	.A(n277));
   BUFX4 FE_OCPC424_n277 (.Y(FE_OCPN424_n277), 
	.A(n277));
   BUFX4 FE_OCPC422_n16 (.Y(FE_OCPN422_n16), 
	.A(n16));
   BUFX4 FE_OCPC421_n16 (.Y(FE_OCPN421_n16), 
	.A(n16));
   NAND3X1 FE_RC_1734_0 (.Y(FE_OFN199_n289), 
	.C(FE_OCPN431_raddr_1_), 
	.B(raddr[0]), 
	.A(n64));
   INVX4 FE_RC_1727_0 (.Y(FE_RN_1157_0), 
	.A(wdata[5]));
   AOI22X1 FE_RC_1726_0 (.Y(FE_RN_1156_0), 
	.D(FE_OCP_RBN498_FE_RN_126_0), 
	.C(\fiforeg[6][5] ), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][5] ));
   OAI22X1 FE_RC_1725_0 (.Y(FE_RN_1155_0), 
	.D(n164), 
	.C(FE_OFN198_n194), 
	.B(n165), 
	.A(FE_OCP_RBN405_n193));
   NOR2X1 FE_RC_1723_0 (.Y(FE_RN_1153_0), 
	.B(FE_RN_1155_0), 
	.A(FE_RN_1154_0));
   AOI22X1 FE_RC_1722_0 (.Y(FE_RN_1152_0), 
	.D(FE_OCP_RBN353_FE_RN_511_0), 
	.C(\fiforeg[4][5] ), 
	.B(n277), 
	.A(\fiforeg[5][5] ));
   NAND3X1 FE_RC_1721_0 (.Y(FE_RN_1151_0), 
	.C(FE_RN_1153_0), 
	.B(FE_RN_1152_0), 
	.A(FE_RN_1156_0));
   NAND2X1 FE_RC_1720_0 (.Y(FE_RN_1150_0), 
	.B(FE_RN_1151_0), 
	.A(FE_OCP_RBN315_wenable_fifo));
   OAI21X1 FE_RC_1718_0 (.Y(FE_RN_1149_0), 
	.C(FE_RN_1150_0), 
	.B(FE_OCP_RBN300_FE_OCPN219_wenable_fifo), 
	.A(FE_RN_1157_0));
   INVX8 FE_RC_1685_0 (.Y(FE_RN_1120_0), 
	.A(wdata[2]));
   NAND2X1 FE_RC_1684_0 (.Y(FE_RN_1119_0), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][2] ));
   NAND2X1 FE_RC_1683_0 (.Y(FE_RN_1118_0), 
	.B(FE_OCP_RBN498_FE_RN_126_0), 
	.A(\fiforeg[6][2] ));
   NAND2X1 FE_RC_1682_0 (.Y(FE_RN_1117_0), 
	.B(FE_RN_1118_0), 
	.A(FE_RN_1119_0));
   AOI22X1 FE_RC_1681_0 (.Y(FE_RN_1116_0), 
	.D(FE_OCP_RBN351_FE_RN_511_0), 
	.C(\fiforeg[4][2] ), 
	.B(n277), 
	.A(\fiforeg[5][2] ));
   NOR2X1 FE_RC_1680_0 (.Y(FE_RN_1115_0), 
	.B(FE_OCP_RBN405_n193), 
	.A(n105));
   NOR2X1 FE_RC_1679_0 (.Y(FE_RN_1114_0), 
	.B(FE_OFN198_n194), 
	.A(n104));
   NOR2X1 FE_RC_1678_0 (.Y(FE_RN_1113_0), 
	.B(FE_RN_1114_0), 
	.A(FE_RN_1115_0));
   NOR2X1 FE_RC_1677_0 (.Y(FE_RN_1112_0), 
	.B(FE_OFN193_n195), 
	.A(n106));
   NOR2X1 FE_RC_1676_0 (.Y(FE_RN_1111_0), 
	.B(FE_OFN191_FE_RN_28_0), 
	.A(n107));
   NOR2X1 FE_RC_1675_0 (.Y(FE_RN_1110_0), 
	.B(FE_RN_1111_0), 
	.A(FE_RN_1112_0));
   NAND3X1 FE_RC_1674_0 (.Y(FE_RN_1109_0), 
	.C(FE_RN_1113_0), 
	.B(FE_RN_1116_0), 
	.A(FE_RN_1110_0));
   OAI21X1 FE_RC_1673_0 (.Y(FE_RN_1108_0), 
	.C(FE_OCP_RBN300_FE_OCPN219_wenable_fifo), 
	.B(FE_RN_1109_0), 
	.A(FE_RN_1117_0));
   BUFX4 FE_RC_1576_0 (.Y(FE_OFN196_n205), 
	.A(n205));
   INVX2 FE_RC_1564_0 (.Y(FE_RN_1038_0), 
	.A(n107));
   NOR2X1 FE_RC_1563_0 (.Y(FE_RN_1037_0), 
	.B(FE_RN_40_0), 
	.A(FE_RN_1038_0));
   AOI21X1 FE_RC_1562_0 (.Y(n256), 
	.C(FE_RN_1037_0), 
	.B(n102), 
	.A(FE_RN_40_0));
   INVX2 FE_RC_1552_0 (.Y(FE_RN_1030_0), 
	.A(FE_OCPN370_FE_OFN193_n195));
   AND2X2 FE_RC_1551_0 (.Y(FE_RN_1029_0), 
	.B(n186), 
	.A(FE_OCPN370_FE_OFN193_n195));
   AOI21X1 FE_RC_1550_0 (.Y(n225), 
	.C(FE_RN_1029_0), 
	.B(n182), 
	.A(FE_RN_1030_0));
   INVX2 FE_RC_1543_0 (.Y(FE_RN_1024_0), 
	.A(FE_OCPN370_FE_OFN193_n195));
   AND2X2 FE_RC_1542_0 (.Y(FE_RN_1023_0), 
	.B(n286), 
	.A(FE_OCPN370_FE_OFN193_n195));
   AOI21X1 FE_RC_1541_0 (.Y(n217), 
	.C(FE_RN_1023_0), 
	.B(n278), 
	.A(FE_RN_1024_0));
   INVX2 FE_RC_1540_0 (.Y(FE_RN_1022_0), 
	.A(n99));
   NOR2X1 FE_RC_1539_0 (.Y(FE_RN_1021_0), 
	.B(FE_OCP_RBN501_FE_RN_126_0), 
	.A(FE_RN_1022_0));
   AOI21X1 FE_RC_1538_0 (.Y(n253), 
	.C(FE_RN_1021_0), 
	.B(n102), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   INVX2 FE_RC_1531_0 (.Y(FE_RN_1016_0), 
	.A(n106));
   NOR2X1 FE_RC_1530_0 (.Y(FE_RN_1015_0), 
	.B(n209), 
	.A(FE_RN_1016_0));
   AOI21X1 FE_RC_1529_0 (.Y(n257), 
	.C(FE_RN_1015_0), 
	.B(n102), 
	.A(n209));
   INVX2 FE_RC_1516_0 (.Y(FE_RN_1006_0), 
	.A(n276));
   AOI22X1 FE_RC_1515_0 (.Y(n251), 
	.D(n122), 
	.C(n276), 
	.B(FE_RN_1006_0), 
	.A(n124));
   INVX2 FE_RC_1494_0 (.Y(FE_RN_992_0), 
	.A(n160));
   NOR2X1 FE_RC_1493_0 (.Y(FE_RN_991_0), 
	.B(FE_OFN197_n205), 
	.A(FE_RN_992_0));
   AOI21X1 FE_RC_1492_0 (.Y(n228), 
	.C(FE_RN_991_0), 
	.B(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(FE_OFN197_n205));
   OR2X1 FE_RC_1429_0 (.Y(FE_RN_958_0), 
	.B(n288), 
	.A(FE_OFN191_FE_RN_28_0));
   NAND2X1 FE_RC_1428_0 (.Y(FE_RN_871_0), 
	.B(FE_RN_958_0), 
	.A(FE_RN_872_0));
   AOI22X1 FE_RC_1412_0 (.Y(n137), 
	.D(FE_OCP_RBN498_FE_RN_126_0), 
	.C(\fiforeg[6][4] ), 
	.B(FE_OFN196_n205), 
	.A(\fiforeg[7][4] ));
   OAI22X1 FE_RC_1410_0 (.Y(n149), 
	.D(n144), 
	.C(FE_OFN202_n283), 
	.B(n145), 
	.A(FE_OFN200_n285));
   OAI22X1 FE_RC_1404_0 (.Y(n290), 
	.D(n286), 
	.C(FE_OCPN465_FE_OFN201_n287), 
	.B(n288), 
	.A(FE_OCPN366_FE_OFN199_n289));
   INVX8 FE_RC_1398_0 (.Y(n15), 
	.A(FE_RN_951_0));
   NAND2X1 FE_RC_1397_0 (.Y(FE_RN_951_0), 
	.B(FE_OCPN439_n65), 
	.A(n17));
   INVX8 FE_RC_1383_0 (.Y(n277), 
	.A(FE_RN_946_0));
   NAND3X1 FE_RC_1382_0 (.Y(FE_RN_946_0), 
	.C(FE_OCP_RBN396_waddr_1_), 
	.B(FE_OCP_RBN515_waddr_0_), 
	.A(waddr[2]));
   INVX2 FE_RC_1372_0 (.Y(FE_RN_939_0), 
	.A(FE_OCPN269_FE_OFN191_FE_RN_28_0));
   MUX2X1 FE_RC_1371_0 (.Y(n271), 
	.S(FE_RN_939_0), 
	.B(n67), 
	.A(FE_OCPN254_n32));
   INVX2 FE_RC_1355_0 (.Y(FE_RN_928_0), 
	.A(n164));
   NOR2X1 FE_RC_1354_0 (.Y(FE_RN_927_0), 
	.B(n276), 
	.A(FE_RN_928_0));
   AOI21X1 FE_RC_1353_0 (.Y(n235), 
	.C(FE_RN_927_0), 
	.B(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(n276));
   INVX2 FE_RC_1352_0 (.Y(FE_RN_926_0), 
	.A(n180));
   NOR2X1 FE_RC_1351_0 (.Y(FE_RN_925_0), 
	.B(FE_OFN197_n205), 
	.A(FE_RN_926_0));
   INVX2 FE_RC_1349_0 (.Y(FE_RN_924_0), 
	.A(n184));
   NOR2X1 FE_RC_1348_0 (.Y(FE_RN_923_0), 
	.B(n276), 
	.A(FE_RN_924_0));
   AOI21X1 FE_RC_1347_0 (.Y(n227), 
	.C(FE_RN_923_0), 
	.B(n182), 
	.A(n276));
   OAI22X1 FE_RC_1317_0 (.Y(n134), 
	.D(n144), 
	.C(FE_OFN198_n194), 
	.B(n145), 
	.A(FE_OCP_RBN405_n193));
   INVX2 FE_RC_1299_0 (.Y(FE_RN_900_0), 
	.A(n68));
   NAND3X1 FE_RC_1298_0 (.Y(FE_RN_899_0), 
	.C(n71), 
	.B(n72), 
	.A(FE_RN_900_0));
   OR2X2 FE_RC_1297_0 (.Y(rdata[0]), 
	.B(n69), 
	.A(FE_RN_899_0));
   INVX2 FE_OCP_RBC408_n193 (.Y(FE_OCP_RBN408_n193), 
	.A(FE_OCP_RBN407_n193));
   INVX1 FE_OCP_RBC407_n193 (.Y(FE_OCP_RBN407_n193), 
	.A(FE_OCP_RBN405_n193));
   INVX2 FE_OCP_RBC406_n193 (.Y(FE_OCP_RBN406_n193), 
	.A(FE_OCP_RBN404_n193));
   INVX4 FE_OCP_RBC405_n193 (.Y(FE_OCP_RBN405_n193), 
	.A(FE_OCP_RBN404_n193));
   INVX4 FE_OCP_RBC404_n193 (.Y(FE_OCP_RBN404_n193), 
	.A(n193));
   INVX2 FE_OCP_RBC403_waddr_1_ (.Y(FE_OCP_RBN403_waddr_1_), 
	.A(FE_OCP_RBN402_waddr_1_));
   INVX4 FE_OCP_RBC402_waddr_1_ (.Y(FE_OCP_RBN402_waddr_1_), 
	.A(FE_OCP_RBN394_waddr_1_));
   BUFX4 FE_OCP_RBC397_waddr_1_ (.Y(FE_OCP_RBN397_waddr_1_), 
	.A(FE_OCP_RBN389_waddr_1_));
   INVX1 FE_OCP_RBC396_waddr_1_ (.Y(FE_OCP_RBN396_waddr_1_), 
	.A(FE_OCP_RBN397_waddr_1_));
   INVX2 FE_OCP_RBC395_waddr_1_ (.Y(FE_OCP_RBN395_waddr_1_), 
	.A(FE_OCP_RBN397_waddr_1_));
   BUFX2 FE_OCP_RBC394_waddr_1_ (.Y(FE_OCP_RBN394_waddr_1_), 
	.A(FE_OCP_RBN389_waddr_1_));
   BUFX2 FE_OCPC370_FE_OFN193_n195 (.Y(FE_OCPN370_FE_OFN193_n195), 
	.A(FE_OCPN368_FE_OFN193_n195));
   BUFX2 FE_OCPC368_FE_OFN193_n195 (.Y(FE_OCPN368_FE_OFN193_n195), 
	.A(FE_OFN193_n195));
   BUFX4 FE_OCPC367_FE_OFN199_n289 (.Y(FE_OCPN367_FE_OFN199_n289), 
	.A(FE_OFN199_n289));
   BUFX4 FE_OCPC366_FE_OFN199_n289 (.Y(FE_OCPN366_FE_OFN199_n289), 
	.A(FE_OFN199_n289));
   BUFX2 FE_OCPC362_n65 (.Y(FE_OCPN362_n65), 
	.A(n65));
   BUFX2 FE_OCPC361_raddr_0_ (.Y(FE_OCPN361_raddr_0_), 
	.A(raddr[0]));
   OAI22X1 FE_RC_1293_0 (.Y(n74), 
	.D(n84), 
	.C(FE_OFN198_n194), 
	.B(n85), 
	.A(FE_OCP_RBN406_n193));
   NAND3X1 FE_RC_1291_0 (.Y(n194), 
	.C(FE_OCP_RBN296_waddr_2_), 
	.B(FE_OCP_RBN512_waddr_0_), 
	.A(FE_OCP_RBN402_waddr_1_));
   AND2X2 FE_RC_1290_0 (.Y(FE_RN_897_0), 
	.B(FE_OCP_RBN514_waddr_0_), 
	.A(FE_OCP_RBN394_waddr_1_));
   INVX8 FE_RC_1289_0 (.Y(FE_OFN191_FE_RN_28_0), 
	.A(FE_RN_896_0));
   AND2X2 FE_RC_1288_0 (.Y(FE_RN_896_0), 
	.B(FE_OCP_RBN296_waddr_2_), 
	.A(FE_RN_897_0));
   BUFX2 FE_OCP_RBC353_FE_RN_511_0 (.Y(FE_OCP_RBN353_FE_RN_511_0), 
	.A(FE_OCP_RBN349_FE_RN_511_0));
   INVX2 FE_OCP_RBC352_FE_RN_511_0 (.Y(FE_OCP_RBN352_FE_RN_511_0), 
	.A(FE_OCP_RBN350_FE_RN_511_0));
   INVX4 FE_OCP_RBC351_FE_RN_511_0 (.Y(FE_OCP_RBN351_FE_RN_511_0), 
	.A(FE_OCP_RBN350_FE_RN_511_0));
   INVX4 FE_OCP_RBC350_FE_RN_511_0 (.Y(FE_OCP_RBN350_FE_RN_511_0), 
	.A(FE_OCPN441_FE_OCP_RBN348_FE_RN_511_0));
   BUFX4 FE_OCP_RBC349_FE_RN_511_0 (.Y(FE_OCP_RBN349_FE_RN_511_0), 
	.A(FE_OCP_RBN348_FE_RN_511_0));
   INVX2 FE_OCP_RBC348_FE_RN_511_0 (.Y(FE_OCP_RBN348_FE_RN_511_0), 
	.A(FE_RN_511_0));
   INVX8 FE_OCP_RBC315_wenable_fifo (.Y(FE_OCP_RBN315_wenable_fifo), 
	.A(FE_OCP_RBN313_wenable_fifo));
   INVX1 FE_OCP_RBC314_wenable_fifo (.Y(FE_OCP_RBN314_wenable_fifo), 
	.A(FE_OCP_RBN313_wenable_fifo));
   BUFX2 FE_OCP_RBC285_raddr_1_ (.Y(FE_OCP_RBN285_raddr_1_), 
	.A(raddr[1]));
   BUFX2 FE_OCPC282_FE_OFN200_n285 (.Y(FE_OCPN282_FE_OFN200_n285), 
	.A(FE_OCPN240_FE_OFN200_n285));
   BUFX2 FE_OCPC274_FE_OFN198_n194 (.Y(FE_OCPN274_FE_OFN198_n194), 
	.A(FE_OFN198_n194));
   BUFX2 FE_OCPC273_FE_OFN198_n194 (.Y(FE_OCPN273_FE_OFN198_n194), 
	.A(FE_OCPN463_FE_OFN198_n194));
   BUFX4 FE_OCPC271_FE_OFN198_n194 (.Y(FE_OCPN271_FE_OFN198_n194), 
	.A(FE_OCPN462_FE_OFN198_n194));
   BUFX4 FE_OCPC270_FE_OFN191_FE_RN_28_0 (.Y(FE_OCPN270_FE_OFN191_FE_RN_28_0), 
	.A(FE_OCPN268_FE_OFN191_FE_RN_28_0));
   BUFX2 FE_OCPC269_FE_OFN191_FE_RN_28_0 (.Y(FE_OCPN269_FE_OFN191_FE_RN_28_0), 
	.A(FE_OCPN268_FE_OFN191_FE_RN_28_0));
   BUFX2 FE_OCPC268_FE_OFN191_FE_RN_28_0 (.Y(FE_OCPN268_FE_OFN191_FE_RN_28_0), 
	.A(FE_OFN191_FE_RN_28_0));
   BUFX4 FE_OCPC254_n32 (.Y(FE_OCPN254_n32), 
	.A(n32));
   BUFX2 FE_OCPC253_n32 (.Y(FE_OCPN253_n32), 
	.A(n32));
   BUFX4 FE_OCPC240_FE_OFN200_n285 (.Y(FE_OCPN240_FE_OFN200_n285), 
	.A(FE_OFN200_n285));
   BUFX2 FE_OCPC234_n14 (.Y(FE_OCPN234_n14), 
	.A(FE_OCP_RBN305_FE_OCPN219_wenable_fifo));
   BUFX2 FE_OCPC233_n14 (.Y(FE_OCPN233_n14), 
	.A(wenable));
   BUFX2 FE_OCPC224_n207 (.Y(FE_OCPN224_n207), 
	.A(FE_OCPN222_n207));
   BUFX4 FE_OCPC222_n207 (.Y(FE_OCPN222_n207), 
	.A(FE_OCP_RBN352_FE_RN_511_0));
   INVX2 FE_RC_1261_0 (.Y(FE_RN_878_0), 
	.A(\fiforeg[5][1] ));
   MUX2X1 FE_RC_1260_0 (.Y(n262), 
	.S(FE_OCPN424_n277), 
	.B(FE_RN_878_0), 
	.A(n82));
   NOR2X1 FE_RC_1255_0 (.Y(FE_RN_875_0), 
	.B(FE_OCPN274_FE_OFN198_n194), 
	.A(n282));
   NOR2X1 FE_RC_1254_0 (.Y(FE_RN_874_0), 
	.B(FE_OCP_RBN405_n193), 
	.A(n284));
   NOR2X1 FE_RC_1253_0 (.Y(FE_RN_873_0), 
	.B(FE_RN_875_0), 
	.A(FE_RN_874_0));
   OR2X1 FE_RC_1252_0 (.Y(FE_RN_872_0), 
	.B(n286), 
	.A(FE_OFN193_n195));
   NAND2X1 FE_RC_1250_0 (.Y(FE_RN_870_0), 
	.B(n277), 
	.A(\fiforeg[5][7] ));
   NAND2X1 FE_RC_1249_0 (.Y(FE_RN_869_0), 
	.B(\fiforeg[4][7] ), 
	.A(FE_OCP_RBN349_FE_RN_511_0));
   NAND2X1 FE_RC_1248_0 (.Y(FE_RN_868_0), 
	.B(FE_RN_869_0), 
	.A(FE_RN_870_0));
   NAND2X1 FE_RC_1247_0 (.Y(FE_RN_867_0), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][7] ));
   NAND2X1 FE_RC_1246_0 (.Y(FE_RN_866_0), 
	.B(\fiforeg[6][7] ), 
	.A(FE_OCP_RBN498_FE_RN_126_0));
   NAND2X1 FE_RC_1245_0 (.Y(FE_RN_865_0), 
	.B(FE_RN_866_0), 
	.A(FE_RN_867_0));
   NOR3X1 FE_RC_1244_0 (.Y(FE_RN_864_0), 
	.C(FE_RN_865_0), 
	.B(FE_RN_871_0), 
	.A(FE_RN_868_0));
   NAND3X1 FE_RC_1243_0 (.Y(FE_RN_863_0), 
	.C(FE_RN_864_0), 
	.B(FE_RN_873_0), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   OR2X1 FE_RC_1242_0 (.Y(FE_RN_862_0), 
	.B(wdata[7]), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   INVX8 FE_RC_1241_0 (.Y(n278), 
	.A(FE_RN_861_0));
   AND2X2 FE_RC_1240_0 (.Y(FE_RN_861_0), 
	.B(FE_RN_863_0), 
	.A(FE_RN_862_0));
   OAI22X1 FE_RC_1173_0 (.Y(n73), 
	.D(FE_OFN193_n195), 
	.C(n86), 
	.B(FE_OFN191_FE_RN_28_0), 
	.A(n87));
   NOR2X1 FE_RC_1149_0 (.Y(FE_RN_790_0), 
	.B(FE_OCP_RBN501_FE_RN_126_0), 
	.A(\fiforeg[6][4] ));
   AOI21X1 FE_RC_1148_0 (.Y(n237), 
	.C(FE_RN_790_0), 
	.B(FE_OCP_RBN505_FE_RN_35_0), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   NOR2X1 FE_RC_1147_0 (.Y(FE_RN_789_0), 
	.B(FE_OFN196_n205), 
	.A(\fiforeg[7][4] ));
   AOI21X1 FE_RC_1146_0 (.Y(n236), 
	.C(FE_RN_789_0), 
	.B(FE_OCP_RBN505_FE_RN_35_0), 
	.A(FE_OFN196_n205));
   INVX2 FE_RC_1082_0 (.Y(FE_RN_733_0), 
	.A(FE_OCPN233_n14));
   NAND2X1 FE_RC_1081_0 (.Y(FE_RN_732_0), 
	.B(FE_RN_733_0), 
	.A(wdata[0]));
   NAND2X1 FE_RC_1080_0 (.Y(FE_RN_731_0), 
	.B(FE_OCPN233_n14), 
	.A(n53));
   INVX4 FE_RC_1079_0 (.Y(n57), 
	.A(FE_RN_730_0));
   NAND2X1 FE_RC_1078_0 (.Y(FE_RN_730_0), 
	.B(FE_RN_731_0), 
	.A(FE_RN_732_0));
   OAI22X1 FE_RC_1075_0 (.Y(n48), 
	.D(FE_OCPN482_FE_OFN193_n195), 
	.C(n66), 
	.B(n67), 
	.A(FE_OFN191_FE_RN_28_0));
   NAND3X1 FE_RC_1072_0 (.Y(n193), 
	.C(FE_OCP_RBN296_waddr_2_), 
	.B(FE_OCP_RBN514_waddr_0_), 
	.A(FE_OCP_RBN402_waddr_1_));
   BUFX4 FE_OFC202_n283 (.Y(FE_OFN202_n283), 
	.A(n283));
   BUFX4 FE_OFC200_n285 (.Y(FE_OFN200_n285), 
	.A(n285));
   BUFX4 FE_OFC198_n194 (.Y(FE_OFN198_n194), 
	.A(n194));
   INVX8 FE_OFC197_n205 (.Y(FE_OFN197_n205), 
	.A(FE_OFN195_n205));
   INVX4 FE_OFC195_n205 (.Y(FE_OFN195_n205), 
	.A(n205));
   INVX8 FE_OFC193_n195 (.Y(FE_OFN193_n195), 
	.A(FE_OFN192_n195));
   INVX4 FE_OFC192_n195 (.Y(FE_OFN192_n195), 
	.A(n195));
   NOR2X1 FE_RC_877_0 (.Y(FE_RN_604_0), 
	.B(FE_OCPN222_n207), 
	.A(\fiforeg[4][1] ));
   AOI21X1 FE_RC_876_0 (.Y(n263), 
	.C(FE_RN_604_0), 
	.B(n82), 
	.A(FE_OCPN224_n207));
   NOR2X1 FE_RC_862_0 (.Y(FE_RN_599_0), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][1] ));
   AOI21X1 FE_RC_861_0 (.Y(n260), 
	.C(FE_RN_599_0), 
	.B(n82), 
	.A(FE_OFN197_n205));
   NAND3X1 FE_RC_762_0 (.Y(FE_RN_511_0), 
	.C(FE_OCP_RBN513_waddr_0_), 
	.B(waddr[2]), 
	.A(FE_OCP_RBN395_waddr_1_));
   INVX2 FE_RC_757_0 (.Y(FE_RN_509_0), 
	.A(FE_OCPN269_FE_OFN191_FE_RN_28_0));
   AND2X2 FE_RC_756_0 (.Y(FE_RN_508_0), 
	.B(n87), 
	.A(FE_OCPN269_FE_OFN191_FE_RN_28_0));
   AOI21X1 FE_RC_755_0 (.Y(n264), 
	.C(FE_RN_508_0), 
	.B(n82), 
	.A(FE_RN_509_0));
   NOR2X1 FE_RC_753_0 (.Y(FE_RN_506_0), 
	.B(FE_OCP_RBN502_FE_RN_126_0), 
	.A(\fiforeg[6][1] ));
   AOI21X1 FE_RC_752_0 (.Y(n261), 
	.C(FE_RN_506_0), 
	.B(n82), 
	.A(FE_OCP_RBN501_FE_RN_126_0));
   INVX2 FE_RC_748_0 (.Y(FE_RN_503_0), 
	.A(n86));
   NOR2X1 FE_RC_747_0 (.Y(FE_RN_502_0), 
	.B(n209), 
	.A(FE_RN_503_0));
   AOI21X1 FE_RC_746_0 (.Y(n265), 
	.C(FE_RN_502_0), 
	.B(n82), 
	.A(n209));
   INVX2 FE_RC_546_0 (.Y(FE_RN_365_0), 
	.A(n85));
   NOR2X1 FE_RC_545_0 (.Y(FE_RN_364_0), 
	.B(n211), 
	.A(FE_RN_365_0));
   AOI21X1 FE_RC_544_0 (.Y(n266), 
	.C(FE_RN_364_0), 
	.B(n82), 
	.A(n211));
   INVX2 FE_RC_539_0 (.Y(FE_RN_361_0), 
	.A(FE_OCP_RBN314_wenable_fifo));
   AOI22X1 FE_RC_532_0 (.Y(n51), 
	.D(FE_OCP_RBN352_FE_RN_511_0), 
	.C(\fiforeg[4][0] ), 
	.B(FE_OCPN425_n277), 
	.A(\fiforeg[5][0] ));
   AND2X2 FE_RC_525_0 (.Y(FE_RN_356_0), 
	.B(FE_RN_331_0), 
	.A(FE_RN_332_0));
   INVX2 FE_RC_524_0 (.Y(FE_RN_355_0), 
	.A(FE_RN_329_0));
   INVX2 FE_RC_523_0 (.Y(FE_RN_354_0), 
	.A(FE_RN_330_0));
   INVX2 FE_RC_497_0 (.Y(FE_RN_334_0), 
	.A(wdata[3]));
   OR2X1 FE_RC_496_0 (.Y(FE_RN_333_0), 
	.B(FE_RN_334_0), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   AOI22X1 FE_RC_495_0 (.Y(FE_RN_332_0), 
	.D(\fiforeg[6][3] ), 
	.C(FE_OCP_RBN498_FE_RN_126_0), 
	.B(\fiforeg[7][3] ), 
	.A(FE_OFN196_n205));
   OAI22X1 FE_RC_493_0 (.Y(FE_RN_330_0), 
	.D(FE_OFN198_n194), 
	.C(n124), 
	.B(n125), 
	.A(FE_OCP_RBN405_n193));
   NAND2X1 FE_RC_489_0 (.Y(FE_RN_326_0), 
	.B(FE_RN_327_0), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   INVX4 FE_RC_488_0 (.Y(n122), 
	.A(FE_RN_325_0));
   NAND2X1 FE_RC_487_0 (.Y(FE_RN_325_0), 
	.B(FE_RN_326_0), 
	.A(FE_RN_333_0));
   INVX2 FE_RC_398_0 (.Y(FE_RN_245_0), 
	.A(\fiforeg[5][0] ));
   MUX2X1 FE_RC_397_0 (.Y(n269), 
	.S(FE_OCPN424_n277), 
	.B(FE_RN_245_0), 
	.A(FE_OCPN253_n32));
   NAND3X1 FE_RC_362_0 (.Y(FE_RN_47_0), 
	.C(FE_OCP_RBN515_waddr_0_), 
	.B(FE_OCP_RBN397_waddr_1_), 
	.A(waddr[2]));
   INVX2 FE_RC_354_0 (.Y(FE_RN_214_0), 
	.A(n84));
   NOR2X1 FE_RC_353_0 (.Y(FE_RN_213_0), 
	.B(n276), 
	.A(FE_RN_214_0));
   AOI21X1 FE_RC_352_0 (.Y(n267), 
	.C(FE_RN_213_0), 
	.B(n82), 
	.A(n276));
   INVX2 FE_RC_351_0 (.Y(FE_RN_212_0), 
	.A(n165));
   NOR2X1 FE_RC_350_0 (.Y(FE_RN_211_0), 
	.B(n211), 
	.A(FE_RN_212_0));
   AOI21X1 FE_RC_349_0 (.Y(n234), 
	.C(FE_RN_211_0), 
	.B(FE_OCP_RBN477_FE_RN_1149_0), 
	.A(n211));
   OR2X1 FE_RC_335_0 (.Y(FE_RN_205_0), 
	.B(FE_RN_34_0), 
	.A(FE_OCP_RBN301_FE_OCPN219_wenable_fifo));
   NAND2X1 FE_RC_334_0 (.Y(FE_RN_32_0), 
	.B(FE_RN_33_0), 
	.A(FE_RN_205_0));
   AND2X1 FE_RC_285_0 (.Y(FE_RN_183_0), 
	.B(n136), 
	.A(n137));
   NAND2X1 FE_RC_284_0 (.Y(n138), 
	.B(n135), 
	.A(FE_RN_183_0));
   NAND2X1 FE_RC_187_0 (.Y(FE_RN_127_0), 
	.B(FE_OCP_RBN397_waddr_1_), 
	.A(FE_OCP_RBN512_waddr_0_));
   OR2X2 FE_RC_185_0 (.Y(FE_RN_126_0), 
	.B(FE_OCP_RBN296_waddr_2_), 
	.A(FE_RN_127_0));
   INVX2 FE_RC_176_0 (.Y(FE_RN_120_0), 
	.A(\fiforeg[4][6] ));
   MUX2X1 FE_RC_175_0 (.Y(n223), 
	.S(FE_OCPN222_n207), 
	.B(FE_RN_120_0), 
	.A(n182));
   INVX4 FE_RC_141_0 (.Y(n102), 
	.A(FE_RN_93_0));
   INVX2 FE_RC_77_0 (.Y(n205), 
	.A(FE_RN_47_0));
   INVX2 FE_RC_68_0 (.Y(FE_RN_41_0), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   MUX2X1 FE_RC_67_0 (.Y(n248), 
	.S(FE_RN_41_0), 
	.B(n127), 
	.A(n122));
   INVX2 FE_RC_66_0 (.Y(FE_RN_40_0), 
	.A(FE_OCPN270_FE_OFN191_FE_RN_28_0));
   INVX2 FE_RC_62_0 (.Y(FE_RN_38_0), 
	.A(wdata[4]));
   OR2X1 FE_RC_61_0 (.Y(FE_RN_37_0), 
	.B(FE_RN_38_0), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   NAND2X1 FE_RC_60_0 (.Y(FE_RN_36_0), 
	.B(n138), 
	.A(FE_OCP_RBN300_FE_OCPN219_wenable_fifo));
   NAND2X1 FE_RC_58_0 (.Y(FE_RN_35_0), 
	.B(FE_RN_36_0), 
	.A(FE_RN_37_0));
   INVX8 FE_RC_57_0 (.Y(FE_RN_34_0), 
	.A(wdata[1]));
   NAND2X1 FE_RC_56_0 (.Y(FE_RN_33_0), 
	.B(FE_OCP_RBN301_FE_OCPN219_wenable_fifo), 
	.A(n78));
   INVX4 FE_RC_55_0 (.Y(n82), 
	.A(FE_RN_32_0));
   AOI22X1 FE_RC_51_0 (.Y(n76), 
	.D(FE_OCP_RBN351_FE_RN_511_0), 
	.C(\fiforeg[4][1] ), 
	.B(n277), 
	.A(\fiforeg[5][1] ));
   AOI22X1 FE_RC_50_0 (.Y(n77), 
	.D(FE_OCP_RBN498_FE_RN_126_0), 
	.C(\fiforeg[6][1] ), 
	.B(FE_OFN197_n205), 
	.A(\fiforeg[7][1] ));
   NAND3X1 FE_RC_45_0 (.Y(n195), 
	.C(FE_OCP_RBN403_waddr_1_), 
	.B(FE_OCP_RBN512_waddr_0_), 
	.A(FE_OCP_RBN296_waddr_2_));
   DFFPOSX1 \fiforeg_reg[7][7]  (.Q(\fiforeg[7][7] ), 
	.D(n212), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[6][7]  (.Q(\fiforeg[6][7] ), 
	.D(n213), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[5][7]  (.Q(\fiforeg[5][7] ), 
	.D(n214), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[4][7]  (.Q(\fiforeg[4][7] ), 
	.D(n215), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[3][7]  (.Q(\fiforeg[3][7] ), 
	.D(n216), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[2][7]  (.Q(\fiforeg[2][7] ), 
	.D(n217), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[1][7]  (.Q(\fiforeg[1][7] ), 
	.D(n218), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[0][7]  (.Q(\fiforeg[0][7] ), 
	.D(n219), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[7][6]  (.Q(\fiforeg[7][6] ), 
	.D(n220), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[6][6]  (.Q(\fiforeg[6][6] ), 
	.D(n221), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[5][6]  (.Q(\fiforeg[5][6] ), 
	.D(n222), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[4][6]  (.Q(\fiforeg[4][6] ), 
	.D(n223), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[3][6]  (.Q(\fiforeg[3][6] ), 
	.D(n224), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[2][6]  (.Q(\fiforeg[2][6] ), 
	.D(n225), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[1][6]  (.Q(\fiforeg[1][6] ), 
	.D(n226), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[0][6]  (.Q(\fiforeg[0][6] ), 
	.D(n227), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[7][5]  (.Q(\fiforeg[7][5] ), 
	.D(n228), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[6][5]  (.Q(\fiforeg[6][5] ), 
	.D(n229), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[5][5]  (.Q(\fiforeg[5][5] ), 
	.D(n230), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[4][5]  (.Q(\fiforeg[4][5] ), 
	.D(n231), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[3][5]  (.Q(\fiforeg[3][5] ), 
	.D(n232), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[2][5]  (.Q(\fiforeg[2][5] ), 
	.D(n233), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[1][5]  (.Q(\fiforeg[1][5] ), 
	.D(n234), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[0][5]  (.Q(\fiforeg[0][5] ), 
	.D(n235), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[7][4]  (.Q(\fiforeg[7][4] ), 
	.D(n236), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[6][4]  (.Q(\fiforeg[6][4] ), 
	.D(n237), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[5][4]  (.Q(\fiforeg[5][4] ), 
	.D(n238), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[4][4]  (.Q(\fiforeg[4][4] ), 
	.D(n239), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[3][4]  (.Q(\fiforeg[3][4] ), 
	.D(n240), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[2][4]  (.Q(\fiforeg[2][4] ), 
	.D(n241), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[1][4]  (.Q(\fiforeg[1][4] ), 
	.D(n242), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[0][4]  (.Q(\fiforeg[0][4] ), 
	.D(n243), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[7][3]  (.Q(\fiforeg[7][3] ), 
	.D(n244), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[6][3]  (.Q(\fiforeg[6][3] ), 
	.D(n245), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[5][3]  (.Q(\fiforeg[5][3] ), 
	.D(n246), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[4][3]  (.Q(\fiforeg[4][3] ), 
	.D(n247), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[3][3]  (.Q(\fiforeg[3][3] ), 
	.D(n248), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[2][3]  (.Q(\fiforeg[2][3] ), 
	.D(n249), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[1][3]  (.Q(\fiforeg[1][3] ), 
	.D(n250), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[0][3]  (.Q(\fiforeg[0][3] ), 
	.D(n251), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[7][2]  (.Q(\fiforeg[7][2] ), 
	.D(n252), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[6][2]  (.Q(\fiforeg[6][2] ), 
	.D(n253), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[5][2]  (.Q(\fiforeg[5][2] ), 
	.D(n254), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[4][2]  (.Q(\fiforeg[4][2] ), 
	.D(n255), 
	.CLK(nclk__L2_N1));
   DFFPOSX1 \fiforeg_reg[3][2]  (.Q(\fiforeg[3][2] ), 
	.D(n256), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[2][2]  (.Q(\fiforeg[2][2] ), 
	.D(n257), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[1][2]  (.Q(\fiforeg[1][2] ), 
	.D(n258), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[0][2]  (.Q(\fiforeg[0][2] ), 
	.D(n259), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[7][1]  (.Q(\fiforeg[7][1] ), 
	.D(n260), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[6][1]  (.Q(\fiforeg[6][1] ), 
	.D(n261), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[5][1]  (.Q(\fiforeg[5][1] ), 
	.D(n262), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[4][1]  (.Q(\fiforeg[4][1] ), 
	.D(n263), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[3][1]  (.Q(\fiforeg[3][1] ), 
	.D(n264), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[2][1]  (.Q(\fiforeg[2][1] ), 
	.D(n265), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][1]  (.Q(\fiforeg[1][1] ), 
	.D(n266), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[0][1]  (.Q(\fiforeg[0][1] ), 
	.D(n267), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[7][0]  (.Q(\fiforeg[7][0] ), 
	.D(n275), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[6][0]  (.Q(\fiforeg[6][0] ), 
	.D(n268), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[5][0]  (.Q(\fiforeg[5][0] ), 
	.D(n269), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[4][0]  (.Q(\fiforeg[4][0] ), 
	.D(n270), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[3][0]  (.Q(\fiforeg[3][0] ), 
	.D(n271), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[2][0]  (.Q(\fiforeg[2][0] ), 
	.D(n272), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][0]  (.Q(\fiforeg[1][0] ), 
	.D(n273), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[0][0]  (.Q(\fiforeg[0][0] ), 
	.D(n274), 
	.CLK(wclk));
   INVX8 U4 (.Y(n65), 
	.A(raddr[0]));
   MUX2X1 U8 (.Y(n224), 
	.S(FE_OCPN270_FE_OFN191_FE_RN_28_0), 
	.B(n182), 
	.A(n187));
   INVX2 U16 (.Y(n4), 
	.A(n64));
   MUX2X1 U22 (.Y(n216), 
	.S(FE_OCPN270_FE_OFN191_FE_RN_28_0), 
	.B(n278), 
	.A(n288));
   INVX8 U24 (.Y(n276), 
	.A(FE_OCPN271_FE_OFN198_n194));
   AND2X2 U45 (.Y(n16), 
	.B(FE_OCPN438_raddr_0_), 
	.A(n17));
   AND2X2 U49 (.Y(n17), 
	.B(FE_OCPN432_raddr_2_), 
	.A(FE_OCPN431_raddr_1_));
   INVX2 U70 (.Y(n54), 
	.A(\fiforeg[6][0] ));
   AOI22X1 U73 (.Y(n52), 
	.D(FE_OFN197_n205), 
	.C(\fiforeg[7][0] ), 
	.B(FE_OCP_RBN498_FE_RN_126_0), 
	.A(\fiforeg[6][0] ));
   INVX2 U78 (.Y(n62), 
	.A(\fiforeg[0][0] ));
   INVX4 U80 (.Y(n63), 
	.A(\fiforeg[1][0] ));
   OAI22X1 U81 (.Y(n49), 
	.D(n63), 
	.C(FE_OCP_RBN406_n193), 
	.B(FE_OFN198_n194), 
	.A(n62));
   INVX4 U83 (.Y(n67), 
	.A(\fiforeg[3][0] ));
   INVX2 U85 (.Y(n66), 
	.A(\fiforeg[2][0] ));
   NOR2X1 U87 (.Y(n50), 
	.B(n49), 
	.A(n48));
   MUX2X1 U89 (.Y(n268), 
	.S(FE_OCP_RBN501_FE_RN_126_0), 
	.B(n54), 
	.A(FE_OCPN254_n32));
   INVX2 U90 (.Y(n55), 
	.A(\fiforeg[7][0] ));
   MUX2X1 U91 (.Y(n275), 
	.S(FE_OFN197_n205), 
	.B(n55), 
	.A(n57));
   INVX2 U92 (.Y(n56), 
	.A(\fiforeg[4][0] ));
   MUX2X1 U93 (.Y(n270), 
	.S(FE_OCPN222_n207), 
	.B(n56), 
	.A(FE_OCPN254_n32));
   INVX8 U94 (.Y(n209), 
	.A(FE_OCPN368_FE_OFN193_n195));
   INVX4 U97 (.Y(n211), 
	.A(FE_OCP_RBN408_n193));
   MUX2X1 U98 (.Y(n273), 
	.S(n211), 
	.B(n63), 
	.A(n57));
   MUX2X1 U99 (.Y(n274), 
	.S(n276), 
	.B(n62), 
	.A(n57));
   NAND3X1 U102 (.Y(n59), 
	.C(FE_OCP_RBN283_raddr_1_), 
	.B(n4), 
	.A(FE_OCPN361_raddr_0_));
   INVX8 U103 (.Y(n281), 
	.A(n59));
   NAND3X1 U104 (.Y(n60), 
	.C(n4), 
	.B(FE_OCPN362_n65), 
	.A(FE_OCP_RBN287_raddr_1_));
   INVX8 U105 (.Y(n280), 
	.A(n60));
   AOI22X1 U106 (.Y(n72), 
	.D(n280), 
	.C(\fiforeg[4][0] ), 
	.B(n281), 
	.A(\fiforeg[5][0] ));
   AOI22X1 U107 (.Y(n71), 
	.D(n15), 
	.C(\fiforeg[6][0] ), 
	.B(FE_OCPN422_n16), 
	.A(\fiforeg[7][0] ));
   INVX2 U108 (.Y(n64), 
	.A(raddr[2]));
   NAND3X1 U109 (.Y(n285), 
	.C(FE_OCP_RBN283_raddr_1_), 
	.B(raddr[0]), 
	.A(n64));
   NAND3X1 U110 (.Y(n283), 
	.C(n65), 
	.B(FE_OCP_RBN283_raddr_1_), 
	.A(n64));
   OAI22X1 U111 (.Y(n69), 
	.D(n62), 
	.C(FE_OCPN444_FE_OFN202_n283), 
	.B(n63), 
	.A(FE_OCPN282_FE_OFN200_n285));
   OAI22X1 U114 (.Y(n68), 
	.D(n66), 
	.C(FE_OCPN466_FE_OFN201_n287), 
	.B(n67), 
	.A(FE_OCPN367_FE_OFN199_n289));
   INVX4 U120 (.Y(n84), 
	.A(\fiforeg[0][1] ));
   INVX4 U121 (.Y(n85), 
	.A(\fiforeg[1][1] ));
   INVX2 U123 (.Y(n87), 
	.A(\fiforeg[3][1] ));
   INVX2 U124 (.Y(n86), 
	.A(\fiforeg[2][1] ));
   NOR2X1 U126 (.Y(n75), 
	.B(n74), 
	.A(n73));
   AOI22X1 U138 (.Y(n92), 
	.D(n280), 
	.C(\fiforeg[4][1] ), 
	.B(n281), 
	.A(\fiforeg[5][1] ));
   AOI22X1 U139 (.Y(n91), 
	.D(n15), 
	.C(\fiforeg[6][1] ), 
	.B(FE_OCPN422_n16), 
	.A(\fiforeg[7][1] ));
   OAI22X1 U140 (.Y(n89), 
	.D(n84), 
	.C(FE_OCPN443_FE_OFN202_n283), 
	.B(n85), 
	.A(FE_OCPN240_FE_OFN200_n285));
   OAI22X1 U141 (.Y(n88), 
	.D(n86), 
	.C(FE_OCPN466_FE_OFN201_n287), 
	.B(n87), 
	.A(FE_OCPN367_FE_OFN199_n289));
   NOR2X1 U142 (.Y(n90), 
	.B(n88), 
	.A(n89));
   NAND3X1 U143 (.Y(rdata[1]), 
	.C(n90), 
	.B(n91), 
	.A(n92));
   INVX2 U144 (.Y(n99), 
	.A(\fiforeg[6][2] ));
   INVX2 U147 (.Y(n104), 
	.A(\fiforeg[0][2] ));
   INVX2 U148 (.Y(n105), 
	.A(\fiforeg[1][2] ));
   INVX2 U150 (.Y(n107), 
	.A(\fiforeg[3][2] ));
   INVX2 U151 (.Y(n106), 
	.A(\fiforeg[2][2] ));
   INVX2 U156 (.Y(n100), 
	.A(\fiforeg[7][2] ));
   MUX2X1 U157 (.Y(n252), 
	.S(FE_OFN197_n205), 
	.B(n100), 
	.A(n102));
   INVX2 U158 (.Y(n101), 
	.A(\fiforeg[4][2] ));
   MUX2X1 U159 (.Y(n255), 
	.S(FE_OCPN222_n207), 
	.B(n101), 
	.A(n102));
   MUX2X1 U161 (.Y(n258), 
	.S(n211), 
	.B(n105), 
	.A(n102));
   INVX2 U163 (.Y(n103), 
	.A(\fiforeg[5][2] ));
   MUX2X1 U164 (.Y(n254), 
	.S(FE_OCPN424_n277), 
	.B(n103), 
	.A(n102));
   AOI22X1 U165 (.Y(n112), 
	.D(n280), 
	.C(\fiforeg[4][2] ), 
	.B(n281), 
	.A(\fiforeg[5][2] ));
   AOI22X1 U166 (.Y(n111), 
	.D(n15), 
	.C(\fiforeg[6][2] ), 
	.B(FE_OCPN422_n16), 
	.A(\fiforeg[7][2] ));
   OAI22X1 U167 (.Y(n109), 
	.D(n104), 
	.C(FE_OCPN443_FE_OFN202_n283), 
	.B(n105), 
	.A(FE_OCPN240_FE_OFN200_n285));
   OAI22X1 U168 (.Y(n108), 
	.D(n106), 
	.C(FE_OCPN466_FE_OFN201_n287), 
	.B(n107), 
	.A(FE_OCPN367_FE_OFN199_n289));
   NOR2X1 U169 (.Y(n110), 
	.B(n108), 
	.A(n109));
   NAND3X1 U170 (.Y(rdata[2]), 
	.C(n110), 
	.B(n111), 
	.A(n112));
   INVX2 U171 (.Y(n119), 
	.A(\fiforeg[6][3] ));
   INVX4 U174 (.Y(n124), 
	.A(\fiforeg[0][3] ));
   INVX4 U175 (.Y(n125), 
	.A(\fiforeg[1][3] ));
   INVX2 U177 (.Y(n127), 
	.A(\fiforeg[3][3] ));
   INVX2 U178 (.Y(n126), 
	.A(\fiforeg[2][3] ));
   INVX2 U183 (.Y(n120), 
	.A(\fiforeg[7][3] ));
   INVX2 U185 (.Y(n121), 
	.A(\fiforeg[4][3] ));
   MUX2X1 U186 (.Y(n247), 
	.S(FE_OCPN222_n207), 
	.B(n121), 
	.A(n122));
   MUX2X1 U188 (.Y(n250), 
	.S(n211), 
	.B(n125), 
	.A(n122));
   INVX2 U190 (.Y(n123), 
	.A(\fiforeg[5][3] ));
   MUX2X1 U191 (.Y(n246), 
	.S(FE_OCPN424_n277), 
	.B(n123), 
	.A(n122));
   AOI22X1 U192 (.Y(n132), 
	.D(n280), 
	.C(\fiforeg[4][3] ), 
	.B(n281), 
	.A(\fiforeg[5][3] ));
   AOI22X1 U193 (.Y(n131), 
	.D(n15), 
	.C(\fiforeg[6][3] ), 
	.B(FE_OCPN421_n16), 
	.A(\fiforeg[7][3] ));
   OAI22X1 U194 (.Y(n129), 
	.D(n124), 
	.C(FE_OFN202_n283), 
	.B(n125), 
	.A(FE_OFN200_n285));
   OAI22X1 U195 (.Y(n128), 
	.D(n126), 
	.C(FE_OCPN465_FE_OFN201_n287), 
	.B(n127), 
	.A(FE_OCPN366_FE_OFN199_n289));
   NOR2X1 U196 (.Y(n130), 
	.B(n128), 
	.A(n129));
   NAND3X1 U197 (.Y(rdata[3]), 
	.C(n130), 
	.B(n131), 
	.A(n132));
   INVX4 U201 (.Y(n144), 
	.A(\fiforeg[0][4] ));
   INVX4 U202 (.Y(n145), 
	.A(\fiforeg[1][4] ));
   INVX2 U204 (.Y(n147), 
	.A(\fiforeg[3][4] ));
   INVX2 U205 (.Y(n146), 
	.A(\fiforeg[2][4] ));
   NOR2X1 U207 (.Y(n135), 
	.B(n134), 
	.A(n133));
   INVX2 U212 (.Y(n141), 
	.A(\fiforeg[4][4] ));
   MUX2X1 U213 (.Y(n239), 
	.S(FE_OCPN222_n207), 
	.B(n141), 
	.A(FE_OCP_RBN505_FE_RN_35_0));
   MUX2X1 U215 (.Y(n242), 
	.S(n211), 
	.B(n145), 
	.A(FE_OCP_RBN505_FE_RN_35_0));
   AOI22X1 U219 (.Y(n152), 
	.D(n280), 
	.C(\fiforeg[4][4] ), 
	.B(n281), 
	.A(\fiforeg[5][4] ));
   AOI22X1 U220 (.Y(n151), 
	.D(n15), 
	.C(\fiforeg[6][4] ), 
	.B(FE_OCPN421_n16), 
	.A(\fiforeg[7][4] ));
   OAI22X1 U222 (.Y(n148), 
	.D(n146), 
	.C(FE_OCPN465_FE_OFN201_n287), 
	.B(n147), 
	.A(FE_OCPN366_FE_OFN199_n289));
   NOR2X1 U223 (.Y(n150), 
	.B(n148), 
	.A(n149));
   NAND3X1 U224 (.Y(rdata[4]), 
	.C(n150), 
	.B(n152), 
	.A(n151));
   INVX2 U225 (.Y(n159), 
	.A(\fiforeg[6][5] ));
   INVX4 U228 (.Y(n164), 
	.A(\fiforeg[0][5] ));
   INVX4 U229 (.Y(n165), 
	.A(\fiforeg[1][5] ));
   INVX2 U231 (.Y(n167), 
	.A(\fiforeg[3][5] ));
   INVX2 U232 (.Y(n166), 
	.A(\fiforeg[2][5] ));
   INVX2 U237 (.Y(n160), 
	.A(\fiforeg[7][5] ));
   INVX2 U239 (.Y(n161), 
	.A(\fiforeg[4][5] ));
   MUX2X1 U240 (.Y(n231), 
	.S(FE_OCPN222_n207), 
	.B(n161), 
	.A(FE_OCP_RBN477_FE_RN_1149_0));
   MUX2X1 U241 (.Y(n233), 
	.S(n209), 
	.B(n166), 
	.A(FE_OCP_RBN477_FE_RN_1149_0));
   INVX2 U244 (.Y(n163), 
	.A(\fiforeg[5][5] ));
   MUX2X1 U245 (.Y(n230), 
	.S(FE_OCPN424_n277), 
	.B(n163), 
	.A(FE_OCP_RBN477_FE_RN_1149_0));
   AOI22X1 U246 (.Y(n172), 
	.D(n280), 
	.C(\fiforeg[4][5] ), 
	.B(n281), 
	.A(\fiforeg[5][5] ));
   AOI22X1 U247 (.Y(n171), 
	.D(n15), 
	.C(\fiforeg[6][5] ), 
	.B(FE_OCPN422_n16), 
	.A(\fiforeg[7][5] ));
   OAI22X1 U248 (.Y(n169), 
	.D(n164), 
	.C(FE_OCPN443_FE_OFN202_n283), 
	.B(n165), 
	.A(FE_OCPN240_FE_OFN200_n285));
   OAI22X1 U249 (.Y(n168), 
	.D(n166), 
	.C(FE_OCPN466_FE_OFN201_n287), 
	.B(n167), 
	.A(FE_OCPN367_FE_OFN199_n289));
   NOR2X1 U250 (.Y(n170), 
	.B(n169), 
	.A(n168));
   NAND3X1 U251 (.Y(rdata[5]), 
	.C(n170), 
	.B(n171), 
	.A(n172));
   INVX2 U252 (.Y(n179), 
	.A(\fiforeg[6][6] ));
   INVX4 U255 (.Y(n184), 
	.A(\fiforeg[0][6] ));
   INVX2 U256 (.Y(n185), 
	.A(\fiforeg[1][6] ));
   INVX2 U258 (.Y(n187), 
	.A(\fiforeg[3][6] ));
   INVX4 U259 (.Y(n186), 
	.A(\fiforeg[2][6] ));
   MUX2X1 U264 (.Y(n221), 
	.S(FE_OCP_RBN501_FE_RN_126_0), 
	.B(n179), 
	.A(n182));
   INVX2 U265 (.Y(n180), 
	.A(\fiforeg[7][6] ));
   MUX2X1 U269 (.Y(n226), 
	.S(n211), 
	.B(n185), 
	.A(n182));
   INVX2 U271 (.Y(n183), 
	.A(\fiforeg[5][6] ));
   MUX2X1 U272 (.Y(n222), 
	.S(FE_OCPN424_n277), 
	.B(n183), 
	.A(n182));
   AOI22X1 U273 (.Y(n192), 
	.D(n280), 
	.C(\fiforeg[4][6] ), 
	.B(n281), 
	.A(\fiforeg[5][6] ));
   AOI22X1 U274 (.Y(n191), 
	.D(n15), 
	.C(\fiforeg[6][6] ), 
	.B(FE_OCPN422_n16), 
	.A(\fiforeg[7][6] ));
   OAI22X1 U275 (.Y(n189), 
	.D(n184), 
	.C(FE_OCPN443_FE_OFN202_n283), 
	.B(n185), 
	.A(FE_OCPN240_FE_OFN200_n285));
   OAI22X1 U276 (.Y(n188), 
	.D(n186), 
	.C(FE_OCPN466_FE_OFN201_n287), 
	.B(n187), 
	.A(FE_OCPN367_FE_OFN199_n289));
   NOR2X1 U277 (.Y(n190), 
	.B(n189), 
	.A(n188));
   NAND3X1 U278 (.Y(rdata[6]), 
	.C(n190), 
	.B(n191), 
	.A(n192));
   INVX2 U279 (.Y(n204), 
	.A(\fiforeg[6][7] ));
   INVX8 U282 (.Y(n282), 
	.A(\fiforeg[0][7] ));
   INVX2 U283 (.Y(n284), 
	.A(\fiforeg[1][7] ));
   INVX4 U285 (.Y(n288), 
	.A(\fiforeg[3][7] ));
   INVX4 U286 (.Y(n286), 
	.A(\fiforeg[2][7] ));
   INVX2 U291 (.Y(n206), 
	.A(\fiforeg[7][7] ));
   MUX2X1 U292 (.Y(n212), 
	.S(FE_OFN197_n205), 
	.B(n206), 
	.A(n278));
   INVX2 U293 (.Y(n208), 
	.A(\fiforeg[4][7] ));
   MUX2X1 U294 (.Y(n215), 
	.S(FE_OCPN222_n207), 
	.B(n208), 
	.A(n278));
   MUX2X1 U295 (.Y(n218), 
	.S(n211), 
	.B(n284), 
	.A(n278));
   INVX2 U296 (.Y(n279), 
	.A(\fiforeg[5][7] ));
   MUX2X1 U297 (.Y(n214), 
	.S(FE_OCPN424_n277), 
	.B(n279), 
	.A(n278));
   AOI22X1 U298 (.Y(n294), 
	.D(n280), 
	.C(\fiforeg[4][7] ), 
	.B(n281), 
	.A(\fiforeg[5][7] ));
   AOI22X1 U299 (.Y(n293), 
	.D(n15), 
	.C(\fiforeg[6][7] ), 
	.B(FE_OCPN421_n16), 
	.A(\fiforeg[7][7] ));
   OAI22X1 U300 (.Y(n291), 
	.D(n282), 
	.C(FE_OFN202_n283), 
	.B(n284), 
	.A(FE_OFN200_n285));
   NOR2X1 U302 (.Y(n292), 
	.B(n290), 
	.A(n291));
endmodule

module write_ptr (
	wclk, 
	rst_n, 
	wenable, 
	wptr, 
	wptr_nxt, 
	FE_OCPN62_wptr_nxt_3_, 
	FE_OCP_RBN67_n24, 
	FE_OCP_RBN68_n24, 
	FE_OCP_RBN73_n24, 
	FE_OCP_RBN92_n24, 
	FE_OCPN104_wptr_nxt_0_, 
	FE_OCPN105_wptr_nxt_1_, 
	nclk__L2_N7, 
	FE_OCPN322_wptr_nxt_2_, 
	FE_OCP_RBN428_wptr_nxt_3_);
   input wclk;
   input rst_n;
   input wenable;
   output [3:0] wptr;
   output [3:0] wptr_nxt;
   input FE_OCPN62_wptr_nxt_3_;
   input FE_OCP_RBN67_n24;
   input FE_OCP_RBN68_n24;
   input FE_OCP_RBN73_n24;
   input FE_OCP_RBN92_n24;
   input FE_OCPN104_wptr_nxt_0_;
   input FE_OCPN105_wptr_nxt_1_;
   input nclk__L2_N7;
   input FE_OCPN322_wptr_nxt_2_;
   input FE_OCP_RBN428_wptr_nxt_3_;

   // Internal wires
   wire FE_OCP_RBN472_n20;
   wire FE_OCP_RBN471_n20;
   wire FE_OCP_RBN470_n20;
   wire FE_OCPN460_binary_r_1_;
   wire FE_RN_1296_0;
   wire FE_RN_1256_0;
   wire FE_RN_1255_0;
   wire FE_RN_1254_0;
   wire FE_RN_1253_0;
   wire FE_RN_1252_0;
   wire FE_RN_1251_0;
   wire FE_RN_1250_0;
   wire FE_RN_1056_0;
   wire FE_RN_1055_0;
   wire FE_RN_1054_0;
   wire FE_RN_1053_0;
   wire FE_RN_1052_0;
   wire FE_RN_1051_0;
   wire FE_RN_954_0;
   wire FE_OCPN411_n21;
   wire FE_OCPN318_FE_OCP_RBN65_n24;
   wire FE_OCPN267_FE_OCP_RBN107_n22;
   wire FE_OCPN244_wptr_nxt_2_;
   wire FE_OCPN239_n12;
   wire FE_RN_446_0;
   wire FE_OCP_RBN107_n22;
   wire FE_RN_234_0;
   wire FE_RN_233_0;
   wire n12;
   wire n14;
   wire n17;
   wire n18;
   wire n20;
   wire n21;
   wire n24;
   wire n25;
   wire n26;
   wire [2:0] binary_nxt;
   wire [3:0] binary_r;

   BUFX2 FE_OCP_RBC472_n20 (.Y(FE_OCP_RBN472_n20), 
	.A(n20));
   BUFX2 FE_OCP_RBC471_n20 (.Y(FE_OCP_RBN471_n20), 
	.A(n20));
   BUFX2 FE_OCP_RBC470_n20 (.Y(FE_OCP_RBN470_n20), 
	.A(FE_OCP_RBN471_n20));
   BUFX2 FE_OCPC460_binary_r_1_ (.Y(FE_OCPN460_binary_r_1_), 
	.A(binary_r[1]));
   AND2X2 FE_RC_1980_0 (.Y(FE_RN_1296_0), 
	.B(binary_r[2]), 
	.A(FE_RN_446_0));
   NAND2X1 FE_RC_1979_0 (.Y(n24), 
	.B(wenable), 
	.A(FE_RN_1296_0));
   XOR2X1 FE_RC_1924_0 (.Y(FE_RN_1256_0), 
	.B(binary_r[3]), 
	.A(binary_r[2]));
   NAND3X1 FE_RC_1923_0 (.Y(FE_RN_1255_0), 
	.C(n26), 
	.B(FE_OCPN460_binary_r_1_), 
	.A(binary_r[0]));
   NOR2X1 FE_RC_1922_0 (.Y(FE_RN_1254_0), 
	.B(FE_OCP_RBN68_n24), 
	.A(n14));
   AOI22X1 FE_RC_1921_0 (.Y(FE_RN_1253_0), 
	.D(n26), 
	.C(FE_RN_1254_0), 
	.B(FE_RN_1256_0), 
	.A(FE_RN_1255_0));
   INVX2 FE_RC_1920_0 (.Y(FE_RN_1252_0), 
	.A(n18));
   AND2X1 FE_RC_1919_0 (.Y(FE_RN_1251_0), 
	.B(n14), 
	.A(FE_OCPN460_binary_r_1_));
   NAND3X1 FE_RC_1918_0 (.Y(FE_RN_1250_0), 
	.C(FE_OCPN318_FE_OCP_RBN65_n24), 
	.B(FE_RN_1251_0), 
	.A(FE_RN_1252_0));
   NAND2X1 FE_RC_1917_0 (.Y(wptr_nxt[2]), 
	.B(FE_RN_1253_0), 
	.A(FE_RN_1250_0));
   AND2X2 FE_RC_1892_0 (.Y(FE_OCP_RBN107_n22), 
	.B(FE_RN_446_0), 
	.A(wenable));
   OAI21X1 FE_RC_1782_0 (.Y(wptr_nxt[0]), 
	.C(FE_RN_954_0), 
	.B(n12), 
	.A(n20));
   XOR2X1 FE_RC_1660_0 (.Y(wptr_nxt[1]), 
	.B(n21), 
	.A(FE_OCP_RBN472_n20));
   INVX2 FE_RC_1598_0 (.Y(FE_RN_1056_0), 
	.A(n17));
   NAND2X1 FE_RC_1597_0 (.Y(FE_RN_1055_0), 
	.B(binary_r[0]), 
	.A(FE_RN_1056_0));
   INVX2 FE_RC_1596_0 (.Y(FE_RN_1054_0), 
	.A(FE_RN_234_0));
   NAND2X1 FE_RC_1595_0 (.Y(FE_RN_1053_0), 
	.B(FE_RN_1054_0), 
	.A(FE_RN_1055_0));
   INVX2 FE_RC_1594_0 (.Y(FE_RN_1052_0), 
	.A(FE_RN_234_0));
   NAND2X1 FE_RC_1593_0 (.Y(FE_RN_1051_0), 
	.B(FE_OCP_RBN73_n24), 
	.A(FE_RN_1052_0));
   NAND2X1 FE_RC_1592_0 (.Y(FE_RN_233_0), 
	.B(FE_RN_1051_0), 
	.A(FE_RN_1053_0));
   NAND2X1 FE_RC_1422_0 (.Y(FE_RN_954_0), 
	.B(n12), 
	.A(n20));
   BUFX2 FE_OCPC411_n21 (.Y(FE_OCPN411_n21), 
	.A(n21));
   BUFX2 FE_OCPC318_FE_OCP_RBN65_n24 (.Y(FE_OCPN318_FE_OCP_RBN65_n24), 
	.A(FE_OCP_RBN67_n24));
   BUFX2 FE_OCPC267_FE_OCP_RBN107_n22 (.Y(FE_OCPN267_FE_OCP_RBN107_n22), 
	.A(FE_OCP_RBN107_n22));
   BUFX2 FE_OCPC244_wptr_nxt_2_ (.Y(FE_OCPN244_wptr_nxt_2_), 
	.A(FE_OCPN322_wptr_nxt_2_));
   BUFX2 FE_OCPC239_n12 (.Y(FE_OCPN239_n12), 
	.A(n12));
   AND2X2 FE_RC_646_0 (.Y(FE_RN_446_0), 
	.B(binary_r[0]), 
	.A(binary_r[1]));
   XNOR2X1 FE_RC_642_0 (.Y(n21), 
	.B(binary_r[2]), 
	.A(FE_OCPN267_FE_OCP_RBN107_n22));
   AND2X2 FE_RC_384_0 (.Y(FE_RN_234_0), 
	.B(n17), 
	.A(n18));
   OAI21X1 FE_RC_382_0 (.Y(n20), 
	.C(FE_RN_233_0), 
	.B(FE_OCPN460_binary_r_1_), 
	.A(FE_OCP_RBN67_n24));
   XNOR2X1 FE_RC_320_0 (.Y(n12), 
	.B(n18), 
	.A(FE_OCP_RBN67_n24));
   DFFSR \binary_r_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[0]), 
	.D(FE_OCPN239_n12), 
	.CLK(nclk__L2_N7));
   DFFSR \binary_r_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[1]), 
	.D(binary_nxt[1]), 
	.CLK(nclk__L2_N7));
   DFFSR \binary_r_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[2]), 
	.D(binary_nxt[2]), 
	.CLK(wclk));
   DFFSR \binary_r_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[3]), 
	.D(FE_OCP_RBN428_wptr_nxt_3_), 
	.CLK(wclk));
   DFFSR \gray_r_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wptr[3]), 
	.D(FE_OCP_RBN428_wptr_nxt_3_), 
	.CLK(wclk));
   DFFSR \gray_r_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wptr[2]), 
	.D(FE_OCPN244_wptr_nxt_2_), 
	.CLK(wclk));
   DFFSR \gray_r_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wptr[1]), 
	.D(FE_OCPN105_wptr_nxt_1_), 
	.CLK(wclk));
   DFFSR \gray_r_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wptr[0]), 
	.D(FE_OCPN104_wptr_nxt_0_), 
	.CLK(wclk));
   INVX2 U14 (.Y(binary_nxt[1]), 
	.A(FE_OCP_RBN470_n20));
   INVX2 U15 (.Y(n18), 
	.A(binary_r[0]));
   INVX4 U16 (.Y(n17), 
	.A(binary_r[1]));
   INVX2 U17 (.Y(n14), 
	.A(binary_r[3]));
   XNOR2X1 U20 (.Y(n25), 
	.B(n14), 
	.A(n24));
   INVX4 U23 (.Y(wptr_nxt[3]), 
	.A(n25));
   INVX2 U29 (.Y(binary_nxt[2]), 
	.A(FE_OCPN411_n21));
   INVX1 U33 (.Y(n26), 
	.A(binary_r[2]));
endmodule

module write_fifo_ctrl (
	wclk, 
	rst_n, 
	wenable, 
	rptr, 
	wenable_fifo, 
	wptr, 
	waddr, 
	full_flag, 
	FE_OCP_RBN140_waddr_0_, 
	FE_OCP_RBN141_waddr_0_, 
	FE_OCP_RBN149_waddr_0_, 
	FE_OCP_RBN150_waddr_0_, 
	FE_OCP_RBN155_waddr_0_, 
	FE_OCP_RBN156_waddr_0_, 
	FE_OCP_RBN166_waddr_0_, 
	FE_OCP_RBN167_waddr_0_, 
	nclk__L2_N7);
   input wclk;
   input rst_n;
   input wenable;
   input [3:0] rptr;
   output wenable_fifo;
   output [3:0] wptr;
   output [2:0] waddr;
   output full_flag;
   output FE_OCP_RBN140_waddr_0_;
   output FE_OCP_RBN141_waddr_0_;
   output FE_OCP_RBN149_waddr_0_;
   output FE_OCP_RBN150_waddr_0_;
   output FE_OCP_RBN155_waddr_0_;
   output FE_OCP_RBN156_waddr_0_;
   output FE_OCP_RBN166_waddr_0_;
   output FE_OCP_RBN167_waddr_0_;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OCP_RBN475_wptr_nxt_0_;
   wire FE_OCPN445_wptr_nxt_3_;
   wire FE_OCP_RBN429_wptr_nxt_3_;
   wire FE_OCP_RBN428_wptr_nxt_3_;
   wire FE_OCP_RBN427_wptr_nxt_3_;
   wire FE_OCP_RBN414_wptr_nxt_1_;
   wire FE_OCP_RBN401_waddr_2_;
   wire FE_OCPN323_wptr_nxt_2_;
   wire FE_OCPN322_wptr_nxt_2_;
   wire FE_OCPN221_FE_OCP_RBN65_n24;
   wire FE_OFN188_nfifo_full;
   wire FE_UNCONNECTED_7;
   wire FE_OCP_RBN73_n24;
   wire FE_OCP_RBN65_n24;
   wire \gray_wptr[2] ;
   wire N5;
   wire n4;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire [3:0] wptr_nxt;
   wire [3:0] wrptr_r2;
   wire [3:0] wrptr_r1;

   BUFX2 FE_OCP_RBC475_wptr_nxt_0_ (.Y(FE_OCP_RBN475_wptr_nxt_0_), 
	.A(wptr_nxt[0]));
   BUFX4 FE_OCPC445_wptr_nxt_3_ (.Y(FE_OCPN445_wptr_nxt_3_), 
	.A(wptr_nxt[3]));
   NAND3X1 FE_RC_1916_0 (.Y(n21), 
	.C(n18), 
	.B(n19), 
	.A(n20));
   XNOR2X1 FE_RC_1913_0 (.Y(n19), 
	.B(n17), 
	.A(FE_OCPN323_wptr_nxt_2_));
   XOR2X1 FE_RC_1741_0 (.Y(\gray_wptr[2] ), 
	.B(FE_OCPN322_wptr_nxt_2_), 
	.A(FE_OCP_RBN429_wptr_nxt_3_));
   INVX2 FE_OCP_RBC429_wptr_nxt_3_ (.Y(FE_OCP_RBN429_wptr_nxt_3_), 
	.A(FE_OCP_RBN427_wptr_nxt_3_));
   INVX1 FE_OCP_RBC428_wptr_nxt_3_ (.Y(FE_OCP_RBN428_wptr_nxt_3_), 
	.A(FE_OCP_RBN427_wptr_nxt_3_));
   INVX1 FE_OCP_RBC427_wptr_nxt_3_ (.Y(FE_OCP_RBN427_wptr_nxt_3_), 
	.A(wptr_nxt[3]));
   BUFX2 FE_OCP_RBC414_wptr_nxt_1_ (.Y(FE_OCP_RBN414_wptr_nxt_1_), 
	.A(wptr_nxt[1]));
   BUFX4 FE_OCP_RBC401_waddr_2_ (.Y(waddr[2]), 
	.A(FE_OCP_RBN401_waddr_2_));
   BUFX4 FE_OCPC323_wptr_nxt_2_ (.Y(FE_OCPN323_wptr_nxt_2_), 
	.A(wptr_nxt[2]));
   BUFX2 FE_OCPC322_wptr_nxt_2_ (.Y(FE_OCPN322_wptr_nxt_2_), 
	.A(wptr_nxt[2]));
   BUFX4 FE_OCPC221_FE_OCP_RBN65_n24 (.Y(FE_OCPN221_FE_OCP_RBN65_n24), 
	.A(FE_OCP_RBN65_n24));
   BUFX4 FE_OFC188_nfifo_full (.Y(full_flag), 
	.A(FE_OFN188_nfifo_full));
   AND2X2 FE_RC_363_0 (.Y(FE_OCP_RBN65_n24), 
	.B(n23), 
	.A(wenable));
   INVX1 FE_OCP_RBC73_n24 (.Y(FE_OCP_RBN73_n24), 
	.A(FE_OCP_RBN65_n24));
   write_ptr WPU1 (.wclk(wclk), 
	.rst_n(rst_n), 
	.wenable(FE_OCP_RBN65_n24), 
	.wptr(wptr), 
	.wptr_nxt(wptr_nxt), 
	.FE_OCPN62_wptr_nxt_3_(wptr_nxt[3]), 
	.FE_OCP_RBN67_n24(FE_OCPN221_FE_OCP_RBN65_n24), 
	.FE_OCP_RBN68_n24(FE_OCPN221_FE_OCP_RBN65_n24), 
	.FE_OCP_RBN73_n24(FE_OCP_RBN73_n24), 
	.FE_OCP_RBN92_n24(FE_UNCONNECTED_7), 
	.FE_OCPN104_wptr_nxt_0_(FE_OCP_RBN475_wptr_nxt_0_), 
	.FE_OCPN105_wptr_nxt_1_(FE_OCP_RBN414_wptr_nxt_1_), 
	.nclk__L2_N7(nclk__L2_N7), 
	.FE_OCPN322_wptr_nxt_2_(FE_OCPN322_wptr_nxt_2_), 
	.FE_OCP_RBN428_wptr_nxt_3_(FE_OCP_RBN428_wptr_nxt_3_));
   DFFSR \wrptr_r1_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r1[3]), 
	.D(rptr[3]), 
	.CLK(wclk));
   DFFSR \wrptr_r1_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r1[2]), 
	.D(rptr[2]), 
	.CLK(wclk));
   DFFSR \wrptr_r1_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r1[1]), 
	.D(rptr[1]), 
	.CLK(nclk__L2_N7));
   DFFSR \wrptr_r1_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r1[0]), 
	.D(rptr[0]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r2[3]), 
	.D(wrptr_r1[3]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r2[2]), 
	.D(wrptr_r1[2]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r2[1]), 
	.D(wrptr_r1[1]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wrptr_r2[0]), 
	.D(wrptr_r1[0]), 
	.CLK(wclk));
   DFFSR full_flag_r_reg (.S(1'b1), 
	.R(rst_n), 
	.Q(FE_OFN188_nfifo_full), 
	.D(N5), 
	.CLK(wclk));
   DFFSR \waddr_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(FE_OCP_RBN401_waddr_2_), 
	.D(\gray_wptr[2] ), 
	.CLK(nclk__L2_N7));
   DFFSR \waddr_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(waddr[1]), 
	.D(FE_OCP_RBN414_wptr_nxt_1_), 
	.CLK(nclk__L2_N7));
   DFFSR \waddr_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(waddr[0]), 
	.D(FE_OCP_RBN475_wptr_nxt_0_), 
	.CLK(nclk__L2_N7));
   AND2X2 U15 (.Y(wenable_fifo), 
	.B(n23), 
	.A(wenable));
   INVX4 U16 (.Y(n23), 
	.A(full_flag));
   XOR2X1 U20 (.Y(n4), 
	.B(wrptr_r2[2]), 
	.A(wrptr_r2[3]));
   XOR2X1 U21 (.Y(n17), 
	.B(n4), 
	.A(wptr_nxt[3]));
   XOR2X1 U22 (.Y(n22), 
	.B(wrptr_r2[1]), 
	.A(wptr_nxt[1]));
   XOR2X1 U23 (.Y(n20), 
	.B(wrptr_r2[3]), 
	.A(FE_OCPN445_wptr_nxt_3_));
   XNOR2X1 U25 (.Y(n18), 
	.B(wrptr_r2[0]), 
	.A(wptr_nxt[0]));
   NOR2X1 U27 (.Y(N5), 
	.B(n21), 
	.A(n22));
endmodule

module read_ptr (
	rclk, 
	rst_n, 
	renable, 
	rptr, 
	rptr_nxt, 
	FE_OCPN89_rptr_nxt_1_, 
	nclk__L2_N5, 
	nclk__L2_N7, 
	FE_OCPN260_rptr_nxt_0_);
   input rclk;
   input rst_n;
   input renable;
   output [3:0] rptr;
   output [3:0] rptr_nxt;
   input FE_OCPN89_rptr_nxt_1_;
   input nclk__L2_N5;
   input nclk__L2_N7;
   input FE_OCPN260_rptr_nxt_0_;

   // Internal wires
   wire FE_OCPN435_binary_r_0_;
   wire FE_OCPN434_binary_r_0_;
   wire FE_OCPN262_rptr_nxt_2_;
   wire FE_OCPN261_rptr_nxt_3_;
   wire FE_OCPN249_renable_p2;
   wire FE_OCPN248_renable_p2;
   wire FE_RN_385_0;
   wire FE_RN_357_0;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n19;
   wire n20;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire [2:0] binary_nxt;
   wire [3:0] binary_r;

   BUFX2 FE_OCPC435_binary_r_0_ (.Y(FE_OCPN435_binary_r_0_), 
	.A(binary_r[0]));
   BUFX2 FE_OCPC434_binary_r_0_ (.Y(FE_OCPN434_binary_r_0_), 
	.A(binary_r[0]));
   OAI21X1 FE_RC_1441_0 (.Y(n38), 
	.C(n36), 
	.B(n32), 
	.A(n37));
   AOI21X1 FE_RC_1430_0 (.Y(n49), 
	.C(n42), 
	.B(n55), 
	.A(n43));
   BUFX2 FE_OCPC262_rptr_nxt_2_ (.Y(FE_OCPN262_rptr_nxt_2_), 
	.A(rptr_nxt[2]));
   BUFX2 FE_OCPC261_rptr_nxt_3_ (.Y(FE_OCPN261_rptr_nxt_3_), 
	.A(rptr_nxt[3]));
   BUFX2 FE_OCPC249_renable_p2 (.Y(FE_OCPN249_renable_p2), 
	.A(renable));
   BUFX4 FE_OCPC248_renable_p2 (.Y(FE_OCPN248_renable_p2), 
	.A(renable));
   INVX2 FE_RC_573_0 (.Y(FE_RN_385_0), 
	.A(n50));
   AOI21X1 FE_RC_572_0 (.Y(n51), 
	.C(binary_r[3]), 
	.B(renable), 
	.A(FE_RN_385_0));
   AND2X2 FE_RC_527_0 (.Y(FE_RN_357_0), 
	.B(n52), 
	.A(n28));
   NAND2X1 FE_RC_526_0 (.Y(n58), 
	.B(n32), 
	.A(FE_RN_357_0));
   NAND3X1 FE_RC_331_0 (.Y(rptr_nxt[2]), 
	.C(n56), 
	.B(n58), 
	.A(n57));
   OAI21X1 FE_RC_328_0 (.Y(n16), 
	.C(n15), 
	.B(n14), 
	.A(n13));
   DFFSR \binary_r_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[0]), 
	.D(binary_nxt[0]), 
	.CLK(nclk__L2_N5));
   DFFSR \binary_r_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[1]), 
	.D(binary_nxt[1]), 
	.CLK(nclk__L2_N5));
   DFFSR \binary_r_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[2]), 
	.D(binary_nxt[2]), 
	.CLK(nclk__L2_N5));
   DFFSR \binary_r_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(binary_r[3]), 
	.D(FE_OCPN261_rptr_nxt_3_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rptr[3]), 
	.D(FE_OCPN261_rptr_nxt_3_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rptr[2]), 
	.D(FE_OCPN262_rptr_nxt_2_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rptr[1]), 
	.D(FE_OCPN89_rptr_nxt_1_), 
	.CLK(nclk__L2_N7));
   DFFSR \gray_r_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rptr[0]), 
	.D(FE_OCPN260_rptr_nxt_0_), 
	.CLK(rclk));
   INVX4 U15 (.Y(n32), 
	.A(n55));
   INVX4 U16 (.Y(rptr_nxt[3]), 
	.A(n16));
   INVX4 U17 (.Y(n26), 
	.A(binary_r[2]));
   NAND2X1 U18 (.Y(n13), 
	.B(n27), 
	.A(n19));
   INVX2 U20 (.Y(n14), 
	.A(FE_OCPN248_renable_p2));
   INVX2 U21 (.Y(n15), 
	.A(n51));
   AND2X2 U25 (.Y(n19), 
	.B(binary_r[1]), 
	.A(binary_r[0]));
   INVX4 U26 (.Y(n54), 
	.A(n19));
   INVX4 U27 (.Y(n20), 
	.A(FE_OCPN249_renable_p2));
   INVX4 U28 (.Y(n55), 
	.A(renable));
   INVX2 U31 (.Y(n40), 
	.A(binary_r[1]));
   NOR2X1 U34 (.Y(n27), 
	.B(n26), 
	.A(n52));
   INVX1 U35 (.Y(n28), 
	.A(n54));
   INVX2 U36 (.Y(n29), 
	.A(n20));
   AND2X1 U37 (.Y(n30), 
	.B(binary_r[3]), 
	.A(n26));
   NAND2X1 U39 (.Y(n56), 
	.B(n30), 
	.A(n55));
   XOR2X1 U40 (.Y(binary_nxt[0]), 
	.B(FE_OCPN434_binary_r_0_), 
	.A(n29));
   INVX2 U41 (.Y(n34), 
	.A(FE_OCPN435_binary_r_0_));
   NAND2X1 U42 (.Y(n41), 
	.B(n40), 
	.A(n34));
   OAI21X1 U43 (.Y(n33), 
	.C(n41), 
	.B(n20), 
	.A(n54));
   AOI21X1 U44 (.Y(binary_nxt[1]), 
	.C(n33), 
	.B(n40), 
	.A(n20));
   AOI22X1 U45 (.Y(n37), 
	.D(FE_OCPN434_binary_r_0_), 
	.C(binary_r[1]), 
	.B(n40), 
	.A(n34));
   NAND2X1 U46 (.Y(n45), 
	.B(n54), 
	.A(n41));
   OAI21X1 U47 (.Y(n35), 
	.C(n54), 
	.B(n45), 
	.A(FE_OCPN434_binary_r_0_));
   NAND2X1 U48 (.Y(n36), 
	.B(FE_OCPN248_renable_p2), 
	.A(n35));
   INVX4 U50 (.Y(rptr_nxt[0]), 
	.A(n38));
   NAND2X1 U51 (.Y(n50), 
	.B(n19), 
	.A(binary_r[2]));
   NAND2X1 U52 (.Y(n44), 
	.B(n26), 
	.A(n54));
   OAI21X1 U53 (.Y(n39), 
	.C(n44), 
	.B(n50), 
	.A(n20));
   AOI21X1 U54 (.Y(binary_nxt[2]), 
	.C(n39), 
	.B(n26), 
	.A(n20));
   OAI22X1 U55 (.Y(n43), 
	.D(binary_r[1]), 
	.C(binary_r[2]), 
	.B(n26), 
	.A(n40));
   NOR2X1 U56 (.Y(n42), 
	.B(n44), 
	.A(n41));
   INVX2 U58 (.Y(n46), 
	.A(n44));
   OAI21X1 U59 (.Y(n47), 
	.C(n50), 
	.B(n45), 
	.A(n46));
   NAND2X1 U60 (.Y(n48), 
	.B(n32), 
	.A(n47));
   AND2X2 U61 (.Y(rptr_nxt[1]), 
	.B(n48), 
	.A(n49));
   INVX2 U62 (.Y(n52), 
	.A(binary_r[3]));
   XOR2X1 U64 (.Y(n53), 
	.B(binary_r[2]), 
	.A(binary_r[3]));
   OAI21X1 U65 (.Y(n57), 
	.C(n53), 
	.B(n54), 
	.A(binary_r[2]));
endmodule

module read_fifo_ctrl (
	rclk, 
	rst_n, 
	renable, 
	wptr, 
	rptr, 
	raddr, 
	empty_flag, 
	nclk__L2_N5, 
	nclk__L2_N7);
   input rclk;
   input rst_n;
   input renable;
   input [3:0] wptr;
   output [3:0] rptr;
   output [2:0] raddr;
   output empty_flag;
   input nclk__L2_N5;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OCPN433_nfifo_empty;
   wire FE_RN_1177_0;
   wire FE_RN_920_0;
   wire FE_RN_916_0;
   wire FE_OCPN260_rptr_nxt_0_;
   wire FE_OCPN259_rptr_nxt_1_;
   wire FE_RN_381_0;
   wire FE_RN_380_0;
   wire n29;
   wire renable_p2;
   wire \gray_rptr[2] ;
   wire N3;
   wire n1;
   wire n4;
   wire n17;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire [3:0] rptr_nxt;
   wire [3:0] rwptr_r2;
   wire [3:0] rwptr_r1;

   BUFX2 FE_OCPC433_nfifo_empty (.Y(empty_flag), 
	.A(FE_OCPN433_nfifo_empty));
   NAND2X1 FE_RC_1794_0 (.Y(FE_RN_1177_0), 
	.B(rptr_nxt[3]), 
	.A(rwptr_r2[3]));
   OAI21X1 FE_RC_1793_0 (.Y(n25), 
	.C(FE_RN_1177_0), 
	.B(rwptr_r2[3]), 
	.A(rptr_nxt[3]));
   NAND2X1 FE_RC_1343_0 (.Y(FE_RN_920_0), 
	.B(n4), 
	.A(rptr_nxt[3]));
   OAI21X1 FE_RC_1342_0 (.Y(\gray_rptr[2] ), 
	.C(FE_RN_920_0), 
	.B(rptr_nxt[3]), 
	.A(n4));
   NAND2X1 FE_RC_1336_0 (.Y(FE_RN_916_0), 
	.B(rptr_nxt[0]), 
	.A(rwptr_r2[0]));
   OAI21X1 FE_RC_1335_0 (.Y(n22), 
	.C(FE_RN_916_0), 
	.B(rptr_nxt[0]), 
	.A(rwptr_r2[0]));
   BUFX2 FE_OCPC260_rptr_nxt_0_ (.Y(FE_OCPN260_rptr_nxt_0_), 
	.A(rptr_nxt[0]));
   BUFX2 FE_OCPC259_rptr_nxt_1_ (.Y(FE_OCPN259_rptr_nxt_1_), 
	.A(rptr_nxt[1]));
   INVX1 FE_RC_567_0 (.Y(FE_RN_381_0), 
	.A(FE_OCPN433_nfifo_empty));
   INVX4 FE_RC_566_0 (.Y(renable_p2), 
	.A(FE_RN_380_0));
   NAND2X1 FE_RC_565_0 (.Y(FE_RN_380_0), 
	.B(FE_RN_381_0), 
	.A(renable));
   read_ptr RPU1 (.rclk(rclk), 
	.rst_n(rst_n), 
	.renable(renable_p2), 
	.rptr(rptr), 
	.rptr_nxt(rptr_nxt), 
	.FE_OCPN89_rptr_nxt_1_(FE_OCPN259_rptr_nxt_1_), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N7(nclk__L2_N7), 
	.FE_OCPN260_rptr_nxt_0_(FE_OCPN260_rptr_nxt_0_));
   DFFSR \rwptr_r1_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r1[3]), 
	.D(wptr[3]), 
	.CLK(rclk));
   DFFSR \rwptr_r1_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r1[2]), 
	.D(wptr[2]), 
	.CLK(rclk));
   DFFSR \rwptr_r1_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r1[1]), 
	.D(wptr[1]), 
	.CLK(rclk));
   DFFSR \rwptr_r1_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r1[0]), 
	.D(wptr[0]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r2[3]), 
	.D(rwptr_r1[3]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r2[2]), 
	.D(rwptr_r1[2]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r2[1]), 
	.D(rwptr_r1[1]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r2[0]), 
	.D(rwptr_r1[0]), 
	.CLK(rclk));
   DFFSR empty_flag_r_reg (.S(rst_n), 
	.R(1'b1), 
	.Q(FE_OCPN433_nfifo_empty), 
	.D(N3), 
	.CLK(rclk));
   DFFSR \raddr_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(raddr[2]), 
	.D(\gray_rptr[2] ), 
	.CLK(rclk));
   DFFSR \raddr_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(raddr[1]), 
	.D(FE_OCPN259_rptr_nxt_1_), 
	.CLK(nclk__L2_N7));
   DFFSR \raddr_reg[0]  (.S(1'b1), 
	.R(rst_n), 
	.Q(n29), 
	.D(FE_OCPN260_rptr_nxt_0_), 
	.CLK(rclk));
   XOR2X1 U15 (.Y(n23), 
	.B(n1), 
	.A(rptr_nxt[2]));
   INVX2 U16 (.Y(n1), 
	.A(rwptr_r2[2]));
   INVX1 U21 (.Y(n4), 
	.A(rptr_nxt[2]));
   INVX2 U22 (.Y(n17), 
	.A(n29));
   INVX8 U23 (.Y(raddr[0]), 
	.A(n17));
   NAND2X1 U28 (.Y(n27), 
	.B(n23), 
	.A(n22));
   XNOR2X1 U30 (.Y(n24), 
	.B(rwptr_r2[1]), 
	.A(rptr_nxt[1]));
   NAND2X1 U31 (.Y(n26), 
	.B(n24), 
	.A(n25));
   NOR2X1 U32 (.Y(N3), 
	.B(n26), 
	.A(n27));
endmodule

module fifo (
	r_clk, 
	w_clk, 
	n_rst, 
	r_enable, 
	w_enable, 
	w_data, 
	r_data, 
	empty, 
	full, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input r_clk;
   input w_clk;
   input n_rst;
   input r_enable;
   input w_enable;
   input [7:0] w_data;
   output [7:0] r_data;
   output empty;
   output full;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OCP_RBN400_waddr_2_;
   wire FE_OCP_RBN313_wenable_fifo;
   wire FE_OCP_RBN312_wenable_fifo;
   wire FE_OCP_RBN311_wenable_fifo;
   wire FE_OCP_RBN305_FE_OCPN219_wenable_fifo;
   wire FE_OCP_RBN303_FE_OCPN219_wenable_fifo;
   wire FE_OCP_RBN302_FE_OCPN219_wenable_fifo;
   wire FE_OCP_RBN287_raddr_1_;
   wire FE_OCP_RBN286_raddr_1_;
   wire FE_OCP_RBN283_raddr_1_;
   wire FE_PT7_;
   wire FE_UNCONNECTED_7;
   wire FE_PT6_;
   wire FE_UNCONNECTED_6;
   wire FE_PT5_;
   wire FE_UNCONNECTED_5;
   wire FE_PT4_;
   wire FE_UNCONNECTED_4;
   wire FE_PT3_;
   wire FE_UNCONNECTED_3;
   wire FE_PT2_;
   wire FE_UNCONNECTED_2;
   wire FE_PT1_;
   wire FE_UNCONNECTED_1;
   wire FE_PT0_;
   wire FE_UNCONNECTED_0;
   wire wenable_fifo;
   wire [2:0] waddr;
   wire [2:0] raddr;
   wire [3:0] rptr;
   wire [3:0] wptr;

   BUFX4 FE_RC_1578_0 (.Y(FE_OCP_RBN313_wenable_fifo), 
	.A(wenable_fifo));
   INVX4 FE_OCP_RBC400_waddr_2_ (.Y(FE_OCP_RBN400_waddr_2_), 
	.A(waddr[2]));
   INVX8 FE_OCP_RBC312_wenable_fifo (.Y(FE_OCP_RBN312_wenable_fifo), 
	.A(wenable_fifo));
   INVX2 FE_OCP_RBC311_wenable_fifo (.Y(FE_OCP_RBN311_wenable_fifo), 
	.A(wenable_fifo));
   INVX1 FE_OCP_RBC305_FE_OCPN219_wenable_fifo (.Y(FE_OCP_RBN305_FE_OCPN219_wenable_fifo), 
	.A(FE_OCP_RBN303_FE_OCPN219_wenable_fifo));
   INVX2 FE_OCP_RBC303_FE_OCPN219_wenable_fifo (.Y(FE_OCP_RBN303_FE_OCPN219_wenable_fifo), 
	.A(FE_OCP_RBN311_wenable_fifo));
   INVX4 FE_OCP_RBC302_FE_OCPN219_wenable_fifo (.Y(FE_OCP_RBN302_FE_OCPN219_wenable_fifo), 
	.A(FE_OCP_RBN312_wenable_fifo));
   INVX1 FE_OCP_RBC287_raddr_1_ (.Y(FE_OCP_RBN287_raddr_1_), 
	.A(FE_OCP_RBN286_raddr_1_));
   INVX1 FE_OCP_RBC286_raddr_1_ (.Y(FE_OCP_RBN286_raddr_1_), 
	.A(FE_OCP_RBN283_raddr_1_));
   INVX2 FE_OCP_RBC283_raddr_1_ (.Y(FE_OCP_RBN283_raddr_1_), 
	.A(raddr[1]));
   fiforam UFIFORAM (.wclk(w_clk), 
	.wenable(FE_OCP_RBN311_wenable_fifo), 
	.waddr(waddr), 
	.raddr(raddr), 
	.wdata(w_data), 
	.rdata(r_data), 
	.FE_OCP_RBN140_waddr_0_(waddr[0]), 
	.FE_OCP_RBN141_waddr_0_(waddr[0]), 
	.FE_OCP_RBN149_waddr_0_(waddr[0]), 
	.FE_OCP_RBN150_waddr_0_(waddr[0]), 
	.FE_OCP_RBN155_waddr_0_(waddr[0]), 
	.FE_OCP_RBN156_waddr_0_(waddr[0]), 
	.FE_OCP_RBN166_waddr_0_(waddr[0]), 
	.FE_OCP_RBN167_waddr_0_(waddr[0]), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7), 
	.FE_OCP_RBN283_raddr_1_(FE_OCP_RBN283_raddr_1_), 
	.FE_OCP_RBN287_raddr_1_(FE_OCP_RBN287_raddr_1_), 
	.FE_OCP_RBN290_waddr_0_(waddr[0]), 
	.FE_OCP_RBN291_waddr_0_(waddr[0]), 
	.FE_OCP_RBN296_waddr_2_(FE_OCP_RBN400_waddr_2_), 
	.FE_OCP_RBN300_FE_OCPN219_wenable_fifo(FE_OCP_RBN312_wenable_fifo), 
	.FE_OCP_RBN301_FE_OCPN219_wenable_fifo(FE_OCP_RBN311_wenable_fifo), 
	.FE_OCP_RBN302_FE_OCPN219_wenable_fifo(FE_OCP_RBN302_FE_OCPN219_wenable_fifo), 
	.FE_OCP_RBN304_FE_OCPN219_wenable_fifo(FE_OCP_RBN312_wenable_fifo), 
	.FE_OCP_RBN305_FE_OCPN219_wenable_fifo(FE_OCP_RBN305_FE_OCPN219_wenable_fifo), 
	.FE_OCP_RBN313_wenable_fifo(FE_OCP_RBN313_wenable_fifo), 
	.FE_OCP_RBN326_waddr_0_(waddr[0]), 
	.FE_OCP_RBN327_waddr_0_(waddr[0]), 
	.FE_OCP_RBN334_waddr_1_(waddr[1]), 
	.FE_OCP_RBN335_waddr_1_(waddr[1]), 
	.FE_OCP_RBN374_waddr_0_(waddr[0]), 
	.FE_OCP_RBN375_waddr_0_(waddr[0]), 
	.FE_OCP_RBN389_waddr_1_(waddr[1]), 
	.FE_OCP_RBN390_waddr_1_(waddr[1]), 
	.FE_OCP_RBN391_waddr_1_(waddr[1]), 
	.FE_OCP_RBN485_waddr_0_(waddr[0]), 
	.FE_OCP_RBN487_waddr_0_(waddr[0]), 
	.FE_OCP_RBN488_waddr_0_(waddr[0]), 
	.FE_OCP_RBN508_waddr_0_(waddr[0]), 
	.FE_OCP_RBN510_waddr_0_(waddr[0]), 
	.FE_OCP_RBN511_waddr_0_(waddr[0]));
   write_fifo_ctrl UWFC (.wclk(nclk__L2_N4), 
	.rst_n(n_rst), 
	.wenable(w_enable), 
	.rptr(rptr), 
	.wenable_fifo(wenable_fifo), 
	.wptr(wptr), 
	.waddr(waddr), 
	.full_flag(full), 
	.FE_OCP_RBN140_waddr_0_(FE_PT0_), 
	.FE_OCP_RBN141_waddr_0_(FE_PT1_), 
	.FE_OCP_RBN149_waddr_0_(FE_PT2_), 
	.FE_OCP_RBN150_waddr_0_(FE_PT3_), 
	.FE_OCP_RBN155_waddr_0_(FE_PT4_), 
	.FE_OCP_RBN156_waddr_0_(FE_PT5_), 
	.FE_OCP_RBN166_waddr_0_(FE_PT6_), 
	.FE_OCP_RBN167_waddr_0_(FE_PT7_), 
	.nclk__L2_N7(nclk__L2_N7));
   read_fifo_ctrl URFC (.rclk(r_clk), 
	.rst_n(n_rst), 
	.renable(r_enable), 
	.wptr(wptr), 
	.rptr(rptr), 
	.raddr(raddr), 
	.empty_flag(empty), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N7(nclk__L2_N7));
endmodule

module lab7_tx_fifo (
	clk, 
	n_rst, 
	read_done, 
	read_data, 
	fifo_empty, 
	fifo_full, 
	write_enable, 
	write_data, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   input read_done;
   output [7:0] read_data;
   output fifo_empty;
   output fifo_full;
   input write_enable;
   input [7:0] write_data;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   fifo IP_FIFO (.r_clk(nclk__L2_N4), 
	.w_clk(clk), 
	.n_rst(n_rst), 
	.r_enable(read_done), 
	.w_enable(write_enable), 
	.w_data(write_data), 
	.r_data(read_data), 
	.empty(fifo_empty), 
	.full(fifo_full), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
endmodule

module lab7_timer (
	clk, 
	n_rst, 
	start, 
	stop, 
	shift_enable, 
	bit_done, 
	nclk__L2_N6);
   input clk;
   input n_rst;
   input start;
   input stop;
   output shift_enable;
   output bit_done;
   input nclk__L2_N6;

   // Internal wires
   wire FE_OCPN459_curr_state_1_;
   wire FE_OCPN419_clk_cnt_0_;
   wire FE_OCPN418_clk_cnt_0_;
   wire FE_OCPN417_clk_cnt_2_;
   wire FE_OCPN416_clk_cnt_2_;
   wire FE_OCPN359_curr_state_0_;
   wire FE_OCPN358_curr_state_0_;
   wire N74;
   wire n35;
   wire n36;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire [1:0] curr_state;
   wire [2:0] clk_cnt;
   wire [2:0] nxt_clk_cnt;

   assign shift_enable = N74 ;

   BUFX2 FE_OCPC459_curr_state_1_ (.Y(FE_OCPN459_curr_state_1_), 
	.A(curr_state[1]));
   BUFX2 FE_OCPC419_clk_cnt_0_ (.Y(FE_OCPN419_clk_cnt_0_), 
	.A(FE_OCPN418_clk_cnt_0_));
   BUFX2 FE_OCPC418_clk_cnt_0_ (.Y(FE_OCPN418_clk_cnt_0_), 
	.A(clk_cnt[0]));
   BUFX2 FE_OCPC417_clk_cnt_2_ (.Y(FE_OCPN417_clk_cnt_2_), 
	.A(clk_cnt[2]));
   BUFX2 FE_OCPC416_clk_cnt_2_ (.Y(FE_OCPN416_clk_cnt_2_), 
	.A(clk_cnt[2]));
   BUFX2 FE_OCPC359_curr_state_0_ (.Y(FE_OCPN359_curr_state_0_), 
	.A(FE_OCPN358_curr_state_0_));
   BUFX2 FE_OCPC358_curr_state_0_ (.Y(FE_OCPN358_curr_state_0_), 
	.A(curr_state[0]));
   DFFSR \curr_state_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[0]), 
	.D(n36), 
	.CLK(nclk__L2_N6));
   DFFSR \curr_state_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[1]), 
	.D(n35), 
	.CLK(nclk__L2_N6));
   DFFSR \clk_cnt_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(clk_cnt[0]), 
	.D(nxt_clk_cnt[0]), 
	.CLK(clk));
   DFFSR \clk_cnt_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(clk_cnt[1]), 
	.D(nxt_clk_cnt[1]), 
	.CLK(clk));
   DFFSR \clk_cnt_reg[2]  (.S(1'b1), 
	.R(n_rst), 
	.Q(clk_cnt[2]), 
	.D(nxt_clk_cnt[2]), 
	.CLK(nclk__L2_N6));
   INVX2 U8 (.Y(n1), 
	.A(n23));
   AND2X2 U9 (.Y(bit_done), 
	.B(n23), 
	.A(FE_OCPN417_clk_cnt_2_));
   AND2X1 U10 (.Y(n2), 
	.B(n3), 
	.A(n19));
   INVX4 U11 (.Y(n19), 
	.A(curr_state[1]));
   INVX2 U12 (.Y(n3), 
	.A(FE_OCPN358_curr_state_0_));
   NOR2X1 U13 (.Y(nxt_clk_cnt[0]), 
	.B(n2), 
	.A(FE_OCPN419_clk_cnt_0_));
   NAND2X1 U14 (.Y(n21), 
	.B(clk_cnt[0]), 
	.A(clk_cnt[1]));
   OAI21X1 U15 (.Y(n20), 
	.C(n1), 
	.B(FE_OCPN418_clk_cnt_0_), 
	.A(clk_cnt[1]));
   INVX2 U16 (.Y(n4), 
	.A(FE_OCPN416_clk_cnt_2_));
   NAND3X1 U17 (.Y(n7), 
	.C(n4), 
	.B(n20), 
	.A(FE_OCPN459_curr_state_1_));
   INVX2 U18 (.Y(n5), 
	.A(n7));
   NAND2X1 U19 (.Y(n15), 
	.B(n1), 
	.A(n5));
   NAND2X1 U20 (.Y(n25), 
	.B(n19), 
	.A(curr_state[0]));
   INVX2 U21 (.Y(n17), 
	.A(n25));
   INVX2 U22 (.Y(n6), 
	.A(stop));
   NAND2X1 U23 (.Y(n14), 
	.B(n6), 
	.A(n17));
   INVX4 U24 (.Y(n23), 
	.A(n21));
   OAI21X1 U25 (.Y(n16), 
	.C(n7), 
	.B(n19), 
	.A(n23));
   AOI22X1 U26 (.Y(n8), 
	.D(n16), 
	.C(FE_OCPN359_curr_state_0_), 
	.B(n2), 
	.A(start));
   NAND3X1 U27 (.Y(n36), 
	.C(n8), 
	.B(n14), 
	.A(n15));
   AOI21X1 U28 (.Y(n18), 
	.C(n16), 
	.B(n17), 
	.A(stop));
   OAI21X1 U29 (.Y(n35), 
	.C(n18), 
	.B(n19), 
	.A(FE_OCPN359_curr_state_0_));
   NOR2X1 U30 (.Y(nxt_clk_cnt[1]), 
	.B(n20), 
	.A(n2));
   XOR2X1 U31 (.Y(n22), 
	.B(FE_OCPN416_clk_cnt_2_), 
	.A(n1));
   NOR2X1 U32 (.Y(nxt_clk_cnt[2]), 
	.B(n22), 
	.A(n2));
   NAND2X1 U33 (.Y(n24), 
	.B(n23), 
	.A(clk_cnt[2]));
   NOR2X1 U34 (.Y(N74), 
	.B(n24), 
	.A(n25));
endmodule

module lab7_tcu (
	clk, 
	n_rst, 
	transmit, 
	bit_done, 
	bus_mode, 
	stop, 
	start, 
	sync, 
	read_done, 
	tx_sel, 
	tx_enable_0, 
	load_data_0, 
	tx_enable_1, 
	load_data_1);
   input clk;
   input n_rst;
   input transmit;
   input bit_done;
   output [1:0] bus_mode;
   output stop;
   output start;
   output sync;
   output read_done;
   output tx_sel;
   output tx_enable_0;
   output load_data_0;
   output tx_enable_1;
   output load_data_1;

   // Internal wires
   wire FE_OCPN481_n39;
   wire FE_OCPN480_n39;
   wire FE_OCPN479_curr_state_3_;
   wire FE_OCPN442_n45;
   wire FE_OCPN437_n127;
   wire FE_OCPN307_curr_state_0_;
   wire FE_OCPN306_curr_state_0_;
   wire FE_OCPN265_curr_state_1_;
   wire FE_OCPN264_curr_state_1_;
   wire FE_OCPN257_n47;
   wire FE_OCPN243_n109;
   wire FE_OCPN242_n135;
   wire FE_OCPN241_n135;
   wire FE_OCPN232_n26;
   wire FE_OCPN231_n93;
   wire FE_OCPN230_n138;
   wire FE_OCPN229_n98;
   wire FE_OCPN228_n98;
   wire FE_OCPN218_n52;
   wire FE_OCPN217_n52;
   wire FE_OCPN216_n52;
   wire FE_OCPN215_n52;
   wire FE_OCPN214_n51;
   wire FE_OCPN206_curr_state_3_;
   wire FE_OCPN205_curr_state_3_;
   wire FE_OCPN204_curr_state_3_;
   wire FE_RN_804_0;
   wire FE_RN_803_0;
   wire FE_RN_802_0;
   wire FE_RN_801_0;
   wire FE_RN_738_0;
   wire FE_RN_691_0;
   wire FE_RN_690_0;
   wire FE_RN_631_0;
   wire n17;
   wire n18;
   wire n19;
   wire n81;
   wire n83;
   wire n85;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n3;
   wire n4;
   wire n5;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n16;
   wire n20;
   wire n21;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n38;
   wire n39;
   wire n41;
   wire n44;
   wire n45;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n86;
   wire n87;
   wire n88;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n122;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire [3:0] curr_state;
   wire [2:0] bit_cnt;

   BUFX2 FE_OCPC481_n39 (.Y(FE_OCPN481_n39), 
	.A(FE_OCPN480_n39));
   BUFX4 FE_OCPC480_n39 (.Y(FE_OCPN480_n39), 
	.A(n39));
   BUFX2 FE_OCPC479_curr_state_3_ (.Y(FE_OCPN479_curr_state_3_), 
	.A(FE_OCPN204_curr_state_3_));
   BUFX2 FE_OCPC442_n45 (.Y(FE_OCPN442_n45), 
	.A(n45));
   BUFX2 FE_OCPC437_n127 (.Y(FE_OCPN437_n127), 
	.A(n127));
   NAND3X1 FE_RC_1749_0 (.Y(n113), 
	.C(n44), 
	.B(n50), 
	.A(n31));
   AOI22X1 FE_RC_1395_0 (.Y(n132), 
	.D(n129), 
	.C(n128), 
	.B(n130), 
	.A(n131));
   OAI21X1 FE_RC_1310_0 (.Y(read_done), 
	.C(n132), 
	.B(n134), 
	.A(n133));
   BUFX2 FE_OCPC307_curr_state_0_ (.Y(FE_OCPN307_curr_state_0_), 
	.A(curr_state[0]));
   BUFX4 FE_OCPC306_curr_state_0_ (.Y(FE_OCPN306_curr_state_0_), 
	.A(curr_state[0]));
   BUFX4 FE_OCPC265_curr_state_1_ (.Y(FE_OCPN265_curr_state_1_), 
	.A(curr_state[1]));
   BUFX4 FE_OCPC264_curr_state_1_ (.Y(FE_OCPN264_curr_state_1_), 
	.A(curr_state[1]));
   BUFX2 FE_OCPC257_n47 (.Y(FE_OCPN257_n47), 
	.A(n47));
   BUFX2 FE_OCPC243_n109 (.Y(FE_OCPN243_n109), 
	.A(n109));
   BUFX2 FE_OCPC242_n135 (.Y(FE_OCPN242_n135), 
	.A(n135));
   BUFX2 FE_OCPC241_n135 (.Y(FE_OCPN241_n135), 
	.A(n135));
   BUFX2 FE_OCPC232_n26 (.Y(FE_OCPN232_n26), 
	.A(n26));
   BUFX2 FE_OCPC231_n93 (.Y(FE_OCPN231_n93), 
	.A(n93));
   BUFX2 FE_OCPC230_n138 (.Y(FE_OCPN230_n138), 
	.A(n138));
   BUFX2 FE_OCPC229_n98 (.Y(FE_OCPN229_n98), 
	.A(FE_OCPN228_n98));
   BUFX2 FE_OCPC228_n98 (.Y(FE_OCPN228_n98), 
	.A(n98));
   BUFX2 FE_OCPC218_n52 (.Y(FE_OCPN218_n52), 
	.A(n52));
   BUFX2 FE_OCPC217_n52 (.Y(FE_OCPN217_n52), 
	.A(n52));
   BUFX2 FE_OCPC216_n52 (.Y(FE_OCPN216_n52), 
	.A(FE_OCPN215_n52));
   BUFX2 FE_OCPC215_n52 (.Y(FE_OCPN215_n52), 
	.A(n52));
   BUFX2 FE_OCPC214_n51 (.Y(FE_OCPN214_n51), 
	.A(n51));
   BUFX2 FE_OCPC206_curr_state_3_ (.Y(FE_OCPN206_curr_state_3_), 
	.A(FE_OCPN204_curr_state_3_));
   BUFX2 FE_OCPC205_curr_state_3_ (.Y(FE_OCPN205_curr_state_3_), 
	.A(FE_OCPN204_curr_state_3_));
   BUFX4 FE_OCPC204_curr_state_3_ (.Y(FE_OCPN204_curr_state_3_), 
	.A(curr_state[3]));
   INVX2 FE_RC_1178_0 (.Y(FE_RN_804_0), 
	.A(n7));
   OR2X1 FE_RC_1177_0 (.Y(FE_RN_803_0), 
	.B(FE_RN_804_0), 
	.A(n10));
   INVX2 FE_RC_1176_0 (.Y(FE_RN_802_0), 
	.A(n31));
   MUX2X1 FE_RC_1175_0 (.Y(FE_RN_801_0), 
	.S(FE_RN_738_0), 
	.B(FE_RN_802_0), 
	.A(n138));
   NAND3X1 FE_RC_1174_0 (.Y(tx_enable_0), 
	.C(FE_RN_801_0), 
	.B(FE_RN_803_0), 
	.A(n122));
   INVX4 FE_RC_1089_0 (.Y(FE_RN_738_0), 
	.A(n52));
   INVX4 FE_RC_1013_0 (.Y(n62), 
	.A(FE_OCPN204_curr_state_3_));
   INVX2 FE_RC_1012_0 (.Y(FE_RN_691_0), 
	.A(n127));
   NOR2X1 FE_RC_1011_0 (.Y(n39), 
	.B(FE_RN_691_0), 
	.A(FE_OCPN206_curr_state_3_));
   INVX2 FE_RC_1010_0 (.Y(FE_RN_690_0), 
	.A(n127));
   OR2X2 FE_RC_1009_0 (.Y(n94), 
	.B(FE_OCPN204_curr_state_3_), 
	.A(FE_RN_690_0));
   AND2X2 FE_RC_927_0 (.Y(FE_RN_631_0), 
	.B(n49), 
	.A(FE_OCPN218_n52));
   NAND2X1 FE_RC_926_0 (.Y(n119), 
	.B(n138), 
	.A(FE_RN_631_0));
   AND2X2 FE_RC_922_0 (.Y(n9), 
	.B(n5), 
	.A(FE_OCPN480_n39));
   NAND3X1 FE_RC_921_0 (.Y(n55), 
	.C(FE_OCPN480_n39), 
	.B(n5), 
	.A(n63));
   OAI22X1 FE_RC_739_0 (.Y(n86), 
	.D(n60), 
	.C(n59), 
	.B(n4), 
	.A(n58));
   DFFSR \bit_cnt_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(bit_cnt[0]), 
	.D(n85), 
	.CLK(clk));
   DFFSR \bit_cnt_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(bit_cnt[1]), 
	.D(n83), 
	.CLK(clk));
   DFFSR \bit_cnt_reg[2]  (.S(1'b1), 
	.R(n_rst), 
	.Q(bit_cnt[2]), 
	.D(n81), 
	.CLK(clk));
   DFFSR \curr_state_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[0]), 
	.D(n92), 
	.CLK(clk));
   DFFSR \curr_state_reg[3]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[3]), 
	.D(n89), 
	.CLK(clk));
   DFFSR \curr_state_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[1]), 
	.D(n91), 
	.CLK(clk));
   DFFSR \curr_state_reg[2]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[2]), 
	.D(n90), 
	.CLK(clk));
   NOR2X1 U9 (.Y(n17), 
	.B(n19), 
	.A(n18));
   NAND2X1 U11 (.Y(n18), 
	.B(bit_cnt[0]), 
	.A(bit_done));
   INVX1 U3 (.Y(n8), 
	.A(n21));
   OR2X2 U4 (.Y(tx_enable_1), 
	.B(n118), 
	.A(n117));
   INVX4 U7 (.Y(n47), 
	.A(n86));
   INVX2 U10 (.Y(n3), 
	.A(n56));
   AND2X2 U12 (.Y(n4), 
	.B(n63), 
	.A(n9));
   AND2X2 U13 (.Y(n5), 
	.B(n48), 
	.A(FE_OCPN214_n51));
   INVX4 U15 (.Y(sync), 
	.A(FE_OCPN242_n135));
   INVX2 U16 (.Y(n7), 
	.A(n127));
   INVX2 U17 (.Y(n21), 
	.A(n127));
   INVX4 U20 (.Y(n26), 
	.A(n94));
   INVX2 U21 (.Y(n10), 
	.A(n129));
   AND2X2 U22 (.Y(n129), 
	.B(n51), 
	.A(n48));
   AND2X2 U28 (.Y(n16), 
	.B(n62), 
	.A(n28));
   AND2X2 U30 (.Y(n57), 
	.B(n55), 
	.A(n98));
   INVX1 U31 (.Y(n20), 
	.A(n9));
   INVX4 U32 (.Y(n49), 
	.A(n48));
   INVX2 U36 (.Y(n25), 
	.A(FE_OCPN481_n39));
   INVX4 U37 (.Y(n50), 
	.A(n28));
   NAND2X1 U38 (.Y(n27), 
	.B(n16), 
	.A(n61));
   INVX4 U39 (.Y(n28), 
	.A(FE_OCPN307_curr_state_0_));
   INVX4 U40 (.Y(n31), 
	.A(FE_OCPN437_n127));
   AND2X2 U41 (.Y(n131), 
	.B(FE_OCPN307_curr_state_0_), 
	.A(FE_OCPN265_curr_state_1_));
   INVX1 U42 (.Y(n30), 
	.A(FE_OCPN307_curr_state_0_));
   NAND2X1 U43 (.Y(n32), 
	.B(n136), 
	.A(FE_OCPN231_n93));
   NAND2X1 U44 (.Y(n91), 
	.B(n88), 
	.A(n33));
   INVX2 U45 (.Y(n33), 
	.A(n32));
   INVX1 U46 (.Y(n34), 
	.A(n50));
   INVX4 U49 (.Y(n48), 
	.A(FE_OCPN306_curr_state_0_));
   INVX8 U51 (.Y(n52), 
	.A(n51));
   INVX4 U52 (.Y(n127), 
	.A(curr_state[2]));
   INVX8 U53 (.Y(n38), 
	.A(FE_OCPN265_curr_state_1_));
   INVX4 U54 (.Y(n51), 
	.A(FE_OCPN264_curr_state_1_));
   AND2X2 U58 (.Y(n111), 
	.B(FE_OCPN243_n109), 
	.A(n110));
   NAND2X1 U60 (.Y(n115), 
	.B(n61), 
	.A(n16));
   INVX2 U61 (.Y(n41), 
	.A(n95));
   OR2X2 U62 (.Y(n104), 
	.B(n52), 
	.A(n122));
   AND2X2 U63 (.Y(n44), 
	.B(FE_OCPN204_curr_state_3_), 
	.A(n38));
   AND2X2 U64 (.Y(n45), 
	.B(n30), 
	.A(FE_OCPN215_n52));
   INVX4 U66 (.Y(n95), 
	.A(n27));
   INVX1 U69 (.Y(n99), 
	.A(load_data_1));
   NAND2X1 U71 (.Y(n116), 
	.B(FE_OCPN204_curr_state_3_), 
	.A(n127));
   INVX4 U72 (.Y(n56), 
	.A(n116));
   NAND2X1 U73 (.Y(n93), 
	.B(n45), 
	.A(n56));
   NAND2X1 U74 (.Y(n120), 
	.B(n21), 
	.A(n62));
   INVX4 U75 (.Y(n138), 
	.A(n120));
   NAND2X1 U76 (.Y(n109), 
	.B(n5), 
	.A(n138));
   NAND2X1 U77 (.Y(load_data_1), 
	.B(n109), 
	.A(n93));
   XOR2X1 U78 (.Y(n85), 
	.B(bit_cnt[0]), 
	.A(bit_done));
   INVX2 U79 (.Y(n19), 
	.A(bit_cnt[1]));
   XOR2X1 U80 (.Y(n83), 
	.B(n18), 
	.A(n19));
   XOR2X1 U81 (.Y(n81), 
	.B(bit_cnt[2]), 
	.A(n17));
   NAND2X1 U82 (.Y(n122), 
	.B(n56), 
	.A(n50));
   NAND2X1 U83 (.Y(n137), 
	.B(n7), 
	.A(n44));
   AND2X2 U84 (.Y(n70), 
	.B(n137), 
	.A(n104));
   NAND2X1 U85 (.Y(n114), 
	.B(n52), 
	.A(n49));
   INVX2 U87 (.Y(n67), 
	.A(n119));
   MUX2X1 U88 (.Y(n54), 
	.S(FE_OCPN217_n52), 
	.B(n127), 
	.A(n3));
   NAND2X1 U89 (.Y(n71), 
	.B(n54), 
	.A(n49));
   INVX2 U90 (.Y(n60), 
	.A(n71));
   NAND3X1 U98 (.Y(n140), 
	.C(n45), 
	.B(n7), 
	.A(FE_OCPN205_curr_state_3_));
   INVX8 U99 (.Y(n63), 
	.A(transmit));
   NAND2X1 U101 (.Y(n98), 
	.B(n56), 
	.A(n5));
   NAND3X1 U102 (.Y(n59), 
	.C(n57), 
	.B(n140), 
	.A(n137));
   INVX2 U103 (.Y(n58), 
	.A(bit_done));
   NOR2X1 U105 (.Y(n66), 
	.B(n62), 
	.A(n86));
   NAND3X1 U106 (.Y(n72), 
	.C(bit_cnt[2]), 
	.B(bit_cnt[1]), 
	.A(bit_cnt[0]));
   INVX2 U107 (.Y(n107), 
	.A(n72));
   NOR2X1 U108 (.Y(n61), 
	.B(n38), 
	.A(n127));
   NAND3X1 U109 (.Y(n64), 
	.C(n95), 
	.B(n63), 
	.A(n107));
   INVX2 U110 (.Y(n65), 
	.A(n64));
   NOR3X1 U111 (.Y(n69), 
	.C(n66), 
	.B(n65), 
	.A(n67));
   AND2X2 U112 (.Y(n68), 
	.B(FE_OCPN229_n98), 
	.A(FE_OCPN231_n93));
   NAND3X1 U113 (.Y(n89), 
	.C(n69), 
	.B(n68), 
	.A(n70));
   NAND2X1 U114 (.Y(n136), 
	.B(FE_OCPN442_n45), 
	.A(FE_OCPN232_n26));
   NAND2X1 U115 (.Y(n105), 
	.B(n137), 
	.A(n71));
   INVX2 U116 (.Y(n75), 
	.A(n105));
   NAND3X1 U117 (.Y(n135), 
	.C(n26), 
	.B(n38), 
	.A(n49));
   OAI21X1 U118 (.Y(n73), 
	.C(n41), 
	.B(n72), 
	.A(n104));
   OAI21X1 U119 (.Y(n108), 
	.C(n27), 
	.B(n114), 
	.A(n94));
   AOI22X1 U120 (.Y(n74), 
	.D(n108), 
	.C(n72), 
	.B(n73), 
	.A(transmit));
   NAND3X1 U121 (.Y(n87), 
	.C(n74), 
	.B(FE_OCPN241_n135), 
	.A(n75));
   MUX2X1 U122 (.Y(n88), 
	.S(n47), 
	.B(n87), 
	.A(FE_OCPN216_n52));
   OAI21X1 U123 (.Y(n96), 
	.C(n104), 
	.B(n25), 
	.A(n38));
   MUX2X1 U124 (.Y(n97), 
	.S(n107), 
	.B(n96), 
	.A(n95));
   NAND2X1 U125 (.Y(n101), 
	.B(n20), 
	.A(n97));
   NAND3X1 U126 (.Y(n100), 
	.C(n99), 
	.B(FE_OCPN228_n98), 
	.A(n136));
   NOR2X1 U127 (.Y(n102), 
	.B(n100), 
	.A(n101));
   MUX2X1 U128 (.Y(n92), 
	.S(FE_OCPN257_n47), 
	.B(n102), 
	.A(n34));
   INVX2 U129 (.Y(n103), 
	.A(n108));
   OAI21X1 U130 (.Y(n106), 
	.C(n103), 
	.B(n104), 
	.A(transmit));
   AOI21X1 U131 (.Y(n112), 
	.C(n105), 
	.B(n106), 
	.A(n107));
   OAI21X1 U132 (.Y(n110), 
	.C(n7), 
	.B(n47), 
	.A(n108));
   OAI21X1 U133 (.Y(n90), 
	.C(n111), 
	.B(n112), 
	.A(n47));
   OAI21X1 U135 (.Y(n118), 
	.C(n113), 
	.B(n114), 
	.A(n120));
   OAI21X1 U136 (.Y(n117), 
	.C(n115), 
	.B(n116), 
	.A(n10));
   OR2X1 U137 (.Y(tx_sel), 
	.B(n117), 
	.A(n118));
   NAND2X1 U138 (.Y(load_data_0), 
	.B(n135), 
	.A(n119));
   NAND2X1 U142 (.Y(n134), 
	.B(FE_OCPN479_curr_state_3_), 
	.A(n8));
   NAND2X1 U143 (.Y(n133), 
	.B(n30), 
	.A(n52));
   NOR2X1 U144 (.Y(n130), 
	.B(n127), 
	.A(FE_OCPN204_curr_state_3_));
   NOR2X1 U145 (.Y(n128), 
	.B(n127), 
	.A(FE_OCPN204_curr_state_3_));
   INVX2 U148 (.Y(start), 
	.A(n136));
   INVX2 U149 (.Y(stop), 
	.A(n137));
   NOR2X1 U150 (.Y(n139), 
	.B(n44), 
	.A(FE_OCPN230_n138));
   OAI21X1 U151 (.Y(bus_mode[0]), 
	.C(n139), 
	.B(n38), 
	.A(n7));
   INVX2 U152 (.Y(bus_mode[1]), 
	.A(n140));
endmodule

module lab7_tx_sr_0 (
	clk, 
	n_rst, 
	shift_enable, 
	tx_enable, 
	tx_data, 
	load_data, 
	tx_out, 
	nclk__L2_N6);
   input clk;
   input n_rst;
   input shift_enable;
   input tx_enable;
   input [7:0] tx_data;
   input load_data;
   output tx_out;
   input nclk__L2_N6;

   // Internal wires
   wire FE_RN_905_0;
   wire FE_OCPN256_n10;
   wire FE_OCPN255_tx_data_int_7_;
   wire n9;
   wire n10;
   wire n11;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire [7:1] curr_val;

   AND2X2 FE_RC_1306_0 (.Y(FE_RN_905_0), 
	.B(n37), 
	.A(n28));
   NAND2X1 FE_RC_1305_0 (.Y(n54), 
	.B(n27), 
	.A(FE_RN_905_0));
   BUFX2 FE_OCPC256_n10 (.Y(FE_OCPN256_n10), 
	.A(tx_data[4]));
   BUFX2 FE_OCPC255_tx_data_int_7_ (.Y(FE_OCPN255_tx_data_int_7_), 
	.A(tx_data[7]));
   DFFSR \curr_val_reg[7]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[7]), 
	.D(n57), 
	.CLK(clk));
   DFFSR \curr_val_reg[6]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[6]), 
	.D(n56), 
	.CLK(clk));
   DFFSR \curr_val_reg[5]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[5]), 
	.D(n55), 
	.CLK(clk));
   DFFSR \curr_val_reg[4]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[4]), 
	.D(n54), 
	.CLK(clk));
   DFFSR \curr_val_reg[3]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[3]), 
	.D(n53), 
	.CLK(clk));
   DFFSR \curr_val_reg[2]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[2]), 
	.D(n52), 
	.CLK(clk));
   DFFSR \curr_val_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[1]), 
	.D(n51), 
	.CLK(nclk__L2_N6));
   DFFSR \curr_val_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(tx_out), 
	.D(n58), 
	.CLK(nclk__L2_N6));
   INVX4 U11 (.Y(n11), 
	.A(n18));
   INVX1 U12 (.Y(n9), 
	.A(n47));
   INVX4 U13 (.Y(n47), 
	.A(n20));
   INVX4 U14 (.Y(n10), 
	.A(n15));
   INVX1 U15 (.Y(n17), 
	.A(shift_enable));
   INVX2 U18 (.Y(n16), 
	.A(tx_enable));
   INVX4 U20 (.Y(n15), 
	.A(load_data));
   NAND3X1 U21 (.Y(n20), 
	.C(shift_enable), 
	.B(n15), 
	.A(tx_enable));
   OAI21X1 U22 (.Y(n18), 
	.C(n15), 
	.B(n16), 
	.A(n17));
   MUX2X1 U23 (.Y(n19), 
	.S(n11), 
	.B(FE_OCPN255_tx_data_int_7_), 
	.A(curr_val[7]));
   NAND2X1 U24 (.Y(n57), 
	.B(n19), 
	.A(n9));
   NAND2X1 U25 (.Y(n23), 
	.B(n47), 
	.A(curr_val[7]));
   NAND2X1 U26 (.Y(n22), 
	.B(n11), 
	.A(curr_val[6]));
   NAND2X1 U27 (.Y(n21), 
	.B(n10), 
	.A(tx_data[6]));
   NAND3X1 U28 (.Y(n56), 
	.C(n22), 
	.B(n21), 
	.A(n23));
   NAND2X1 U29 (.Y(n26), 
	.B(n47), 
	.A(curr_val[6]));
   NAND2X1 U30 (.Y(n25), 
	.B(n11), 
	.A(curr_val[5]));
   NAND2X1 U31 (.Y(n24), 
	.B(n10), 
	.A(tx_data[5]));
   NAND3X1 U32 (.Y(n55), 
	.C(n25), 
	.B(n24), 
	.A(n26));
   NAND2X1 U33 (.Y(n37), 
	.B(curr_val[5]), 
	.A(n47));
   NAND2X1 U34 (.Y(n28), 
	.B(n11), 
	.A(curr_val[4]));
   NAND2X1 U35 (.Y(n27), 
	.B(n10), 
	.A(FE_OCPN256_n10));
   NAND2X1 U37 (.Y(n40), 
	.B(n47), 
	.A(curr_val[4]));
   NAND2X1 U38 (.Y(n39), 
	.B(curr_val[3]), 
	.A(n11));
   NAND2X1 U39 (.Y(n38), 
	.B(n10), 
	.A(tx_data[3]));
   NAND3X1 U40 (.Y(n53), 
	.C(n38), 
	.B(n39), 
	.A(n40));
   NAND2X1 U41 (.Y(n43), 
	.B(n47), 
	.A(curr_val[3]));
   NAND2X1 U42 (.Y(n42), 
	.B(n11), 
	.A(curr_val[2]));
   NAND2X1 U43 (.Y(n41), 
	.B(n10), 
	.A(tx_data[2]));
   NAND3X1 U44 (.Y(n52), 
	.C(n42), 
	.B(n41), 
	.A(n43));
   NAND2X1 U45 (.Y(n46), 
	.B(n47), 
	.A(curr_val[2]));
   NAND2X1 U46 (.Y(n45), 
	.B(curr_val[1]), 
	.A(n11));
   NAND2X1 U47 (.Y(n44), 
	.B(n10), 
	.A(tx_data[1]));
   NAND3X1 U48 (.Y(n51), 
	.C(n44), 
	.B(n45), 
	.A(n46));
   NAND2X1 U49 (.Y(n50), 
	.B(curr_val[1]), 
	.A(n47));
   NAND2X1 U50 (.Y(n49), 
	.B(n11), 
	.A(tx_out));
   NAND2X1 U51 (.Y(n48), 
	.B(n10), 
	.A(tx_data[0]));
   NAND3X1 U52 (.Y(n58), 
	.C(n49), 
	.B(n48), 
	.A(n50));
endmodule

module lab7_usb_transmitter (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OFN203_load_data_0_int;
   wire tx_sel_int;
   wire tx_out_0_int;
   wire tx_out_1_int;
   wire sync_int;
   wire \tx_data_int[7] ;
   wire tx_value_int;
   wire shift_enable_int;
   wire tx_enable_0_int;
   wire load_data_0_int;
   wire tx_enable_1_int;
   wire load_data_1_int;
   wire read_done_int;
   wire start_int;
   wire stop_int;
   wire bit_done_int;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire [7:0] read_data_int;
   wire [1:0] bus_mode_int;

   BUFX4 FE_OFC203_load_data_0_int (.Y(FE_OFN203_load_data_0_int), 
	.A(load_data_0_int));
   lab7_out_ctrl OCTRL (.clk(nclk__L2_N5), 
	.n_rst(n_rst), 
	.d_plus(d_plus), 
	.d_minus(d_minus), 
	.bus_mode(bus_mode_int), 
	.tx_value(tx_value_int));
   lab7_encoder ENC (.clk(nclk__L2_N6), 
	.n_rst(n_rst), 
	.tx_bit(n1), 
	.shift_enable(n5), 
	.tx_value(tx_value_int));
   lab7_tx_sr_1 T_SR_0 (.clk(nclk__L2_N1), 
	.n_rst(n_rst), 
	.shift_enable(shift_enable_int), 
	.tx_enable(tx_enable_0_int), 
	.tx_data({ \tx_data_int[7] ,
		n12,
		n11,
		n10,
		n9,
		n8,
		n7,
		n6 }), 
	.load_data(FE_OFN203_load_data_0_int), 
	.tx_out(tx_out_0_int), 
	.nclk__L2_N6(nclk__L2_N6));
   lab7_tx_sr_0 T_SR_1 (.clk(nclk__L2_N1), 
	.n_rst(n_rst), 
	.shift_enable(shift_enable_int), 
	.tx_enable(tx_enable_1_int), 
	.tx_data({ \tx_data_int[7] ,
		n12,
		n11,
		n10,
		n9,
		n8,
		n7,
		n6 }), 
	.load_data(load_data_1_int), 
	.tx_out(tx_out_1_int), 
	.nclk__L2_N6(nclk__L2_N6));
   lab7_tx_fifo T_FIFO (.clk(clk), 
	.n_rst(n_rst), 
	.read_done(read_done_int), 
	.read_data(read_data_int), 
	.fifo_empty(fifo_empty), 
	.fifo_full(fifo_full), 
	.write_enable(write_enable), 
	.write_data(write_data), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
   lab7_timer TIM (.clk(nclk__L2_N5), 
	.n_rst(n_rst), 
	.start(start_int), 
	.stop(stop_int), 
	.shift_enable(shift_enable_int), 
	.bit_done(bit_done_int), 
	.nclk__L2_N6(nclk__L2_N6));
   lab7_tcu CTRL (.clk(nclk__L2_N5), 
	.n_rst(n_rst), 
	.transmit(transmit), 
	.bit_done(bit_done_int), 
	.bus_mode(bus_mode_int), 
	.stop(stop_int), 
	.start(start_int), 
	.sync(sync_int), 
	.read_done(read_done_int), 
	.tx_sel(tx_sel_int), 
	.tx_enable_0(tx_enable_0_int), 
	.load_data_0(load_data_0_int), 
	.tx_enable_1(tx_enable_1_int), 
	.load_data_1(load_data_1_int));
   INVX2 U3 (.Y(n3), 
	.A(tx_out_1_int));
   INVX2 U4 (.Y(n2), 
	.A(tx_out_0_int));
   INVX8 U5 (.Y(n13), 
	.A(sync_int));
   MUX2X1 U6 (.Y(n1), 
	.S(tx_sel_int), 
	.B(n2), 
	.A(n3));
   INVX1 U7 (.Y(n4), 
	.A(shift_enable_int));
   INVX2 U8 (.Y(n5), 
	.A(n4));
   AND2X2 U9 (.Y(n6), 
	.B(n13), 
	.A(read_data_int[0]));
   AND2X2 U10 (.Y(n7), 
	.B(n13), 
	.A(read_data_int[1]));
   AND2X2 U11 (.Y(n8), 
	.B(n13), 
	.A(read_data_int[2]));
   AND2X2 U12 (.Y(n9), 
	.B(n13), 
	.A(read_data_int[3]));
   AND2X2 U13 (.Y(n10), 
	.B(read_data_int[4]), 
	.A(n13));
   AND2X2 U14 (.Y(n11), 
	.B(read_data_int[5]), 
	.A(n13));
   AND2X2 U15 (.Y(n12), 
	.B(read_data_int[6]), 
	.A(n13));
   OR2X2 U16 (.Y(\tx_data_int[7] ), 
	.B(sync_int), 
	.A(read_data_int[7]));
endmodule

module lab7_layout_design_t (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   lab7_usb_transmitter LD (.clk(clk), 
	.n_rst(n_rst), 
	.d_plus(d_plus), 
	.d_minus(d_minus), 
	.transmit(transmit), 
	.write_enable(write_enable), 
	.write_data(write_data), 
	.fifo_empty(fifo_empty), 
	.fifo_full(fifo_full), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
endmodule

module lab7_layout_design (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;

   // Internal wires
   wire nclk__L2_N7;
   wire nclk__L2_N6;
   wire nclk__L2_N5;
   wire nclk__L2_N4;
   wire nclk__L2_N3;
   wire nclk__L2_N2;
   wire nclk__L2_N1;
   wire nclk__L2_N0;
   wire nclk__L1_N0;
   wire nclk;
   wire nn_rst;
   wire ntransmit;
   wire nwrite_enable;
   wire nd_plus;
   wire nd_minus;
   wire nfifo_empty;
   wire nfifo_full;
   wire [7:0] nwrite_data;

   INVX8 nclk__L2_I7 (.Y(nclk__L2_N7), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I6 (.Y(nclk__L2_N6), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I5 (.Y(nclk__L2_N5), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I4 (.Y(nclk__L2_N4), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I3 (.Y(nclk__L2_N3), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I2 (.Y(nclk__L2_N2), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I1 (.Y(nclk__L2_N1), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I0 (.Y(nclk__L2_N0), 
	.A(nclk__L1_N0));
   INVX8 nclk__L1_I0 (.Y(nclk__L1_N0), 
	.A(nclk));
   lab7_layout_design_t I0 (.clk(nclk__L2_N0), 
	.n_rst(nn_rst), 
	.d_plus(nd_plus), 
	.d_minus(nd_minus), 
	.transmit(ntransmit), 
	.write_enable(nwrite_enable), 
	.write_data(nwrite_data), 
	.fifo_empty(nfifo_empty), 
	.fifo_full(nfifo_full), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
   PADVDD U1 ();
   PADGND U2 ();
   PADOUT U3 (.YPAD(d_minus), 
	.DO(nd_minus));
   PADOUT U4 (.YPAD(d_plus), 
	.DO(nd_plus));
   PADOUT U5 (.YPAD(fifo_empty), 
	.DO(nfifo_empty));
   PADOUT U6 (.YPAD(fifo_full), 
	.DO(nfifo_full));
   PADINC U7 (.YPAD(clk), 
	.DI(nclk));
   PADINC U8 (.YPAD(n_rst), 
	.DI(nn_rst));
   PADINC U9 (.YPAD(transmit), 
	.DI(ntransmit));
   PADINC U10 (.YPAD(write_data[0]), 
	.DI(nwrite_data[0]));
   PADINC U11 (.YPAD(write_data[1]), 
	.DI(nwrite_data[1]));
   PADINC U12 (.YPAD(write_data[2]), 
	.DI(nwrite_data[2]));
   PADINC U13 (.YPAD(write_data[3]), 
	.DI(nwrite_data[3]));
   PADINC U14 (.YPAD(write_data[4]), 
	.DI(nwrite_data[4]));
   PADINC U15 (.YPAD(write_data[5]), 
	.DI(nwrite_data[5]));
   PADINC U16 (.YPAD(write_data[6]), 
	.DI(nwrite_data[6]));
   PADINC U17 (.YPAD(write_data[7]), 
	.DI(nwrite_data[7]));
   PADINC U18 (.YPAD(write_enable), 
	.DI(nwrite_enable));
endmodule

