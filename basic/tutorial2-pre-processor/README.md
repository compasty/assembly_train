# 预处理

nasm类似C语言支持预处理，在上一节中我们发现在Linux和MacOS中系统调用指令对应的值是不同的，如果编写两个版本是很麻烦的，此时就可以借助nasm提供的预处理能力。

## 宏定义

类似C语言，nasm使用`%define`进行宏定义。

```
%define sys_write 1
%define a(a1, a2)  a1*a2
```



## 条件编译



## 包含其他文件

可以使用`%include`包含其他汇编文件， 默认搜索路径为当前文件。类似C语言我们可以使用`-I`来扩展include path。对于本例中的文件我们可以在MacOS上类似如下进行编译：`nasm -f macho64 -I../common -DMACOS -o hello.o hello.s`。