#include <iostream>

int main() {
    int a, b;
    int result;

    std::cout << "Введите делимое (a): ";
    std::cin >> a;

    __asm {
        // Загружаем делимое в регистр eax
        mov eax, a

    repeat_input:
        // Ввод делителя
        std::cout << "Введите делитель (b): ";
        std::cin >> b;

        // Загружаем делитель в регистр ebx
        mov ebx, b

        // Проверяем, равен ли делитель нулю
        cmp ebx, 0
        je zero_divisor  // Если равен, переходим к метке zero_divisor

        // Выполняем деление
        cdq             // Расширяем eax до edx:eax для деления
        idiv ebx        // Делим edx:eax на ebx, результат в eax
        mov result, eax // Сохраняем результат в переменную result

        jmp end_loop    // Переходим к метке end_loop, чтобы завершить цикл

    zero_divisor:
        // Выводим сообщение об ошибке
        std::cout << "Ошибка: делитель не может быть равен нулю. Попробуйте снова." << std::endl;
        jmp repeat_input // Возвращаемся к метке repeat_input для повторного ввода

    end_loop:
    }

    std::cout << "Результат деления: " << result << std::endl;

    return 0;
}
