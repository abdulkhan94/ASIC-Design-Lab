
module sync ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;


  DFFSR temp2_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

