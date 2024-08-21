module lcd_mult(
input in_Clk,
input [3:0] a, b,
input reset,
output [7:0] data,
output lcd_rs, 
output lcd_e
);

wire [7:0] product;

unsigned_mult mult0(a,b,product);
lcd lcd0(in_Clk,product,reset,data,lcd_rs,lcd_e);
   
endmodule
