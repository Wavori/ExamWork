#include <iostream>

void divide(int dividend, int divisor, int &quotient, int &remainder) {
    __asm {
        mov eax, dividend   ; Загружаем делимое в EAX
        cdq                 ; Расширяем знак EAX в EDX (если делимое отрицательное)
        idiv divisor        ; Выполняем деление: EAX = quotient, EDX = remainder
        mov quotient, eax   ; Сохраняем частное
        mov remainder, edx  ; Сохраняем остаток
    }
}

int main() {
    int dividend = 17, divisor = 5;
    int quotient, remainder;

    divide(dividend, divisor, quotient, remainder);

    std::cout << "Частное: " << quotient << std::endl;
    std::cout << "Остаток: " << remainder << std::endl;

    return 0;
}
