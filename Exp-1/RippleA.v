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

module ripple_adder(
    input [3:0]a,b,
    input cin,
    output [3:0]sum,
    output cout);

wire w1,w2,w3;

full_adder fa1(a[0],b[0],cin,sum[0],w1);
full_adder fa2(a[1],b[1],w1,sum[1],w2);
full_adder fa2(a[2],b[2],w2,sum[2],w3);
full_adder fa4(a[3],b[3],w3,sum[3],cout);
                
endmodule

