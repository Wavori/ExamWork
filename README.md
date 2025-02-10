#include <iostream>

void division(int dividend, int divisor, int& quotient, int& remainder) {
    __asm {
        mov eax, dividend  ; eax = dividend
        cdq                ; расширение знака для EDX:EAX
        idiv divisor       ; eax = quotient, edx = remainder
        mov quotient, eax  ; quotient = eax
        mov remainder, edx ; remainder = edx
    }
}

int main() {
    int dividend = 10, divisor = 3, quotient, remainder;
    division(dividend, divisor, quotient, remainder);
    std::cout << "Quotient: " << quotient << ", Remainder: " << remainder << std::endl;
    return 0;
}
