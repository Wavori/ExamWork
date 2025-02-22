#include <iostream>

int main() {
    int a, b;
    double result;

    // Ввод делимого
    std::cout << "Введите делимое (a): ";
    std::cin >> a;

    // Ввод делителя с проверкой на корректность
    std::cout << "Введите делитель (b): ";
    std::cin >> b;

    // Ассемблерная вставка MASM
    __asm {
        // Проверка делителя на ноль
        check_b:
            cmp b, 0          // Сравниваем b с 0
            jne valid_b         // Если b != 0, переходим к valid_b
            // Если b == 0, запрашиваем повторный ввод
            push eax            // Сохраняем регистры
            push ecx
            push edx
            // Выводим сообщение об ошибке
            mov eax, offset invalid_input_msg
            push eax
            call printf
            add esp, 4
            // Вводим новое значение b
            mov eax, offset b
            push eax
            call scanf
            add esp, 4
            pop edx             // Восстанавливаем регистры
            pop ecx
            pop eax
            jmp check_b         // Повторно проверяем b

        valid_b:
            // Вычисление результата деления
            fild a              // Загружаем a в стек FPU
            fild b              // Загружаем b в стек FPU
            fdivp st(1), st(0)  // Делим st(1) на st(0), результат в st(0)
            fstp result         // Сохраняем результат в переменную result
    }

    // Вывод результата
    std::cout << "Результат деления: " << result << std::endl;

    return 0;
}
