#include <iostream>

int count_divisors(int n) {
    int count = 0;
    __asm {
        mov eax, 0      // count = 0
        mov ecx, 1      // ecx = 1
        divisors_loop:
        mov edx, 0      // edx = 0
        mov ebx, n
        div ebx         // edx:eax / ebx
        test edx, edx   // проверка остатка
        jz increment_count
        jmp next_iteration
        increment_count:
        inc eax
        next_iteration:
        inc ecx
        cmp ecx, n
        jle divisors_loop
        mov count, eax
    }
    return count;
}

int main() {
    int N = 6;
    std::cout << "Количество делителей числа " << N << ": " << count_divisors(N) << std::endl;
    return 0;
}
