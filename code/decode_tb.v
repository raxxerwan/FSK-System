module decode_tb;
	
	reg inputData, clk;
	reg rst_n;
	wire outputData, wrg_show;

	decode decoder(inputData, outputData, wrg_show, clk, rst_n);

	always
		begin
			#20 clk <= ~clk;
		end

	initial
		begin
			clk <= 1'b0;
			inputData <= 1'b0;
			rst_n <= 1'b0;

			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			//enable
			#40 rst_n <= 1'b1;
			#40 inputData <= 1'b0;

			//code = 1000|111 (Correct)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;

			//code = 1001|111 (Can be corrected)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;

			//code = 1010|111 (Can be corrected)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;

			//code = 0010|111 (Wrong)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;
			
			//code = 1100|111 (Can be corrected)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;

			//code = 1011|111 (Wrong, Would be corrected to 1111)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;

			#40 inputData <= 1'b0;

			//code = 0000|111 (Can be corrected)
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b0;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;
			#40 inputData <= 1'b1;



		end
endmodule



