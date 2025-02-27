.386
.model flat, c
.code

; Процедура для вычисления 2^x
Pow2Proc proc
    push ebp        ; Сохраняем базовый указатель стека
    mov ebp, esp    ; Устанавливаем новый базовый указатель стека

    mov ecx, [ebp+8] ; Получаем значение x из стека
    mov eax, 1      ; Начальное значение результата (2^0 = 1)

pow_loop:
    test ecx, ecx   ; Проверяем, равен ли ecx нулю
    jz done         ; Если ecx == 0, завершаем цикл
    shl eax, 1      ; Умножаем eax на 2 (сдвиг влево на 1 бит)
    loop pow_loop   ; Уменьшаем ecx на 1 и повторяем цикл

done:
    pop ebp         ; Восстанавливаем базовый указатель стека
    ret             ; Возвращаем управление и результат в EAX
Pow2Proc endp

end


#include <iostream>

// Объявляем внешнюю процедуру на ассемблере
extern "C" int Pow2Proc(unsigned int x);

int main() {
    unsigned int x = 5;

    // Вызываем процедуру на ассемблере
    int result = Pow2Proc(x);

    std::cout << "2^" << x << " = " << result << std::endl;
    return 0;
}
