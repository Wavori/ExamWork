#include <iostream>

int calculate_y(int a, int x, int b) {
    int y;
    __asm {
        mov eax, a    ; eax = a
        imul eax, x   ; eax = ax
        add eax, b    ; eax = ax + b
        mov y, eax    ; y = eax
    }
    return y;
}

int main() {
    int a = 3, x = 4, b = 5;
    std::cout << "y = " << calculate_y(a, x, b) << std::endl;
    return 0;
}
