## RAM与ROM

**作者：郭琦**

----------------------------------

## 1、RAM（随机访问存储器）
单口RAM：只有一套数据总线、地址总线和读写控制线，因此当多个外设需要访问同一块单口RAM 时，需要通过仲裁电路来判断。

双口RAM：具有两套完全独立的数据线、地址线和读写控制线，从而实现了大量数据的高速访问以及不同时钟域的数据交换。

### 1.1 单口RAM

说明：

1. cs_n为片选信号，低有效，当cs_n为低时，存储器处于工作状态（可以读或写）；当cs_n为高时，存储器处于禁止状态（强制输出0）。

2. we_n为写使能信号，低有效，当we_n为低时，存储器处于写状态，当we_n为高时，存储器处于读状态。

3. ram的容量为8*8=64bit数据。

设计代码：

    /**********单口RAM***************
    设计者：xygq163
    说明：1、cs_n为片选信号，低有效，当cs_n为低时，存储器处于工作状态（可以读或写）    ；当cs_n为高时，存储器处于禁止状态（强制输出0）。
          2、we_n为写使能信号，低有效，当we_n为低时，存储器处于写状态，当we_n为高    时，存储器处于读状态。
          3、ram的容量为8*8=64bit数据。
    *********************************/
    module ram_single #(parameter WIDTH=8,DEPTH=8)
    (clk,reset_n,cs_n,we_n,addr,data_in,data_out);
    
    input wire clk,reset_n,cs_n,we_n;
    input wire [2:0] addr; 
    input wire [WIDTH-1:0] data_in;
    output reg [WIDTH-1:0] data_out;
    
    reg [WIDTH-1:0] ram [DEPTH-1:0];    //定义了一个存储器
    integer i;
    
    always@(posedge clk,negedge reset_n)
     begin
        if(!reset_n) begin
    	    data_out <= 0;
    	    for(i=0;i < WIDTH;i=i+1)
    	        ram[i] <= 0;
    	end
        else if(!cs_n) begin
            if(!we_n) ram[addr] <= data_in;
            else data_out <= ram[addr];		
    	end
        else begin
    	    data_out <= 0;
    	end
     end
    
    endmodule

测试代码：

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

Multisim仿真：

![ram_single功能仿真.png](../Picture/)

### 1.2 双口RAM

说明：

1. cs_n为片选信号，低有效，当cs_n为低时，存储器处于工作状态（可以读或写）；当cs_n为高时，存储器处于禁止状态（强制输出0）。

2. we_n为写使能信号，低有效，当we_n为低时，存储器处于写状态，当we_n为高时，存储器处于读状态。

3. ram的容量为8*8=64bit数据。

4. addr_r表示读地址，受clk_2控制，addr_w表示写地址，受clk_1控制。

设计代码：

    /**********双口RAM****************
    设计者：xygq163
    说明：1、cs_n为片选信号，低有效，当cs_n为低时，存储器处于工作状态（可以读或写)；当cs_n为高时，存储器处于禁止状态（强制输出0）。
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

测试代码：

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

Multisim仿真：

![ram_double功能仿真.png](../Picture/)

## 2、ROM（只读存储器）

说明：

1. 采用组合逻辑设计，（在制造时写入内容，以后只能读，不能写入）。
2. read=1时读数据，read=0时输出高阻态，其中8'bz等同于8'bzzzzzzzz。

设计代码：

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

测试代码：

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

Multisim仿真：

![rom功能仿真.png](../Picture/)

**参考资料：**
1. [RAM/ROM存储器的设计](https://blog.csdn.net/Andy_ICer/article/details/105371780)
2. [verilog case，if语句情况不全包含会生成锁存器](https://blog.csdn.net/qq_40696831/article/details/88855164)

