# 基础

`hello.s`是一个适用Linux的Hello World汇编程序（macos文件夹中的`hello.s`是适用macos的版本）, 我们可以使用 `nasm -f elf64 hello.s `

> 对于macos可以使用如下命令进行操作: `nasm -f macho64 hello.s -o hello.o`, `ld`, 既可以得到可以运行的Hello World程序

## 语法

text db "Hello,World!",10  其中的 db 表示 define bytes，意味着我们要定义一些字节数据，换行符无法打出，所以输入10。text表示一个变量名称，代表这段数据加载的地址（address in memory that this data is located in）, 实际地址由 编译器决定

[text db](img/1.png)

