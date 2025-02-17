#include <iostream>

int main() {
    int size;
    std::cout << "Введите размер таблицы умножения: ";
    std::cin >> size;

    __asm {
        mov ecx, 1          // Инициализируем строки (i = 1)
    outer_loop:
        cmp ecx, size       // Сравниваем i с size
        jg done              // Если i > size, завершаем цикл

        mov edx, 1          // Инициализируем столбцы (j = 1)
    inner_loop:
        cmp edx, size       // Сравниваем j с size
        jg next_row         // Если j > size, переходим к следующей строке

        // Вычисляем произведение i * j
        mov eax, ecx        // Загружаем i в eax
        imul eax, edx       // Умножаем eax на j
        push eax            // Сохраняем результат в стеке

        // Выводим результат
        std::cout << eax << "\t";
        pop eax             // Восстанавливаем eax из стека

        inc edx             // Увеличиваем j на 1
        jmp inner_loop      // Повторяем внутренний цикл

    next_row:
        std::cout << std::endl; // Переходим на новую строку
        inc ecx             // Увеличиваем i на 1
        jmp outer_loop      // Повторяем внешний цикл

    done:
    }

    return 0;
}
