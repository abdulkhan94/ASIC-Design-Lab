// $Id: $
// File name:   tb_decode.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: test bench for decoder
`timescale 1ns / 10ps

module tb_decode();
  
  	localparam	CLK_PERIOD	= 10;
	localparam S_CLK_PERIOD = 300;
	localparam CHECK_DELAY = 2.5;
	
	
	reg tb_clk;
	
	
	
	integer tb_test_num;
	reg tb_n_rst;
	reg tb_scl;
	reg [7:0] tb_start_byte;
	reg tb_sda;
	reg tb_rw;
	reg tb_address;
	reg tb_stop;
	reg tb_start;
	
// DUT portmaps

	decode DEFAULT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.scl(tb_scl),
		.sda_in(tb_sda),
		.starting_byte(tb_start_byte),
		.rw_mode(tb_rw),
		.address_match(tb_address),
		.stop_found(tb_stop),
		.start_found(tb_start)
		);
	
	// Clock generation block for clk
		always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	initial
	begin
		tb_n_rst =1;
	  #(CLK_PERIOD);
	  tb_n_rst =0;
	   #(CLK_PERIOD);
	  tb_n_rst =1;
	  //Test Case 1
	  tb_test_num = 1;
	  tb_n_rst = 0;
	  #(CLK_PERIOD);
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
	  //Test Case2
	  tb_test_num = 2;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b11110000;
	  tb_sda = 1'b0;
	  tb_scl = 1'b0;
	  #(CLK_PERIOD)
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
	  
	  //Test Cse3
	  tb_test_num = 3;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b11110001;
	  tb_sda = 1'b1;
	  tb_scl = 1'b0;
	  #(CLK_PERIOD);
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			//TEST Case4
			 tb_test_num = 4;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b10110101;
	  tb_sda = 1'b1;
	  tb_scl = 1'b1;
	  #(CLK_PERIOD);
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			//Test Case 5
			tb_test_num = 5;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b01010101;
	  tb_sda = 1'b0;
	  tb_scl = 1'b1;
	  #(CLK_PERIOD);
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			//Test case 6
			tb_test_num = 6;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b11001011;
	  tb_sda = 1'b0;
	  tb_scl = 1'b1;
	  #(CLK_PERIOD);
	  	if ((1'b1 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			//test case 7
			tb_test_num = 7;
	  tb_n_rst = 1'b1;
	  tb_start_byte = 8'b11110000;
	  tb_sda = 1'b0;
	  tb_scl = 1'b1;
	  #(CLK_PERIOD);
	  	if ((1'b0 == tb_start)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			if ((1'b0 == tb_stop)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b1 == tb_address)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			if ((1'b0 == tb_rw)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end 
		else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			
			
			
		end
		endmodule