; 
; By Professor Sundararajan
section .data
  helloStr    db    "Hello"
  helloStrLen equ   $ - helloStr
  newLineChar db 10
  yesOutput db "d is available", 10
	yesOutputLen equ $ - yesOutput
	noOutput db "d is NOT available", 10
	noOutputLen equ $ - noOutput

; uninitialized data
section .bss

; code section
section .text
  global _start
  _start:
  ;mov esi, helloStrLen
  mov ecx, helloStrLen
  mov edi, helloStr

findOneChar:
 cmp byte [edi], 'd'
 je printAvailable

 nextChar:
  inc edi
  loop findOneChar

  jmp exitCode
  ; dec esi
  ; jnz findOneChar

   printAvailable:
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  mov ecx, yesOutput     ; address of the message to write
  mov edx, yesOutputLen  ; length of the message
  int 80h               ; call kernel

    ; system exit
exitCode:
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel
