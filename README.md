#include <iostream>

int main() {
    int n;
    std::cout << "Введите значение n: ";
    std::cin >> n;

    __asm {
        mov eax, n          ; Загружаем значение n в регистр eax
        mov ebx, 5          ; Загружаем значение 5 в регистр ebx

    loop_start:
        cmp eax, 0          ; Сравниваем eax с 0
        jl loop_end         ; Если eax < 0, переходим к loop_end

        cdq                 ; Расширяем eax до edx:eax
        idiv ebx            ; Делим edx:eax на ebx, результат в eax
        imul ebx            ; Умножаем eax на ebx, результат в eax

        push eax            ; Сохраняем eax в стек
        mov eax, 4          ; Системный вызов для вывода числа
        mov ebx, 1          ; Дескриптор файла (stdout)
        pop ecx             ; Восстанавливаем число из стека в ecx
        call print_number   ; Вызываем функцию для вывода числа

        sub eax, 5          ; Уменьшаем eax на 5
        jmp loop_start      ; Переходим к началу цикла

    loop_end:
    }

    return 0;
}

void print_number(int number) {
    std::cout << number << std::endl;
}
