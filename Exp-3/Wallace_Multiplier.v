module unsigned_mult( 
    input [3:0] a, b, 
    output [7:0]m
    );

wire [3:0]p0, p1, p2, p3;
wire s5, s4,s3,s2,s1,s0;
wire c5, c4,c3,c2,c1,c0;

assign p0 = a & {4{b[0]}};
assign p1 = a & {4{b[1]}};
assign p2 = a & {4{b[2]}};
assign p3 = a & {4{b[3]}};

half_adder ha0(p2[1],p3[0],k1,l1);
half_adder ha1(p2[2],p3[1],k2,l2);
half_adder ha2(p0[1],p1[0],s0,c0);

full_adder fa0(p0[2],p1[1],p2[0],s1,c1);
full_adder fa1(p0[3],p1[2],k1,s2,c2);
full_adder fa2(p1[3],k2,l1,s3,c3);
full_adder fa3(p2[3],p3[2],l2,s4,c4);

half_adder ha3(s1,c0,m[2],d0);
full_adder fa4(s2,c1,d0,m[3],d1);
full_adder fa5(s3,c2,d1,m[4],d2);
full_adder fa6(s4,c3,d2,m[5],d3);
full_adder fa7(p3[3],c4,d3,m[6],d4);

assign m[0] = p0[0];
assign m[1] = s0;
assign m[7] = d4;

endmodule



module half_adder(
    input a,b,
    output sum,cout
);

xor(sum,a,b);
and(cout,a,b);

endmodule

module full_adder (
    input a,b,cin,
    output sum,cout
);
wire w1,w2,w3,w4;  

xor(w1,a,b);
xor(sum,w1,cin);  

and(w2,a,b);
and(w3,b,cin);
and(w4,cin,a);
or(cout,w2,w3,w4);

endmodule