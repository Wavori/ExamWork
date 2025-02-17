#include <iostream>

int main() {
    int N;
    std::cout << "Введите положительное число N: ";
    std::cin >> N;

    __asm {
        mov ecx, N          ; Загружаем N в регистр ecx

    print_multiples:
        mov eax, ecx        ; Копируем ecx в eax
        cdq                 ; Расширяем eax до edx:eax
        mov ebx, 5          ; Загружаем 5 в регистр ebx
        idiv ebx            ; Делим edx:eax на ebx
        cmp edx, 0          ; Проверяем остаток
        jne next_number     ; Если остаток не 0, переходим к следующему числу

        ; Выводим число
        push eax            ; Сохраняем eax
        mov eax, ecx        ; Копируем ecx в eax
        call print_number   ; Вызываем функцию для вывода числа
        add esp, 4          ; Очищаем стек

    next_number:
        sub ecx, 1          ; Уменьшаем ecx
        cmp ecx, 0          ; Сравниваем с 0
        jge print_multiples ; Если ecx >= 0, продолжаем
    }

    return 0;
}

void print_number(int number) {
    std::cout << number << " ";
}
