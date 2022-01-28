# 四则运算指令

本部分主要学习汇编语言的四则运算。

# 标志位Flags

标志位类似寄存器，但只存储1bit数据（即为True或者False）。

|Flag Symbol|Description|
|---|---|
|CF|Carry|
|PF|Parity|
|ZF|Zero|
|SF|Sign|
|OF|Overflow|
|AF|Adjust|
|IF|Interrupt Enabled|

# 指针Pointers

指针包含指向数据的地址（不是数据本身）

|Pointer Name|Meaning|Description|
|---|---|---|
|rip(ep,ip)|Index Pointer|Point to next address to be executed|
|rsp(esp, sp)|Stack Pointer|Pointer to the top address of the stack|
|rbp(ebp, bp)|Stack Base Pointer|Pointer to the bottom of the stack|

# 调试Debug

可以使用 `gdb`进行汇编程序的调试，以 `calculate.s`为例

一些常用的命令：