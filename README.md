#include <iostream>

int main() {
    int n;
    std::cout << "Введите значение n: ";
    std::cin >> n;

    __asm {
        mov eax, n
        for_loop:
            cmp eax, 0
            jl end_loop
            push eax
            call print_number
            add esp, 4
            sub eax, 5
            jmp for_loop
        end_loop:
    }

    return 0;
}

void print_number(int number) {
    std::cout << number << " ";
}
