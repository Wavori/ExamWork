#include <iostream>

int main() {
    int n;
    std::cout << "Введите число n: ";
    std::cin >> n;

    __asm {
        mov ecx, n          // Загружаем n в регистр ecx
        cmp ecx, 0          // Сравниваем ecx с 0
        jl done             // Если ecx < 0, завершаем цикл

    loop_start:
        mov eax, ecx        // Копируем ecx в eax
        cdq                 // Расширяем eax в edx:eax для деления
        mov ebx, 5          // Загружаем 5 в ebx
        idiv ebx            // Делим eax на ebx, остаток в edx
        test edx, edx       // Проверяем остаток от деления
        jnz not_multiple   // Если остаток не 0, переходим к not_multiple

        // Если число кратно 5, выводим его
        push ecx            // Сохраняем ecx в стеке
        std::cout << ecx << " ";
        pop ecx             // Восстанавливаем ecx из стека

    not_multiple:
        dec ecx             // Уменьшаем ecx на 1
        cmp ecx, 0          // Сравниваем ecx с 0
        jge loop_start      // Если ecx >= 0, продолжаем цикл

    done:
    }

    std::cout << std::endl;
    return 0;
}
