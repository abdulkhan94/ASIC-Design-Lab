// $Id: $
// File name:   timer.sv
// Created:     2/28/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: Timer block
module timer
#(
parameter [3:0] IDLE = 3'b000, CNT = 3'b001, RECEIVE = 3'b010, PREP = 3'b011, CHECK = 3'b100, COMPLETE = 3'b101
)
(
  input wire clk,
  input wire n_rst,
  input wire rising_edge_found,
  input wire falling_edge_found,
  input wire stop_found,
  input wire start_found,
  output reg byte_received,
  output reg ack_prep,
  output reg check_ack,
  output reg ack_done
);

reg [3:0] count;

reg flag;

defparam FLEX.NUM_CNT_BITS = 4;

flex_counter FLEX (.clk(clk), .n_rst(n_rst), .count_enable(rising_edge_found), .clear((stop_found | start_found)), .rollover_val(4'b1001), .count_out(count), .rollover_flag(flag));


assign ack_prep = ((count == 4'b1000) && (falling_edge_found));
assign ack_done = ((count == 4'b1001) && (falling_edge_found));
assign check_ack = (count == 4'b1001);
assign byte_received = (count == 4'b1000);

endmodule

/*

 reg [3:0] state;
  reg [3:0] nxtstate;
  reg en;
  reg rst;
  reg bytef;
  reg [2:0] temp;
  reg t_byte_received;
  reg t_ack_prep;
  reg t_check_ack;
  reg t_ack_done;
  
  flex_counter #(3) FLEX (.clk(clk), .n_rst(n_rst), .count_enable(rising_edge_found && en), .rollover_val(temp), .rollover_flag(bytef));
  
  always @( posedge clk, negedge n_rst)
  begin
    
    if(!n_rst) begin
      temp <= 3'b000;
      state <= IDLE;
      byte_received <= 1'b0;
      ack_prep <= 1'b0;
      check_ack <= 1'b0;
      ack_done <= 1'b0;
    end
    else begin
      temp <= 3'b111;
      state <= nxtstate;
      byte_received <= t_byte_received;
      ack_prep <= t_ack_prep;
      check_ack <= t_check_ack;
      ack_done <= t_ack_done;
    end
  end
  
  
  always @(state)
  begin
    en = 0;
    rst = 1;
    t_byte_received = 0;
    t_ack_prep = 0;
    t_check_ack = 0;
    t_ack_done = 0;
    case(state)
      IDLE: begin
        en = 0;
    rst = 1;
    t_byte_received = 0;
    t_ack_prep = 0;
    t_check_ack = 0;
    t_ack_done = 0;
  end
  
    CNT: begin
      en = 1;
      //en = 0;
    //rst = 1;
    //t_byte_received = 0;
    //t_ack_prep = 0;
    //t_check_ack = 0;
    //t_ack_done = 0;
    end
    
    RECEIVE: begin
                    en = 0;
                    rst = 0;
      t_byte_received = 1;
      
    //t_ack_prep = 0;
    //t_check_ack = 0;
    //t_ack_done = 0;
    end
    PREP: begin
      t_ack_prep = 1;
      //en = 0;
    //rst = 1;
    //t_byte_received = 0;
  
    //t_check_ack = 0;
    //t_ack_done = 0;
    end
     CHECK: begin
      t_check_ack = 1;
      //en = 0;
   // rst = 1;
   // t_byte_received = 0;
   // t_ack_prep = 0;
   // t_ack_done = 0;
    end
    COMPLETE: begin
            rst =1 ;
      t_ack_done = 1;
      //en = 0;
     // t_byte_received = 0;
   // t_ack_prep = 0;
   // t_check_ack = 0;
    end
    default: begin
      en = 0;
      rst = 1;
      t_byte_received = 0;
      t_ack_prep = 0;
      t_check_ack = 0;
      t_ack_done = 0;
    end
    
  endcase
  end

  always @(state,rising_edge_found, falling_edge_found, stop_found, start_found, bytef)
  begin
    nxtstate = state;
  
  case(state)
    
    IDLE: begin
           if (start_found)begin
             nxtstate = CNT;
           end
          
          else begin
             nxtstate = IDLE;
           end
         end
        
         CNT: begin
          
           if ((bytef == 1'b1) && (rising_edge_found == 1'b1)) begin
            
             nxtstate = RECEIVE;
           end
           else if (stop_found)begin
             nxtstate = IDLE;
           end
           else begin
             nxtstate = CNT;
           end
         end
        
         RECEIVE: begin
          
           if (falling_edge_found) begin
             nxtstate = PREP;
           end
           else if (stop_found)begin
             nxtstate = IDLE;
           end
           else begin
             nxtstate = RECEIVE;
           end
          end
          
        
         PREP: begin
        
           if(rising_edge_found)
           begin
             nxtstate = CHECK;
           end
           else if (stop_found)begin
             nxtstate = IDLE;
           end
           else begin
             nxtstate = PREP;
           end
        
         end    
            
        
         CHECK: begin
          
           if(falling_edge_found) begin
             nxtstate = COMPLETE;
           end
           else if (stop_found) begin
             nxtstate = IDLE;
           end
           else begin
             nxtstate = CHECK;
           end
          
          end
        
        
         COMPLETE: begin
          
           if(stop_found)begin
            
             nxtstate = IDLE;
           end
           else begin
             nxtstate = CNT;
           end
           end
         endcase
end

  
endmodule

*/
