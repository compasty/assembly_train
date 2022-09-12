# 调用C语言函数

首先我们写一个简单的C程序，即目录中的`test.c`, 然后使用 `gcc test.c -o test.o` 生成目标文件。此时，我们可以使用`objdump`命令将目标程序反编译成汇编语言：`objdump -d test.o`，可以得到其中的核心汇编代码段：

```asm
0000000000001129 <test>:
    1129:       f3 0f 1e fa             endbr64 
    112d:       55                      push   %rbp
    112e:       48 89 e5                mov    %rsp,%rbp
    1131:       c7 45 fc 00 00 00 00    movl   $0x0,-0x4(%rbp)
    1138:       83 45 fc 02             addl   $0x2,-0x4(%rbp)
    113c:       8b 45 fc                mov    -0x4(%rbp),%eax
    113f:       5d                      pop    %rbp
    1140:       c3                      retq   

0000000000001141 <main>:
    1141:       f3 0f 1e fa             endbr64 
    1145:       55                      push   %rbp
    1146:       48 89 e5                mov    %rsp,%rbp
    1149:       b8 00 00 00 00          mov    $0x0,%eax
    114e:       e8 d6 ff ff ff          callq  1129 <test>
    1153:       b8 00 00 00 00          mov    $0x0,%eax
    1158:       5d                      pop    %rbp
    1159:       c3                      retq   
    115a:       66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
```

其中 `0000000000001141` 对应程序的主函数`main`的其实地址。