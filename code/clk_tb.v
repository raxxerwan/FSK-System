module clk_tb;

    reg clk, rst_n;
    wire clk_output;

    clk_code codeClk(clk, clk_output, rst_n);

    always
        begin
            #5 clk <= ~clk;
        end

    initial
		begin
			clk <= 1'b0;
			rst_n <= 1'b0;

			#40 rst_n <= 1'b1;

		end
        
endmodule