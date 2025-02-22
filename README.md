#include <iostream>

int main() {
    int a, b;
    double result = 0.0;

    // Ввод делимого
    std::cout << "Введите делимое (a): ";
    std::cin >> a;

    // Ввод делителя
    std::cout << "Введите делитель (b): ";
    std::cin >> b;

    // Ассемблерная вставка MASM
    __asm {
        // Цикл проверки делителя b
        check_b:
            cmp b, 0          // Сравниваем b с 0
            jne valid_b       // Если b != 0, переходим к valid_b

            // Если b == 0, запрашиваем повторный ввод
            // Выводим сообщение об ошибке
            push eax          // Сохраняем регистры
            push ecx
            push edx
            push offset b     // Передаем адрес b для ввода
            push offset error_msg // Передаем адрес сообщения об ошибке
            call dword ptr printf // Выводим сообщение об ошибке
            add esp, 8       // Очищаем стек после printf
            push offset b    // Передаем адрес b для ввода
            push offset scanf_format // Передаем формат ввода
            call dword ptr scanf // Вводим новое значение b
            add esp, 8       // Очищаем стек после scanf
            pop edx          // Восстанавливаем регистры
            pop ecx
            pop eax
            jmp check_b      // Повторно проверяем b

        valid_b:
            // Вычисление результата деления
            fild a          // Загружаем a в стек FPU
            fild b          // Загружаем b в стек FPU
            fdivp st(1), st(0) // Делим st(1) на st(0), результат в st(0)
            fstp result      // Сохраняем результат в переменную result
    }

    // Вывод результата
    std::cout << "Результат деления: " << result << std::endl;

    return 0;
}

// Объявление строк для сообщений и форматов
extern "C" {
    const char* error_msg = "Ошибка: делитель не может быть равен нулю. Повторите ввод: ";
    const char* scanf_format = "%d";
}
