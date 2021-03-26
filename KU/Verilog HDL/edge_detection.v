/***************边沿检测电路*********************
设计者：郭琦
设计时间：2021/03/23
说明：1、用到了4个D触发器，U1对信号采样，U2、U3、U4对信号分别延时一个时钟周期。
      2、通过U3和U4的输出检测上升沿，即q3&~q4。
	  3、U2去掉也并无大碍。
***************************************************/
module edge_detection(clk,data_in,data_out);

input clk;
input data_in;
output data_out;

wire q1,q2,q3,q4;

dffo U1 (clk,data_in,q1, );
dffo U2 (clk,q1,q2, );
dffo U3 (clk,q2,q3, );
dffo U4 (clk,q3,q4, );

assign data_out = q3&~q4;

endmodule


/****************D触发器************************
设计者：郭琦
设计时间：2021/03/23
特点：不带置位
***************************************************/
module dffo(clk,d,q,q_n);

input wire clk,d;
output reg q,q_n;

always@(posedge clk)
 begin
	q<=d;
    q_n<=~d;
 end

endmodule
