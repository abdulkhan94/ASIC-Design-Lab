// Verilog for ECE337 Lab 2
//File Name : sensor_b.sv
//Author: Parneet kaur Ahuja
//Lab Section: 337-01

module sensor_b
(
	input wire [3:0] sensors,
	output reg error
);
reg mid1;
reg mid2;
reg mid3;

always @ (sensors) 
begin
  mid1 = sensors[1]&sensors[2];
  mid2 = sensors[1]&sensors[3];
  mid3 = sensors[0]||mid1;
  error = mid3||mid2;
end

	
endmodule