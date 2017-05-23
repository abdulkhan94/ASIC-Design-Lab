// Verilog for ECE337 Lab 2

module sensor_s
(
	input wire [3:0] sensors,
	output wire error
);
wire mid1;
wire mid2;
wire mid3;

and a1 (mid1, sensors[1], sensors[2]);
and a2 (mid2, sensors[1], sensors[3]);
or a3 (mid3, sensors[0], mid1);
or a4 (error, mid3, mid2);



	
endmodule