# 概述

在开发操作系统的时候，常常需要从汇编语言跳转到C语言的函数中执行，例如从系统引导程序（汇编语言）到系统内核主函数中，或者从中断入口程序（汇编）跳转到中断处理函数。汇编语言调用C语言的过程涉及函数的调用约定、参数的传递方式、函数的调用方式等技术细节。

## 函数的调用方式

汇编调用函数很简单，使用`JMP`,`CALL`,`RET`及其变种指令即可。以目录中的`test.c`为例，反编译这段代码编译出的程序。