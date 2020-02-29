section .data
    buf1 db 0x10
    buf2 dw 0x1000
    buf3 dd 0x10000000

section .text
global _start
_start:

b1:
    ; when the mulplicant and multiplier both are 8 bit value
    ; mov al, 0x11
    ; mov bl, 0x10
    ; mul bl


    ;; when the mulplicant and multiplier both are 16 bit value
    ; mov ax, 0x1111
    ; mov bx, 0x1000
    ; mul bx

    ; multiply 3 and 5
    mov edx, 0x123A
    ; when the mulplicant and multiplier both are 32 bit value
    mov eax, 0x101
    mov ebx, 0x11
    mul ebx

    ; when the second argument is of size 32 bit in memory
     mov eax, 0x22222222
     mul dword [buf3]


    mov eax, 1
    mov ebx, 0
    int 80h
