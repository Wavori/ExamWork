#include <iostream>

int main() {
    int a, b;
    double result;

    std::cout << "Введите делимое (a): ";
    std::cin >> a;

    std::cout << "Введите делитель (b): ";

    __asm {
        // Цикл с предусловием для проверки корректности ввода делителя
    check_divisor:
        std::cin >> b;
        cmp b, 0
        je check_divisor  // Если b == 0, повторить ввод

        // Выполнение деления
        mov eax, a
        cdq             // Расширение знака eax в edx:eax
        idiv b          // Деление eax на b, результат в eax

        // Сохранение результата
        mov result, eax
    }

    std::cout << "Результат деления: " << result << std::endl;

    return 0;
}
