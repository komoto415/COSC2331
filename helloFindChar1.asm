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
  mov esi, helloStrLen   ; helloStrLen is a constant
  mov edi, helloStr    ; helloStr is an address

findOneChar:
 cmp byte [edi], 'd' ; compare content of the address in edi with 'd'
 je printAvailable   ; if equal got to print available block

 nextChar:        ; if not, the code falls through to this section
  inc edi         ; increment the address
  dec esi         ; decrement the count of input string
  jnz findOneChar
  ; if the code comes here then it did not find the character in the entire string
  ; so go to not available segment
  jmp printNotAvailable

   printAvailable:
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  mov ecx, yesOutput     ; address of the message to write
  mov edx, yesOutputLen  ; length of the message
  int 80h               ; call kernel
  jmp exitCode       ; after printing this msg, go to exit code

printNotAvailable:
mov eax, 4            ; sys call number sys_write =4
mov ebx, 1            ; stdout
mov ecx, noOutput     ; address of the message to write
mov edx, noOutputLen  ; length of the message
int 80h               ; call kernel

    ; system exit
exitCode:
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel
