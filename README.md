#include <iostream>

int main() {
    double a = 2.0; // коэффициент a
    double b = 3.0; // коэффициент b
    double x = 5.0; // значение x
    double y;       // результат

    // Используем ассемблерную вставку для вычисления y = ax + b
    asm (
        fldl a      // Загружаем a в вершину стека FPU
        fmul x      // Умножаем a на x
        fadd b      // Добавляем b
        fstpl y     // Сохраняем результат в y
        : "=m" (y)  // Выходные операнды
        : "m" (a), "m" (x), "m" (b) // Входные операнды
    );

    std::cout << "y = " << y << std::endl;
    return 0;
}
