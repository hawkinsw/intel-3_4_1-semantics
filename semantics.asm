        global _start
        section .data
        section .text
_start: mov rdx, 0xffffffffffffffff ; put full data in rdx for observability.
        mov al, 0x0    ; Set up a byte register with 0.
        mov bl, 0x1    ; Set up a byte register with 1.
        mov dl, al     ; These are 8-bit operands. In other words, they
                       ; generate an 8-bit result. According to 3.4.2 Bullet 3,
                       ; the "upper 56 bits ... of the destination general-
                       ; purpose register are not modified by this operation."
                       ; As a result, rdx should be 0xffffffffffffff00
        mov edx, 0xe   ; These are 32-bit operands. In other words, they
				               ; generate a "32-bit result, zero-extended to a 64-bit
											 ; result in the destination general-purpose register."
											 ; As a result, rdx should be 0x000000000000000e
        mov rax, 60    ; 60 is the system call for exit
        xor rdi, rdi   ; set the return value of the process to 0.
        syscall        ; now, tell the OS that we actually want to do a syscall.
