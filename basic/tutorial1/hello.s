section .data
        text db "Hello, World!",10  ; db表示define bytes, 10这里表示换行符，text
section .text
        global _start
_start:
        ;以下五行完成系统调用sys_write(1, text, 14)
        mov rax, 1           ; linux下调用sys_write
        mov rdi, 1
        mov rsi, text
        mov rdx, 14
        syscall

        ;以下三行完成系统调用sys_exit(0)
        mov rax, 60          ; linux下调用sys_exit
        mov rdi, 0
        syscall