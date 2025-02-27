.386
.model flat, c
.stack 100h

.data
    str1 db "Hello", 0
    str2 db "Hello", 0
    caption db "Result", 0
    messageEqual db "Strings are equal", 0
    messageNotEqual db "Strings are not equal", 0

.code
CompareStringsProc proc
    push ebp
    mov ebp, esp

    ; Получаем адреса строк из стека
    mov esi, offset str1
    mov edi, offset str2

    ; Сравниваем строки
compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_equal
    cmp al, 0
    je equal
    inc esi
    inc edi
    jmp compare_loop

equal:
    ; Вызываем MessageBox для отображения сообщения о равенстве строк
    push MB_OK
    push offset caption
    push offset messageEqual
    push 0
    call MessageBoxA
    jmp done

not_equal:
    ; Вызываем MessageBox для отображения сообщения о неравенстве строк
    push MB_OK
    push offset caption
    push offset messageNotEqual
    push 0
    call MessageBoxA

done:
    pop ebp
    ret
CompareStringsProc endp

end

#include <windows.h>

// Объявляем внешнюю процедуру на ассемблере
extern "C" void CompareStringsProc();

int main() {
    // Вызываем процедуру на ассемблере
    CompareStringsProc();

    return 0;
}
