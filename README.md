#include <iostream>
#include <string.h>

extern "C" void copyString(char* dest, const char* src);

int main() {
    char source[] = "Hello, World!";
    char destination[20];

    copyString(destination, source);

    std::cout << "Copied String: " << destination << std::endl;
    return 0;
}

// Assembly code for copying a string
void copyString(char* dest, const char* src) {
    __asm {
        mov esi, src    // Source string
        mov edi, dest   // Destination string

    copy_loop:
        lodsb           // Load byte from [esi] to al and increment esi
        stosb           // Store byte from al to [edi] and increment edi
        test al, al     // Check if we reached the end of the string
        jnz copy_loop   // If not, continue copying
    }
}
