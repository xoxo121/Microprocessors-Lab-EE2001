module clk_divider(
    input inClk,
    input reset,
    output reg outClk
    );

reg [25:0] clockCount;
 // Adjust the value of v to change the frequency of outClk
parameter v = 26'd80000000;

always @(negedge reset or posedge inClk) 
begin
    if (reset == 1'b0) 
    begin
        clockCount <= 26'd0;
        outClk <= 1'b0;
    end 
    else 
    begin
        // Increment clockCount
        clockCount <= clockCount + 1'd1;

        // Check if clockCount has reached v
        if (clockCount == v) 
        begin
            // Reset clockCount and toggle outClk
            clockCount <= 26'd0;
            outClk <= ~outClk;
        end
    end
end

endmodule
