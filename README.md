section .data
    num1 dd 5
    num2 dd 10
    min_msg db "Minimum is: %d", 10, 0

section .bss
    min resd 1

section .text
    global _start

_start:
    mov eax, [num1]
    mov ebx, [num2]
    cmp eax, ebx
    jle set_min_num1
    mov eax, ebx
set_min_num1:
    mov [min], eax

    ; Вывод результата (предполагается, что используется функция printf)
    push eax
    push min_msg
    call printf
    add esp, 8

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
