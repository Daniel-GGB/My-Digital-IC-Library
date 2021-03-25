`timescale 1ns/1ns
module rom_t();

parameter WIDTH=8,DEPTH=8,NUMBER=3;

reg read;
reg [NUMBER-1:0] addr;
wire [WIDTH-1:0] data_out;

rom #(WIDTH,DEPTH,NUMBER) U1(read,addr,data_out);

initial begin
read = 0;
addr = 0;
end

initial begin
#10 read = 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
#10 addr = addr + 1;
end

endmodule




