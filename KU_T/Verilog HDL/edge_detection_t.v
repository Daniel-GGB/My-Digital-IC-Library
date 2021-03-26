`timescale 1ns/1ns
module edge_detection_t();

reg data_in,clk;
wire data_out;

edge_detection E1 (clk,data_in,data_out);

always #10 clk=~clk;

initial begin
clk=0;
data_in=0;
end

initial begin
#12 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#50 data_in = 0;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
#1 data_in = 1;
#1 data_in = 0;
end
endmodule