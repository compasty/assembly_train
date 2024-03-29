# 执行

`hello.s`是一个适用Linux的Hello World汇编程序（MacOS文件夹中的`hello.s`是适用macos的版本）, 我们可以首先使用 `nasm -f elf64 hello.s -o hello.o`生成一个目标文件(object file), 目标文件本身是无法执行的，需要执行链接: `ld hello.o -o hello`来获取一个可执行文件。 

> 对于macos可以使用如下命令进行操作: `nasm -f macho64 hello.s -o hello.o`, ` ld -o hello -e _start -static hello.o`, 既可以得到可以运行的Hello World程序。

# 基础语法

1. sections

汇编程序通常由三个程序块组成, 分别是 `.data`, `.bss`和`.text`。其中 `.data`表示在编译之前定义的数据，`.bss`表示为后续使用分配的数据，比如输入缓存等，`.text`存放代码。

2. labels 标号

`labels`通常标记一段代码，如`hello.s`中的 `_start`, 在编译过程中汇编器会计算代码段实际的地址，在运行中进行替换。

3. global声明

`global`的作用是：保证链接器linker可以获取到label对应的地址，每个被`global`标识的label在目标文件中都会包含一个链接。在`hello.s`中 `_start`必须声明为`global`, 因为这是入口函数。


4. db

`db`是一条伪指令(pseudo-instructions)表示`define bytes`, 表示定义一些字节数据。由于换行符无法打出，在`hello.s`输入的是其ASCII码值10。 

`text db "Hello,World!",10`中 `text`是变量名称，代表这段数据加载的地址（address in memory that this data is located in）, 实际地址由编译器决定。

![text db](img/1.png)

5. syscall

`syscall`表示一个系统调用，不同的操作系统有不同kernel, 但每一个系统调用都有一个ID以及一系列入参，这些入参都是基于寄存器的。

[Linux系统调用](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md)

![input registers](img/2.png)
![system call list](img/3.png)

> Linux中常用的文件描述符（file descriptor）: 0对应标准输入，1对应标准输出，2对应标准错误输出。

# NASM常用符号说明

1. 符号[]

在NASM编译器中，如果直接引用变量名或者标识符，会被认为是引用改变量的地址；如果希望访问变量里的数据，则必须使用符号`[]`。

2. 符号$
符号 `$` 表示当前行被编译后的地址。

`jmp $`表示一个死循环，翻译成机器码就是`E9 FD FF`;其中E9表示`jmp`指令，`FD FF`在x86这种小端模式下表示 `0xfffd`, 即十进制数-3. 这个指令长度恰好是3，所以处理器会回到指令处开始重新执行。

3. 符号$$

符号$$表示一个Section起始处被编译后的地址，也就是这个节的起始地址。

在编写代码的时候，通常会使用代码 `$-$$`，表示本行代码距离Section起始处的编译。如果只有一个Section, 便表示本行代码距离程序起始处的距离。可以配合关键字`times`，来计算将要填充的数据长度，例如: `times 512 -($ - $$) db 0`

# 寄存器

寄存器是CPU内部用来存放数据的小型存储区域，用于暂时存放参与运算的数据和运算结果，本质上是具有存储功能的锁存器或者触发器组合构成的。从功能上划分，寄存器通常分为通用寄存器、专用寄存器和控制寄存器。

寄存器拥有非常高的读写数据，所以在寄存器之间的数据传送非常快。

x86_64中常用的通用寄存器：

| 8-bit | 16-bit | 32-bit | 64-bit |
| ----- | ------ | ------ | ------ |
| al    | ax     | eax    | rax    |
| bl    | bx     | ebx    | rbx    |
| cl    | cx     | ecx    | rcx    |
| dl    | dx     | edx    | rdx    |
| sil   | si     | esi    | rsi    |
| dil   | di     | edi    | rdi    |
| spl   | sp     | esp    | rsp    |
| r8b   | r8w    | r8d    | r8     |
| r9b   | r9w    | r9d    | r9     |
| r10b  | r10w   | r10d   | r10    |
| r11b  | r11w   | r11d   | r11    |
| r12b  | r12w   | r12d   | r12    |
| r13b  | r13w   | r13d   | r13    |
| r14b  | r14w   | r14d   | r14    |
| r15b  | r15w   | r15d   | r15    |

> 当 `rax`的值为 FEDCBA9876543210H的时候，`eax`则为76543210H，`ax`的值为为3210H，`al`的值为10H。

# 代码解析

`hello.s`首先我们定义了 `text`这个变量存放字符串 `Hello,World!\n`, 然后在 `_start`函数中我们首先将 `rax`寄存器（如果是32位的汇编程序）置为1，对应`sys_write`命令，然后分别给寄存器 `rdi`, `rsi`, `rdx`传值即传入`sys_write`命令的参数，`rdi`传值1表示标准输出，`rsi`传入`text`对应`Hello, World!\n`字符串的首地址，`rdx`传值14表示字符串的长度，然后执行系统调用完成终端上的字符串打印。

![sys_write](img/4.png)

紧接着我们对`rax`赋值60，`rdi`赋值0, 完成系统调用`sys_exit 0`。