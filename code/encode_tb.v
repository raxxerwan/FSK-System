module encode_tb;

	reg clk;
	reg[3:0] inputData;
	reg encode_en;
	reg rst_n;
	wire outputData;

	encode encoder(inputData, outputData, encode_en, clk, rst_n);

	always
		begin
			#5 clk <= ~clk;
		end

	initial
		begin
			clk <= 1'b0;
			inputData <= 4'b0101;
			encode_en <= 1'b0;
			rst_n <= 1'b0;
			#100
			encode_en <= 1'b1;
			rst_n <= 1'b1;
		end

endmodule

