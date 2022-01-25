section .data
        text db "Hello, World!",10  ; db表示define bytes, 10这里表示换行符，text
section .text
        global _start
_start:
        mov rax, 1           ; linux下调用sys_write
        ;mov rax, 0x2000004    ; macOS 下调用号需要 0×2000000 + unix syscall #
        mov rdi, 1
        mov rsi, text
        mov rdx, 14
        syscall

        mov rax, 60          ; linux下调用sys_exit
        ;mov rax, 0x2000001    ; macs 调用syscall, SYS_exit
        mov rdi, 0
        syscall