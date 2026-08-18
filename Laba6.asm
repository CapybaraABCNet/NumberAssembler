section .data
  msg db 'случайное число: '
  len equ $ - msg
  newline db 10
 
section .bss
  buffer resb 1

section .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  rdtsc     ; Число тактов процессора

  xor edx, edx
  mov ecx, 10
  div ecx

  add dl, '0'
  mov [buffer], dl

  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 1
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, newline
  mov edx, 1
  int 0x80

  mov eax, 1
  xor ebx, ebx
  int 0x80
  
  