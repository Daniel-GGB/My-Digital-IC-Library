`timescale 1ns/1ns
module ram_double_t();

parameter WIDTH=8,DEPTH=8,NUMBER=3;

reg clk_1,clk_2,reset_n,cs_n,we_n;
reg [NUMBER-1:0] addr_r,addr_w;
reg [WIDTH-1:0] data_in;
wire [WIDTH-1:0] data_out;

ram_double #(WIDTH,DEPTH,NUMBER) U1(clk_1,clk_2,reset_n,cs_n,we_n,addr_r,addr_w,data_in,data_out);

always #5 clk_1=~clk_1;
always #10 clk_2=~clk_2;

initial begin
clk_1 = 0;
clk_2 = 0;
reset_n = 0;
cs_n = 0;
we_n = 0;
data_in = 0;
addr_r = 0;
addr_w = 0;
end

initial begin
#10 reset_n = 1;
#10 data_in = 5;
#1 addr_w = addr_w + 1;
#10 data_in = 12;
#1 addr_w = addr_w + 1;
#10 data_in = 36;
#1 addr_w = addr_w + 1;
#30 we_n = 1;
#10 addr_r = addr_r + 1;
#10 addr_r = addr_r + 1;
#10 addr_r = addr_r + 1;
#20 cs_n = 1;
end

endmodule

