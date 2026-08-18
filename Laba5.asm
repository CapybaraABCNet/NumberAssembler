section .data
    msg db 'Цикл: '
    len equ $ - msg
    space db ' '
    newline db 10

section .bss
    num resb 1

section .text
    global _start                  

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov esi, '0'          

.loop:
    cmp esi, '9'
    jg .end

    mov [num], esi

    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80                    

    inc esi
    jmp .loop

.end:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80