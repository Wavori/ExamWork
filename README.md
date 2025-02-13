section .data
    purchase_amount dd 100
    paid_amount dd 150
    thank_you_msg db "Спасибо!", 10, 0
    change_msg db "Возьмите сдачу: %d", 10, 0
    insufficient_msg db "Недостаточно средств: %d", 10, 0

section .bss
    change resd 1

section .text
    global _start

_start:
    mov eax, [purchase_amount]
    mov ebx, [paid_amount]

    cmp eax, ebx
    je thank_you
    jg insufficient_funds

    ; Calculate change
    sub ebx, eax
    mov [change], ebx

    ; Вывод результата (предполагается, что используется функция printf)
    push ebx
    push change_msg
    call printf
    add esp, 8
    jmp end_program

thank_you:
    ; Вывод результата (предполагается, что используется функция printf)
    push thank_you_msg
    call printf
    add esp, 4
    jmp end_program

insufficient_funds:
    sub eax, ebx
    mov [change], eax

    ; Вывод результата (предполагается, что используется функция printf)
    push eax
    push insufficient_msg
    call printf
    add esp, 8

end_program:
    ; Завершение программы
    mov eax, 1
    xor ebx, ebx
    int 0x80
