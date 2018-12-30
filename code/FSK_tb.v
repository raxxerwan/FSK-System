module FSK_tb;
	
	reg inputData, clk, rst_n;
	wire outputData;

	FSK FSKer(inputData, outputData, clk, rst_n);

	always
		begin
			#5 clk <= ~clk;
		end

	initial
		begin
			clk <= 1'b0;
			rst_n <= 1'b0;
			inputData <= 1'b0;

			#320 inputData <= 1'b1;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;

			#320 rst_n <= 1'b1;

			#320 inputData <= 1'b1;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b0;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;
			#320 inputData <= 1'b1;
		end
endmodule

