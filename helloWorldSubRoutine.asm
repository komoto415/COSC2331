; A simple subroutine ; uses parameter passing using registers
; By Professor Sundararajan
section .data
  helloStr    db    "Hello World",0xA
  helloStrLen equ   $ - helloStr

; uninitialized data
section .bss

; code section
section .text
  global _start
  _start:
  mov ecx, 10

printStr:
  push ecx
  call writeStr
  pop ecx
  loop printStr

    ; system exit
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel


;--------------------

writeStr:
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  mov ecx, helloStr     ; address of the message to write
  mov edx, helloStrLen  ; length of the message
  int 80h     ; call kernel
  ret
