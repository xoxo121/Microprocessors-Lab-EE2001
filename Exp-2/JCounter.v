module johnson3bit(
    input in_clk,
    input reset,
    output [7:0] Seven_Seg,
    output [3:0] digit
    );

wire [2:0] cntr; 
wire q0,q1,q2;
wire q0bar, q1bar, q2bar;
wire out_clk;

// Assign the digit to a constant value
assign digit = 4'b0001;
// Concatenate flip-flop outputs to form the counter value
assign cntr = {q2,q1,q0};

// Instantiate the 3-bit Johnson counter using D flip-flops with reset
dflipflop_reset d2(in_clk, reset, q0bar, q2, q2bar);
dflipflop_reset d1(in_clk, reset, q2, q1, q1bar);
dflipflop_reset d0(in_clk, reset, q1, q0, q0bar);

clk_divider cd0(in_clk, reset, out_clk);
decoder dec0(cntr, Seven_Seg);

endmodule
