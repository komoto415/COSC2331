; print A to Z
; By Professor Sundararajan
section .data
  helloStr    db    65
  helloStrLen equ   $ - helloStr
  newLineChar db 10
; uninitialized data
section .bss

; code section
section .text
  global _start
  _start:
  mov esi, 26
printEachChar:
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  mov ecx, helloStr     ; address of the message to write
  mov edx, 1  ; length of the message
  int 80h               ; call kernel

  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  mov ecx, newLineChar     ; address of the message to write
  mov edx, 1  ; length of the message
  int 80h               ; call kernel

  inc byte [helloStr]
  dec esi
  jnz printEachChar

    ; system exit
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel
