section .data
    month dd 2
    days_msg db "Days in month: %d", 10, 0

section .bss
    days resd 1

section .text
    global _start

_start:
    mov eax, [month]

    cmp eax, 2
    je february
    cmp eax, 4
    je april
    cmp eax, 6
    je june
    cmp eax, 9
    je september
    cmp eax, 11
    je november

    ; Default to 31 days
    mov ebx, 31
    jmp set_days

february:
    mov ebx, 28
    jmp set_days

april:
june:
september:
november:
    mov ebx, 30

set_days:
    mov [days], ebx

    ; Вывод результата (предполагается, что используется функция printf)
    push ebx
    push days_msg
    call printf
    add esp, 8

    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
