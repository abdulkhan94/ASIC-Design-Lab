// $Id: $
// File name:   flex_counter.sv
// Created:     2/2/2015
// Author:      Diti Bhatnagar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Counter with Controlled Rollover
module flex_counter
#( parameter NUM_CNT_BITS = 4
)
(
  input wire clk,
  input wire n_rst,
  input wire clear,
  input wire count_enable,
  input wire [NUM_CNT_BITS-1:0] rollover_val,
  output reg [NUM_CNT_BITS-1:0] count_out,
  output reg rollover_flag
  );
  
  reg [NUM_CNT_BITS-1:0] D_state;
  reg [NUM_CNT_BITS-1:0] Q_state;
  reg rolltemp;
  
  always_comb
  begin
    if( clear == 1'b1) begin
      D_state = '0;
    end else if ( count_enable == 1'b1) begin
      if (Q_state == rollover_val)
        begin
          D_state = 1'b1;
        end else begin
          D_state = Q_state + 1'b1;
        end
    end else begin
      D_state = Q_state;
    end
  end
    
  
  
  always_ff @ (posedge clk, negedge n_rst)
  begin
    if (n_rst == 1'b0) begin
      Q_state = '0;
    end else begin
      Q_state = D_state;
      if (Q_state == rollover_val) begin
        rolltemp = 1'b1;
      end else begin
        rolltemp = 1'b0;
    end
  end
  
  end
assign count_out = Q_state;
assign rollover_flag = rolltemp;
endmodule // flex_counter
/*
module flex_counter
  #(parameter NUM_CNT_BITS = 4)
  (
   input wire clk,
   input wire n_rst,
   input wire clear,
   input wire count_enable,
   input wire [NUM_CNT_BITS - 1:0] rollover_val,
   output reg [NUM_CNT_BITS - 1:0] count_out,
   output reg rollover_flag
   );
   
   reg flag;
   reg [NUM_CNT_BITS-1:0] data;
   reg [NUM_CNT_BITS-1:0] next_data;
    
    
   always_ff @ (negedge n_rst, posedge clk)
  
   begin
     if(!n_rst)
       begin
        next_data = 1'b0;  
       end
     else
       begin
           next_data = data;
           if(next_data == rollover_val) begin
             flag = 1'b1;
           end else begin
             flag = 1'b0;
         end
       end
     end
     
     
       always_comb
       begin 
          //next_data = count_out;
         if(clear)
           begin
           data = 1'b0;
         end
       else if (count_enable)
         begin
           if(next_data == rollover_val)
       //else if ((count_out == (rollover_val -1)) && count_enable ==1)
         begin
           data = 1'b1;
         end
       else  begin
         data = 1'b1 + next_data  ;
       end
     end
     else begin
       data = next_data;
     end
   end
   
   assign rollover_flag = flag;
   assign count_out = next_data;
              
endmodule 
          
         
   */
