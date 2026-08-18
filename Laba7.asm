section .data
  msg db "Игра угадай число", 10
  len equ $ - msg
  
  msg1 db "Введи число: "
  len1 equ $ - msg1
  
  msg2 db "Нет, это неправильно! Меньше", 10
  len2 equ $ - msg2
  
  msg3 db "Правильно! Это число: "
  len3 equ $ - msg3
  
  msg4 db "Нет, Это неправильно! Больше", 10
  len4 equ $ - msg4

  newline db 10
  
section .bss
  buffer resb 1
  inp    resb 2
  

section .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  rdtsc

  xor edx, edx
  mov ecx, 10
  div ecx
  
  add dl, '0'
  mov [buffer], dl

.loop:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, len1
  int 0x80
   
  mov eax, 3
  mov ebx, 0
  mov ecx, inp
  mov edx, 1
  int 0x80

  inc esi
  mov al, [inp]
  cmp al, [buffer]
  je .Eqq
  jl .Big
  jg .Little

.Eqq:  
  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, len3
  int 0x80

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
 
  jmp .end

.Big:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg4
  mov edx, len4
  int 0x80
 
  jmp .loop

.Little:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 0x80
 
  jmp .loop

.end:
  mov eax, 1
  xor ebx, ebx
  int 0x80
