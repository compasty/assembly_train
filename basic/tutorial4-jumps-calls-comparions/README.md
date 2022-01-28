# 跳转与比较

## 标志位Flags

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

## 指针Pointers

指针包含指向数据的地址（不是数据本身）

|Pointer Name|Meaning|Description|
|---|---|---|
|rip(ep,ip)|Index Pointer|Point to next address to be executed|
|rsp(esp, sp)|Stack Pointer|Pointer to the top address of the stack|
|rbp(ebp, bp)|Stack Base Pointer|Pointer to the bottom of the stack|

## 跳转指令

汇编可以根据label进行跳转，一个常用的指令就是`jmp label`。我们可以写一个简单的死循环：

```asm
_start:
        jmp _start
```

另一个常用的跳转指令是 `call`, 和 `jmp`的不同在于，我们可以使用`ret`返回当初执行的位置。

```
_start:
        call _printHello

        mov rax, 60
        ...

_printHello:
        ...
        ret
```
上面的代码表示在`_start`当我们执行完`_printHello`会返回，继续`call _printHello`之后的代码。

## 比较指令

比较指令方便我们根据不同条件执行不同的代码。比较是基于寄存器完成，最常用的比较指令：`cmp register, register/value`, 例如：`cmp rax, 32`, `cmp rax, rcx`。

当执行完比较后，特定的标志位会被置位。当我们执行`cmp a,b`，如果此时 `a=b`, 标志位`ZF`就会被置位为1，反之若`a≠b`, 就会被置位为0。标志位`SF`会被置位为 `msb(a-b)`。

## 条件跳转

上面的`jmp`指令是无条件跳转，而条件跳转指令可以根据标志位的情况进行跳转。

|Jump Symbol(signed)|Jump Symbol(unsigned)|Result of cmp a,b|
|---|---|---|
|je|-|a=b|
|jne|-|a≠b|
|jg|ja|a>b|
|jge|jae|a≥b|
|jl|jb|a<b|
|jle|jbe|a≤b|
|jz|-|a=0|
|jnz|-|a≠0|
|jo|-|Overflow occured|
|jno|-|Overflow not occured|
|js|-|Jump if signed|
|jns|-|Jump if not signed|

例如: 
```
cmp rax, 23 
je _doThis
```
表示当rax等于23的时候执行 `_doThis`。

## 将寄存器看做指针

通用寄存器可以当做指针使用，语法是用中括号包裹寄存器。

当我们执行`mov rax, rbx`表示的含义是将rbx的值传给rax, 但是当我们执行`mov rax, [rbx]`则是将rbx寄存器指向的数据传给rax。