#include <iostream>

int main() {
    int N;
    std::cout << "Введите положительное число N: ";
    std::cin >> N;

    int count = 0;

    __asm {
        mov ecx, 1          ; Начинаем с 1
        mov ebx, N          ; Загружаем N в регистр ebx

    check_divisor:
        mov edx, 0          ; Очищаем edx для деления
        mov eax, ebx        ; Копируем N в eax
        div ecx             ; Делим eax на ecx
        cmp edx, 0          ; Проверяем остаток
        je increment_count  ; Если остаток 0, переходим к увеличению счетчика
        jmp next_number     ; Иначе переходим к следующему числу

    increment_count:
        inc count           ; Увеличиваем счетчик делителей

    next_number:
        inc ecx             ; Увеличиваем делитель
        cmp ecx, ebx        ; Сравниваем с N
        jle check_divisor   ; Если ecx <= N, продолжаем
    }

    std::cout << "Количество делителей: " << count << std::endl;
    return 0;
}
