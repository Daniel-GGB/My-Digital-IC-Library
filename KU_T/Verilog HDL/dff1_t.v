`timescale 1ns/1ps
module dff1_t ();

reg d,clk,reset,set;
wire q,qn;

dff1 D1 (d,clk,reset,set,q,qn);

initial begin
clk = 0;
#13 d=1;
#25 d=0;
#17 d=1;
end

initial begin
#5 reset = 0; set = 0;
#15 reset = 1;
#50 set = 1;
end

always begin
#5 clk = ~clk;
end
endmodule
