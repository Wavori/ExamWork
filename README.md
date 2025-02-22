#include <iostream>

int main() {
    double a, b;
    std::cout << "Введите делимое (a): ";
    std::cin >> a;

    std::cout << "Введите делитель (b): ";
    while (true) {
        std::cin >> b;
        if (b != 0) {
            break;
        }
        std::cout << "Ошибка: делитель не может быть равен нулю. Пожалуйста, введите делитель снова: ";
    }

    double result;

    // Ассемблерная вставка для выполнения деления
    __asm {
        fld a       ; Загружаем делимое в стек FPU
        fld b       ; Загружаем делитель в стек FPU
        fdiv        ; Делим делимое на делитель
        fstp result ; Сохраняем результат в переменную result
    }

    std::cout << "Результат деления: " << result << std::endl;
    return 0;
}
