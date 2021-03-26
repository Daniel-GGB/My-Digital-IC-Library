/******************************************************
参考自：https://blog.csdn.net/buzhiquxiang/article/details/103287220
设计者：郭琦
fifo类型：同步fifo
特点：1、读时钟与写时钟为同一时钟，在时钟上升沿不同时发生读写操作，读写顺序为“先写后读”；
      2、fifo在被写满后可以继续写入，从而覆盖原有数据，在写满时发出写满警告；
	  3、fifo读取完成后可继续进行读操作，在读取完成时发出读完警告，读取重头开始；
	  4、full=1表示写满，full=0表示写入，empty=1表示读取，empty=0表示读完；
BUG：1、数据0，判断为空；（未修复）
*******************************************************/

module fifo_s #(parameter WIDTH=8,DEPTH=8,ADDR=3)    //宽度为8,深度为2^7=128 
(clk,reset_n,wen,ren,data_in,full,empty,data_out);

input wire clk,reset_n;
input wire wen,ren;                    //写使能，读使能
input wire [WIDTH-1:0] data_in;
output reg full,empty;                 //满、空
output reg [WIDTH-1:0] data_out; 

reg [WIDTH-1:0] memery [DEPTH-1:0];    //内存容量为:8
reg [ADDR-1:0] waddr,raddr;            //写地址指针，读地址指针

always@(posedge clk,negedge reset_n) begin   
if(reset_n == 0) waddr = 0;
else if(wen == 1) begin
    if((data_in != 0)&&(full != 1)) begin
        memery[waddr] = data_in;                  //写寄存器
		waddr = waddr + 1;
	end
    else waddr = waddr;
end
else waddr = waddr;
end

always@(posedge clk,negedge reset_n) begin    
if(reset_n == 0) raddr = 0;
else if(ren == 1) begin
    if((memery[raddr] != 0)&&(empty != 0)) begin
      data_out = memery[raddr];                //读寄存器
		raddr = raddr + 1;
    end
    else raddr = raddr;
end
else raddr = raddr;
end

always@(posedge clk,negedge reset_n) begin    //判断是否写满
if(reset_n == 0) full = 0;
else if(waddr == DEPTH) begin
    full = 1;
    waddr = 0;
end
else full = 0;
end

always@(posedge clk,negedge reset_n) begin    //判断是否读完
if(reset_n == 0) empty = 1;
else if(raddr==DEPTH) begin
    empty = 0;
    raddr = 0;
end
else empty = 1;
end

endmodule
