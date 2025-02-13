section .data
    num1 dd 5
    num2 dd 10
    num3 dd 3
    max_msg db "Maximum is: %d", 10, 0

section .bss
    max resd 1

section .text
    global _start

_start:
    mov eax, [num1]
    mov ebx, [num2]
    mov ecx, [num3]

    cmp eax, ebx
    jge check_num3_1
    mov eax, ebx
check_num3_1:
    cmp eax, ecx
    jge set_max
    mov eax, ecx
set_max:
    mov [max], eax

    ; Вывод результата (предполагается, что используется функция printf)
    push eax
    push max_msg
    call printf
    add esp, 8

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
