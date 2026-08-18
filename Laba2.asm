section .data
  num1 db 2
  num2 db 5
  msg  db 'result: '
  len equ $ - msg
  newline db 10
  
section .bss
  res resb 1
  
section .text
  global _start
  
_start:
  ;==== СЛОЖЕНИЕ ====
  mov al, [num1]
  add al, [num2]
  add al, '0'
  mov [res], al
 
  ;==== ВЫВОД "Results" ====
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80
  
  ;==== ВЫВОД ОТВЕТА ====
  mov eax, 4
  mov ebx, 1
  mov ecx, res
  mov edx, 1
  int 0x80
  
  ;==== ВЫВОД newline ====
  mov eax, 4
  mov ebx, 1
  mov ecx, newline
  mov edx, 1
  int 0x80
  
  ;==== ЗАВЕРШЕНИЕ ====
  mov eax, 1
  xor ebx, ebx
  int 0x80