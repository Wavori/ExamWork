#include <iostream>

void fillRegister(uint8_t value, uint32_t &result) {
    __asm {
        mov al, value   ; Загружаем значение в AL
        mov ah, al      ; Копируем AL в AH
        shl eax, 16     ; Сдвигаем AL и AH в старшие 16 бит
        mov ah, al      ; Копируем AL в AH (уже в старшем слове)
        mov al, value   ; Восстанавливаем AL
        mov result, eax ; Сохраняем результат
    }
}

int main() {
    uint8_t value = 0xAB; // Заполняем значением 0xAB
    uint32_t result;

    fillRegister(value, result);

    std::cout << "Результат: 0x" << std::hex << result << std::endl;

    return 0;
}
