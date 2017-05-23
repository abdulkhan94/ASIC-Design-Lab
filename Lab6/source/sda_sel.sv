// $Id: $
// File name:   sda_sel.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: sda select block

module sda_sel(
  input wire tx_out,
  input wire [1:0] sda_mode,
  output reg sda_out
  );
  
  always_comb
  begin
    case(sda_mode)
      2'b00: begin
        sda_out = 1;
      end
      2'b01: begin
        sda_out = 0;
      end
      
      2'b10: begin
        sda_out = 1;
      end
      
      2'b11: begin
        sda_out = tx_out;
      end
      default: begin
        sda_out = 1;
      end
      
    endcase
  end
  
endmodule
