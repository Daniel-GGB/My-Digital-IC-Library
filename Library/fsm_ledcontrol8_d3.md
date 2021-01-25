# 8路彩灯控制程序

## 1.要求
彩灯有以下3种演示花型：
（1）8路彩灯同时亮灭
（2）从左至右逐个亮（每次只有一路亮）
（3）8路彩灯每次4路灯亮，4路灯灭，且亮灭相间，交替亮灭

## 2.程序源码
    /*************8路彩灯控制程序****************
    
    要求：彩灯有以下3种演示花型
    （1）8路彩灯同时亮灭
    （2）从左至右逐个亮（每次只有一路亮）
    （3）8路彩灯每次4路灯亮，4路灯灭，且亮灭相间，交替亮灭
    
    clk => 时钟
    reste => 复位
    c1 => 控制8路彩灯同时亮灭的开关
    c2 => 控制从左至右逐个亮的开关
    c3 => 控制8路彩灯每次4路灯亮4路灯灭的开关
    z => 控制点亮哪个灯
    1.采用顺序编码方式（常用的有四种：顺序编码、格雷编码、热码编码、约翰逊编码）
    2.采用三段式的描述方式
    
    备注：c1、c2、c3为电平触发开关，高电平有效
    ******************************************/
    
    module fsm_ledcontrol8_d3 (clk,reset,c1,c2,c3,z);
    
    input wire clk,reset,c1,c2,c3;
    output reg [7:0] z;
    
    localparam S0 = 'd0,S1 = 'd1,S2 = 'd2,S3 = 'd3,S4 = 'd4,S5 = 'd5,
               S6 = 'd6,S7 = 'd7,S8 = 'd8,S9 = 'd9,S10 = 'd10;
    			  
    			  
    wire [2:0] control;
    reg [3:0] state,next_state;
    
    assign control = {c1,c2,c3}; 
    
    always@(posedge clk,posedge reset) begin
    if(reset == 1) state <= S0;
    else state <= next_state;
    end
    
    always@(state,control) begin
    
    case(state)
    S0: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S1;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S1: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S2;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S2: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S3;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S3: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S4;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S4: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S5;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S5: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S6;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S6: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S7;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S7: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S8;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S8: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S1;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    S9: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S1;
        3'b001: next_state <= S10;
        default:  next_state <= S0;
        endcase
        end
    S10: begin case(control)
        3'b100: next_state <= S0;
        3'b010: next_state <= S1;
        3'b001: next_state <= S9;
        default:  next_state <= S0;
        endcase
        end
    endcase
    end
    
    always@(state) begin
    case(state)
    S0: z <= 8'b0000_0000;
    S1: z <= 8'b1000_0000;
    S2: z <= 8'b0100_0000;
    S3: z <= 8'b0010_0000;
    S4: z <= 8'b0001_0000;
    S5: z <= 8'b0000_1000;
    S6: z <= 8'b0000_0100;
    S7: z <= 8'b0000_0010;
    S8: z <= 8'b0000_0001;
    S9: z <= 8'b1010_1010;
    S10: z <= 8'b0101_0101;
    endcase
    end
    
    endmodule
## 3.测试文件
    `timescale 1ns/1ns
    module fsm_ledcontrol8_d3_t();
    
    reg clk,reset,c1,c2,c3;
    wire [7:0] z;
    
    fsm_ledcontrol8_d3 F1 (clk,reset,c1,c2,c3,z);
    
    initial fork
    clk = 0;
    reset = 0;
    c1=0;
    c2=0;
    c3=0;
    #10 reset = 1;
    #20 reset = 0;
    #50 c1 = 1;
    #100 c1 =0;
    #100 c2 = 1;
    #500 c2 = 0;
    #500 c3 = 1;
    #600 c3 = 0;
    join
    
    always #5 clk = ~clk;
    
    endmodule

## 4.RTL图
[8路彩灯控制程序RTL图.png]!(../Picture/FSM/8路彩灯控制程序RTL图.png)

## 5.状态转换图
[8路彩灯控制程序综合后的状态转换图.png]!(../Picture/FSM/8路彩灯控制程序综合后的状态转换图.png)




