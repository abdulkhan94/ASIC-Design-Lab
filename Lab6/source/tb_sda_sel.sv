// $Id: $
// File name:   tb_sda_sel.sv
// Created:     2/22/2015
// Author:      Parneet Kaur Ahuja
// Lab Section: 01
// Version:     1.0  Initial Design Entry
// Description: sda select block test bench
`timescale 1ns / 10ps

module tb_sda_sel();

	localparam	CLK_PERIOD	= 10;
	
	reg tb_clk;
	
	
	integer tb_test_num;
	reg tb_tx;
	reg [1:0] tb_sdam;
	reg tb_sdao;
// DUT portmaps
	sda_sel DEFAULT
	(
		.tx_out(tb_tx),
		.sda_mode(tb_sdam),
		.sda_out(tb_sdao)
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
 		//Test 1
		
		tb_test_num = 1;
		tb_sdam = 2'b00;
		tb_tx = 1'b0;
		#(CLK_PERIOD);
		if ((1'b1 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		
		// Test 2:
		#(CLK_PERIOD); 
		tb_test_num =  2;
		tb_sdam = 2'b01; 
		tb_tx = 1'b0;
		#(CLK_PERIOD);
		if ((1'b0 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		// Test 3: 
		#(CLK_PERIOD); 
		tb_test_num = 3;
		tb_sdam = 2'b10;  
		tb_tx = 1'b0;
		#(CLK_PERIOD);
		if ((1'b1 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		
		// Test 4: 
		#(CLK_PERIOD); 
		tb_test_num = 4;
		tb_sdam = 2'b11;  
		tb_tx = 1'b1;
		#(CLK_PERIOD);
		if ((1'b1 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end

		
		#(CLK_PERIOD); 
		
		//Test case 5
		#(CLK_PERIOD); 
		tb_test_num = 5;
		tb_sdam = 2'b11;  
		tb_tx = 1'b0;
		#(CLK_PERIOD);
		if ((1'b0 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end

		
		#(CLK_PERIOD); 
		//Test case 6
		#(CLK_PERIOD); 
		tb_test_num = 6;
		tb_sdam = 2'b10;  
		tb_tx = 1'b1;
		#(CLK_PERIOD);
		if ((1'b1 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
			end
			//Test Case 7
			#(CLK_PERIOD); 
		tb_test_num = 7;
		tb_sdam = 2'b00;  
		tb_tx = 1'b1;
		#(CLK_PERIOD);
		if ((1'b1 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		//Test Case 8
		#(CLK_PERIOD); 
		tb_test_num = 8;
		tb_sdam = 2'b01;  
		tb_tx = 1'b1;
		#(CLK_PERIOD);
		if ((1'b0 == tb_sdao)) begin
			$info("Default Test Case %0d:: PASSED", tb_test_num);
		end else begin // Test case failed
			$error("Default Test Case %0d:: FAILED", tb_test_num);
		end
		
		
		
		end
		endmodule

