// $Id: $
// File name:   scl_edge.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: SCL edge detector
module scl_edge(
  input wire clk,
  input wire n_rst,
  input wire scl,
  output reg falling_edge_found,
  output reg rising_edge_found
  );
  
  reg rise;
  reg fall;
 
  
  always_ff @(posedge clk, negedge n_rst)
  begin
    if(!n_rst) begin
      rise <= 1'b1;
      fall <=1'b1;
    end
  else begin
    rise <= scl;
    fall <= rise;
  end
end


assign falling_edge_found = (!rise & fall) ? 1'b1:1'b0;
assign rising_edge_found = (!fall & rise) ? 1'b1:1'b0;

endmodule
