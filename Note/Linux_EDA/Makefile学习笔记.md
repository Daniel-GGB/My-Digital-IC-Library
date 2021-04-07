## Makefile学习笔记
作者：guoqi

### 一、本文简介

本文为guoqi学习基于Linux系统的EDA工具所写，并非完整的Makefile语法参考手册，不足之处望谅解。

### 二、Makefile背景知识

Makefile是Linux系统进行工程管理的一种方法，其定义可以参考[百度百科](https://baike.baidu.com/item/Makefile/4619787?fr=aladdin)，在EDA项目开发的过程中需要不断的输入各种命令，如果只是需要开发一个小项目，那用手敲代码的方式也可以实现，但如果要对多个 `.v` 文件进行操作，而且需要不断地重复某些命令，那手敲代码的方式效率非常低下。这就引入了Make工程管理的概念，Makefile像一个脚本文件，我们可以将想要执行的指令事先编写在一个name为Makefile的文件中， 然后在Linux的Terminal中输入 `make` 或 `make -f Makefile` 即可。

### 三、Makefile编写规则

#### 1.规则1：用于生成一个或多个目标文件



    target:prerequisites       //目标项：依赖项
    <Tab>command               //必须以 <Tab> 键开头，后跟command编译命令

举例：

    all: compile clean simulate

    clean:
        rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*
    
    目标项：all
    依赖项：clean
    指  令：rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*

> 说明：Makefile中的目标可能会有很多，但一个文件只能有一个最终目标，本例中all为最终目标，compile、clean、simulate都不算是最终目标。

#### 2.规则2：使用 `.PHONY` 这一Makefile关键字定义伪目标

    .PHONY:name          //定义一个伪目标，名为name
    mame:                //这里要换行
    <Tab>command1 \      //命令前必须以 <Tab> 键开头
    <Tab>command2 \      //在结尾处通过“ 空格+转义符‘\’ ”来连接多条指令
    <Tab>command3 

举例：

    all: compile simulate      //多个目标可以“ 空格 ”分开
    compile:                   //用VCS编译rtl.lst中的文件
        vcs \
        -debug_all \
        -l com.log \
        -f rtl.lst 
    simulate:                  //用VCS仿真
        ./simv -l sim.log 
    .PHNOY: clean all
        rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*
    
    伪目标：clean compile simulate
    指 令1：(4条)
        vcs \
        -debug_all \
        -l com.log \
        -f rtl.lst	#$(RTL)
    指 令2：
        ./simv -l sim.log 
    指 令3：
        rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*

> 说明：在Makefile中可以用“ 空格+转义符‘\’ ”来连接多条指令。要想执行伪目标，可以通过“ make+伪目标名 ”来实现。如：“ make clean ”来执行删除指令。

#### 3.规则3：使用变量丰富Makefile指令

Makefile变量类似C语言中的宏定义，主要包括四种：用户自定义变量、自动变量、预定义变量、环境变量。

##### 3.1 用户自定义变量

    定义变量：
    VAR:=value              //变量名:=变量值

    使用变量：
    $(变量名)=???           //赋值
    ???=$(变量名)           //引用

举例：

    RTL:=converter.v       //定义变量RTL并初始化

    compile:               //用VCS编译converter.v
        vcs \
        -debug_all \
        -l com.log \
        -f $(RTL)          //引用变量RTL

##### 3.2 自动变量

    $@        //当前规则的目标文件
    $<        //当前规则的第一个依赖文件
    $^        //当前规则的所有依赖文件
    $?        //规则中日期新于目标文件的所有相关文件列表，逗号分隔
    $(@D)     //目标文件的目录名部分，若$@为“ add/add.v ”，则$(@D)为add
    $(@F)     //目标文件的文件名部分，若$@为“ add/add.v ”，则$(@F)为add.v

> 说明：自动表量可以在使用时自动替换变量的值。自动变量可以认为是Makefile里设定好的符号。在使用EDA软件时，很少用到自动变量。

##### 3.3 预定义变量和环境变量

    export    //查看预定义变量和环境变量的列表

举例：

    declare -x Laker_HOME="/opt/synopsys/Laker2016"
    declare -x MAIL="/var/spool/mail/crazy"
    declare -x MGC_CALIBRE_LAYOUT_SERVER="127.0.0.1:1989"
    declare -x MGC_HOME="/opt/mentor/calibre2019/aoi_cal_2019.3_25.15"
    declare -x MGC_LIB_PATH="/opt/mentor/calibre2019/aoi_cal_2019.3_25.15/lib"
    declare -x MILKWAY_HOME="/opt/synopsys/milkway_2016"
    declare -x MMSIM_HOME="/opt/cadence/SPECTRE191"
    declare -x Milkyway_HOME="/opt/synopsys/Milkyway_2016"
    declare -x NOVAS_HOME="/opt/synopsys/verdi_2015"
    declare -x OA_UNSUPPORTED_PLAT="linux_rhel50_gcc44x"

> 说明：这两者都是系统里设定好的自定义变量。我们一般不用去修改，也很少使用。

#### 4.其他规则

    %.v      //用“ % ”号模式匹配“ .v ”结尾的文件

举例：

    compile:converter.v               //用VCS编译converter.v
        vcs \
        -debug_all \
        -l com.log \
        -f %.v                        //模式匹配converter.v

> 说明：Makefile规则可分为三类：普通规则、隐含规则、模式规则。上面的三条都属于普通规则，隐含规则和模式规则主要是在编译C语言时使用，在操作Linux系统中的EDA工具时使用不到，这里也不做介绍。上面的例子为模式规则之一，适当了解即可。

### 四、其他注意事项

1. Makefile里注释使用“ # ”。
2. 命令如果不显示到终端，在命令前加“ @ ”。
3. 如果Makefile名字不为“ Makefile ”或“ makefile ”，可使用命令“ make -f filename ”来启动make。filename为任意名字。



















