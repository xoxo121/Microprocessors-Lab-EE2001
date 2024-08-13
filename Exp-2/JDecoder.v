module decoder(
    input [2:0] cntr,
    output [7:0] Seven_Seg
    );

reg [6:0] val;

assign Seven_Seg = {1'b1, ~val};

// Always block triggered whenever the counter value changes
always @(cntr)
begin 
    // Case statement to decode the counter value to 7-segment display segments
    case(cntr)
    3'd0: val = 7'b0111111; // Display "0"
    3'd1: val = 7'b0000110; // Display "1"
    3'd2: val = 7'b1011011; // Display "2"
    3'd3: val = 7'b1001111; // Display "3"
    3'd4: val = 7'b1100110; // Display "4"
    3'd5: val = 7'b1101101; // Display "5"
    3'd6: val = 7'b1111100; // Display "6"
    default: val = 7'b0000000; // Default case
    endcase
end

endmodule