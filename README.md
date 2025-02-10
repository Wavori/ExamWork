#include <iostream>

void swap(int &a, int &b) {
    __asm {
        mov eax, a   ; Загружаем a в EAX
        mov ebx, b   ; Загружаем b в EBX
        mov a, ebx   ; Записываем значение b в a
        mov b, eax   ; Записываем значение a в b
    }
}

int main() {
    int a = 5, b = 10;

    std::cout << "До обмена: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "После обмена: a = " << a << ", b = " << b << std::endl;

    return 0;
}
