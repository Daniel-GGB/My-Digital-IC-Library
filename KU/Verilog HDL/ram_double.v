/**********双口RAM****************
设计者：郭琦
说明：1、cs_n为片选信号，低有效，当cs_n为低时，存储器处于工作状态（可以读或写）；当cs_n为高时，存储器处于禁止状态（强制输出0）。
      2、we_n为写使能信号，低有效，当we_n为低时，存储器处于写状态，当we_n为高时，存储器处于读状态。
      3、ram的容量为8*8=64bit数据。
	  4、addr_r表示读地址，受clk_2控制，addr_w表示写地址，受clk_1控制。
*******************************/
module ram_double #(parameter WIDTH=8,DEPTH=8,NUMBER=3)
(clk_1,clk_2,reset_n,cs_n,we_n,addr_r,addr_w,data_in,data_out);

input wire clk_1,clk_2,reset_n,cs_n,we_n;
input wire [NUMBER-1:0] addr_r,addr_w;
input wire [WIDTH-1:0] data_in;
output reg [WIDTH-1:0] data_out;

reg [WIDTH-1:0] ram [DEPTH-1:0];    //定义了一个存储器
integer i,j;

always@(posedge clk_1,negedge reset_n)
 begin
    if(!reset_n) begin
	    data_out <= 0;
	    for(i=0;i < WIDTH;i=i+1)
	        ram[i] <= 0;		
    end
	else if(!cs_n) begin
	    if(!we_n) ram[addr_w] <= data_in;
	    else ;
	end
	else begin
        data_out <= 0;
	end
 end
 
always@(posedge clk_2,negedge reset_n)
 begin
    if(!reset_n) begin
	    data_out <= 0;
	    for(j=0;j < WIDTH;j=j+1)
	        ram[j] <= 0;		
    end
	else if(!cs_n) begin
	    if(we_n) data_out <= ram[addr_r];
	    else ;
	end
	else begin
        data_out <= 0;
	end
 end

endmodule