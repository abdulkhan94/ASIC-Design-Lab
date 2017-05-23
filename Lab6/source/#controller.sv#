// $Id: $
// File name:   controller.sv
// Created:     2/28/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: Controller block



module controller 
#(
  parameter [3:0] IDLE = 4'b0000, RX_ENABLE = 4'b0001, ADDRESS_CHECK = 4'b0010, ACK_DONE = 4'b0011, NACK_DONE = 4'b0100, LOAD_DATA = 4'b0101, TX_ENABLE = 4'b0110, ACK_CHECK = 4'b0111, READ_ENABLE = 4'b1000, ACK_COMPLETE = 4'b1001, REC_ACK = 4'b1010, REC_NACK = 4'b1011
)
  
(
  input wire clk,
  input wire n_rst,
  input wire stop_found,
  input wire start_found,
  input wire byte_received,
  input wire ack_prep,
  input wire check_ack,
  input wire ack_done,
  input wire rw_mode,
  input wire address_match,
  input wire sda_in,
  output reg rx_enable,
  output reg tx_enable,
  output reg read_enable,
  output reg [1:0] sda_mode,
  output reg load_data
);

reg [3:0] state;
reg [3:0] nxtstate;
reg t_rx_enable;
reg t_tx_enable;
reg t_read_enable;
reg [1:0] t_sda_mode;
reg t_load_data;
	

always_ff @(posedge clk, negedge n_rst)
begin
  if(!n_rst) begin
   //rx_enable <= 1'b0;
		//tx_enable <= 1'b0;
		//read_enable <= 1'b0;
		//sda_mode <= 2'b00;
		//load_data <= 1'b0;
    state <= IDLE;
  end 
  else begin
    
		//rx_enable <= t_rx_enable;
		//tx_enable <= t_tx_enable;
		//read_enable <= t_read_enable;
		//sda_mode <= t_sda_mode;
		//load_data <= t_load_data;
    state <= nxtstate;
  end
end


 always @(state)
 begin
  
  case(state)
  IDLE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b1;
      t_tx_enable = 1'b0;
    end
    RX_ENABLE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b1;
      t_tx_enable = 1'b0;
    end
  ADDRESS_CHECK: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
 ACK_DONE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b01;
     	t_load_data = 1'b0;
     	t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
 
NACK_DONE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b10;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
  
LOAD_DATA: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b01;
      t_load_data = 1'b1;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
  end
  
TX_ENABLE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b11;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b1;
    end
   
    ACK_CHECK: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
    
READ_ENABLE: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
    
    ACK_COMPLETE: begin
      t_read_enable = 1'b1;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
    REC_ACK: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
    
REC_NACK: begin
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
      t_rx_enable = 1'b0;
      t_tx_enable = 1'b0;
    end
    
    default: begin
      t_rx_enable = 1'b1;
      t_tx_enable = 1'b0;
      t_read_enable = 1'b0;
      t_sda_mode = 2'b00;
      t_load_data = 1'b0;
    end

  endcase
	end
	
	assign rx_enable = t_rx_enable;
	 
      assign tx_enable = t_tx_enable; 
     assign read_enable =  t_read_enable; 
     assign sda_mode = t_sda_mode;
     assign load_data =  t_load_data; 
	
	

always @(state,stop_found, start_found, byte_received, ack_prep, check_ack, ack_done, rw_mode, address_match, sda_in )
begin
  nxtstate = state;
  
  case(state)
  
  IDLE: begin
  if(start_found == 1'b1) begin
  nxtstate = RX_ENABLE;
end
else begin
nxtstate = IDLE;
end
end

RX_ENABLE: begin
  //rx_enable = 1'b1;
  if(ack_prep) begin
    nxtstate = ADDRESS_CHECK;
  end
  else if(stop_found) begin
    nxtstate = IDLE;
    end
    
else begin
  nxtstate = RX_ENABLE;
end
end

ADDRESS_CHECK: begin
  if((address_match == 1'b1) && (rw_mode == 1'b1)) begin
    nxtstate = ACK_DONE;
  end
else if (address_match == 1'b0 && rw_mode == 1'b0) begin
  nxtstate = NACK_DONE;
end
else if(stop_found) begin
  nxtstate = IDLE;
  end
else begin
  nxtstate = NACK_DONE;
end
end

ACK_DONE: begin
  //sda_mode = 2'b01;
  
  if(ack_done) begin
    nxtstate = LOAD_DATA;
  end
  else if(stop_found) begin
    nxtstate= IDLE;
    end
    
else begin
  nxtstate = ACK_DONE;
end
end

NACK_DONE: begin
  //sda_mode = 2'b10;
  if(ack_done) begin
    nxtstate = IDLE;
  end
  else if(stop_found) begin
    nxtstate = IDLE;
    end
else begin
   nxtstate = NACK_DONE;
 end
 end
 
 LOAD_DATA: begin
   //load_data = 1'b1;
   if(stop_found == 1'b0) begin
     
   nxtstate = TX_ENABLE;
 end
 else begin
   nxtstate = IDLE;
 end
 
 end
 
 TX_ENABLE: begin
   
   //tx_enable = 1'b1;
   //sda_mode = 2'b11;
   
   if(ack_prep) begin
   nxtstate = ACK_CHECK; 
 end
 else begin
   nxtstate = TX_ENABLE;
 end
 end
 
 ACK_CHECK: begin
   if(check_ack) begin
     nxtstate = READ_ENABLE;
     
     end 
     
     else if (stop_found == 1'b1) begin
        nxtstate = IDLE;
      end 
      
      else begin
        nxtstate = ACK_CHECK;
      end
    end
    
    
    READ_ENABLE : begin
      //read_enable = 1'b1;
      if(!sda_in) begin
      nxtstate = ACK_COMPLETE;
    end
  else if(stop_found == 1'b1) begin
    nxtstate = IDLE;
  end
  else if(sda_in == 1'b1) begin
    nxtstate = REC_NACK;
  end 
    end
    
    ACK_COMPLETE: begin
      if(stop_found == 1'b1) begin
        nxtstate = IDLE;
      end 
      
      else begin
        nxtstate = REC_ACK;
      end
    end
    REC_ACK: begin
      
    if(ack_done) begin
      	nxtstate = LOAD_DATA;
   		end 
   		else if (stop_found )begin
	   		nxtstate = IDLE;
 			end
    end
    

    REC_NACK: begin
      if (stop_found) begin
        nxtstate = ADDRESS_CHECK;
      end 
      else if (!stop_found) begin
        nxtstate = IDLE;
      end
    end
      
    default: begin
      nxtstate = IDLE;
    end
    
  endcase
  end
  
  
  
endmodule

     
 
   
 


 
  
  
