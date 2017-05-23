// $Id: $
// File name:   tb_flex_counter.sv
// Created:     2/2/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: flex counter testbench

`timescale 1ns / 10ps

module tb_flex_counter ();

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
	
	// Shared Test Variables
	reg tb_clk;
	
	// Default Config Test Variables & constants
	localparam DEFAULT_SIZE = 4;
	localparam DEFAULT_MAX_BIT = (DEFAULT_SIZE - 1);
	localparam DEFAULT_MSB = 1;
	
	
	reg tb_default_n_reset;
	reg [DEFAULT_MAX_BIT:0] tb_default_rollover_val;
	reg tb_default_clear;
	reg tb_default_count_enable;
	reg [DEFAULT_MAX_BIT:0] tb_default_count_out;
	reg tb_default_rollover_flag;
	
	
	// DUT portmaps
	flex_counter DEFAULT
	(
		.clk(tb_clk),
		.n_rst(tb_default_n_reset),
		.rollover_val(tb_default_rollover_val),
		.clear(tb_default_clear),
		.count_enable(tb_default_count_enable),
		.count_out(tb_default_count_out),
		.rollover_flag(tb_default_rollover_flag)
	);
	

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	initial
	begin
	  tb_default_rollover_val = 4'b1111;
	  
	  tb_default_n_reset =1;
	  #(CLK_PERIOD);
	  tb_default_n_reset =0;
	   #(CLK_PERIOD);
	  tb_default_n_reset =1;
	  tb_default_count_enable = 1;
	  #(20*CLK_PERIOD);
	 
	  tb_default_n_reset = 0;
	  #(CLK_PERIOD);
	  tb_default_n_reset =1;
	  #(CLK_PERIOD);
	  tb_default_count_enable = 1;
	  #(2*CLK_PERIOD);
	  tb_default_rollover_val = 4'b0000;
	  #(5*CLK_PERIOD);
	  tb_default_clear =1;
	  #(CLK_PERIOD);
	  tb_default_clear = 0;
	  #(CLK_PERIOD);
	  tb_default_rollover_val = 4'b0111;
	  #(20*CLK_PERIOD);
	  tb_default_count_enable =0;
	  #(CLK_PERIOD);
	  tb_default_n_reset = 0;
	  #(CLK_PERIOD); 
	  
	  
	  end
	  
	  localparam CONFIG1_SIZE = 8;
	localparam CONFIG1_MAX_BIT = (CONFIG1_SIZE - 1);
	localparam CONFIG1_MSB = 1;
	
	reg tb_config1_n_reset;
	reg [CONFIG1_MAX_BIT:0] tb_config1_rollover_val;
	reg tb_config1_clear;
	reg tb_config1_count_enable;
	reg [CONFIG1_MAX_BIT:0] tb_config1_count_out;
	reg tb_config1_rollover_flag;
	
	
	// DUT portmaps
	flex_counter CONFIG1
	(
		.clk(tb_clk),
		.n_rst(tb_config1_n_reset),
		.rollover_val(tb_config1_rollover_val),
		.clear(tb_config1_clear),
		.count_enable(tb_config1_count_enable),
		.count_out(tb_config1_count_out),
		.rollover_flag(tb_config1_rollover_flag)
	);
	initial
	begin
	  tb_config1_rollover_val = 8'b00001111;
	  
	  tb_config1_n_reset =1;
	  #(CLK_PERIOD);
	  tb_config1_n_reset =0;
	   #(CLK_PERIOD);
	  tb_config1_n_reset =1;
	  tb_config1_count_enable = 1;
	  #(20*CLK_PERIOD);
	  
	  tb_config1_n_reset = 0;
	  #(CLK_PERIOD);
	   
	  tb_config1_n_reset = 1;
	  #(CLK_PERIOD);
	 
	  tb_config1_count_enable = 1;
	  #(15*CLK_PERIOD);
	  tb_config1_rollover_val = 8'b00000001;
	  #(5*CLK_PERIOD);
	  tb_config1_clear =1;
	  #(CLK_PERIOD);
	  tb_config1_clear = 0;
	  #(CLK_PERIOD);
	  tb_config1_rollover_val = 8'b00000111;
	  #(20*CLK_PERIOD);
	  tb_config1_count_enable =0;
	  #(CLK_PERIOD);
	  tb_config1_n_reset = 0;
	  #(CLK_PERIOD); 
	  
	  
	  end

	  
	/*
	// Default Configuration Test bench main process
	initial
	begin
	  
		// Initialize all of the test inputs
		tb_default_n_reset		= 1'b1;				// Initialize to be inactive
		// Initialize parallel in to be idle values
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b1;
		end
		tb_default_clear		= 1'b0;				// Initialize to be inactive
		tb_default_count_enable		= 1'b0;				// Initialize to be inactive
		tb_default_test_num 	= 0;
		
		// Power-on Reset of the DUT
		#(0.1);
		tb_default_n_reset	= 1'b0; 	// Need to actually toggle this in order for it to actually run dependent always blocks
		#(CLK_PERIOD * 2.25);	// Release the reset away from a clock edge
		tb_default_n_reset	= 1'b1; 	// Deactivate the chip reset
		
		// Wait for a while to see normal operation
		#(CLK_PERIOD);
		
		
		// Test 1: Check for Proper Reset w/ Idle input
		@(negedge tb_clk); 
		tb_default_test_num = tb_default_test_num + 1;
		tb_default_n_reset = 1'b0;
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b1;
		end
		tb_default_clear = 1'b0;
		tb_default_count_enable = 1'b0;
		#(CHECK_DELAY);
		if (4'b0000 == tb_default_count_out && 1'b0 == tb_default_rollover_flag)
			$info("Default Test Case %0d:: PASSED", tb_default_test_num);
		else // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_default_test_num);
		
		// Test 2: Check for Proper Reset w/ Active inputs
		@(negedge tb_clk); 
		tb_default_test_num = tb_default_test_num + 1;
		tb_default_n_reset = 1'b0;
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b0;
		end
		tb_default_count_enable = 1'b1;
		tb_default_clear = 1'b1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if (4'b0000 == tb_default_count_out &&  1'b0 == tb_default_rollover_flag)
			$info("Default Test Case %0d:: PASSED", tb_default_test_num);
		else // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_default_test_num);
			
		
			
		// Test 4: Check for Proper Load Enable Control w/ load enable off and shift enable on
		// Power-on Reset of the DUT (Best case conditions)
		@(negedge tb_clk); 
		tb_default_test_num = tb_default_test_num + 1;
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b1;
		end
		tb_default_count_enable = 1'b0;
		tb_default_clear = 1'b1;
		tb_default_n_reset	= 1'b1; 	
		#(CLK_PERIOD * 2);
		@(negedge tb_clk);	// Release the reset away from a clock edge
		tb_default_n_reset	= 1'b1;	// Deactivate the chip reset
		// Perform test
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b0;
		end
		tb_default_count_enable = 1'b0;
		tb_default_clear = 1'b1;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if (4'b0000 == tb_default_count_out && 1'b0 == tb_default_rollover_flag)
			$info("Default Test Case %0d:: PASSED", tb_default_test_num);
		else // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_default_test_num);
			
		// Test 5: Check for Proper Load Enable Control w/ enable on and shift enable on
		// Power-on Reset of the DUT (Best case conditions)
		@(negedge tb_clk); 
		tb_default_test_num = tb_default_test_num + 1;
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b1;
		end
		tb_default_clear = 1'b0;
		tb_default_count_enable = 1'b1;
		tb_default_n_reset	= 1'b1; 	
		#(CLK_PERIOD * 2);
		@(negedge tb_clk);	// Release the reset away from a clock edge
		tb_default_n_reset	= 1'b1;	// Deactivate the chip reset
		// Perform test
		for(tb_default_i = 0; tb_default_i < DEFAULT_SIZE; tb_default_i = tb_default_i + 1)
		begin
			tb_default_rollover_val[tb_default_i] = 1'b1;
		end
		tb_default_clear = 1'b0;
		tb_default_count_enable = 1'b1;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if (1'b1 == tb_default_count_out[DEFAULT_MAX_BIT])
			$info("Default Test Case %0d:: PASSED", tb_default_test_num);
		else // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_default_test_num);
			end*/
	endmodule	