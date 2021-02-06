# My-Digital-IC-Library
我的数字IC仓库：Verilog HDL; System Vreilog; UVM; ModelSim; Quartus II;
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


## [KU_T](./KU_T)
### Verilog HDL
 - 模为任意值的BCD码计数器的测试文件  =>  count60_BCD_t.v
 - 带置0和置1位的D触发器的测试文件  =>  dff1_t.v
 - 带参数的4位加法器的测试文件  =>  fulladder4_t.v
 - 任意位数二进制码转格雷码的测试文件  =>  Binary_Gray_t.v
 - 任意位数格雷码转二进制码测试文件  =>  Gray_Binary_t.v
 
 
 
 
 
 
 # GitHub的高级搜索方式

平时在学完一个知识后，需要写些 demo来进行练手，这个时候 GitHub就是最好不过的资源库了，以下整理了一些关于在 github 上面找项目的一些小技巧。

一、单条件使用
- 项目名称

        仓库名称包含 spring 的项目

        in:name spring

- 项目描述

        仓库描述中包含 spring 的项目

        in:description spring

- readme文件

        readme 中的描述包含 spring 的项目

        in:readme spring

- star数量

        star 数量大于 1000 的项目

        starts: >1000

        star 数量在 10~20直接的项目

        stars:10..20

- fork 数量

        fork 数量大于 1000 的项目

        fork:>1000

        fork 数量在 10~20 之间的项目

- 仓库大小

        按照仓库大小进行搜索，单位：KB，仓库大于1000kB的项目

        size:>=1000

- 最近更新时间

        最近一次提交在2019年以后的仓库

        pushed:>2019-01-01 关键词

- 仓库创建时间

        2019年以后创建的仓库

        created:>2019-01-01 关键词

- license

        使用 apache-2.0 协议的仓库

        license:apache-2.0 关键词

- 仓库使用的开发语言

        用java 语言写的仓库

        language:java 关键词

- 仓库的作者

        用户google 上传的仓库

        user:google 关键词

- 组织的仓库

        列出org 的 spring-cloud 仓库

        org:spring-cloud

二、组合条件使用#
1. 搜索名字包含 spring boot ,并且 star 在 1000 以上的项目。

        in:name spring boot stars:>1000

2. 搜索描述中包含 spring boot,并且 star 在1000以上，language 为 java 的项目。

        in:description spring boot stars:>1000 language:java

3. 搜索 readme 中包含关键字【测试自动化框架】，并且 star 在 100 以上，language 是 python 的项目.

        in:readme 测试自动化框架 stars:>100 language:python

*作者： 小葛师兄*
*出处：https://www.cnblogs.com/tester-ggf/p/11897697.html*
*版权：本文采用「署名-非商业性使用-相同方式共享 4.0 国际」知识共享许可协议进行许可。*
*分类: github*
*标签: github*

 
