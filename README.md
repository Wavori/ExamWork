#include <iostream>

int main() {
    int N = 20; // Пример значения N
    int number = N;

    __asm {
        mov ecx, number   // Загружаем значение number в регистр ecx
        loop_start:
            cmp ecx, 0     // Сравниваем ecx с 0
            jl done        // Если ecx меньше 0, переходим к метке done
            test ecx, ecx  // Проверяем, делится ли ecx на 5
            jnz next       // Если не делится, переходим к метке next
            mov eax, ecx   // Перемещаем значение ecx в eax
            call print_number // Вызываем функцию для печати числа
            next:
            sub ecx, 5     // Уменьшаем ecx на 5
            jmp loop_start // Переходим к началу цикла
        done:
    }

    return 0;
}

void print_number() {
    std::cout << _EAX << " "; // Печатаем значение регистра EAX
}
