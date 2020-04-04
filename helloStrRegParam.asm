; My first program
; By Professor Sundararajan
section .data
  helloStr    db    "Hello World",0xA
  helloStrLen equ   $ - helloStr
  helloStr1   db    "What a cool subject!!!",0xA
  helloStrLen1 equ   $ - helloStr1
; uninitialized data
section .bss
; code section
section .text
  global _start
  _start:

printStr:
  mov ecx, helloStr     ; address of the message to write
  mov edx, helloStrLen  ; length of the message
  call writeStr

  mov ecx, helloStr1     ; address of the message to write
  mov edx, helloStrLen1  ; length of the message
  call writeStr

    ; system exit
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel

;--------------------

writeStr:
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  int 80h     ; call kernel
  ret
