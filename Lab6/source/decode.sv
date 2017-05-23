// $Id: $
// File name:   decode.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: decode block

module decode(
  input wire clk,
  input wire n_rst,
  input wire scl,
  input wire sda_in,
  input wire [7:0] starting_byte,
  output reg rw_mode,
  output reg address_match,
  output reg start_found,
  output reg stop_found
  );
  
  reg sc1;
  reg sc2;
  reg sd1;
  reg sd2;
  
  always_ff @(posedge clk, negedge n_rst) begin
    if(!n_rst) begin
      sc1 <= 1'b0;
      sc2 <= 1'b0;
      sd1 <= 1'b0;
      sd2 <= 1'b0;
      address_match <= 1'b0;
      rw_mode <= 1'b0;
      stop_found <= 1'b0;
      start_found <= 1'b0;
    end
  else begin
    sc1 <= scl;
    sc2 <= sc1;
    sd1 <= sda_in;
    sd2 <= sd1;
    rw_mode <= starting_byte[0];
    if(starting_byte[7:1] == 7'b1111000) begin
      address_match <= 1'b1;
    end
  else begin
    address_match <= 1'b0;
  end
  if(sc1 && sc2 && !sd1 && sd2) begin
    start_found <= 1'b1;
  end
else begin
  start_found <= 1'b0;
end
if(sc1 && sc2 && sd1 && !sd2) begin
  stop_found <= 1'b1;
end
else begin
  stop_found <=1'b0;
end

  
    
    
    
end
end

endmodule
    
  
  
