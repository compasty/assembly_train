%include "env.s"

section .text
        global _start
_start:
        
        _exit0



; 打印0-9的数字
_printDigit:


_exit0:
        mov rax, sys_exit
        mov rdi, 0
        syscall
        