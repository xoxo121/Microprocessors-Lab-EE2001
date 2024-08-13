module clk_divider(
    input inClk,
    input reset,
    output reg outClk
    );

reg [3:0] clockCount;
 // Adjust the value of v to change the frequency of outClk
parameter v = 4'd10;

always @(negedge reset or posedge inClk) 
begin
    if (reset == 1'b0) 
    begin
        clockCount <= 4'b0000;
        outClk <= 1'b0;
    end 
    else 
    begin
        // Increment clockCount
        clockCount <= clockCount + 1'b1;

        // Check if clockCount has reached v
        if (clockCount == v-1) 
        begin
            // Reset clockCount and toggle outClk
            clockCount <= 4'b0000;
            outClk <= ~outClk;
        end
    end
end

endmodule
