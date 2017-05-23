module top_level(
  input wire clk,
  input wire n_rst,
  input wire buffer_clear,
  input wire w_flag_clear,
  input wire [31:0] w_load_size,
  input wire [15:0] sample1,
  
  input wire[15:0] sample2,
  input wire[15:0] sample3,
  input wire[15:0] sample4,
  input wire[15:0] sample5,
  input wire[15:0] sample6,
  input wire[15:0] sample7,
  input wire[15:0] sample8,
  
  output reg w_output_load,
  output reg w_wav_done,
  output reg [15:0] data_out1,
  output reg [15:0] data_out2,
  output reg [15:0] data_out3,
  output reg [15:0] data_out4,
  output reg [15:0] data_out5,
  output reg [15:0] data_out6,
  output reg [15:0] data_out7,
  output reg [15:0] data_out8
  );
  reg [31:0] p;
  reg [31:0] next_p;
  reg done;
  reg [16:0] a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2;
  reg [16:0] a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3,l3,m3,n3,o3,p3;
  reg [16:0] a4,b4,c4,d4,e4,f4,g4,h4,i4,j4,k4,l4,m4,n4,o4,p4;



  
  always_ff @(posedge clk, negedge n_rst) begin
if(!n_rst) begin
	//w_output_load <= 0;
	p <= '0;
end else begin
	//w_output_load <= 1;
	p <= next_p;
  end
end

dit DIT(
 .clk(clk),
.reset(n_rst),
.start(buffer_clear),
.sample1({1'b0,sample1[15:0]}),
.sample2({1'b0,sample2[15:0]}),
.sample3({1'b0,sample3[15:0]}),
.sample4({1'b0,sample4[15:0]}),
.sample5({1'b0,sample5[15:0]}),
.sample6({1'b0,sample6[15:0]}),
.sample7({1'b0,sample7[15:0]}),
.sample8({1'b0,sample8[15:0]}),
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




ifft IFFT(.clk(clk),.reset(reset),.start(done1),.sample1(b2),.sample2(a2),.sample3(d2),.sample4(c2),.sample5(f2),.sample6(e2),.sample7(h2),.sample8(g2),.sample9(j2),.sample10(i2),.sample11(l2),.sample12(k2),.sample13(n2),.sample14(m2),.sample15(p2),.sample16(o2),.b2(a3),.a2(b3),.d2(c3),.c2(d3),.f2(e3),.e2(f3),.h2(g3),.g2(h3),.j2(i3),.i2(j3),.l2(k3),.k2(l3),.n2(m3),.m2(n3),.p2(o3),.o2(p3),.done(w_output_load));


assign b4 = b3/8;
assign a4 = a3/8;
assign d4 = d3/8;
assign c4 = c3/8;
assign f4 = f3/8;
assign e4 = e3/8;
assign h4 = h3/8;
assign g4 = g3/8;
assign j4 = j3/8;
assign i4 = i3/8;
assign l4 = l3/8;
assign k4 = k3/8;
assign n4 = n3/8;
assign m4 = m3/8;
assign p4 = p3/8;
assign o4 = o3/8;



always_comb begin
	
	data_out1 = a4[15:0];
	data_out2 = c4[15:0];
	data_out3 = e4[15:0];
	data_out4 = g4[15:0];
	data_out5 = i4[15:0];
        data_out6 = k4[15:0];
        data_out7 = m4[15:0];
        data_out8 = o4[15:0];
	
	if(buffer_clear) begin
  		next_p = p + 8;
	end
	else begin
		next_p = p;
	end
	if(w_flag_clear) begin
  if(next_p == 690000 || next_p == 690008 ) begin//w_load_size) begin
    w_wav_done = 1;
  end
  else begin
	w_wav_done = 0;
	end
end
  else begin
  w_wav_done = 0;
  end

end

  
endmodule
  
    
  
  
  
  
