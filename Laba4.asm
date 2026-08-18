section .data
  prompt db 'Введи число: '
  prompt_len equ $ - prompt
  newline db 10

section .bss
  buffer resb 2

section .text
  global _start

_start:
  ; вывод приглашения
  mov eax, 4
  mov ebx, 1
  mov ecx, prompt
  mov edx, prompt_len
  int 0x80

  ; Чтение с клавиатуры
  mov eax, 3
  mov ebx, 0
  mov ecx, buffer
  mov edx, 1
  int 0x80

  ; Вывод числа
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 1
  int 0x80

  ; Вывод новой строки

  mov eax, 4
  mov ebx, 1
  mov ecx, newline
  mov edx, 1
  int 0x80

  ; Конец
  mov eax, 1
  xor ebx, ebx
  int 0x80