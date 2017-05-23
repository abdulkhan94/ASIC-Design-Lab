`timescale 1ns/1ps

module tb_dit
(
);

// Inputs
parameter CLK_PERIOD = 2.5;
reg clk;

reg reset;
reg start;
reg done;

	// Outputs
wire [16:0] a2, b2, c2, d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2;
reg [16:0] sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8;

	


	// Instantiate Device Under Test (UUT)
	dit dut (
		.clk(clk), 
		.reset(reset), 
		.start(start), 
		.sample1(sample1),
		.sample2(sample2),
		.sample3(sample3),
		.sample4(sample4),
		.sample5(sample5),
		.sample6(sample6),
		.sample7(sample7),
		.sample8(sample8),
		.done1(done),
		.a2(a2), 
		.b2(b2),
		.c2(c2), 
		.d2(d2), 
		.e2(e2), 
		.f2(f2), 
		.g2(g2), 
		.h2(h2), 
		.i2(i2), 
		.j2(j2), 
		.k2(k2), 
		.l2(l2), 
		.m2(m2), 
		.n2(n2), 
		.o2(o2), 
		.p2(p2) 
		
	);


always begin
	clk = 1'b0;
	#(CLK_PERIOD/2);  
	clk =1;
        #(CLK_PERIOD/2);
end



initial begin
	// Initialize Inputs
	start = 1;
	reset = 1;
	#(CLK_PERIOD);
	reset = 0;
		
	sample1 = 1853;
	sample2 = 1156;
	sample3 = 6758;
	sample4 = 6785;
	sample5 = 5678;
	sample6 = 1056;
	sample7 = 6787;
	sample8 =1125;
	
	#(50*CLK_PERIOD);
	sample1 = 112;
	sample2 = 139;
	sample3 = 174;
	sample4 = 252;
	sample5 = 249;
	sample6 = 280;
	sample7 = 300;
	sample8 =252;
	#(50*CLK_PERIOD);
	


		
		
     
		
     
	end
      
endmodule

/*

`timescale 1ns/1ps

module tb_dit
(



);
// Inputs
	reg clk;
	reg reset;
	reg start;

	// Outputs
	wire [17:0] a2, b2, c2, d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2;
	wire w1;
	wire [19:0] cos1;

	// Instantiate Device Under Test (UUT)
	dit dut (
		.clk(clk), 
		.reset(reset), 
		.start(start), 
		.a2(a2), 
		.b2(b2), 
		.c2(c2), 
		.d2(d2), 
		.e2(e2), 
		.f2(f2), 
		.g2(g2), 
		.h2(h2), 
		.i2(i2), 
		.j2(j2), 
		.k2(k2), 
		.l2(l2), 
		.m2(m2), 
		.n2(n2), 
		.o2(o2), 
		.p2(p2) 
		//.w1(w1), 
		//.cos1(cos1)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		start = 0;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 1;
		start = 0;

		// Wait 50 ns 
		#5;
		clk = 0;
		reset = 0;
		start = 1;


		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns 
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;

		#5;
		clk = 0;
		reset = 0;
		start = 1;

		// Wait 50 ns for global reset to finish
		#5;
      clk = 1;
		reset = 0;
		start = 1;


	end
      
endmodule
*/