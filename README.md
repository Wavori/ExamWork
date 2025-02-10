#include <iostream>

int calculate_y(int a, int x, int b, int c) {
    int y;
    __asm {
        mov eax, x       ; eax = x
        imul eax, eax    ; eax = x^2
        imul eax, a      ; eax = ax^2
        mov ebx, x       ; ebx = x
        imul ebx, b      ; ebx = bx
        add eax, ebx     ; eax = ax^2 + bx
        add eax, c       ; eax = ax^2 + bx + c
        mov y, eax       ; y = eax
    }
    return y;
}

int main() {
    int a = 2, x = 3, b = 4, c = 5;
    std::cout << "y = " << calculate_y(a, x, b, c) << std::endl;
    return 0;
}
