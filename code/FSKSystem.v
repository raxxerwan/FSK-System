module FSKSystem(inputData, outputData, clk, wr, rst_n, encode_en);

    input clk, rst_n, encode_en;
    input [3:0] inputData;
    output wr;
    output [3:0] outputData;

    wire clkCode;
    wire dataToFSK;
    wire dataToDeFSK;
    wire dataToDecoder;

    clk_code codeClk(clk, clkCode, rst_n);
    encode encoder(inputData, dataToFSK, encode_en, clkCode, rst_n);
    FSK FSKer(dataToFSK, dataToDeFSK, clk, rst_n);
    deFSK deFSKer(dataToDeFSK, dataToDecoder, clk, rst_n);
    decode decoder(dataToDecoder, outputData, wr, clkCode, rst_n);

endmodule
