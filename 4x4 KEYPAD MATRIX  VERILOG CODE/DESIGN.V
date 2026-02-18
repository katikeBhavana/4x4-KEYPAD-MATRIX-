// _______keypad matrix 4x4________
module keypad_matrix (
    input  wire [3:0] row,   
    input  wire [3:0] col,   
    output reg  [3:0] key
);
    always @(*) begin
        key = 4'h0; 
        // R0 active (row[0]==0) and column cases:
        if (row[0] == 1'b0) begin
            if (col[0] == 1'b0) key = 4'h1; // R0C0 -> 1
            else if (col[1] == 1'b0) key = 4'h2; // R0C1 -> 2
            else if (col[2] == 1'b0) key = 4'h3; // R0C2 -> 3
            else if (col[3] == 1'b0) key = 4'hA; // R0C3 -> A
        end
        // R1 active
        else if (row[1] == 1'b0) begin
            if (col[0] == 1'b0) key = 4'h4; // R1C0 -> 4
            else if (col[1] == 1'b0) key = 4'h5; // R1C1 -> 5
            else if (col[2] == 1'b0) key = 4'h6; // R1C2 -> 6
            else if (col[3] == 1'b0) key = 4'hB; // R1C3 -> B
        end
        // R2 active
        else if (row[2] == 1'b0) begin
            if (col[0] == 1'b0) key = 4'h7; // R2C0 -> 7
            else if (col[1] == 1'b0) key = 4'h8; // R2C1 -> 8
            else if (col[2] == 1'b0) key = 4'h9; // R2C2 -> 9
            else if (col[3] == 1'b0) key = 4'hC; // R2C3 -> C
        end
        // R3 active
        else if (row[3] == 1'b0) begin
            if (col[0] == 1'b0) key = 4'hE; // R3C0 -> *
            else if (col[1] == 1'b0) key = 4'h0; // R3C1 -> 0
            else if (col[2] == 1'b0) key = 4'hF; // R3C2 -> #
            else if (col[3] == 1'b0) key = 4'hD; // R3C3 -> D
        end
        else begin
            key = 4'h0; // no row active -> no key
        end
    end 
 endmodule
