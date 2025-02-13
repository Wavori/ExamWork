#include <iostream>

int main() {
    int month = 1;
    int days;

_asm {
    mov eax, [month]

    cmp eax, 2
    je february
    cmp eax, 4
    je april
    cmp eax, 6
    je june
    cmp eax, 9
    je september
    cmp eax, 11
    je november

    ; Default to 31 days
    mov ebx, 31
    jmp set_days

    february :
    mov ebx, 28
        jmp set_days

      
     april :
    june:
    september:
    november:
    mov ebx, 30

    set_days :
    mov[days], ebx
}
std::cout << "Days in month: " << days << std::endl;

return 0;
}
