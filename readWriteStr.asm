; My first program
; By Professor Sundararajan
section .data
  helloStr    db    "Hello World",0xA
  helloStrLen equ   $ - helloStr

; uninitialized data
section .bss
  userInputBuf resb 80
  userInputBufLen resd 1

; code section
section .text
  global _start
  _start:
  push userInputBuf
  push dword 80
  call readStr     ; call kernel

  dec eax
  mov dword [userInputBufLen], eax

  push userInputBuf     ; address of the message to write
  push dword [userInputBufLen]  ; length of the message
  call writeStr

    ; system exit
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel
;--------------------
; Signature of writeStr
; void writeStr(addrOfStr, lengthOfStr)
; first parameter to be pushed is the address of the string
; second parameter to be pushed is the length of the string
; call the subroutine
; this subroutine does not return anything
writeStr:
  push ebp   ; setup stack frame
  mov ebp, esp   ; ebp = esp

  push eax
  push ebx
  push ecx
  push edx

  mov edx, [ebp + 8]
  mov ecx, [ebp + 12]
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  int 80h     ; call kernel

  pop edx
  pop ecx
  pop ebx
  pop eax

  mov esp, ebp    ; esp = ebp
  pop ebp
  ret


;--------------------
; Signature of readStr
; int readStr(addrOfStr, lengthOfStr)
; first parameter to be pushed is the address of the buffer
; second parameter to be pushed is the length of the buffer
; call the subroutine
; this subroutine does not return anything
readStr:
    push ebp   ; setup stack frame
  mov ebp, esp   ; ebp = esp

  push ebx
  push ecx
  push edx

  mov edx, [ebp + 8]
  mov ecx, [ebp + 12]
  mov eax, 3            ; sys call number sys_write =4
  mov ebx, 2            ; stdout
  int 80h     ; call kernel

  pop edx
  pop ecx
  pop ebx

  mov esp, ebp    ; esp = ebp
  pop ebp
  ret
