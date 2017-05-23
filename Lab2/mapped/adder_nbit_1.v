
module adder_1bit_3 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U2 ( .A(n5), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n4), .D(carry_in), .Y(n5) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n4) );
endmodule


module adder_1bit_0 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U2 ( .A(n5), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n4), .D(carry_in), .Y(n5) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n4) );
endmodule


module adder_1bit_1 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U2 ( .A(n5), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n4), .D(carry_in), .Y(n5) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n4) );
endmodule


module adder_1bit_2 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n4, n5;

  XOR2X1 U1 ( .A(carry_in), .B(n4), .Y(sum) );
  INVX1 U2 ( .A(n5), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n4), .D(carry_in), .Y(n5) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n4) );
endmodule


module adder_nbit ( a, b, carry_in, sum, overflow );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input carry_in;
  output overflow;

  wire   [3:1] carrys;

  adder_1bit_3 \genblk1[0].Ii  ( .a(a[0]), .b(b[0]), .carry_in(carry_in), 
        .sum(sum[0]), .carry_out(carrys[1]) );
  adder_1bit_2 \genblk1[1].Ii  ( .a(a[1]), .b(b[1]), .carry_in(carrys[1]), 
        .sum(sum[1]), .carry_out(carrys[2]) );
  adder_1bit_1 \genblk1[2].Ii  ( .a(a[2]), .b(b[2]), .carry_in(carrys[2]), 
        .sum(sum[2]), .carry_out(carrys[3]) );
  adder_1bit_0 \genblk1[3].Ii  ( .a(a[3]), .b(b[3]), .carry_in(carrys[3]), 
        .sum(sum[3]), .carry_out(overflow) );
endmodule

