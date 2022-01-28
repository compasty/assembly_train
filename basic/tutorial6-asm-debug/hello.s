%include "env.s"

section .data
        text db "Hello, World!",10  ; db表示define bytes, 10这里表示换行符，text
section .text
        global _start
_start:
        mov rax, sys_write
        mov rdi, 1
        mov rsi, text
        mov rdx, 14
        syscall

        mov rax, sys_exit
        mov rdi, 0
        syscall