module encode (data_in, data_out, encode_en, clk, rst_n);
	input [3:0] data_in;
	input clk;
	input rst_n;
	input encode_en;
	output data_out;

	reg [3:0] c_state, n_state;
	reg [3:0] c_data, n_data;
	reg data_out;

	always @(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
		begin
			c_state <= 4'd0;
			c_data <= 4'd0;
		end
		else
		begin
			c_state <= n_state;
			c_data <= n_data;
		end
	end

	always @(c_state, encode_en, c_data)
	begin
		if(c_state == 4'd0)
		begin
			n_state = (encode_en)? 4'd1:4'd0;
			n_data = data_in;
		end
		else if(c_state < 4'd10)
		begin
			n_state = c_state + 4'd1;
			n_data = c_data;
		end
		else
		begin
			n_state = 4'd0;
			n_data = 4'd0;
		end
	end

	always @(c_state, c_data)
	begin
		case(c_state)
			4'd0: data_out = 1'b0;
			4'd1: data_out = 1'b1;
			4'd2: data_out = 1'b1;
			4'd3: data_out = 1'b0;
			4'd4: data_out = c_data[3];
			4'd5: data_out = c_data[2];
			4'd6: data_out = c_data[1];
			4'd7: data_out = c_data[0];
			4'd8: data_out = c_data[3] ^ c_data[2] ^ c_data[1];
			4'd9: data_out = c_data[3] ^ c_data[2] ^ c_data[0];
			4'd10: data_out = c_data[3] ^ c_data[1] ^ c_data[0];
			default: data_out = 1'b0;
		endcase
	end

endmodule