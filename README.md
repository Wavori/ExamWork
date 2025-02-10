#include <iostream>

// Функция для вычисления y(x) = ax + b с использованием ассемблерной вставки
int compute_y(int a, int x, int b) {
    int y;
    // Ассемблерная вставка для вычисления y = ax + b
    __asm__(
        "movl %1, %%eax;\n\t"  // Перемещаем значение a в регистр eax
        "movl %2, %%ebx;\n\t"  // Перемещаем значение x в регистр ebx
        "imull %%ebx, %%eax;\n\t"  // Умножаем eax (a) на ebx (x), результат в eax
        "addl %3, %%eax;\n\t"    // Добавляем b к результату в eax
        "movl %%eax, %0;\n\t"    // Перемещаем результат из eax в y
        : "=r" (y)               // Выходной операнд
        : "r" (a), "r" (x), "r" (b) // Входные операнды
        : "%eax", "%ebx"         // Используемые регистры
    );
    return y;
}

int main() {
    int a = 3;
    int x = 4;
    int b = 2;

    int result = compute_y(a, x, b);
    std::cout << "y(" << x << ") = " << result << std::endl;

    return 0;
}
