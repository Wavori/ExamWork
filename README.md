#include <iostream>

int main() {
    int n;
    std::cout << "Enter the value of n: ";
    std::cin >> n;

    __asm {
        mov eax, n          ; Загружаем значение n в регистр eax
        mov ebx, 5          ; Загружаем значение 5 в регистр ebx

    loop_start:
        cmp eax, 0          ; Сравниваем eax с 0
        jl loop_end         ; Если eax < 0, переходим к loop_end
        cdq                 ; Расширяем eax до edx:eax
        idiv ebx            ; Делим edx:eax на ebx, остаток в edx
        cmp edx, 0          ; Сравниваем остаток с 0
        jne not_multiple    ; Если остаток не равен 0, переходим к not_multiple
        push eax            ; Сохраняем eax в стек
        push eax            ; Сохраняем eax в стек
        call print_number   ; Вызываем функцию print_number
        add esp, 4          ; Очищаем стек

    not_multiple:
        sub eax, 5          ; Уменьшаем eax на 5
        jmp loop_start      ; Переходим к началу цикла

    loop_end:
    }

    return 0;
}

void print_number(int num) {
    std::cout << num << " ";
}
