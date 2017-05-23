// $Id: $
// File name:   sync.sv
// Created:     1/26/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: synchronizer
module sync
(
	input wire clk,
	input wire  n_rst,
	input wire async_in,
	output wire sync_out
	);
reg temp;
reg temp2;

always_ff @ (posedge clk, negedge n_rst) begin
if (! n_rst) begin
    temp2 = 1'b0;
    temp = 1'b0;
  end
else begin
    temp = async_in;
    temp2 = temp;
  end
end

assign sync_out = temp2;
endmodule