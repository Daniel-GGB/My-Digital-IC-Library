/***********ROM的设计*********************
设计者：xygq163
说明：1、采用组合逻辑设计，（在制造时写入内容，以后只能读，不能写入）。
      2、read=1时读数据，read=0时输出高阻态，其中8'bz等同于8'bzzzzzzzz。
**************************************/
module rom #(parameter WIDTH=8,DEPTH=8,NUMBER=3)
(read,addr,data_out);

input wire read;
input wire [NUMBER-1:0] addr;
output wire [WIDTH-1:0] data_out;

wire [WIDTH-1:0] rom [DEPTH-1:0];    //定义了一个存储器（wire类型）

assign rom[0] = 1;
assign rom[1] = 2;
assign rom[2] = 3;
assign rom[3] = 4;
assign rom[4] = 5;
assign rom[5] = 6;
assign rom[6] = 7;
assign rom[7] = 8;

assign data_out = read ? rom[addr]:8'bz;

endmodule