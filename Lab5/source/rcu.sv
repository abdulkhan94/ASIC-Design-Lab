// $Id: $
// File name:   rcu.sv
// Created:     2/15/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: rcu block code

module rcu
  #(
  parameter [2:0] idle = 3'b000, packet_complete = 3'b001, sbc = 3'b010, stop_check = 3'b011, load = 3'b100
  )
  (
  input wire clk,
  input wire n_rst,
  input wire start_bit_detected,
  input wire packet_done,
  input wire framing_error,
  output reg sbc_clear,
  output reg sbc_enable,
  output reg load_buffer,
  output reg enable_timer
  );
  
  reg [2:0] state;
  reg [2:0] nxtstate;
  
  
  always_ff @(posedge clk, negedge n_rst)
  begin
    if(!n_rst)
      begin
        state <= 3'b000;
      end
    else begin
      state <= nxtstate;
    end
  end

always_comb
begin
  nxtstate = state;
  case(state)
  idle : begin
  if(start_bit_detected == 1'b1) begin
  nxtstate = packet_complete;
  end
  else begin
    nxtstate = idle;
  end
end
packet_complete: begin
  if(packet_done == 1'b1) begin
    nxtstate = sbc;
  end
else begin
  nxtstate = packet_complete;
end
end
sbc: begin
  nxtstate = stop_check;
end
stop_check: begin
  if(framing_error == 1'b1) begin
    nxtstate = idle;
  end
else begin
  nxtstate = load;
end
end
load: begin
  nxtstate = idle;
end
endcase
end

always @ (state)
begin
  sbc_clear = 0;
  sbc_enable = 0;
  load_buffer = 0;
  enable_timer = 0;
  case(state)
    idle: begin
      sbc_clear = 0;
  sbc_enable = 0;
  load_buffer = 0;
  enable_timer = 0;
end
packet_complete: begin
  sbc_clear = 1'b1;
  sbc_enable = 0;
  load_buffer = 0;
  enable_timer = 1'b1;
end
sbc: begin
  sbc_clear = 0;
  sbc_enable = 1'b1;
  load_buffer = 0;
  enable_timer = 0;
end
stop_check: begin
  sbc_clear = 0;
  sbc_enable = 0;
  load_buffer = 0;
  enable_timer = 0;
end
load: begin
  sbc_clear = 0;
  sbc_enable = 0;
  load_buffer = 1'b1;
  enable_timer = 0;
end
endcase
end

endmodule

  
      
  
