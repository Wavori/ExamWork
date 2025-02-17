#include <iostream>

int factorial(int n) {
    int result = 1;
    if (n < 0) {
        std::cout << "Факториал не существует" << std::endl;
        return -1; // Ошибка: факториал не существует
    }
    __asm {
        mov eax, 1      // result = 1
        mov ecx, n      // ecx = n
        fact_loop:
        imul eax, ecx   // result *= i
        loop fact_loop
        mov result, eax
    }
    return result;
}

int main() {
    int N = 5;
    int result = factorial(N);
    if (result != -1) {
        std::cout << "Факториал числа " << N << ": " << result << std::endl;
    }
    return 0;
}
