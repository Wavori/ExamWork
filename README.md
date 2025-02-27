.386
.model flat, c
.code

; Процедура для вычисления суммы двух чисел
SumProc proc
    push ebp        ; Сохраняем базовый указатель стека
    mov ebp, esp    ; Устанавливаем новый базовый указатель стека

    mov eax, [ebp+8]  ; Получаем первое число (a) из стека
    mov ebx, [ebp+12] ; Получаем второе число (b) из стека

    add eax, ebx     ; Вычисляем сумму a + b

    pop ebp          ; Восстанавливаем базовый указатель стека
    ret              ; Возвращаем управление и результат в EAX
SumProc endp

end


#include <iostream>

// Объявляем внешнюю процедуру на ассемблере
extern "C" int SumProc(int a, int b);

int main() {
    int a = 5;
    int b = 10;

    // Вызываем процедуру на ассемблере
    int result = SumProc(a, b);

    std::cout << "Sum: " << result << std::endl;
    return 0;
}
