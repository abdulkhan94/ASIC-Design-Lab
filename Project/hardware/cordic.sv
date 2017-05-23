module cordic
  
  (
   input wire 		clock,
   input wire 		reset,
   input signed 	[15:0] start1, start2,
   input signed [31:0] 	angle,
   output signed [15:0] sine, cosine,
   output reg 		done
   );

   wire signed [31:0] 	arctan [0:30];
   reg signed [16:0] 	x [0:15];
   reg signed [16:0] 	y [0:15];
   reg signed [31:0] 	z [0:15];
   
   reg signed [16:0] 	x_nxt [0:15];
   reg signed [16:0] 	y_nxt [0:15];
   reg signed [31:0] 	z_nxt [0:15];
   
   
   assign arctan[00] = 32'b00100000000000000000000000000000;
   assign arctan[01] = 32'b00010010111001000000010100011101;
   assign arctan[02] = 32'b00001001111110110011100001011011;
   assign arctan[03] = 32'b00000101000100010001000111010100;
   assign arctan[04] = 32'b00000010100010110000110101000011;
   assign arctan[05] = 32'b00000001010001011101011111100001;
   assign arctan[06] = 32'b00000000101000101111011000011110;
   assign arctan[07] = 32'b00000000010100010111110001010101;
   assign arctan[08] = 32'b00000000001010001011111001010011;
   assign arctan[09] = 32'b00000000000101000101111100101110;
   assign arctan[10] = 32'b00000000000010100010111110011000;
   assign arctan[11] = 32'b00000000000001010001011111001100;
   assign arctan[12] = 32'b00000000000000101000101111100110;
   assign arctan[13] = 32'b00000000000000010100010111110011;
   assign arctan[14] = 32'b00000000000000001010001011111001;
   assign arctan[15] = 32'b00000000000000000101000101111100;
   assign arctan[16] = 32'b00000000000000000010100010111110;
   assign arctan[17] = 32'b00000000000000000001010001011111;
   assign arctan[18] = 32'b00000000000000000000101000101111;
   assign arctan[19] = 32'b00000000000000000000010100010111;
   assign arctan[20] = 32'b00000000000000000000001010001011;
   assign arctan[21] = 32'b00000000000000000000000101000101;
   assign arctan[22] = 32'b00000000000000000000000010100010;
   assign arctan[23] = 32'b00000000000000000000000001010001;
   assign arctan[24] = 32'b00000000000000000000000000101000;
   assign arctan[25] = 32'b00000000000000000000000000010100;
   assign arctan[26] = 32'b00000000000000000000000000001010;
   assign arctan[27] = 32'b00000000000000000000000000000101;
   assign arctan[28] = 32'b00000000000000000000000000000010;
   assign arctan[29] = 32'b00000000000000000000000000000001;
   assign arctan[30] = 32'b00000000000000000000000000000000;
 
 
   wire [1:0] 		quadrant; // make sure rotation angle is in -pi/2 to pi/2 range
   reg 		checkDone;
   reg [4:0]		checkDone2;
   
   flex_counter #(5) counter (.clk(clock), .n_rst(!reset), .clear(1'b0), .count_enable(1'b1), .rollover_val(5'b10000), .rollover_flag(done), .count_out(checkDone2));
   
   
   assign quadrant = angle[31:30];
/*   always @ (posedge clock, negedge reset) begin
      if(reset == 0) begin
	 done <= 0;
      end
   end
*/
   always_comb begin
      case(quadrant)
	2'b00,
	2'b11: // no changes needed for these quadrants
	  begin
	     x[0] = start1;
	     y[0] = start2;
	     z[0] = angle;
	  end
	2'b01:
	  begin
	     x[0] = -start2;
	     y[0] = start1;
	     z[0] = {2'b00,angle[29:0]}; // subtract pi/2 for angle in this quadrant
	  end
	2'b10:
	  begin
	     x[0] = start2;
	     y[0] = -start1;
	     z[0] = {2'b11,angle[29:0]}; // add pi/2 to angles in this quadrant
	  end
      endcase
   end
	   reg [16:0] z_sign;
	   reg signed [16:0] x_shr, y_shr;
	   wire signed [16:0] a_x_shr, a_y_shr;
   // run through iterations
   genvar i;

//   generate
//      for (i=0; i < 15; i=i+1)
//	begin: xyz
//	   assign x_shr = x[i] >>> i; // signed shift right
//	   assign y_shr = y[i] >>> i;
//	   //the sign of the current rotation angle
//	   assign z_sign = z[i][31];
//
//	   assign x_nxt[i+1] = z_sign ? x[i] + y_shr : x[i] - y_shr;
//	   assign y_nxt[i+1] = z_sign ? y[i] - x_shr : y[i] + x_shr;
//	   assign z_nxt[i+1] = z_sign ? z[i] + arctan[i] : z[i] - arctan[i];
//	end : xyz
//   endgenerate

	assign a_x_shr = x[0] >>> 1; // signed shift right
	assign a_y_shr = y[0] >>> 1;

always_comb
begin
	for(int i = 0; i < 15; i=i+1)
	begin
		x_shr[i] = x[i] >>> i; // signed shift right
		y_shr[i] = y[i] >>> i;
		//Sign of the current rotation angle
		z_sign[i] = z[i][31];
		
		x_nxt[i+1] = z_sign[i] ? x[i] + y_shr[i] : x[i] - y_shr[i];
		y_nxt[i+1] = z_sign[i] ? y[i] - x_shr[i] : y[i] + x_shr[i];
		z_nxt[i+1] = z_sign[i] ? z[i] + arctan[i] : z[i] - arctan[i];
	end
end

   generate
      for (i=0; i < 15; i=i+1)
	begin
	   always @(posedge clock)
	     begin
		// add/subtract shifted data
		x[i+1] <= x_nxt[i+1];
		y[i+1] <= y_nxt[i+1];
		z[i+1] <= z_nxt[i+1];
	     end
	end // block: xyz
     
   endgenerate

   // assign output
   assign cosine = x[15];
   assign sine = y[15];

endmodule
