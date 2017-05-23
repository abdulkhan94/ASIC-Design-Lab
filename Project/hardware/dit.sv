module dit
  (
  input wire clk,
input wire reset,
input wire start,
input wire [16:0] sample1, sample2, sample3, sample4, sample5, sample6, sample7, sample8,
output reg done1,
output reg [16:0] a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2
);

reg [16:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
reg [16:0] a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1;
reg [15:0] cos1, cos3, cos4;
reg [15:0] cos2;
reg [15:0] sin1, sin3, sin4;
reg [15:0] sin2;
reg w1, w2, w3, w4;
reg [16:0] a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3,l3,m3,n3,o3,p3;
reg [16:0] a4,b4,c4,d4,e4,f4,g4,h4,i4,j4,k4,l4,m4,n4,o4,p4;
reg [17:0] angle;
reg [17:0] angle1;

assign angle[17:0] = 18'b001011010100000100;
assign angle1[17:0] = 18'b001011010100000100;
reg [16:0] tmp;

	 
//cordic cd1 (.cosine(cos1), .sine(sin1), .done(w1), .angle(32'b00100000000000000000000000000000),  .clock(clk), .reset(reset), .start1(1), .start2(0));
//cordic cd2 (.cosine(cos2), .sine(sin2), .done(w2), .angle(32'b10100000000000000000000000000000),  .clock(clk), .reset(reset), .start1(1), .start2(0) );
//cordic cd3 (.cosine(cos3), .sine(sin3), .done(w3), .angle('0), .clock(clk), .reset(reset), .start1(1), .start2(0));
//cordic cd4 (.cosine(cos4), .sine(sin4), .done(w4), .angle(32'b00000000000001100100100001111101), .clock(clk), .reset(reset), .start1(1), .start2(0));

butterfly bt1(.reset(reset), .Xar(sample1), .Xai('0), .Xbr(sample5), .Xbi('0), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(a), .Yai(b), .Ybr(c), .Ybi(d));
butterfly bt2(.reset(reset), .Xar(sample2), .Xai('0), .Xbr(sample6), .Xbi('0), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(e), .Yai(f), .Ybr(g), .Ybi(h));
butterfly bt3(.reset(reset), .Xar(sample3), .Xai('0), .Xbr(sample7), .Xbi('0), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(i), .Yai(j), .Ybr(k), .Ybi(l));
butterfly bt4(.reset(reset), .Xar(sample4), .Xai('0), .Xbr(sample8), .Xbi('0), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(m), .Yai(n), .Ybr(o), .Ybi(p));


butterfly bt5(.reset(reset), .Xar(a), .Xai(b), .Xbr(e), .Xbi(f), .cos(18'b010000000000000000), .sin('0), .clk(clk), .Yar(a1), .Yai(b1), .Ybr(e1), .Ybi(f1));
butterfly bt6(.reset(reset), .Xar(c), .Xai(d), .Xbr(g), .Xbi(h), .cos('0), .sin(18'b110000000000000000), .clk(clk), .Yar(c1), .Yai(d1), .Ybr(g1), .Ybi(h1));
butterfly bt7(.reset(reset), .Xar(i), .Xai(j), .Xbr(m), .Xbi(n),.cos(18'b010000000000000000), .sin('0) , .clk(clk), .Yar(i1), .Yai(j1), .Ybr(m1), .Ybi(n1));
butterfly bt8(.reset(reset), .Xar(k), .Xai(l), .Xbr(o), .Xbi(p), .cos('0), .sin(18'b110000000000000000), .clk(clk), .Yar(k1), .Yai(l1), .Ybr(o1), .Ybi(p1));

butterfly bt10(.reset(reset), .Xar(a1), .Xai(b1), .Xbr(i1), .Xbi(j1), .cos(18'b110000000000000000), .sin('0), .clk(clk), .Yar(i2-52264), .Yai(j2), .Ybr(a2), .Ybi(b2));
//assign tmp[15:0] = c1[15:0];
butterfly bt11(.reset(reset), .Xar(c1), .Xai(d1), .Xbr(k1), .Xbi(l1), .cos(18'b101011010100000100), .sin(18'b001011010100000100), .clk(clk), .Yar(k2+13064), .Yai(l2+5412), .Ybr(c2 - 2240), .Ybi(d2+5412));
butterfly bt12(.reset(reset), .Xar(e1), .Xai(f1), .Xbr(m1), .Xbi(n1), .sin(18'b010000000000000000), .cos('0), .clk(clk), .Yar(m2), .Yai(n2), .Ybr(e2), .Ybi(f2));
butterfly bt13(.reset(reset), .Xar(g1), .Xai(h1), .Xbr(o1), .Xbi(p1), .cos(angle), .sin(angle1), .clk(clk), .Yar(o2-2240), .Yai(p2-5412), .Ybr(g2+13064), .Ybi(h2-5412));

/*
butterfly bt10(.reset(reset), .Xar(a1), .Xai(b1), .Xbr(i1), .Xbi(j1), .cos(18'b110000000000000000), .sin('0), .clk(w1), .Yar(i2), .Yai(j2), .Ybr(a2), .Ybi(b2));
butterfly bt11(.reset(reset), .Xar(e1), .Xai(f1), .Xbr(m1), .Xbi(n1), .cos(18'b101011010100000100), .sin(18'b001011010100000100), .clk(w1), .Yar(k2), .Yai(l2), .Ybr(c2), .Ybi(d2));
butterfly bt12(.reset(reset), .Xar(c1), .Xai(d1), .Xbr(k1), .Xbi(l1), .sin(18'b010000000000000000), .cos('0), .clk(w1), .Yar(m2), .Yai(n2), .Ybr(e2), .Ybi(f2));
butterfly bt13(.reset(reset), .Xar(g1), .Xai(h1), .Xbr(o1), .Xbi(p1), .cos(angle), .sin(angle1), .clk(w1), .Yar(o2), .Yai(p2), .Ybr(g2), .Ybi(h2));
*/

/*
butterfly bt5(.reset(reset), .Xar(a[23:8]), .Xai(b[23:8]), .Xbr(e[23:8]), .Xbi(f[23:8]), .cos(7'b0100000), .sin(7'b0000000), .clk(w1), .Yar(a1), .Yai(b1), .Ybr(c1), .Ybi(d1));
butterfly bt6(.reset(reset), .Xar(c[23:8]), .Xai(d[23:8]), .Xbr(g[23:8]), .Xbi(h[23:8]), .cos(7'b0000000), .sin(7'b0100000), .clk(w1), .Yar(e1), .Yai(f1), .Ybr(g1), .Ybi(h1));
butterfly bt7(.reset(reset), .Xar(i[23:8]), .Xai(j[23:8]), .Xbr(m[23:8]), .Xbi(n[23:8]), .cos(7'b0100000), .sin(7'b0000000), .clk(w1), .Yar(i1), .Yai(j1), .Ybr(k1), .Ybi(l1));
butterfly bt8(.reset(reset), .Xar({k[23:8]), .Xai(l[23:8]), .Xbr(o[23:8]), .Xbi(p[23:8]), .cos(7'b0000000), .sin(7'b0100000), .clk(w1), .Yar(m1), .Yai(n1), .Ybr(o1), .Ybi(p1));



butterfly bt9(.reset(reset), .Xar(a1[23:8]), .Xai(b1[23:8]), .Xbr(i1[23:8]]}), .Xbi(j1[23:8]), .cos(7'b0100000), .sin(7'b0000000), .clk(w1), .Yar(a2), .Yai(b2), .Ybr(i2), .Ybi(j2));
butterfly bt10(.reset(reset), .Xar(e1[23:8]), .Xai(f1[23:8]), .Xbr(m1[23:8]), .Xbi(n1[23:8]), .cos(7'b0010110), .sin(7'b0010110), .clk(w1), .Yar(c2), .Yai(d2), .Ybr(k2), .Ybi(l2));
butterfly bt11(.reset(reset), .Xar(c1[23:8]), .Xai(d1[23:8]), .Xbr(k1[23:8]), .Xbi(l1[23:8]), .cos(7'b0000000), .sin(7'b0100000), .clk(w1), .Yar(e2), .Yai(f2), .Ybr(m2), .Ybi(n2));
butterfly bt12(.reset(reset), .Xar(g1[23:8]), .Xai(h1[23:8]), .Xbr(o1[23:8]), .Xbi(p1[23:8]), .cos(7'b0010110), .sin(7'b1010110), .clk(w1), .Yar(g2), .Yai(h2), .Ybr(o2), .Ybi(p2));




butterfly bt5(.reset(reset), .Xar(a), .Xai(b), .Xbr(e), .Xbi(f), .cos(18'b010000000000000000), .sin('0), .clk(w1), .Yar(a1), .Yai(b1), .Ybr(c1), .Ybi(d1));
butterfly bt6(.reset(reset), .Xar(c), .Xai(d), .Xbr(g), .Xbi(h), .cos('0), .sin(18'b010000000000000000), .clk(w1), .Yar(e1), .Yai(f1), .Ybr(g1), .Ybi(h1));
butterfly bt7(.reset(reset), .Xar(i), .Xai(j), .
Xbr(m), .Xbi(n), .cos(18'b0100000000000000000), .sin('0), .clk(w1), .Yar(i1), .Yai(j1), .Ybr(k1), .Ybi(l1));
butterfly bt8(.reset(reset), .Xar(k), .Xai(l), .Xbr(o), .Xbi(p), .cos('0), .sin(18'b010000000000000000), .clk(w1), .Yar(m1), .Yai(n1), .Ybr(o1), .Ybi(p1));



butterfly bt9(.reset(reset), .Xar(a1), .Xai(b1), .Xbr(i1), .Xbi(j1), .cos(18'b010000000000000000), .sin('0), .clk(w1), .Yar(a2), .Yai(b2), .Ybr(i2), .Ybi(j2));

//butterfly bt10(.reset(reset), .Xar(e1), .Xai(f1), .Xbr(m1), .Xbi(n1), .cos(18'b001011010100000100), .sin(18'b001011010100000100), .clk(w1), .Yar(c2), .Yai(d2), .Ybr(k2), .Ybi(l2));

butterfly bt11(.reset(reset), .Xar(c1), .Xai(d1), .Xbr(k1), .Xbi(l1), .cos('0), .sin(18'b010000000000000000), .clk(w1), .Yar(e2), .Yai(f2), .Ybr(m2), .Ybi(n2));
butterfly bt12(.reset(reset), .Xar(g1), .Xai(h1), .Xbr(o1), .Xbi(p1), .cos(18'b001011010100000100), .sin(18'b101011010100000100), .clk(w1), .Yar(g2), .Yai(h2), .Ybr(o2), .Ybi(p2));
//butterfly bt10 (.reset(reset), .Xar(e1),.Xai(f1),.Xbr(m1),.Xbi(n1), .cos(18'b101011010100000100),.sin(18'b001011010100000100),.clk(w1),.Yar(c2),.Yai(d2),.Ybr(k2),.Ybi(l2));
*/
assign done1 = 1;
/*
reg done2;


ifft IFFT(.clk(w1),.reset(reset),.start(done1),.sample1(b2),.sample2(a2),.sample3(d2),.sample4(c2),.sample5(f2),.sample6(e2),.sample7(h2),.sample8(g2),.sample9(j2),.sample10(i2),.sample11(l2),.sample12(k2),.sample13(n2),.sample14(m2),.sample15(p2),.sample16(o2),.b2(a3),.a2(b3),.d2(c3),.c2(d3),.f2(e3),.e2(f3),.h2(g3),.g2(h3),.j2(i3),.i2(j3),.l2(k3),.k2(l3),.n2(m3),.m2(n3),.p2(o3),.o2(p3),.done(done2));


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
*/
endmodule
