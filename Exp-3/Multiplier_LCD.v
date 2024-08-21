module lcd(
    input in_Clk,
    input [7:0] product, // multiplier output
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

reg [7:0] ascii_table [0:1];
initial 
    begin
        ascii_table[0] = 8'h30; // '0'
        ascii_table[1] = 8'h31; // '1'
    end

clk_divider c0 (in_Clk,out_Clk);
assign lcd_e = out_Clk;

always@(posedge lcd_e) 
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
        19: begin lcd_rs = 1; data = ascii_table[product[7]]; end // MSB
        20: begin lcd_rs = 1; data = ascii_table[product[6]]; end
        21: begin lcd_rs = 1; data = ascii_table[product[5]]; end
        22: begin lcd_rs = 1; data = ascii_table[product[4]]; end
        23: begin lcd_rs = 1; data = ascii_table[product[3]]; end
        24: begin lcd_rs = 1; data = ascii_table[product[2]]; end
        25: begin lcd_rs = 1; data = ascii_table[product[1]]; end
        26: begin lcd_rs = 1; data = ascii_table[product[0]]; end // LSB

        default: begin lcd_rs = 0; data = 8'h80;count <= 0; end
        // return cursor to initial position
    endcase
    end
endmodule



module clk_divider(
    input inClk,
    output reg outClk = 0
    );

reg [25:0] clockCount = 26'd0;
parameter v = 26'd500000;

always @(posedge inClk) 
begin
    if (clockCount == v-1) 
    begin
        clockCount <= 26'd0;
        outClk <= ~outClk;
    end 
    else 
    begin
        clockCount <= clockCount + 1'd1;
    end
end

endmodule
