; by Professor Sundararajan
; get two numbers from user
; add them and print it in std out
; by Professor Sundararajan

section .data
   msg db "The sum is:"
   len equ $ - msg
   newLineChar db 10
segment .bss
   sum resb 1
   buf1 resb 2
   buf2 resb 2

section	.text
   global _start    ;must be declared for using gcc

_start:             ;tell linker entry point
   mov	ecx, buf1
   mov	edx, 2
   mov	ebx,2	;file descriptor (stdout)
   mov	eax,3	;system call number (sys_write)
   int	0x80	;call kernel


   mov	ecx, buf2
   mov	edx, 2
   mov	ebx,2	;file descriptor (stdout)
   mov	eax,3	;system call number (sys_write)
   int	0x80	;call kerne

   mov al, [buf1]
   mov bl, [buf2]
   sub al, '0'   ; convert from ascii repr of int to actual int value
   sub bl, '0'   ; convert from ascii repr of int to actual int value
   add al, bl
   add al, '0'   ; convert from int value to its ascii repr so that we can print it
   mov byte [sum], al


   ; print the msg
   mov	ecx,msg
   mov	edx, len
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   ; print the output
   mov	ecx,sum
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   ; print the new line char
   mov	ecx, newLineChar
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel


   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
