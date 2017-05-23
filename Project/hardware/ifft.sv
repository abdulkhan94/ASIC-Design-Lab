module ifft


(
input wire clk,
input wire reset,
input wire start,
input wire [16:0] sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8,sample9,sample10,sample11,sample12,sample13,sample14,sample15,sample16,
output reg [16:0] a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,
output reg done
);

wire [16:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
wire [16:0] a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1;
wire [19:0] cos1, cos3, cos4;
wire [19:0] cos2;
wire [19:0] sin1, sin3, sin4;
wire [19:0] sin2;
wire w1, w2;
reg [17:0] angle,angle1;
assign angle[17:0] = 18'b001011010100000100;
assign angle1[17:0] = 18'b001011010100000100;







//cordic cd1 (.cosine(cos1), .sine(sin1), .done(w1), .angle(32'b00100000000000000000000000000000),  .clock(clk), .reset(reset), .start1(1), .start2(0));
//cordic cd2 (.cosine(cos2), .sine(sin2), .done(w2), .angle(32'b10100000000000000000000000000000),  .clock(clk), .reset(reset), .start1(1), .start2(0) );
//cordic cd3 (.cosine(cos3), .sine(sin3), .done(w3), .angle('0), .clock(clk), .reset(reset), .start1(1), .start2(0));
//cordic cd4 (.cosine(cos4), .sine(sin4), .done(w4), .angle(32'b00000000000001100100100001111101), .clock(clk), .reset(reset), .start1(1), .start2(0));


butterfly bt1(.reset(reset), .Xar(sample1), .Xai(sample2), .Xbr(sample9), .Xbi(sample10), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(a), .Yai(b), .Ybr(c), .Ybi(d));
butterfly bt2(.reset(reset), .Xar(sample3), .Xai(sample4), .Xbr(sample11), .Xbi(sample12), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(e), .Yai(f), .Ybr(g), .Ybi(h));
butterfly bt3(.reset(reset), .Xar(sample5), .Xai(sample6), .Xbr(sample13), .Xbi(sample14), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(i), .Yai(j), .Ybr(k), .Ybi(l));
butterfly bt4(.reset(reset), .Xar(sample7), .Xai(sample8), .Xbr(sample15), .Xbi(sample16), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(m), .Yai(n), .Ybr(o), .Ybi(p));


butterfly bt5(.reset(reset), .Xar(a), .Xai(b), .Xbr(e), .Xbi(f), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(a1), .Yai(b1), .Ybr(e1), .Ybi(f1));
butterfly bt6(.reset(reset), .Xar(c), .Xai(d), .Xbr(g), .Xbi(h), .cos('0), .sin(18'b110000000000000000), .clk(clk), .Yar(c1), .Yai(d1), .Ybr(g1), .Ybi(h1));
butterfly bt7(.reset(reset), .Xar(i), .Xai(j), .Xbr(m), .Xbi(n),.cos(18'b010000000000000000), .sin('0) , .clk(clk), .Yar(i1), .Yai(j1), .Ybr(m1), .Ybi(n1));
butterfly bt8(.reset(reset), .Xar(k), .Xai(l), .Xbr(o), .Xbi(p), .cos('0), .sin(18'b110000000000000000), .clk(clk), .Yar(k1), .Yai(l1), .Ybr(o1), .Ybi(p1));

butterfly bt10(.reset(reset), .Xar(a1), .Xai(b1), .Xbr(i1), .Xbi(j1), .cos(18'b110000000000000000), .sin('0), .clk(clk), .Yar(c2), .Yai(d2), .Ybr(a2), .Ybi(b2));
//assign tmp[15:0] = c1[15:0];
butterfly bt11(.reset(reset), .Xar(c1), .Xai(d1), .Xbr(k1), .Xbi(l1), .cos(18'b101011010100000100), .sin(18'b001011010100000100), .clk(clk), .Yar(g2), .Yai(h2), .Ybr(e2), .Ybi(f2));
butterfly bt12(.reset(reset), .Xar(e1), .Xai(f1), .Xbr(m1), .Xbi(n1), .sin(18'b010000000000000000), .cos('0), .clk(clk), .Yar(k2), .Yai(l2), .Ybr(i2), .Ybi(j2));
butterfly bt13(.reset(reset), .Xar(g1), .Xai(h1), .Xbr(o1), .Xbi(p1), .cos(angle), .sin(angle1), .clk(clk), .Yar(o2), .Yai(p2), .Ybr(m2), .Ybi(n2));


assign done = 1;
endmodule



   
