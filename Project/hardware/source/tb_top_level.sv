`timescale 1ns / 10ps

module tb_top_level();

	// Define parameters
	parameter CLK_PERIOD				= 2.5;
	parameter NORM_DATA_PERIOD	= (10 * CLK_PERIOD);
	
	reg clk;
        reg n_rst;
	reg buffer_load;
	reg [31:0] w_load_size;
  	reg [15:0] sample1;
  
  	reg [15:0] sample2;
  	reg [15:0] sample3;
 	reg [15:0] sample4;
  	reg [15:0] sample5;
  	reg [15:0] sample6;
  	reg [15:0] sample7;
  	reg [15:0] sample8;
  
 	reg w_output_load;
  	reg w_wav_done;
  	reg [15:0] data_out1;
  	reg [15:0] data_out2;
  	reg [15:0] data_out3;
  	reg [15:0] data_out4;
  	reg [15:0] data_out5;
 	reg [15:0] data_out6;
  	reg [15:0] data_out7;
  	reg [15:0] data_out8;
	integer i;
	
	top_level DUT
	(
		.clk(clk),
		.n_rst(n_rst),
		
		.buffer_load(buffer_load),
		.w_load_size(w_load_size),
		.sample1(sample1),
		.sample2(sample2),
		.sample3(sample3),
		.sample4(sample4),
		.sample5(sample5),
		.sample6(sample6),
		.sample7(sample7),
		.sample8(sample8),
		.w_output_load(w_output_load),
		.w_wav_done(w_wav_done),
		.data_out1(data_out1),
		.data_out2(data_out2),
		.data_out3(data_out3),
		.data_out4(data_out4),
		.data_out5(data_out5),
		.data_out6(data_out6),
		.data_out7(data_out7),
		.data_out8(data_out8)
	);
	
	always
	begin : CLK_GEN
		clk = 1'b0;
		#(CLK_PERIOD / 2);
		clk = 1'b1;
		#(CLK_PERIOD / 2);
	end

	// Test vector population
	initial
	begin
		for(i = 0; i < 600000; i = i+8) begin 
			buffer_load = 1;
			sample1 = 112;
			sample2 = 256;
			sample3 = 300;
			sample4 = 4000;
			sample5 = 3567;
			sample6 = 356;
			sample7 = 287;
			sample8 = 119;
			#(8*CLK_PERIOD);
			if(w_wav_done) begin
				i = 600001;
			end
		end
	end
endmodule

