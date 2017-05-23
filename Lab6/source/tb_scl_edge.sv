// $Id: $
// File name:   tb_scl_edge.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: test bench for edge detector

`timescale 1ns / 10ps

module tb_scl_edge();
  
  // Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;
	localparam S_CLK_PERIOD = 300;
	
	
	reg tb_clk;
	
	
	
	integer tb_test_num;
	reg tb_scl;
	reg tb_rise;
	reg tb_n_rst;
  reg tb_fall;
	

	scl_edge DEFAULT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
    .scl(tb_scl),
		.rising_edge_found(tb_rise),
		.falling_edge_found(tb_fall)
	);
	
	// Clock generation block for clk
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// Clock generation block for scl
	always
	begin
		tb_scl = 1'b0;
		#(S_CLK_PERIOD/3.0);
		#(S_CLK_PERIOD/3.0);
		tb_scl = 1'b1;
		#(S_CLK_PERIOD/3.0);
	end
	
	// Default Configuration Test bench main process
	initial
	begin
	  tb_n_rst =1;
	  #(CLK_PERIOD);
	  tb_n_rst =0;
	   #(CLK_PERIOD);
	  tb_n_rst =1;
 		
		tb_n_rst		= 1'b1;				// Initialize to be inactive

		
		//Test case 1
		
		tb_test_num =1;
		
		
		tb_n_rst = 1'b0;  
		#(CLK_PERIOD);
		if ((1'b0 == tb_fall) && (1'b0 == tb_rise)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		
	 
		
		// Test 2
		tb_test_num = 2;
		tb_n_rst = 1'b1;  
		
		#(18*CLK_PERIOD);  
		if (1'b1 == tb_rise) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
			
			// Test 3: 
		tb_test_num = 3;
		
		
		#(CLK_PERIOD * 10);  
		if (1'b1 == tb_fall) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
	end
			
endmodule
		