; by Professor Sundararajan
; change the value of eax and ebx and try it out
section .data
	yesOutput db "eax is bigger than ebx", 10
	yesOutputLen equ $ - yesOutput
	noOutput db "eax is NOT bigger than ebx", 10
	noOutputLen equ $ - noOutput

section .text
  global _start
	_start:

	mov eax, 10
	mov ebx, 5

	cmp eax, ebx
	jle noMsg

yesMsg:
	mov eax, 4
	mov ebx, 1
	mov ecx, yesOutput
	mov edx, yesOutputLen
	int 80h
  jmp exitCode

noMsg:
mov eax, 4
mov ebx, 1
mov ecx, noOutput
mov edx, noOutputLen
int 80h

exitCode:
	mov eax, 1
	mov ebx, 0
	int 80h
