// $Id: $
// File name:   adder_nbit.sv
// Created:     1/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: n bit adder
module adder_nbit
#(
  parameter num = 4
)
(
	input wire [(num - 1):0] a,
	input wire [(num - 1):0] b,
	input wire carry_in,
	output wire [(num - 1):0] sum,
	output wire overflow
);
wire [num:0] carrys;
genvar i;
assign carrys[0] = carry_in;
generate
  for(i = 0; i <= (num - 1); i = i + 1)
  begin
    adder_1bit Ii (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
  end
endgenerate
assign overflow = carrys[num];
endmodule