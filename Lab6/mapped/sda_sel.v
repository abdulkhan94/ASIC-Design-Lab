
module sda_sel ( tx_out, sda_mode, sda_out );
  input [1:0] sda_mode;
  input tx_out;
  output sda_out;
  wire   n2;

  NAND2X1 U5 ( .A(sda_mode[0]), .B(n2), .Y(sda_out) );
  NAND2X1 U6 ( .A(tx_out), .B(sda_mode[1]), .Y(n2) );
endmodule

