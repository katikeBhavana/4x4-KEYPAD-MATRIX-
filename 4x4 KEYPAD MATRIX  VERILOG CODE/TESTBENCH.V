//_____________ keypad matrix 4x4 testbench_________________
module keypad_matrix_tb();
    reg [3:0] row;   // row[3]=R3, row[2]=R2, row[1]=R1, row[0]=R0
    reg [3:0] col;   // col[3]=C3, col[2]=C2, col[1]=C1, col[0]=C0
    wire [3:0] key;
    keypad_matrix uut (
        .row(row),
        .col(col),
        .key(key)
    );
    initial begin
        $display("Note: row bits are {R3,R2,R1,R0}, col bits {C3,C2,C1,C0} (active LOW)");
        $display("Time\trow\tcol\tkey(hex)\tdescription");
        row = 4'b1111; col = 4'b1111; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "none");
        row = 4'b1101; col = 4'b1101; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "5 (R1,C1)");
                row = 4'b1110; col = 4'b1011; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "7 (R2,C0)");
        row = 4'b1011; col = 4'b0111; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "# (R3,C2)");
        row = 4'b1011; col = 4'b1011; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "9 (R2,C2)");
        row = 4'b0111; col = 4'b0111; #10;
        $display("%0dns\t%b\t%b\t%h\t%s", $time, row, col, key, "D (R3,C3)");
        $finish;
    end
endmodule
