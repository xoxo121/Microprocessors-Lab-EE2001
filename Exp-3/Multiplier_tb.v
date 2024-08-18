module multiplier_tb;
reg [3:0] a, b;
wire [7:0] m;
    
unsigned_mult um(a,b,m);

initial 
begin
    $monitor("At time %t: a = %b, b = %b, m = %b", $time, a, b, m);
    a = 4'b0000;
    b = 4'b0000;
    #10 a = 4'b0001; b = 4'b0100;
    #10 a = 4'b0010; b = 4'b1010;
    #10 a = 4'b0011; b = 4'b0111;
    #10 a = 4'b0100; b = 4'b0100;
    #10 a = 4'b0101; b = 4'b1011;
    #10 a = 4'b1111; b = 4'b1100;
    #10 $finish;
end

endmodule
    
