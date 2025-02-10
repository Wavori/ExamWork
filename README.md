#include <iostream>

void swap(int& a, int& b) {
    __asm {
        mov eax, a
        mov ebx, b
        mov a, ebx
        mov b, eax
    }
}

int main() {
    int a = 5, b = 10;
    swap(a, b);
    std::cout << "a = " << a << ", b = " << b << std::endl;
    return 0;
}
