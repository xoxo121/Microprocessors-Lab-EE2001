module lcd(
    input in_Clk,
    input [7:0] product, // multiplier output
    input reset,
    output reg [7:0] data,
    output reg lcd_rs, // register select
    output lcd_e // enable
    );

wire [7:0] command [0:5];
reg [31:0] count=0;
wire out_Clk;

assign command [0] = 8'h38; // control signal to display on two lines
assign command [1] = 8'h0C; // keep display on but cursor off
assign command [2] = 8'h06; // increment the cursor
assign command [3] = 8'h01; // clear the display
assign command [4] = 8'h80; // Set cursor to the first line
assign command [5] = 8'hC0; // Set cursor to the second line

clk_divider c0(in_Clk,reset,out_Clk);
assign lcd_e = out_Clk;

reg [7:0] hundreds;
reg [7:0] tens;
reg [7:0] ones;

// convert binary to decimal
always @(*)
begin
    hundreds = (product/100)%10 + 8'h30;
    tens = (product/10)%10 + 8'h30;
    ones = (product%10) + 8'h30;
end


always@(posedge lcd_e or negedge reset) 
begin
if (!reset)
begin
        count <= 0;
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
        
        6: begin lcd_rs = 1; data = 8'h50; end // 'P'
        7: begin lcd_rs = 1; data = 8'h72; end // 'r'
        8: begin lcd_rs = 1; data = 8'h6F; end // 'o'
        9: begin lcd_rs = 1; data = 8'h64; end // 'd'
        10: begin lcd_rs = 1; data = 8'h75; end // 'u'
        11: begin lcd_rs = 1; data = 8'h63; end // 'c'
        12: begin lcd_rs = 1; data = 8'h74; end // 't'
        13: begin lcd_rs = 1; data = 8'h20; end // ' '
        14: begin lcd_rs = 1; data = 8'h69; end // 'i'
        15: begin lcd_rs = 1; data = 8'h73; end // 's'
        16: begin lcd_rs = 1; data = 8'h20; end // ' '
        17: begin lcd_rs = 1; data = 8'h3D; end // '='
        
        // Move to second line
        18: begin lcd_rs = 0; data = command[5]; end
        
        // Display the product in binary
        19: begin lcd_rs = 1; data = hundreds; end // MSB
        20: begin lcd_rs = 1; data = tens; end
        21: begin lcd_rs = 1; data = ones; end


        default: begin lcd_rs = 0; data = 8'h80; end
        // return cursor to initial position
    endcase
end
end
endmodule



module clk_divider(
    input inClk,
    input reset,
    output reg outClk = 0
    );

reg [25:0] clockCount;
parameter v = 26'd80000;

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
        if (clockCount == v - 1) 
        begin
            clockCount <= 26'd0;
            outClk <= ~outClk;
        end
    end
end

endmodule
