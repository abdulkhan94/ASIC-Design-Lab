module top_level(
  input wire clk,
  input wire n_rst,
  input wire buffer_load,
  input wire [31:0] w_load_size,
  input wire [15:0] sample1,
  
  input wire[15:0] sample2,
  input wire[15:0] sample3,
  input wire[15:0] sample4,
  input wire[15:0] sample5,
  input wire[15:0] sample6,
  input wire[15:0] sample7,
  input wire[15:0] sample8,
  
  output reg w_output_load,
  output reg w_wav_done,
  output reg [15:0] data_out1,
  output reg [15:0] data_out2,
  output reg [15:0] data_out3,
  output reg [15:0] data_out4,
  output reg [15:0] data_out5,
  output reg [15:0] data_out6,
  output reg [15:0] data_out7,
  output reg [15:0] data_out8
  );
  reg [31:0] i;
reg [31:0] next_i;
  
  always_ff @(posedge clk, negedge n_rst) begin
if(!n_rst) begin
	w_output_load <= 0;
	i <= 0;
end else begin
	w_output_load <= 1;
	i <= next_i;
  end
end



always_comb begin
	if(buffer_load) begin
		data_out1 = sample1;
		data_out2 = sample2;
		data_out3 = sample3;
		data_out4 = sample4;
		data_out5 = sample5;
        	data_out6 = sample6;
        	data_out7 = sample7;
        	data_out8 = sample8;
	end
	if(buffer_load) begin
  		next_i = i + 8;
	end
	else begin
		next_i = i;
	end
  if(next_i == 48000) begin//w_load_size) begin
    w_wav_done = 1;
  end
  else begin
  w_wav_done = 0;
  end

end

  
endmodule
  
    
  
  
  
  
