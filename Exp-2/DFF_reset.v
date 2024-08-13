module dflipflop_reset(
    input clk,
    input reset, d,
    output reg q,qbar
    );

always @(posedge clk)
begin 
    // If reset is active(low)
    if (~reset)
    begin
        q <= 1'b0;
        qbar <= 1'b1;
    end
    else    
    begin
        q <= d;
        qbar <= ~d;
    end
end

endmodule
