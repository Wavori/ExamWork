#include <iostream>

int main() {
    const int size = 10;
    int table[size][size];

    __asm {
        mov ecx, size       ; Устанавливаем счетчик цикла для строк
        mov ebx, 0          ; Устанавливаем индекс строки

    row_loop:
        mov edi, size       ; Устанавливаем счетчик цикла для столбцов
        mov esi, 0          ; Устанавливаем индекс столбца

    col_loop:
        mov eax, ebx        ; Загружаем индекс строки в eax
        imul eax, esi      ; Умножаем eax на индекс столбца
        mov table[ebx * size * 4 + esi * 4], eax ; Сохраняем результат в таблицу
        inc esi             ; Увеличиваем индекс столбца
        dec edi             ; Уменьшаем счетчик цикла для столбцов
        jnz col_loop        ; Если edi не равен 0, переходим к col_loop

        inc ebx             ; Увеличиваем индекс строки
        dec ecx             ; Уменьшаем счетчик цикла для строк
        jnz row_loop        ; Если ecx не равен 0, переходим к row_loop
    }

    // Вывод таблицы умножения
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j) {
            std::cout << table[i][j] << "\t";
        }
        std::cout << std::endl;
    }

    return 0;
}
