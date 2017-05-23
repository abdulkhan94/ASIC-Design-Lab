module butterfly
  (
   input wire 	     clk,
   input wire 	     reset,
   input wire [16:0]  Xar, Xai, Xbr, Xbi,
   input wire [17:0]  cos, sin,
   output reg [16:0] Yar, Yai, Ybr, Ybi
   );

   reg [63:0] 	     a1, a2, a3, a4;
   reg [63:0] 	     a11, a22,a33,a44;
   reg [16:0] tmp1,tmp2,tmp3,tmp4;
   reg [16:0] tmp5,tmp6;

  always @ (posedge clk)
  begin
if(cos[16] == 1) begin
if(Xbr[16] == 1'b1) begin
	
	tmp5[16:0] <= (~(Xbr[16:0]))+1;
	a1 <= {47'b0,tmp5[16:0]};
end
else begin
a1 <= {47'b0,Xbr[16:0]};
end

a2 <= '0;

if(Xbi[16] == 1'b1) begin
	tmp6[16:0] <= (~(Xbi[16:0]))+1;
	a3 <= {47'b0,tmp6[16:0]};
end
else begin
a3 <= {47'b0,Xbi[16:0]};
end

a4 <= '0;
end

else if(sin[16] == 1) begin
a1 <= '0;
if(Xbr[16] == 1'b1) begin
	
	tmp5[16:0] <= (~(Xbr[16:0]))+1;
a2 <= {47'b0,tmp5[16:0]};
	
end
else begin
a2 <= {47'b0,Xbr[16:0]};
end
//a2 <= {48'b0,Xbr};
a3 <= '0;
if(Xbi[16] == 1'b1) begin

	tmp6 <= (~(Xbi[16:0]))+1;
a4 <= {47'b0,tmp6[16:0]};
end
else begin
a4 <= {47'b0,Xbi[16:0]};
end

//a4 <= {48'b0,Xbi};
end
else begin
	if(Xbr[16] == 1'b1) begin
	tmp5[16:0 ]<= (~(Xbr[16:0]))+1;
	end
	else begin
	tmp5[16:0] <= Xbr[16:0];
end
if(Xbi[16] == 1'b1) begin
	tmp6[16:0 ]<= (~(Xbi[16:0]))+1;
	end
	else begin
	tmp6[16:0] <= Xbi[16:0];
end

        
	
	a11 <= {47'b0,tmp5[16:0]};

	a22 <= {47'b0,tmp6[16:0]};
	

	a1 <=  ((a11 << 16)*cos[15:0])>>32;
	a2 <=  ((a11 << 16)*sin[15:0])>>32;
	a3 <=  ((a22 << 16)*cos[15:0])>>32;
	a4 <=  ((a22 << 16)*sin[15:0])>>32;
end
	
	a1[63] <= (cos[17] ^ Xbr[16]);
	a2[63] <= (sin[17] ^ Xbr[16]);
	a3[63] <= (cos[17] ^ Xbi[16]);
	a4[63] <= (sin[17] ^ Xbi[16]);
        //a11<= (Xar<<11);
	//a22<= (Xai<<11);
	//a33<= (Xbr<11);
	//a44<= (Xbi<<11);
if(a1[63] == 1'b1) begin
tmp1 <= 0 - a1[16:0];
end
else begin
tmp1 <= a1[16:0];
end
if(a2[63] == 1'b1) begin
tmp2 <=  0 - a2[16:0];
end
else begin
tmp2 <= a2[16:0];
end
if(a3[63] == 1'b1) begin
tmp3 <=  0 - a3[16:0];
end
else begin
tmp3 <= a3[16:0];
end

if(a4[63] == 1'b1) begin
tmp4 <=  0 - a4[16:0];
end
else begin
tmp4 <= a4[16:0];
end


  end




   assign Yar =((Xar)+(tmp1)-(tmp4));
   assign Yai =  ( (Xai)+ (tmp3)+ (tmp2));
   assign Ybr =  ( (Xar)- (tmp1)+ (tmp4));
   assign Ybi =  ( (Xai)- (tmp3)- (tmp2));

endmodule
