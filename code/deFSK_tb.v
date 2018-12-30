module deFSK_tb;

    reg inputSignal, clk, rst_n;
    wire outputData;

    deFSK deFSKer(inputSignal, outputData, clk, rst_n);

    always
        begin
            #5 clk <= ~clk;
        end
    
    initial
        begin
            clk <= 1'b0;
            inputSignal <= 1'b0;
            rst_n <= 1'b0;

            //rst_n test
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;

            rst_n <= 1'b1;
            //code = 1
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;

            //code = 0
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;

            //code = 1
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;


            //code = 0 (add noise)
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #3  inputSignal <= 1'b1;
            #4  inputSignal <= 1'b0;
            #3  inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #3  inputSignal <= 1'b1;
            #4  inputSignal <= 1'b0;
            #3  inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;
            #10 inputSignal <= 1'b1;
            #10 inputSignal <= 1'b0;

            //code = 1 (add noise)
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #5  inputSignal <= 1'b1;
            #3  inputSignal <= 1'b0;
            #12 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #5  inputSignal <= 1'b1;
            #3  inputSignal <= 1'b0;
            #12 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;
            #20 inputSignal <= 1'b1;
            #20 inputSignal <= 1'b0;


        end
endmodule
