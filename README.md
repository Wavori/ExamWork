#include <iostream>

int main() {
    int x = -15;
    int a = 5;
    int y;


    _asm {
        mov eax, x
        mov ebx, a

        cmp eax, -10
        jl case_less_than_minus10
        cmp eax, 10
        jge case_greater_than_10
        ; case -10 <= x < 10
            imul eax, eax
            mov[y], eax
            jmp print_result
        case_less_than_minus10 :
            imul eax, eax 
            imul eax, ebx
            mov[y], eax 
            jmp print_result
        case_greater_than_10 :
            sub ebx, eax
            mov[y], ebx

           print_result:

     }

    std::cout << "y = " << y << std::endl;

   return 0;
}
