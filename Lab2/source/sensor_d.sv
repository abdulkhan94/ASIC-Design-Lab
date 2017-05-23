// Verilog for ECE337 Lab 2
//File Name : sensor_d.sv
//Author: Parneet kaur Ahuja
//Lab Section: 337-01

module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);
wire mid1;
wire mid2;
wire mid3;

assign mid1 = sensors[1]&sensors[2];
assign mid2 = sensors[1]&sensors[3];
assign mid3 = sensors[0]||mid1;
assign error = mid3||mid2;


	
endmodule