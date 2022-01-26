section .text
        global _start
_start:
        
        _exit0

_add1:
        

_exit0:
        mov rax, 60          ; linux下调用sys_exit
        mov rdi, 0
        syscall
        