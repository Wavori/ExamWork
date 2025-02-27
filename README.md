.386
.model flat, stdcall
.stack 4096

option casemap :none

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib

.data
    str1 db 256 dup(?)
    str2 db 256 dup(?)
    result db 256 dup(?)

.code
CompareStrings proc
    ; Входные параметры: адреса строк в памяти
    ; Выходные параметры: результат сравнения в EAX (0 - строки равны, 1 - строки не равны)

    mov esi, offset str1
    mov edi, offset str2

    ; Сравниваем строки посимвольно
compare_loop:
    lodsb           ; Загружаем символ из str1 в AL
    scasb           ; Сравниваем с символом из str2
    jne not_equal   ; Если символы не равны, переходим к not_equal
    test al, al     ; Проверяем, достигли ли конца строки
    jnz compare_loop ; Если нет, продолжаем сравнение

    ; Строки равны
    mov eax, 0
    jmp done

not_equal:
    ; Строки не равны
    mov eax, 1

done:
    ret
CompareStrings endp

end

#include <windows.h>

extern "C" int CompareStrings();

int main() {
    // Заполняем строки для сравнения
    char str1[] = "Hello, World!";
    char str2[] = "Hello, World!";

    // Копируем строки в общую область памяти
    memcpy((void*)0x00404000, str1, sizeof(str1));
    memcpy((void*)0x00404010, str2, sizeof(str2));

    // Вызываем ассемблерную процедуру
    int result = CompareStrings();

    // Отображаем результат сравнения
    if (result == 0) {
        MessageBox(NULL, "Строки равны", "Результат", MB_OK);
    } else {
        MessageBox(NULL, "Строки не равны", "Результат", MB_OK);
    }

    return 0;
}
