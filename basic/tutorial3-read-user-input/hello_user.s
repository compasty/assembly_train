%include "env.s"

section .data
        intro db "What is your name?"
        answer1 db "Hello, "
        answer2 db "!",10

section .bss
        name resb 32  ; 保存用户输入的名称

section .text
        global _start

_start:
        call _printIntro
        call _readName
        call _printHello1
        call _printHello2
        jmp _exit0

_printIntro:
        mov rax, sys_write
        mov rdi, 1
        mov rsi, intro
        mov rdx, 18
        syscall
        ret

_readName:
        mov rax, sys_read
        mov rdi, 0
        mov rsi, name
        mov rdx, 32
        syscall

_printHello1:
        mov rax, sys_write
        mov rdi, 1
        mov rsi, answer1
        mov rdx, 7
        syscall
        ret

_printHello2:
        mov rax, sys_write
        mov rdi, 1
        mov rsi, name
        mov rdx, 16
        ret

;sys_exit(0)
_exit0:
        mov rax, sys_exit       
        mov rdi, 0
        syscall