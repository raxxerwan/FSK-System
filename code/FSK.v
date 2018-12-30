module FSK (FSK_in, FSK_out, clk, rst_n);
	input FSK_in;
	input clk;
	input rst_n;
	output FSK_out;

	reg [1:0] cnt;
	reg clk_0, clk_1;

	always @(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 2'd0;
		else
			cnt <= (cnt < 2'd3)? (cnt + 2'd1): 2'd0;
	end

	always @(cnt)
	begin
		case(cnt)
			2'd0: begin clk_0 = 1; clk_1 = 1; end 
			2'd1: begin clk_0 = 0; clk_1 = 1; end
			2'd2: begin clk_0 = 1; clk_1 = 0; end
			2'd3: begin clk_0 = 0; clk_1 = 0; end
		endcase
	end

	assign FSK_out = (~FSK_in)? clk_0: clk_1;
	

endmodule