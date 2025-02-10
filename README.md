#include <iostream>

void divide(int dividend, int divisor, int& quotient, int& remainder) {
    __asm {
        mov eax, dividend   ; eax = dividend
        cdq                 ; Sign-extend eax into edx:eax (edx contains the sign extension)
        mov ebx, divisor    ; ebx = divisor
        idiv ebx            ; Divide edx:eax by ebx. Quotient goes into eax, remainder into edx.
        mov quotient, eax   ; quotient = eax
        mov remainder, edx   ; remainder = edx
    }
}

int main() {
    int dividend = 10, divisor = 3;
    int quotient, remainder;

    divide(dividend, divisor, quotient, remainder);

    std::cout << "Quotient: " << quotient << std::endl;
    std::cout << "Remainder: " << remainder << std::endl;

    return 0;
}
