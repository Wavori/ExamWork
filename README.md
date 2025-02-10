#include <iostream>

void calculate_division(int dividend, int divisor, int &quotient, int &remainder) {
    __asm {
        mov eax, dividend   // Загружаем делимое в регистр EAX
        xor edx, edx       // Обнуляем EDX перед делением (это будет остаток)
        mov ebx, divisor    // Загружаем делитель в регистр EBX
        div ebx             // Делим EAX на EBX (частное в EAX, остаток в EDX)
        
        mov quotient, eax   // Сохраняем частное
        mov remainder, edx  // Сохраняем остаток
    }
}

int main() {
    int dividend = 10;
    int divisor = 3;
    int quotient = 0;
    int remainder = 0;

    calculate_division(dividend, divisor, quotient, remainder);

    std::cout << "Частное: " << quotient << ", Остаток: " << remainder << std::endl;

    return 0;
}
