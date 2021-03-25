`timescale 1ns/1ns
module ram_single_t();

parameter WIDTH=8,DEPTH=8;

reg clk,reset_n,cs_n,we_n;
reg [2:0] addr;
reg [WIDTH-1:0] data_in;
wire [WIDTH-1:0] data_out;

ram_single #(WIDTH,DEPTH) U1(clk,reset_n,cs_n,we_n,addr,data_in,data_out);

always #5 clk=~clk;

initial begin
clk = 0;
reset_n = 0;
cs_n = 0;
we_n = 0;
addr = 0;
data_in = 0;
end

initial begin
#10 reset_n = 1;
#10 data_in = 5;
addr = addr + 1;
#10 data_in = 12;
addr = addr + 1;
#10 data_in = 36;
addr = addr + 1;
#30 we_n = 1;
#10 addr = addr - 1;
#10 addr = addr - 1;
#10 addr = addr - 1;
#20 cs_n = 1;
end

endmodule
