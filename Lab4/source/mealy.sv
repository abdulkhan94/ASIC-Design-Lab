// $Id: $
// File name:   mealy.sv
// Created:     2/3/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: Mealy model
module mealy(
  input wire clk,
  input wire n_rst,
  input wire i,
  output reg o
  );
  
  
  //parameter [2:0] WAITING = 3'b000, RCV1 = 3'b00, RCV11 = 3'b010, RCV110 = 3'b011, RCV1101 = 3'b100;
  //reg [2:0] state, nxtstate;
  typedef enum bit [1:0]{WAITING, RCV1, RCV11, RCV110} state_type;
  state_type state;
  state_type nxtstate;
  
  
  
  always_ff @(posedge clk, negedge n_rst)
  begin
    if (n_rst == 1'b0)
      begin
        state <= WAITING;
      end
    else
      begin
        state <= nxtstate;
      end
    end
    
    
    
    always_comb
    begin
      //nxtstate = WAITING;
      //o = 0;
      case (state)
        WAITING : begin
          if(i == 1'b1) begin
            nxtstate = RCV1;
            o = 1'b0;
          end else begin
            nxtstate = WAITING;
            o = 1'b0;
          end
        end
        RCV1 : begin
          if(i == 1'b1) begin
            nxtstate = RCV11;
            o = 0;
          end else begin
            nxtstate = WAITING;
            o = 0;
        end
      end
          RCV11: begin
            if(i == 1'b0) begin
              nxtstate = RCV110;
              o = 0;
            
            end else begin
              nxtstate = RCV11;
              o = 0;
            end
          end
            RCV110 : begin
              if(i == 1'b1) begin
                nxtstate = RCV1;
                o = 1;
              end else begin
                nxtstate = WAITING;
                o = 0;
              end
            end
              
          default : begin
            nxtstate = WAITING;
            o = 0;
          end
        endcase
      end
      
    endmodule 
            
          