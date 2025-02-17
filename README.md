#include <iostream>
#include <iomanip>

int main() {
    const int size = 10;
    int table[size][size];

    __asm {
        mov ecx, 0          ; Инициализируем счетчик строк

    row_loop:
        cmp ecx, size       ; Сравниваем с размером
        jge end_loop        ; Если ecx >= size, заканчиваем

        mov ebx, 0          ; Инициализируем счетчик столбцов

    col_loop:
        cmp ebx, size       ; Сравниваем с размером
        jge next_row        ; Если ebx >= size, переходим к следующей строке

        ; Вычисляем произведение
        mov eax, ecx        ; Копируем ecx в eax
        imul eax, ebx       ; Умножаем eax на ebx

        ; Сохраняем результат в массиве
        lea edi, table      ; Загружаем адрес массива в edi
        mov esi, ecx        ; Копируем ecx в esi
        imul esi, size      ; Умножаем esi на размер
        add esi, ebx        ; Добавляем ebx к esi
        mov [edi + esi*4], eax ; Сохраняем результат

        inc ebx             ; Увеличиваем счетчик столбцов
        jmp col_loop        ; Переходим к следующему столбцу

    next_row:
        inc ecx             ; Увеличиваем счетчик строк
        jmp row_loop        ; Переходим к следующей строке

    end_loop:
    }

    // Выводим таблицу
    std::cout << "    ";
    for (int i = 1; i <= size; ++i) {
        std::cout << std::setw(4) << i;
    }
    std::cout << std::endl;

    for (int i = 1; i <= size; ++i) {
        std::cout << std::setw(4) << i;
        for (int j = 1; j <= size; ++j) {
            std::cout << std::setw(4) << table[i-1][j-1];
        }
        std::cout << std::endl;
    }

    return 0;
}
