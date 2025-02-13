section .data
    x dd -15
    a dd 2
    result_msg db "Result is: %d", 10, 0

section .bss
    y resd 1

section .text
    global _start

_start:
    mov eax, [x]
    mov ebx, [a]

    cmp eax, -10
    jl case_less_than_minus10
    cmp eax, 10
    jge case_greater_than_10
    ; case -10 <= x < 10
    imul eax, eax
    mov [y], eax
    jmp print_result

case_less_than_minus10:
    imul eax, eax
    imul eax, ebx
    mov [y], eax
    jmp print_result

case_greater_than_10:
    sub ebx, eax
    mov [y], ebx

print_result:
    ; Вывод результата (предполагается, что используется функция printf)
    push dword [y]
    push result_msg
    call printf
    add esp, 8

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
