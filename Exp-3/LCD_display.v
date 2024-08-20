module lcd(
    input in_Clk,
    output reg [7:0] data,
    output reg lcd_rs,
    output lcd_e
    );

wire [7:0] command [0:4];
reg [31:0] count=0;
wire out_Clk;

assign command [0] = 8'h38; // control signal to display on two lines
assign command [1] = 8'h0C; // keep display on but cursor off
assign command [2] = 8'h06; // increment the cursor
assign command [3] = 8'h01; // clear the display
assign command [4] = 8'hC0; // choose the second line


clk_divider c0 (in_Clk,reset,out_Clk);
assign lcd_e = out_Clk;

always@(posedge lcd_e or negedge reset) 
begin   
    if (!reset) 
    begin
        count <= 0;        // Reset the count on reset signal
    end 
    else
    begin
        count <= count + 1;
        case(count)
            1: begin lcd_rs = 0; data = command[0]; end 
            2: begin lcd_rs = 0; data = command[1]; end
            3: begin lcd_rs = 0; data = command[2]; end
            4: begin lcd_rs = 0; data = command[3]; end
            5: begin lcd_rs = 0; data = command[4]; end
            6: begin lcd_rs = 1; data = 8'h31; end // '1'
            7: begin lcd_rs = 1; data = 8'h32; end // '2'
            8: begin lcd_rs = 1; data = 8'h33; end // '3'
            9: begin lcd_rs = 1; data = 8'h34; end // '4'
            10: begin lcd_rs = 1; data = 8'h35; end // '5'
            11: begin lcd_rs = 1; data = 8'h36; end // '6'
            12: begin lcd_rs = 1; data = 8'h37; end // '7'
            13: begin lcd_rs = 1; data = 8'h38; end // '8'
            14: begin lcd_rs = 1; data = 8'h39; end // '9'
            15: begin lcd_rs = 1; data = 8'h41; end // 'A'
            16: begin lcd_rs = 1; data = 8'h42; end // 'B'
            17: begin lcd_rs = 1; data = 8'h43; end // 'C'
            18: begin lcd_rs = 1; data = 8'h44; end // 'D'
            19: begin lcd_rs = 1; data = 8'h45; end // 'E'
            20: begin lcd_rs = 1; data = 8'h46; end // 'F'
            21: begin lcd_rs = 1; data = 8'h47; end // 'G'
        
            default: begin lcd_rs = 0; data = 8'h80; end
            // return cursor to initial position
        endcase
    end
end
endmodule



module clk_divider(
    input inClk,
    input reset,
    output reg outClk
    );

reg [25:0] clockCount;
parameter v = 26'd80000000;

always @(negedge reset or posedge inClk) 
begin
    if (!reset) 
    begin
        clockCount <= 26'd0;
        outClk <= 1'b0;
    end 
    
    else 
    begin
        clockCount <= clockCount + 1'd1;
        if (clockCount == v) 
        begin
            clockCount <= 26'd0;
            outClk <= ~outClk;
        end
    end
end

endmodule
