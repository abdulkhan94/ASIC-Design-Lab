// $Id: $
// File name:   adder_1bit.sv
// Created:     1/21/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: 1 bit full adder


module adder_1bit
(
	input wire  a,
	input wire  b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
wire mid1;
wire mid2;
wire mid3;
wire mid4;
wire mid5;

	xor a1 (mid1, a, b);
  xor a2 (sum, mid1, carry_in);
  or a3 (mid2, b, a);
  and a4 (mid3, carry_in, mid2);
  and a5 (mid4, b, a);
  and a6 (mid5, mid4, !carry_in);
  or a7 (carry_out, mid5, mid3);	
endmodule