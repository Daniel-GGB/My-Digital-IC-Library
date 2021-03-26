`timescale 1ns/1ns
module fifo_s_t();

parameter WIDTH=8,DEPTH=8,ADDR=4;
reg clk,reset_n,wen,ren;
reg [WIDTH-1:0] data_in;
wire full,empty;
wire [WIDTH-1:0] data_out;

fifo_s #(WIDTH,DEPTH,ADDR) U1 (clk,reset_n,wen,ren,data_in,full,empty,data_out);

always #5 clk=~clk;

initial begin
clk = 0;
reset_n = 0;
wen = 0;
ren = 0;
#18
reset_n = 1;
wen = 1;
ren = 0;
#100
wen = 0;
ren = 1;
#182
reset_n = 0;
end

initial begin
#20 data_in = 10;
#10 data_in = 5;
#10 data_in = 6;
#10 data_in = 7;
#10 data_in = 89;
#10 data_in = 125;
#10 data_in = 3;
#10 data_in = 9;
#10 data_in = 22;
#10 data_in = 23;
#10 data_in = 220;
#10 data_in = 96;
#10 data_in = 155;
#10 data_in = 53;
#10 data_in = 62;
#10 data_in = 29;
#10 data_in = 85;
#10 data_in = 44;
#10 data_in = 11;
#10 data_in = 3;
end

endmodule
