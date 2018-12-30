module clk_code(clk, output_clk, rst_n);

    input clk;
    input rst_n;
    output output_clk;

    reg [3:0] counter;
    reg output_clk;

    always @(posedge clk or negedge rst_n)
    begin
        if (~rst_n)
        begin
            counter <= 4'd0;
            output_clk <= 1'd0;
        end
        else 
        begin
            counter <= (counter < 4'b1111)? (counter + 4'd1): 4'd0;
            output_clk <= (counter == 4'd0)? ~output_clk: output_clk;
        end
    end
    
endmodule