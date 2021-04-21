# My-Digital-IC-Library
我的数字IC仓库：
`Verilog HDL` `System Vreilog`
`UVM`
`EDA_Linux`

数字IC设计是一项大工程，包括前端设计（算法研究、计算机体系架构等等）、前端验证、中端综合、DFT、STA以及后端APR。自己可以找个小项目，熟悉前端设计做到后端实现的整个设计流程。然后，再根据自己的喜好，选择某个方向专研。每个流程都会涉及不同的EDA tool及脚本语言的使用，希望大家等静下心来好好沉淀技术！
不过，说实话，毕业后真正从事芯片设计的一般很少，一个实验室也就20%左右！硅农不好挣钱，现在还是码农、金融、公务员的天下！

## [Books](./Books)
 - 《Verilog HDL程序设计教程_135例》_王金明.pdf  =>  书中的案例值得多学习，反复练习验证，明白其中编程原理
 - 《Verilog编码规范》_亚芯微电子有限公司.pdf

## [KU](./KU)
### Verilog HDL
 - 模为任意值的BCD码计数器  =>  count60_BCD.v
 - 带置0和置1位的D触发器  =>  dff1.v
 - 带参数的4位加法器  =>  fulladder4.v
 - 任意位数二进制码转格雷码  =>  Binary_Gray.v
 - 任意位数格雷码转二进制码  =>  Gray_Binary.v
 - 随机访问存储器  =>  ram_single.v 与 ram_double.v
 - 只读存储器  =>  rom.v
 - 边沿检测模块（通用消抖模块）  =>  edge_detection.v
 - 同步FIFO  =>  fifo_s.v


## [KU_T](./KU_T)
### Verilog HDL
 - 模为任意值的BCD码计数器的测试文件  =>  count60_BCD_t.v
 - 带置0和置1位的D触发器的测试文件  =>  dff1_t.v
 - 带参数的4位加法器的测试文件  =>  fulladder4_t.v
 - 任意位数二进制码转格雷码的测试文件  =>  Binary_Gray_t.v
 - 任意位数格雷码转二进制码测试文件  =>  Gray_Binary_t.v
 - 随机访问存储器的测试文件  =>  ram_single_t.v 与 ram_double_t.v
 - 只读存储器  =>  rom_t.v
 - 边沿检测模块（通用消抖模块）的测试文件  =>  edge_detection_t.v
 - 同步FIFO的测试文件  =>  fifo_s_t.v
 
 ## 学习网站推荐
 1. https://customizablecomputinglab.gitee.io/
 
## 其他推荐
 1. [gvim简明教程](https://www.jianshu.com/p/94ba2306f7c8)
 2. [Synopsys全套docker镜像使用指南](https://zhuanlan.zhihu.com/p/266225644)
 3. [VCS入门教程(一)](https://zhuanlan.zhihu.com/p/127335447)
 4. [【工利其器】必会工具之（一）Source Insight篇](https://www.cnblogs.com/andy-songwei/p/9965714.html)
 5. [3.Linux系统Makefile](https://www.bilibili.com/video/BV1dW411n7vk?from=search&seid=18160544971512013359)（资料推荐：[Makefile入门.zip](./Book/Makefile入门.zip)）
 6. [formality软件使用教程](https://blog.csdn.net/weixin_43755290/article/details/105097210?utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18.control&dist_request_id=&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-18.control)
 7. [自动布局布线工具Astro教程(现在的ICC)](https://wenku.baidu.com/view/a2bb3b6bcc7931b764ce1539.html)
 8. [ASIC设计学习总结(包括：工具及书籍文档推荐 、软件环境搭建、RTL设计、验证、工艺库说明、形式验证、综合等共12部分）](http://www.360doc.com/content/20/1215/18/39626951_951692940.shtml)
