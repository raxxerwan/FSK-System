module decode (data_in, data_out, wrg_show, clk, rst_n);
	input data_in;
	input clk;
	input rst_n;
	output [3:0] data_out;
	output wrg_show;

	reg [3:0] c_state, n_state;
	reg [6:0] c_data, n_data;
	reg [4:0] data_check;
	reg [4:0] crt_data;

	wire [2:0] hamming_check;

	always @(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
		begin
			c_state <= 4'd0;
			c_data <= 7'd0;
			data_check <= 5'd0;
		end
		else
		begin
			c_state <= n_state;
			c_data <= n_data;
			data_check <= (c_state == 4'd10)? crt_data: data_check;
		end
	end

	always @(c_state, data_in)
	begin
		case(c_state)
			4'd0: n_state = (data_in == 1'd1)? 4'd1: 4'd0;
			4'd1: n_state = (data_in == 1'd1)? 4'd2: 4'd0;
			4'd2: n_state = (data_in == 1'd0)? 4'd3: 4'd0;
			default: n_state = (c_state < 4'd10)? (c_state + 4'd1): 4'd0;
		endcase
	end

	always @(c_state, c_data, data_in)
	begin
		if(c_state < 4'd3)
			n_data = 4'd0;
		else if(c_state < 4'd10)
			n_data = {c_data[5:0], data_in};
		else
			n_data = c_data;
	end

	assign hamming_check[2] = c_data[6] ^ c_data[5] ^ c_data[4] ^ c_data[2];
	assign hamming_check[1] = c_data[6] ^ c_data[5] ^ c_data[3] ^ c_data[1];
	assign hamming_check[0] = c_data[6] ^ c_data[4] ^ c_data[3] ^ c_data[0];

	always @(hamming_check, c_data)
	begin
		if(hamming_check == 3'b000)
			crt_data = {c_data[6:3], 1'b0};
		else if(hamming_check == 3'b111)
			crt_data = {~c_data[6], c_data[5:3], 1'b0};
		else if(hamming_check == 3'b110)
			crt_data = {c_data[6], ~c_data[5], c_data[4:3], 1'b0};
		else if(hamming_check == 3'b101)
			crt_data = {c_data[6:5], ~c_data[4], c_data[3], 1'b0};
		else if(hamming_check == 3'b011)
			crt_data = {c_data[6:4], ~c_data[3], 1'b0};
		else
			crt_data = {c_data[6:3], 1'b1};
	end

	assign data_out = data_check[4:1];

	assign wrg_show = data_check[0];

endmodule