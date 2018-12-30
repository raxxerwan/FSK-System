module FSKSystem_tb;

    reg clk, rst_n, encoder_en;
    reg [3:0] inputData;
    wire wr;
    wire [3:0] outputData;

    FSKSystem FSKSystemTest(inputData, outputData, clk, wr, rst_n, encoder_en);

    always
        begin
          #5 clk <= ~clk;
        end

    initial begin
        clk <= 1'b0;
        inputData <= 4'b1001; 
        rst_n <= 1'b0;
        encoder_en <= 1'b0;

        #20 rst_n <= 1'b1;
        #20 encoder_en <= 1'b1;
    end
    
endmodule