`timescale 1ns/1ps
module count60_BCD_t();

reg clk,reset;
wire [7:0] out;
wire cout;

count10 C1 (clk,reset,out,cout);

initial begin
clk = 0;
#17 reset = 0;
#19 reset = 1;
#1000 reset = 0;
end

always begin
#5 clk = ~clk;
end
endmodule
