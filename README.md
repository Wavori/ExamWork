#include <iostream>

int count_divisors(int n) {
    int count = 0;
    __asm {
        mov eax, 1      // eax = 1 (начальное значение для делителя)
        mov ecx, n      // ecx = n (число, для которого ищем делители)
        mov edx, 0      // edx = 0 (используется для хранения остатка)

        count_loop:
        mov ebx, ecx    // ebx = n
        div ebx         // делим ecx на eax, остаток в edx
        cmp edx, 0      // сравниваем остаток с 0
        je increment    // если остаток 0, переходим к метке increment
        jmp next_iter   // иначе переходим к следующей итерации

        increment:
        inc count        // увеличиваем счетчик делителей

        next_iter:
        inc eax          // увеличиваем делитель
        cmp eax, ecx     // сравниваем делитель с числом n
        jle count_loop   // если делитель <= n, продолжаем цикл
    }
    return count;
}

int main() {
    int N = 6;
    std::cout << "Количество делителей числа " << N << ": " << count_divisors(N) << std::endl;
    return 0;
}
