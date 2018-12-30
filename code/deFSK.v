module deFSK (deFSK_in, deFSK_out, clk, rst_n);
	input deFSK_in;
	input clk;
	input rst_n;
	output deFSK_out;

	reg [4:0] cnt_period;
	reg [4:0] c_cnt_in, n_cnt_in;
	reg c_data, p_data;
	reg c_out, n_out;

	always @(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
		begin
			cnt_period <= 5'd0;
			c_cnt_in <= 5'd0;
			c_data <= 1'd0;
			p_data <= 1'd0;
			c_out <= 1'd0;
		end
		else
		begin
			cnt_period <= (cnt_period < 5'b11111)? (cnt_period + 5'd1): 5'd0;
			c_cnt_in <= n_cnt_in;
			c_data <= deFSK_in;
			p_data <= c_data;
			c_out <= n_out;
		end
	end

	always @(c_cnt_in, c_data, p_data)
	begin
		if(p_data == 1'b0 && c_data == 1'b1)
			n_cnt_in = (cnt_period == 5'd0)? 5'd0: (c_cnt_in + 5'd1);
		else
			n_cnt_in = (cnt_period == 5'd0)? 5'd0: c_cnt_in;
	end

	always @(c_cnt_in, cnt_period, c_out)
	begin
		if(cnt_period == 5'd0)
			n_out = (c_cnt_in <= 5'd12)? 1'b1: 1'b0;
		else
			n_out = c_out;
	end

	assign deFSK_out = c_out;

endmodule