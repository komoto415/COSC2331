section .data
  ;buf1 db 7
  ;buf2 dw 3
  ;buf3 dd 5

section .text
global _start
_start:
; divide 155/10 using div command
b1:
; when using 8bit divisor
mov ax, 155
mov bl, 10
div bl

; when using 16 bit divisor
; mov dx, 0x0
; mov ax, 57
; mov bx, 5
; div bx

;; when using 32 bit divisor
; sub edx, edx
; mov eax, 57
; mov ebx, 5
; div ebx

;; when using a memory operand as divisor
; sub edx, edx
; mov eax, 57
;div dword [buf3]

mov eax, 1
mov ebx, 0
int 80h
