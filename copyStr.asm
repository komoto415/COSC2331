
; By Professor Sundararajan
section .data
  origStr    db    "Hello World",0xA
  origStrLen equ   $ - origStr

; uninitialized data
section .bss
  userInput resb 80
  userInputLen resd 1
  copiedStr resb origStrLen

; code section
section .text
  global _start
  _start:

 push userInput
 push dword 80
 call readStr

 dec eax
 mov dword [userInputLen], eax

  ;;; [copiedStr]=[origStr]
;;; [copiedStr+1]=[origStr+1]
;;; [copiedStr+2]=[origStr+2]

  mov eax, userInput   ;; base addr of origStr
  mov ebx, copiedStr   ;; base addr of copiesdStr
  mov ecx, dword [userInputLen]  ;; loop count
  mov esi, 0 ;; index
copyStr:
  mov dl, byte [eax +esi]
  mov byte [ebx+esi], dl
  inc esi
  loop copyStr

  push copiedStr
  push dword [userInputLen]
  call writeStr
    ; system exit
  mov eax, 1            ; sys exit number
  mov ebx, 0            ; to indicate that there is no error
  int 80h               ; call kernel

; void copyStr(addrOfOrigStr, addrOfcopiedStr, lengthOFOrigStr)


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

  ; push eax
  ; push ebx
  ; push ecx
  ; push edx

  pushad

  mov edx, [ebp + 8]
  mov ecx, [ebp + 12]
  mov eax, 4            ; sys call number sys_write =4
  mov ebx, 1            ; stdout
  int 80h     ; call kernel

  popad

  ; pop edx
  ; pop ecx
  ; pop ebx
  ; pop eax

  mov esp, ebp    ; esp = ebp
  pop ebp
  ret 8


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
    ret 8
