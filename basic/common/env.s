%ifdef MACOS
        %define sys_read 0x2000003
        %define sys_write 0x2000004
        %define sys_exit 0x2000001
%elifdef
        %define sys_read 0
        %define sys_write 1
        %define sys_exit 60
%endif