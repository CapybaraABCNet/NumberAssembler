section .data
  num  db 3
  msg  db 'Равно три', 10
  len equ $ - msg
  msg1 db 'Больше трёх', 10
  len1 equ $ - msg1
  msg2 db 'Меньше трёх', 10
  len2 equ $ - msg2

section .text
  global _start

_start:
  mov al, [num]
  cmp al, 8
  jg little
  jl big
  je equa
  
equa:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80
  jmp end

big:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, len1
  int 0x80
  jmp end

little:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 0x80
  jmp end

end:
  mov eax, 1
  xor ebx, ebx
  int 0x80